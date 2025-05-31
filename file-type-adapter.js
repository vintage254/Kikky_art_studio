/**
 * file-type adapter for Payload CMS
 * 
 * This adapter ensures the fileTypeFromFile export is available for Payload CMS
 * Compatible with file-type version 19.3.0
 */

import { fileTypeFromFile as originalFileTypeFromFile } from 'file-type';

// In file-type v19.3.0, used by Payload CMS, we need to provide the following exports
export const fileTypeFromFile = async (filePath) => {
  try {
    // Use the original function if it exists
    return await originalFileTypeFromFile(filePath);
  } catch (error) {
    console.error('Error in fileTypeFromFile:', error);
    return undefined;
  }
};

// fileTypeFromBuffer mock for compatibility
export const fileTypeFromBuffer = async (buffer) => {
  // Mock implementation - returns a safe default
  console.warn('fileTypeFromBuffer called with mock implementation');
  return {
    mime: 'application/octet-stream',
    ext: 'bin'
  };
};

// Export a compatible module interface
export default {
  fileTypeFromFile,
  fileTypeFromBuffer
};
