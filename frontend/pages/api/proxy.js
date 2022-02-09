import { getAccessToken } from '@auth0/nextjs-auth0'
import fetch from 'node-fetch'

export default async function handler(req, res) {
  const accessToken = (await getAccessToken(req, res)).accessToken

  const apiRes = await fetch(
    "http://localhost:3001/api/private",
    { headers: { 'Authorization': `Bearer ${accessToken}` } }
  )
  const apir = await apiRes.json()

  res.status(200).json(apir)
}
