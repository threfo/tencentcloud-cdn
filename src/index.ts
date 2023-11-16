import tencentcloud from 'tencentcloud-sdk-nodejs'
import * as core from '@actions/core'

// https://cloud.tencent.com/document/product/436/45597

async function run(): Promise<void> {
  try {
    const secretId: string = core.getInput('secret_id')
    const secretKey: string = core.getInput('secret_key')

    const urls: string[] = core.getInput('urls').split(';')

    const CdnClient = tencentcloud.cdn.v20180606.Client
    const clientConfig = {
      credential: {
        secretId,
        secretKey
      },
      Region: '',
      profile: {
        httpProfile: {
          endpoint: 'cdn.tencentcloudapi.com'
        }
      }
    }

    const client = new CdnClient(clientConfig)
    const params = {
      Urls: urls
    }
    client.PurgeUrlsCache(params)
  } catch (error) {
    const e: any = error
    core.setFailed(e.message)
  }
}
run()
