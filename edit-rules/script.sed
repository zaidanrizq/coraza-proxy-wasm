/id:949111/{
  :a
  N
  /msg:[^\\]*\\$/!ba
  s/\(msg:[^\\]*\\\)/\1\
    logdata:'with X-Request-ID: %{tx.request_id}',\\/
}

/id:949110/{
  :a
  N
  /msg:[^\\]*\\$/!ba
  s/\(msg:[^\\]*\\\)/\1\
    logdata:'with X-Request-ID: %{tx.request_id}',\\/
}
