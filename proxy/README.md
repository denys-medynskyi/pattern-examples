### Definition

Proxy / Surrogate - provides surrogate or placeholder for another object to control access to it.

![img](https://bogdanvlviv.com/images/posts/ruby/patterns/design-patterns-in-ruby/proxy_pattern.png)

### Types of proxies

- Virtual proxy: Creates expensive objects on demand
- Protection proxy: A protection Proxy controls access to the original object
- Remote proxy: A remote proxy provides a local representative for an object in different address space
- Smart reference: replacement, can be memoization

### Virtual proxy example: Image / Expensive operation

TextDocument would use ImageProxy to show some placeholder initially, and ImageProxy would load actual Image when required.

![img-1](image_proxy.png)

### Protection proxy example: Actor / Agent / Requesters

![img-2](https://www.sihui.io/wp-content/uploads/2018/01/img_5a4dc32163a00.png)

### Links
- https://www.sihui.io/design-pattern-proxy/
- http://rubyblog.pro/2017/11/proxy-pattern
