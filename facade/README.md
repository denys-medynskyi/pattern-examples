### Definition

Facade provides unified interface for a sub-system.
It simplifies sub-system usage.

### Examples

#### 1-click payment

When you need to buy a phone in Amazon you need to:
- 1. enter name
- 2. enter shipping address
- 3. pay

In OOP it can look like:

```ruby
  order = Order.new
  # 1
  name = 'Denys'
  PersonalInformation.new(order, name: name)
  # 2
  address = 'Lviv, Ukraine'
  AddShippingAddress.new(order, address: address).perform
  # 3
  PayProcess.new(order).perform
```

With facade you can do 1-click operation

```ruby
  order = Order.new
  OneClickOrder.new(order: order, name: name, address: address).perform
```

#### MVC - controller example (view model in platform)

```ruby
class UsersController < ApplicationController
  def index
    @user = User.new
    @last_active_users = User.active.order(created_at: :desc).limit(10)
    @vip_users_presenter = VipUsersPresenter.new(User.active.vip)
    @messages = current_user.messages
  end
end
```

```ruby
class UsersFacade
  def last_active_users
    ...
  end

  def vip_users_presenter
    ...
  end

  def messages
    ...
  end
end
```


```ruby
<%= render @user_facade.last_active_users %>
<%= render @user_facade.vip_users %>
<%= render @user_facade.messages %>
```

### Example in Screening

1. https://github.com/toptal/platform/blob/master/app/view_models/onboarding/wizard_view_model.rb

2. https://github.com/toptal/platform/blob/master/engines/screening/app/controllers/platform/staff_space/inactivity_rejection_deadlines_controller.rb#L23


### Links

https://www.sihui.io/design-pattern-facade/
