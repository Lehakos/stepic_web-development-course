from urllib.parse import parse_qsl

def app(evniron, start_response):
  status = '200 OK'
  headers = [
    ('Content-Type', 'text/plain')
  ]
  body = ''
  parsed_query = parse_qsl(evniron['QUERY_STRING'])
  
  for item in parsed_query:
    body += '{}={}\n'.format(item[0], item[1])

  start_response(status, headers)
  return [ bytes(body, 'utf-8') ]