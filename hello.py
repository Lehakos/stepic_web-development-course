def app(evniron, start_response):
  status = '200 OK'
  headers = [
    ('Content-Type', 'text/plain')
  ]
  body = evniron['QUERY_STRING'].replace('&', '\n')

  start_response(status, headers)
  return [ bytes(body, 'utf-8') ]