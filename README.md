# Thumbox

Generate secure [thumbor](http://thumbor.org) URLs on the fly.

[![Build Status](https://travis-ci.org/webdeb/thumbox.svg?branch=master)](https://travis-ci.org/webdeb/thumbox)
[![Module Version](https://img.shields.io/hexpm/v/thumbox.svg)](https://hex.pm/packages/thumbox)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/thumbox/)
[![Total Download](https://img.shields.io/hexpm/dt/thumbox.svg)](https://hex.pm/packages/thumbox)
[![License](https://img.shields.io/hexpm/l/thumbox.svg)](https://github.com/webdeb/thumbox/blob/master/LICENSE)
[![Last Updated](https://img.shields.io/github/last-commit/webdeb/thumbox.svg)](https://github.com/webdeb/thumbox/commits/master)


#### The signature generation is tested against the original thumbor implementation.

## Installation

The package can be installed by adding `:thumbox` to your list of dependencies
in `mix.exs`:

```elixir
def deps do
  [
    {:thumbox, "~> 0.1.0"}
  ]
end
```

## Config

```elixir
config :thumbox,
  server: "https://thumbor.example.com", # The thumbor server
  origin: "my-app.com", # The hostname of the original images
  secret: "s3cr3t", # The shared secret key
  types: %{
    # Define your image types
    profile_avatar: "200x200/smart",
    blog_header: "1024x360",
  }
```

_Note_: The origin option can also be an internal hostname, like "app"

## Usage

### gen_url(type, path, opts \\\ [])

```elixir
Thumbox.gen_url(:profile_avatar, "uploads/some-user-avatar.jpg")
=> "https://thumbor.example.com/<hmac-signature>/200x200/smart/my-app.com/uploads/some-user-avatar.jpg"
```

*opts: You can also pass any option from the config to the url generation on the fly.*

## Copyright and License

Copyright (c) 2018 Boris Kotov

This work is free. You can redistribute it and/or modify it under the
terms of the MIT License. See the [LICENSE.md](./LICENSE.md) file for more details.
