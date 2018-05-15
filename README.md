# Thumbox

Generate secure [thumbor](http://thumbor.org) urls on the fly.

[![Build Status](https://travis-ci.org/webdeb/thumbox.svg?branch=master)](https://travis-ci.org/webdeb/thumbox)

#### The signature generation is tested against the original thumbor implemention.

## Installation

[available in Hex](https://hex.pm/packages/thumbox), the package can be installed
by adding `thumbox` to your list of dependencies in `mix.exs`:

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

### gen_url(type, path, opts \\ [])

```elixir
Thumbox.gen_url(:profile_avatar, "uploads/some-user-avatar.jpg")
=> "https://thumbor.example.com/<hmac-signature>/200x200/smart/my-app.com/uploads/some-user-avatar.jpg"
```

opts: You can also pass any option from the config to the url generation on the fly.

## License

MIT
