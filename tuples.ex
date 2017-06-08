elem({404, "http://test.com"}, 1)
# "http://test.com"

put_elem({404, "https://test.com"}, 0, 503)
# {503, "https://test.com"}
