import type { GlobalAfterChangeHook } from 'payload'

export const revalidateFooter: GlobalAfterChangeHook = ({ doc, req: { payload, context } }) => {
  if (!context.disableRevalidate) {
    payload.logger.info(`Revalidating footer`)

    // Use fetch to manually revalidate instead of revalidateTag
    try {
      // Using the internal revalidation API endpoint
      fetch(`/api/revalidate?tag=global_footer&secret=${process.env.PAYLOAD_SECRET}`)
        .catch(err => payload.logger.error(`Error revalidating footer: ${err.message}`))
    } catch (err: any) {
      payload.logger.error(`Error in revalidating footer: ${err.message}`)
    }
  }

  return doc
}
