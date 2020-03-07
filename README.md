# Saoshyant

**Saoshyant is an exception handler Gem** that allows you to customize your exceptions to have a custom reaction when error raised in rails Application.

When you Encountering to an error in Rails Application it shows Red Page and explains Exception. With Saoshyant you can log or render error with custom status code.

the Most Usage of Saoshyant is in Rest Apis Applications that you need to render errors with custom error code and messages.

## Requirements
* Rails: 3.0.0+

## Installation
Add Saoshyant to your Gemfile:
```sh
gem 'saoshyant'
```

## Getting Start

in blowe Example we want to render `Exceptions` messages in json format.

```rb
class PageController < ApplicationController
  include Saoshyant

  def initialize		
    saoshyant do |status_code, msg, exception_klass|
      render json: {message: msg, error_class_name: exception_klass}, status: status_code
    end
  end
end

```

### How Customize Status Code and Log
default status code in saoshyant gem is `500` error code and it doesnt log Exceptions.

if you want to customize Status Code and Log you can use `saoshyant_option` methode:
```rb
saoshyant_option(ExceptionClass, StatusCode, LogFlag)
```
```rb
class PageController < ApplicationController
  include Saoshyant

  def initialize
    saoshyant_option(NameError, 402, true)
    saoshyant do |status_code, msg, exception_klass|
      render json: {message: msg, error_class_name: exception_klass}, status: status_code
    end
  end
end

```
