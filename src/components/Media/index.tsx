'use client'

import React, { Fragment } from 'react'

import type { Props } from './types'

import { ImageMedia } from './ImageMedia'
import { VideoMedia } from './VideoMedia'

export const Media: React.FC<Props> = (props) => {
  const { className, htmlElement = 'div', resource, fill, payloadImageSize } = props

  const isVideo = typeof resource === 'object' && resource?.mimeType?.includes('video')
  const Tag = htmlElement || Fragment

  // Calculate style based on fill property
  const style = fill ? { position: 'relative', width: '100%', height: '100%' } : undefined

  return (
    <Tag
      {...(htmlElement !== null
        ? {
            className,
            style
          }
        : {})}
    >
      {isVideo ? <VideoMedia {...props} /> : <ImageMedia {...props} payloadImageSize={payloadImageSize} />}
    </Tag>
  )
}
