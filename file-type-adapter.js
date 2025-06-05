// file-type-adapter.js
// Custom file-type adapter for serverless environments

import { readFile } from 'fs/promises'

// MIME type detection based on file signatures (magic bytes)
const fileSignatures = {
  // JPEG
  'ffd8ff': 'image/jpeg',
  // PNG
  '89504e47': 'image/png',
  // GIF
  '47494638': 'image/gif',
  // WebP
  '52494646': 'image/webp', // RIFF header, need to check further
  // BMP
  '424d': 'image/bmp',
  // TIFF
  '49492a00': 'image/tiff',
  '4d4d002a': 'image/tiff',
  // ICO
  '00000100': 'image/x-icon',
  // SVG (XML-based, check for text patterns)
  '3c3f786d6c': 'image/svg+xml', // <?xml
  '3c737667': 'image/svg+xml', // <svg
  // PDF
  '255044462d': 'application/pdf',
  // MP4
  '667479704d534e56': 'video/mp4', // ftyp + brand
  '66747970': 'video/mp4', // ftyp
  // AVI
  '52494646': 'video/avi', // RIFF (need additional check)
  // MOV
  '6674797071742020': 'video/quicktime',
}

// Enhanced WebP detection
function isWebP(buffer) {
  if (buffer.length < 12) return false

  // Check RIFF header
  const riffHeader = buffer.subarray(0, 4)
  if (riffHeader.toString('hex') !== '52494646') return false

  // Check WEBP signature
  const webpSignature = buffer.subarray(8, 12)
  return webpSignature.toString('hex') === '57454250' // WEBP
}

// Enhanced AVI detection
function isAVI(buffer) {
  if (buffer.length < 12) return false

  // Check RIFF header
  const riffHeader = buffer.subarray(0, 4)
  if (riffHeader.toString('hex') !== '52494646') return false

  // Check AVI signature
  const aviSignature = buffer.subarray(8, 12)
  return aviSignature.toString('hex') === '41564920' // AVI 
}

// SVG detection (text-based)
function isSVG(buffer) {
  try {
    const text = buffer.toString('utf8', 0, Math.min(1000, buffer.length))
    return text.includes('<svg') || text.includes('<?xml') && text.includes('svg')
  } catch {
    return false
  }
}

// Main detection function
function detectMimeType(buffer) {
  if (!buffer || buffer.length === 0) {
    return null
  }

  // Convert first 16 bytes to hex for signature matching
  const headerHex = buffer.subarray(0, 16).toString('hex').toLowerCase()

  // Special cases first
  if (isWebP(buffer)) return 'image/webp'
  if (isAVI(buffer)) return 'video/avi'
  if (isSVG(buffer)) return 'image/svg+xml'

  // Check against known signatures
  for (const [signature, mimeType] of Object.entries(fileSignatures)) {
    if (headerHex.startsWith(signature.toLowerCase())) {
      return mimeType
    }
  }

  // Fallback: try to detect by common patterns
  if (headerHex.startsWith('ffd8')) return 'image/jpeg'
  if (headerHex.startsWith('89504e47')) return 'image/png'
  if (headerHex.startsWith('47494638')) return 'image/gif'

  return null
}

// Create file type result object
function createFileTypeResult(mimeType) {
  if (!mimeType) return undefined

  // Map mime types to common extensions
  const extMap = {
    'image/jpeg': 'jpg',
    'image/png': 'png',
    'image/gif': 'gif',
    'image/webp': 'webp',
    'image/bmp': 'bmp',
    'image/tiff': 'tiff',
    'image/x-icon': 'ico',
    'image/svg+xml': 'svg',
    'application/pdf': 'pdf',
    'video/mp4': 'mp4',
    'video/avi': 'avi',
    'video/quicktime': 'mov',
  }

  return {
    ext: extMap[mimeType] || mimeType.split('/')[1],
    mime: mimeType
  }
}

// Mock fileTypeFromBuffer
export async function fileTypeFromBuffer(buffer) {
  const mimeType = detectMimeType(buffer)
  return createFileTypeResult(mimeType)
}

// Mock fileTypeFromFile - THIS IS THE MISSING FUNCTION
export async function fileTypeFromFile(filePath) {
  try {
    // Read the first 4KB of the file for type detection
    const buffer = await readFile(filePath, { start: 0, end: 4096 })
    const mimeType = detectMimeType(buffer)
    return createFileTypeResult(mimeType)
  } catch (error) {
    console.error('Error reading file for type detection:', error)
    return undefined
  }
}

// Default export for compatibility
export default {
  fileTypeFromBuffer,
  fileTypeFromFile
}

// Named exports (including the missing one)
//export { fileTypeFromBuffer as fromBuffer, fileTypeFromFile }