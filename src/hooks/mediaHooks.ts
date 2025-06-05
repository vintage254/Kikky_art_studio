// hooks/mediaHooks.ts
import type { CollectionBeforeChangeHook } from 'payload'

// MIME type detection based on file extension as fallback
const extensionToMimeType: Record<string, string> = {
    // Images
    'jpg': 'image/jpeg',
    'jpeg': 'image/jpeg',
    'png': 'image/png',
    'gif': 'image/gif',
    'webp': 'image/webp',
    'bmp': 'image/bmp',
    'tiff': 'image/tiff',
    'tif': 'image/tiff',
    'svg': 'image/svg+xml',
    'ico': 'image/x-icon',

    // Videos
    'mp4': 'video/mp4',
    'avi': 'video/avi',
    'mov': 'video/quicktime',
    'wmv': 'video/x-ms-wmv',
    'flv': 'video/x-flv',
    'webm': 'video/webm',
    'mkv': 'video/x-matroska',

    // Audio
    'mp3': 'audio/mpeg',
    'wav': 'audio/wav',
    'ogg': 'audio/ogg',
    'flac': 'audio/flac',

    // Documents
    'pdf': 'application/pdf',
    'doc': 'application/msword',
    'docx': 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
}

function getFileExtension(filename: string): string {
    return filename.split('.').pop()?.toLowerCase() || ''
}

function getMimeTypeFromExtension(filename: string): string | null {
    const extension = getFileExtension(filename)
    return extensionToMimeType[extension] || null
}

export const setCorrectMimeType: CollectionBeforeChangeHook = async ({ req, data }) => {
    // Only process if we have a file being uploaded
    if (!req.file) {
        return data
    }

    const filename = req.file.name || ''

    // If MIME type is 'application/octet-stream' or missing, try to detect it
    if (!data.mimeType || data.mimeType === 'application/octet-stream') {
        const detectedMimeType = getMimeTypeFromExtension(filename)

        if (detectedMimeType) {
            console.log(`🔧 Correcting MIME type from '${data.mimeType}' to '${detectedMimeType}' for file: ${filename}`)
            data.mimeType = detectedMimeType
        }
    }

    // Fix MIME types for all generated sizes
    if (data.sizes && typeof data.sizes === 'object') {
        Object.keys(data.sizes).forEach(sizeKey => {
            const size = data.sizes[sizeKey]
            if (size && (!size.mimeType || size.mimeType === 'application/octet-stream')) {
                const detectedMimeType = getMimeTypeFromExtension(filename)
                if (detectedMimeType) {
                    console.log(`🔧 Correcting MIME type for size '${sizeKey}' from '${size.mimeType}' to '${detectedMimeType}'`)
                    size.mimeType = detectedMimeType
                }
            }
        })
    }

    return data
}

// Additional hook to ensure file validation passes
export const validateMimeType: CollectionBeforeChangeHook = async ({ req, data }) => {
    // If we still don't have a valid MIME type, provide a sensible default
    if (!data.mimeType || data.mimeType === 'application/octet-stream') {
        if (req.file) {
            const filename = req.file.name || ''
            const extension = getFileExtension(filename)

            // Default to image/jpeg for unknown image files
            if (['jpg', 'jpeg', 'png', 'gif', 'webp', 'bmp', 'tiff', 'svg'].includes(extension)) {
                data.mimeType = extensionToMimeType[extension] || 'image/jpeg'
            }
            // Default to video/mp4 for unknown video files  
            else if (['mp4', 'avi', 'mov', 'wmv', 'flv', 'webm', 'mkv'].includes(extension)) {
                data.mimeType = extensionToMimeType[extension] || 'video/mp4'
            }
            // Default fallback
            else {
                data.mimeType = 'application/octet-stream'
            }
        }
    }

    // Also fix sizes
    if (data.sizes && typeof data.sizes === 'object') {
        Object.keys(data.sizes).forEach(sizeKey => {
            const size = data.sizes[sizeKey]
            if (size && (!size.mimeType || size.mimeType === 'application/octet-stream')) {
                // Use the main file's MIME type for sizes
                size.mimeType = data.mimeType
            }
        })
    }

    return data
}