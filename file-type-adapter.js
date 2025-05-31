/**
 * file-type adapter for Payload CMS
 * 
 * This adapter ensures the fileTypeFromFile export is available for Payload CMS
 */

import * as fileType from 'file-type';

// Provide the missing fileTypeFromFile export by re-exporting fileTypeFromFile
// If the current version doesn't have fileTypeFromFile, create a fallback using fileTypeStream
export const fileTypeFromFile = async (filePath) => {
  // Use fileTypeFromBuffer if available or provide a fallback implementation
  if (fileType.fileTypeFromFile) {
    return fileType.fileTypeFromFile(filePath);
  } else if (fileType.fileTypeStream) {
    const fs = await import('fs');
    const stream = fs.createReadStream(filePath);
    return fileType.fileTypeStream(stream);
  } else {
    // Last resort fallback - read file into buffer
    const fs = await import('fs');
    const buffer = await fs.promises.readFile(filePath);
    return fileType.fileTypeFromBuffer(buffer);
  }
};

// Re-export all other exports from file-type
export default {
  ...fileType,
  fileTypeFromFile
};
