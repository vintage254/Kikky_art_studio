import type { GlobalAfterChangeHook } from 'payload'

export const revalidateHeader: GlobalAfterChangeHook = ({ doc, req: { payload, context } }) => {
  if (!context.disableRevalidate) {
    payload.logger.info(`Revalidating header`)

    // Use fetch to manually revalidate instead of revalidateTag
    try {
      // Using the internal revalidation API endpoint
      fetch(`/api/revalidate?tag=global_header&secret=${process.env.PAYLOAD_SECRET}`)
        .catch(err => payload.logger.error(`Error revalidating header: ${err.message}`))
    } catch (err: any) {
      payload.logger.error(`Error in revalidating header: ${err.message}`)
    }
  }

  return doc
}
