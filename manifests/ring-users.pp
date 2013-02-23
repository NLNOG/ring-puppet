# Class: ring_users
#
# This class creates all normal users on all ring nodes and adds their ssh_keys to the @authorized_keys file
# This is the file that manages all users and sshkeys
# if you want to remove a user add 'ensure => absent' to the @add_user block
# if you want to remove or add a key, just add it to the appropiate array under the correct user
#
# Parameters:
#   none
# Actions:
#   Configures or removes all normal users on a ringnode
# Requires:
#   - add_user from classes/user.pp
#   - authorized_keys from classes/user.pp
#

class users::virtual::ring_users {

##### BEGIN former users #####

@add_user { 'ic-hosting':
    email   => 'info@ic-hosting.nl',
    company => 'IC Hosting',
    uid => 5014,
    groups  => ['ring-users'],
    ensure => absent,
}

##### END former users #####

##### BEGIN intouch #####

    @add_user { 'intouch':
        email    => 'tech@intouch.eu',
        company => 'InTouch NV',
        uid      => 5001,
        groups  => ['ring-users'],
    }
    @authorized_keys { 'intouch':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAxr0qjSn+2nhibydQhc/Ry4KiChKv9OJBja69s0ScyNTwWhvWvEItgXQlbLp0RW5XeZ7aBvehHa3pYLPZUshhz5roRMhZHZhKe9Cu12ZSS7qIXk1DRL8vTDP2K9f+yyH04yDlIr2O9uyh/B3KCcK1TdGVDsj/KiXgDQSClfQnFdqByYqFftEnjAq86eoADhIWnEbH06HE2ndEtnggtOJcy0D7SC1O0Y3MxqpJy8oEHMsrVoFi+Do+bc6iqW39Yi20t92I/qKz08wHrOEqNSsL0OMi302GJ9ZozhJXHIUCdvMMgUlufI41lbhXpeq8Kau/eZAdgC3CcqE1nsL19mOSfw== tt@intouch.eu',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAtKkm8CZww0PWJHSQ0CifRxmfpRmow1N5ExDRU+O2TB0loaENFsmrbtfh8e5lJZu8YISA5mNXU1bgb3+B5H1CqAItNaIYWoM+t8MUMj52Nfe8u75NnK30tGX6ebIc2lJcF2sORx4oIxDJcjCJMeBQANl6t9Zeuq5Xn9xSd6f1gF2osbReQCSnX+f6iSxHMIjv+crqkrui+ELzZEmKnIfJE6nDXl3yA9LhtUy7JKi6YYBzPNRCFyHuqBntTschC4gIOEncaudxe3SZB2CIKSinovBK4wYOUx06h46m8l/9e0pVCU/HiJUdfsZUDrlKbgDwlMyyqYi8mHvJOCnnRWWg3w== kevin@intouch.eu',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAlygrWfVGVCQ0gSizA/USj9En0vmjsmPFWStt3UMqABYjStx733q+GrBPgufuVUg5Wk8APIUwEYyL8uQvs0WO1SOGbWuqIFvnc9Z45swIr3H9UkgNEHiOuhmuGfitRtuwhVaIb/pUsAggMJz1/BO18pBIEyz+Uo9fU1UQ7pdKnWH+nOUp1PrhPOKye7AZAnfVVOiGMzyZdUo8Yrx4kQF+XQr+5OfaDbSD3eHME6oKOCYIe6GwaOdkw7tjwxO/bLBAIsBA48FQ37tze/V5SERI/tN5gAUL66xMYAqMtonmY4jVBgF1/TbA1n/ww9XsFxYmQAyCC2q0XxnpuRrzmASHPQ== Simps@Tymora.local',
        ],
    }
##### END intouch #####

##### BEGIN bit #####

    @add_user { 'bit':
        email    => 'support@bit.nl',
        company => 'BIT',
        uid      => 5002,
        groups   => ['ring-users']
    }
    @authorized_keys { 'bit':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7YmMMnYyOh18/XWgJW92PL9OLerWC6Y15LTy7FLqu+i0E47sUbReS9UGgfT3leRI41i9TBWTybq7rNDkGRHikCfAGIS2Wdc7BEt69o3S7B2NrEfv1B2Xty623fuQktCEV7JxbYyvHtSv4skoXLukB0rO8os7DI4p7FoxdTw5ZbxtIVU+R3VMEaJEsFKc0neiJIaW1mix+S25Dc94Y8Ld5ZZAfenIrgp1C8lp/sZnONYONzcXAzsxeu+6S8kOQAvIif8uhk/LtfOOEa7HhbdAhAo3cqnSpfCzLNiM5hCN1/VrDGxgrjpPem+2hrcKnwWzb2GEfxunH8xBSaWb4JMcP bart@bit.nl',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAA/g2lhSZnu59h2YBn5tOX5AQOfGW1UHb+jKF+qTBHLT2PRSv/A+ceLFzKHZ2pYbd9f7gEv0okaTZONegKqk+bArjOwurp9AEvrhHUtbtKiPSaOnus7U8tuM3e1329I26P4qGbmMhV2HOBP/+g58xEJLMcNoiyaH/68swt3o14g4IjXEpM+ih1eKGw0HYHE0eQavvcJr3BOr3/oORB4ly5RjmIzqZX1tJCfghz8ppOx3LfV2VLkCbKOyEUJuW5r3oC5M40mPRLwXTfZraMrZGQs3rq/NBiPe5HasQZEuJkzquKSl84a3w+Q/yJ7W8h1BTm9fW78P3p5eZQbMmQdcYj bastiaan@bastiaan-desktop',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDOFT2YQioHB+ddpeSxD047IPHmuNwkPEqf5m7lyKxN57ufjczOaraX1EkBNQaOUafKufnCdRu3Oy51EhB94byD21+a3alGvclGFHvyWeAV2b7njMr1udEfeLMcnp7hc+E4a7bqaGHkeHFiV4Ew8JsWhTJ57csVEeJwcqpAnQKpNp1Pfkw6hayTbpgIgYSCpt0NhxZlXMJCGK+dSyh2egC09gE27ECG/sGzW53EXRUakAj0iSD//UXoPlxoNIcnuPf5Fyv5mLIT6Ro8n8Rd6rZQwUUEkBW351aQnExOxq4yJhh/swTXf3Jh0tB/lUoQMafueosGhPy7kCjeqtHGWyzd emil@barabas',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD8fKw9XWbNcV829VMy8Z/7jW6eGllW1PO0MAED8mS8om+y3ysZjqMCKqZX511KdhbOgLZOUf0b3ip70bpfkdYgVikPQBU/r/2K4wj9j8cAsliJUEMHhIYjgVzZUWfKACFtvaR9Xq5zlgzqWRDTfllTGSR/E/aVHGR0EbSedUurloDMnB1dMvJx0YeH2kcb6BMznObJAL6zmcWaQFZrbkN7yiEktkqJYWesc1QYVJxv8MMHhD4Dx/ztsyJTaCNGv6bVl6QAJC/Y9kEfLWTTqA3Zpzsdc9o9Y0cqSCJd4SkrFfc0PMfUcy5nqUAGDrrRSa7iARS4eJYD1DP0SUXSz+3Z henkjan@faith-20120214',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAK6gO1DeWy3T0qla58WFRkbZcML1kItdJTwn1Yttr7k+aRioexdS7uOZx8cwIupiBri7Qe1czC1dT6HP65Uci5985FqoX15V2QYQhOAWI7bTdFKKBdK4gOZ0iDqF/sQVQglnzouTHnDc/NDTCMMc+/OmFwEZsTa6N+JBo3iUEitfAAAAFQCXXKnODRtGol4C3d62faB2CF3uqwAAAIBpXnEZeptU+soFMDhYxh83nxPPR8h5Y4kHwrZFnFp74f4xsOlU2cKc1Txy1wjYsUk9LN6WytK3xAdsYOO8XV9pBMa9iEyZEXJ9viYZxoVfUtZNFjcOXeJtlMjTkmQLolqlIv+PgKTBrxch5paksydD9Zbk1mato2KeYrXKAK7dSwAAAIEAjFBqgcWqkHoKGEfwbUOUnjjo6LybQ09KMRhqGWYbbHevTsWErB6uemg2Mad601ng7Q6E0owXFE6QXivm/BuoDuKAhk53WZYUNgZS21bdNGYrNGOtkVpS081tZSHKiRWk+VY14Nu30GfJmtSXJh3ymLFn8n4EsTxZwVYAdjaHLTA= jeroen@jeroen-desktop',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDHb8X3MsA1cih97yYhgpvMcROsuoTSemTWkuROeP+7RnByq3gf1d3z3QdEAmRDBizxdxNEqlAmKwIoKUuKYNho0ZYPHhRee1NzlzX3eQlQUyUvGi5IEDojIqXYgwPlqlsbrZjljeikgWvCh0lJYJFofT4VaDvyRiMQ9ps454Fxnd27ZC0lFDYfkHzRMm2OgDk5hBbJvHbK7WWe+zg5mJSr4b3+u1SF43d3r5wVS/c0Wp3zsLm09CfD334dP7HWJRX/YwGud5qUkSQ9mNd1fqxU5YR0DqkGL/Sf16oXRnkWbnkaF6gdPTylZx0/oistOs5KmZIxveIjS+6GU97ttSKkjEde4hui/rzYLqp7XDlVuBKufmIwRLhTGv44Nhcb6XywVeejt55mbT4FP94ESL1q+8vF+QIJEl6c7H4ky+CtjzXmUUPhm428SX/WhD1L1eiA+zWqEX0ojHXLRf2odOLQl/xUGOlr4VYqLAyjDOPfJJ59nQvLbc/jXwUnDx6DR9+NFcc/ts6MHPjAk+QY2anrkhxL8SCrwJ8pmYIbZxgniydUJSVSB/Q74JR3gsUVBH3oFqdeRqa7CdZRL3bib+wyoyKoWa9VU5gnP2OtbuE7oi0h0ljgF/yBO5I50sdCI4L42IEDa8Wgond7Z0GrWJY0TxPUQLvDy0rUFc4ZOQ9AMQ== juul@juul-desktop',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7CGyitVWr65+iEhd81EIkodA1gac2MiymTvcXTYkxINrn6NgkTI/lxn1zGzar7dpFvzhXV5KSvd2JBvYEef9cyZ8qXiu4NrM8gq4QC5PbMvXxywnOV7iV5e3WsyD6iyaRaFuKmPs3cKqNcbCDjZWsYQZFhKfM2nSOe5+ULUU3IGx5GNhRwFVEhfTrjOdE1bBRIkrSRQBS4Em9PFERNEgvasu41i8cD9w0Gb0UY0jqc1pNRHSH8fLku+z/BldXHrh8mud15aRQkzSoPBsTDeGJmRDKu7UgYVW4vPm9wPdm3XoaLrI7eCLj5nYH4Yo+6ekv9lIuJczbdgYEyWG1bShv martijn@martijn-desktop',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDCxSzhxF83AgQaIXvQW17thTrMcmHFMeL0dRfWips7KeEujYSW+ts3ihYoi5ygtj3FT1MD7ZVXP8uJZh08FWkw77qMEv5FL2Wsb7cY4SkXCMAkZ2Xu2Iz9tV3uPDfDzLFANt/KyfTgN2mJNjGczdjUJ8nJYJlGY1zE44ZkibucZKw39zgPMFuOK9rT7efbnGtry0RfujL7plEccLVLAFEIowiKcikk9BSuJgj1EYGggKQyuN/q60lQ6ZWf1Y/6prWe7nTyamCd05ycM3emJWehl5f9TrDMMMqmwaimoHbZEsLmCAHjXuaKM7bbny1C/wPj+tuJn+rDUgrKnjpSPomig3NKV7PQjB2HY3CQoymdgiAE3+W11GemKSMqackckdTzh7/kSvIKtlbYBQ4l7PY4sZZkE+avVL3kzVNHG0Y94bAwn2Xu6c4z0738drd6lBpSGzUnYIMu6vEB+Zl4tSWO4B2a89Fe5tO2OIW+E4hXlawC+ujUBKLfn+M3A7O/x+2rddU8B0srdSkRmRYOm5o9/zxW+T8Tl3dJJ6nxl0RqzjNjPwV8FSQC8C2JmMkZlzdpeRZUNN+5cCHN10eOOTBv0/OudOCgkNO/Br04gD4dtlzCrUDVpiYOIBmSVyXlVdS9dNMzxVmpV4q8a4aGsKue4VceK0FxdwYmahY8IiWdHQ== sanders-2012-08-22',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5soV8O9rKAYg6E1G/QD4KP6U7Vb3H7QZliCDTY27L0IFjN37iqQiz0Wx0AI3euOZuquebLXxqr85Uesg+UMbcu2jAWBIPrE4jVxIZSQdmV+pBTeNygY7QdjP3LNIOW0MApTU4oCEonrd0wBbHxwBXv7R6q63NVbjNUdXSQ5ieM8BcMjKhTZovKEpX5uo/CKUE0MZ7A9RcNIL/ovQKJhxs9IVtkTmkdmpG1+1QPXM7g7SZAvbSkrKf1PhedaLMvhglF9Y0kOl7RKOeeBkYV8nzPHSuhnz9Va8M+pC4+pV/ksguPb/9oRxLxa5kgn7b8H7ji0dF+5aVBEDceL92qa5f stefan@toaster',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCwYodUsSoD0lt+iO9nASunmoWiiS5CDXBBwBpT9OIZEiHz1MSpZXbqcqS0aT8sFjw5cQNH75QC59E0O185smTqFjpUOAOdfQvwsUxspxaeGvAJsECDuvO8l7pVqQ89wv7xUnO7mDYvF9E44AJrxi75ALRfma0UUkwJByIuiJQdJAvXse5vUikPeeYyXZBLzdx/6P/EawkX1BJcz8qAaTn77s145tHVH/GQRwbptcRPGWOaLh5AyG5pX02OkR77kXVwNYEj5VIo1uTQg7CfOb+qe1uZ+NQWDp5kTFzYC0dPY+CVbp42nLatt1s0JOQ21V2s7GbGYuq179biF0pCLLLbWZFyJV/AxBvtGoTQyCLR8yp13Gr4KHpaeCr2p36ZopdBYJvetXm34B7DMB/lpoaB0COI0+2ZnpGFbB2Dx2BVE/C8MxNGRb7RYgMdDYMrGNPOsBJNbJLb5VNHdsrdE7u6ncaI0idrBRM7dLR3rIUdFcYd9vWQBMlWXTetdEgvSZ/UHsOlXHb6Axcx2uYh5JVTw71/70z4VvAzrnApbkSfMrB2EWahkugJocNfBI8O5oeMgD27Sei+NWCT1phh8DFRCGa7NbELLF2TgM3fHJ4+JqzXh0lsdRAS5YSQ1HbuS3tn4P3EN1lEhScA92mgW5Yv1ePkVqqLQmCYW/yTifGWNQ== teun-2012-08-21',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAv2TcL/YmKvsTedKo0Go6Pr6SZQlOfFFbbOtRO7w+6pcA27+wWdJs3O4EQ+//xBR5ZO5y2lksmvQGdjtfjlicwI2EeDedzDk6vxmtyX/RDvmHres9H76jnpQ/AWYFWlmfAp0faSqk1wL8Yl9f1fvEUH8FQwgtrljaHhyDk9Iza5VPCHkoBweDho2VELxOqUfwcQ++ZRhbDoh9kBckERc2Pjx6q81W4E8SIYW4psw8Dlw7ya8DXo4YF9+AIQV9jKSTpJLgOAhWYKWKfu2ot8eeMKcxlVuMEH+csftKQn60K7LQBZEtgmtjd0nUhjQfRayPPrv0rYyXwBPY2viq2t2KDw== teun-ring',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDoM+7T5UcLV5WMJkSPabmBo22KqTyEC5/Sl5C4sW3ILLxDqBHGwnbaRGsWR96lr5Hj8kgS3eWFJrezLWVOedMWlrZo/VBfE8Yp6XgeaNkOy8zQcZfl/vJhvgAOJo/XFaUtjNk5CaVCOB+xIySJaW3J9jAp4xlYNcLYr3/zfUDg6BRZQWdQ5ugfVOr8NavlSjfvrP55eLIQG+lOZ6oyJF65Xbr+D6Y+JFE0TrMhceRLvgvej2FoERI5is/IHxjziCarbRhbWVXjtIzbZSMPFOsPeVgUydlmW9ydSbZMC9xL1UIB9eP/HP/UsEvzq39e7qVbmqJcRB+UNYxNhpVAeP7V stefan@toaster',
        ],
    }

##### END bit #####

##### BEGIN coloclue #####

    @add_user { 'coloclue':
        email   => 'routers@coloclue.net',
        company => 'Netwerkvereniging Coloclue',
        uid     => 5003,
        groups  => ['ring-users']
    }
    @authorized_keys { 'coloclue':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA3gqVHURqyVTzzjUjgMXeCJfUi1VtLnUqIr166az2wNUTgnuxLLLsa1evPz7mfDJwY36UKi5IcUuC9pf1B9q2vD6o1fLrrd4sviGQZsvSrGuJkMEvIhXM8JtKxpwbEgg/3vCPPUV4cfjBqeNJeo2r6vru6oOHOdFuGJO5vDtDG/EmuQVgMirTWvjlONKWqEGxz/5BTnDX8PGZ5dEryAdtXrhvf1wYqWcQCkh+ZSgBqq7Vv4Chfzeo7P2iIPi4SAoz6j3pDRNQDzPu2r1cMDPqZCPeTVR0+P6+NpIVo5xlxops6NsJPEwxYhhMYc9OsNvR58JII6G5Z2T2/0LZFeVmEQ== weerd@weirdnet.nl',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEArwx5A1fV4Exd1uAWMXo/TC0tmMqhexSjpiUwJS9iI1+DsVU5MarlvPp12JTc9V7cYGwsIqRCWtXmxiS9yB0Ro70pTMMckyjRtFeyoxhVD9wjEX8o5UHAZ8xWSHShMQKm8TZzDmisCb1KwfrCbRZgBA+Km6TgMeUhTUSuhyELu6h2OBhwvpDAhWmPXOVKD4RnSU+z3hqgEe6R57idvNOQJRVVks05a4gM49gX/JYRzbNPWveb8OkyAvxNjYy15PHDa/5L3fMILxy2AQBo5GaNJUE1obxXhCACiDSYUpI01XfCVBnUELaYepp0++VuZKJp16Yd0sAZ6olpjZhEAcrrkw== niels@alphix.local',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAwcJ6MwiRbbWDvydgiuNJRSiI41AE15Mccp31zPEcHv5yfm6aotJZ9XyhLOCRwkA0uUICfjQt+WXkwllO1K/c8HVHDlxYsPnxyu0l3SLB9XmJs29/onx/vSOWgST8olRvoBoMp5kgkoN4blSIvlq6LAF4rZZAbuqyh5BmE6M98ZznnV18x+5YwAhQgazfEWBMs70hO25OcnIqgEHbSoW1wOoZQSnJkaQPODKbnVJlG7W9WT4iW2gauJMG0J/KFG3uiQ69EqCnxMVQQGQoBnQ7fo/GUvQdbYxFKoUZ3pAIBd7sizP8UqijhLCDoSQE6/AwxX5BzxVDx7MWzc4JZjx2WQ== job@instituut.net',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAMg580Z4SL2KWtPNeicc/Zhiwqrd3iNAeAIl3mXosTEI+CvinILL7+e7VasJhhxi+6gPPu4QPdROeRHwVESMFCjYYU0c9kfU8Da2RnZpZGnzRicGw8QD5jxNTUw7SVLN0zzpFwufHLMW8OM0Yv8fScGjwcepRvmRITyxKNv98mM1AAAAFQCDh0IVU9ta32oQu0d99IH96AeXLQAAAIEAtqGVhCHqezk+aPfW1wYLZzv0OgND6hFjeO73hC09oxBRlgFBxEAyjz//pV4afFBjuXXd7M6HrWdBMs/toTnWpYugHE8fMl156fVw0sjWW2Qsdwtv646Axauo+LPAxBXg6Eb3614015FwMQz3MoKdgphCJXHGNZXW+xtar96GJ3YAAACBALteS4ciNfuvHAN8qIEkvX6fNVgcQVkpfpfX4Ywt70o5m1Wd/6gb855dXw4A/Zy8m0oYadbE0KyGJVZ+XMWxyTVwjrwge3wPJ/M8aKkLI038Hl7TTzzYbJoZ5L1KZmeR6Vzy0u3bw/YpAXSG3f+Zfir3J+KZpFSUIih0K5MrpeBM evharten@macbook-pro-van-evert-van-harten.local_1',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA3vVoweLhPChcis1q5mt9N+uO3fOjWP3+gjm2aitKi4XCNbcvAYglTp/GkI7bhPhHCm1Ab2n6dBl0wwbrB1x1IGFx7C3+GdvtcSAwdzQoCzy5VdN0bRRoe+yWF8t81GBm45Z/yaBvV+SBEP61onn8VQkJslrFs8CFe5+HPk25hBZSuUc4IuX32daMqsarX/Zqw0DTAEPKXtEyt5PLAhx65pfE+8rqMehwCvo083oCXDohV54kIsYfebfXWKrZv+nFBRcsVQFOjnNJ8wUgr8iDFODjzIaXJK0zXuY4MSPHS+0qKbVXFXpVVBdFKpIggB4f4xjBL8XuBToXS2WVa8bDgw== marco@goofy.tols.org',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAk2rT7i5onAatfbnWwibB39nVB6mjuAEur2pUxGlOlPyxmVdRo3B+sjJ6CKKITwXuVYRJ0DOPH4QrlxTKYYiqx90fOJPCpMRpUklYmvjG2MEhuvp3KgJeQX/yGGI34QmNgkLM3I9b9f529LiZD+rR2Tsid132v0m1xPMkHBxzeqs= Jurrian van Iersel',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAICUvNO3MDyBt87RCVTGGxlG3A4653h5jtVuKNbYGE5D2DBQQq2OQmDtISgLHpRXtfjAQDJBv/9/tLAnRcc0f/pBXgHkN78YDZuHJNszctdM4mZYgwdEUlWarKKsgJPFcPLMob+Yr3JOsiHQ4vkrKaB90zBF1yNueFcdprQGG1wnAAAAFQCDBbWMzp2FI5NVQTcADgGOqNC12wAAAIBK3X2tb3gLEKuzRKThJobRMlg2/oUv0VWzqRCdX70SFxSVHBENTmrsrzoyCSQIbFBwr6LE0LQRioRdy+ckzTf5yf5e6VCkvY5Q+MGRdMH9u83OxeKrvMcHvp5a4qG/pGqgyN3iIr1AiOUN09X/Y+Kt//ycZuXkm1vLzgL2W0r2yQAAAIB8/X4qzsOno3P/9F0NyGRNWUNEH40Bq56/BammLCwirHwRyBWBvAtc/yDOOs3YHjYK33Se5ce79pkrbFr6ypBG1G+GgBAfZH3+lJUFn1sRKiY8nhkkmRB41ru0CjC/1hoQI5TTCGaoGpItvj7GWogqtgMX/1fDwd/4G+Yi6XvCdQ== pim@ipng.nl',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAulccxoS5gbAcOPXGsGiW8m5qZu0fnizAMqMBMse8bzGbzSD2B/m3+3T0CIYLQisr1eO0AcirljnYJSf5jNgYMAJIFEQQ2caO5jlEDS33vu//wcNbAPurGlcHxlIIEubxL6W7IQ19+GNixkcPGYQyugkdipFKT50KzsUo9lTea26ucJWtI0y7TdH7tlLUElBQTPlTE78HBEHEUDsR4ZBctHQ8+OOe1smY/S3XBqJTpDQU/BG0xRfTamrv0C6VNeBvJZmKUeZfV2Ttve6Nz0HFUcKOGH9SPKAM1asqVQpQg11A4KsvPYqGzF8lJnviIet0X07hYO9IgdYuekyhF8TJ9w== pim@ipng.nl',
        ],
    }
##### END coloclue #####

##### BEGIN widexs #####

    @add_user { 'widexs':
        email    => 'noc@widexs.nl',
        company => 'WideXS',
        uid      => 5004,
        groups   => ['ring-users']
    }
    @authorized_keys { 'widexs':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEAyyOtKholD/KBwXrQPMeWa3lEC76ihFMVOHOh8b4FAWvztWGNtfLWXmfL6BR+kj8fC0jX/qffPoMH1GdDFgUr2zpy1bbYoOGu/W4jd9JPJAQ5+pgQTrDZq8ygIDiJEnRJzR7dG9bS0Qh91CXY8T7acSOn0AsG9OV/JfoJUR7GEMCim3VFiz1poitzPPYNPNFJJaj3vEhV/Om/wUhaRwLbFQLBN89Gdpe4BsYWnhFyMvFW9iW/cBzU89yyNvKzu/aWMjMqiMUE71nDptDRL9UkhbQW4czvZ6lG1ZOkqlB0LCgs99KPEst+3cZNLmedIIMMOK9uRzyFoO52YYf2hSYg22qz8i8jSn+AuODKLnIDobO9CSfGrq4Pqv2j47hjp0SDiTI+pgRPpIp92XHXdBxi0s7SV4WOfduJ2V/frssNPQI/akGj7iPXCufMeFcPkhhu96nNzr61JyTypDfTpprcJZzE/GW9XB1AYIv7VedYLvA3idAqf8ehwVyTZo1rpC/Qtaj/kib0lxOtR48Bw9Z5gwsQBTKAkOwEbYQ1oYgvQh4+ZA0hiN+7UXQ6MDSmW+cNODW4o0414vEHI8rXCGx4cmcu1ocWq0H5WT8Ev1fX7bd6h8VAdZRXVZ0PldykN2J+QMybBkyM+l2oVi2AG3m5WjZx76OV9kO2OPvDS6IARqE= wouter@widexs',
        ],
    }
##### END widexs #####

##### BEGIN xlshosting #####

    @add_user { 'xlshosting':
        email    => 'noc@xlshosting.nl',
        company => 'XLSHosting BV',
        uid      => 5005,
        groups   => ['ring-users']
    }
    @authorized_keys { 'xlshosting':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEAzZcxnNSBqocQVE830nX4k8Mx3LNDFvOsDWezhon5zy8LKu09nACOnQYPTqGAADqDr5lrq8X9Hme0RKrThltMrihugR4yw8kTVl7C/ISazdlzn0EnaZpQ+H3bgbvzp9Ba5WmpPGx7b/YKROEZeADfga3TEARhj5ZsFutuerQE4LVpVc8iXQwjTVziHCPH/ezKyGa4CmH707qQTRMTFQW/bEcvlUqk+0KJTGKBaiPXZ9vVODDTjmgStiDkc3Rn4il6ifGlWBakm4ky6Md26cGzQWli8ABWOGswpunPNboNEgmQsuI7ifVA/OO73UNucho1g1FNT+33AfhCK9o6Vpztx3seun7rbGMNrv7y4ROe63yh8PeUbF3Sf0GdyB1KmCL+qFMaVOAuKnSzxpsBMUFycXdncrUmVXzdrzb1aXRhE9+FascA5KG6dGirhxgl7Jxk1P9TWtav/swAkJN54JwLM99a8T8EOC7N651y1sNZ32gDrOsXVIIxDArRoj084ZCnLxYScoXUw9qqZStTL/a90O5CTkl4jV6T+OwftHAnqmtrgHlc7vkOFbkGfB0QPu+Wzl0+mTZus9csrvzGAeSpUJXgDniL7Bebd3fWpEaYnB2UViAV7D2U259mMHmrmcAh3BZiZQBMoeDSo2l7Kwi4To0dKa8T/bq4XJwBRgpODGE= root@jumphost.xlshosting.nl',
        ],
    }
##### END xlshosting #####

##### BEGIN interconnect #####

    @add_user { 'interconnect':
        email    => 'noc@interconnect.nl',
        company => 'Interconnect',
        uid      => 5006,
        groups   => ['ring-users']
    }
    @authorized_keys { 'interconnect':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAACBAL/dFf7qvalf0XqAm8bAB7/VtQEbMxzMHyQV9682MXiin3/k0XWwFplg0+Eem7cyFNyLW8N3I8xsLFgrBzaH0W8OtfeW3/Vp6tVsBkSL/11mZWdon4ZQSl8gBqFcaiprqD1LaQhYvRdCQA0hvzRIOe9MxHK1rmUQPHYS1RCmWzcPAAAAFQDo38eE3Vhd2+ZFDui8AN8o1pZw7wAAAIEAk7bh+NAU0TN+ktgnLl5oDTcGcoxdm7pjlfcY0FQoYfLNLk3fWU0SMqdAjkp3Mdg4b68slJxG6usjqvbFydVTRYbBXIQBkrseG73DQA63LNmrQIA1kz3DdqUi8vqZtX+QVLrNb8pt/0NVmSvUc3EAAx7N7BgKdTGOJNoATsrPdEkAAACAYLLpo4BH4Huf3QmFC6D91nkQh1m3EwgyDxHx2mD+NoeQUlnl4/rzhhTqQ3wFtgd9ia+86bFr4wIN4f0TFjgXd6Mcdhn7swQMT5fttfvhgrb/bD6kDSE+8PZrfExgUEhw6plPvLi22tCBgAJ+Jfao5dmz9IWMU/G1RIJSyXAKtOw= interconnect@pjotr.interconnect.nl',
        ],
    }
##### END interconnect #####

##### BEGIN cambrium #####

    @add_user { 'cambrium':
        email    => 'noc@cambrium.nl',
        company => 'Cambrium',
        uid      => 5007,
        groups   => ['ring-users']
    }
    @authorized_keys { 'cambrium':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAACBANnnPEOmV/40/HvwU+Xr5kkEF2CtJ15ZlYFfFDYqPSxEvXKwdUW4LL++SWj9YTi6sEEppH1t/0oSLwq/RXs6uey1pBnDMcikLIPuF5xmh3dc1yr38cLefD/1VfncXIfBpajjzb5gyhvGAMwCednKttOS6HMFYhj4XK8x7XF3R1dNAAAAFQDWRIJVFVQr9Rizit+exU3uH0ZWuwAAAIBXVZNjdibQ0blGrsNAH/pz2yPvtRZDFlUHHkLlT41pj+JitoIW/zPrBcELTRl3Bn9hPrMhs+arfT7wPMCwtUhu9RM23H0AY8A6iWMd+MAjyuRVnbKm/t5UY+9OeSGmhY0VmSd1VmgtL1WFW2Z8JruDU+SKobBs+FAnAPOVyetXogAAAIBu3pU9tLu7VZh96MqTYAOsnhkFdhcSemgQDtgWhvWN4sOah+g2i0VuqPC2G2bRpiiJO2Zu6Y6OguA46Ie6l1PCcm1I799vqe5545JKUGi3rS50lX3udH5j68twbvSTpniTMQzaGUdKB67rWBsSABKawWc75f1ifJa1eUdHxfoQxg== cambrium@cambrium01.ring.nlnog.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAwreIddtAA7ONovBfx2Uxt1ZA18aTomnFuynzmi/NOD+BdCHCO0xfUPyYjEPf5+R8iuNBSrjDscMKMFIO2nHShmNFueuCyCvWOYhLCFEEFA1SlmzGa3grAnNqNH71sru7igc30qtAi6/BTO591kvzB+qatxQcO2AEsxALu8aPwRk= /home/staff/johan/.ssh/id_rsa',
            'ssh-dss AAAAB3NzaC1kc3MAAACBANnnPEOmV/40/HvwU+Xr5kkEF2CtJ15ZlYFfFDYqPSxEvXKwdUW4LL++SWj9YTi6sEEppH1t/0oSLwq/RXs6uey1pBnDMcikLIPuF5xmh3dc1yr38cLefD/1VfncXIfBpajjzb5gyhvGAMwCednKttOS6HMFYhj4XK8x7XF3R1dNAAAAFQDWRIJVFVQr9Rizit+exU3uH0ZWuwAAAIBXVZNjdibQ0blGrsNAH/pz2yPvtRZDFlUHHkLlT41pj+JitoIW/zPrBcELTRl3Bn9hPrMhs+arfT7wPMCwtUhu9RM23H0AY8A6iWMd+MAjyuRVnbKm/t5UY+9OeSGmhY0VmSd1VmgtL1WFW2Z8JruDU+SKobBs+FAnAPOVyetXogAAAIBu3pU9tLu7VZh96MqTYAOsnhkFdhcSemgQDtgWhvWN4sOah+g2i0VuqPC2G2bRpiiJO2Zu6Y6OguA46Ie6l1PCcm1I799vqe5545JKUGi3rS50lX3udH5j68twbvSTpniTMQzaGUdKB67rWBsSABKawWc75f1ifJa1eUdHxfoQxg== cambrium@cambrium01.ring.nlnog.net-dss',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAKwq1BcTcA1Nrw78Kn2/7Y5cL9LR4dOODqMT00z3hFbOdpc8NF9ashJTdv4SvfQLOwbw+FbxNM9Ew2rIEZNNg86Gh76mzKIURnZ7CIxg8Msh8sm6TNc5SBYxNSkqpEJOfP+PnEjEAMtkT/InbNq++WohQNxc7kI2ZyRxLoiujCH1AAAAFQDXnhxAUR6VyxYxDNZE++DE9St+YwAAAIAMjzRnrML3nSGrG4p+llH9tZTOIPnHOycydAhKk1TEY+plWyG+0nw/F/BpmmdaZtcsSqxy3SLPy12SOeuFnMlgCWYs8VNF+NP9f5gOljrQw+llbi+bChnkH4XYC9V+YHwytCoaw3ahFVdo8KoulprMpU7MWf6v/P0hOhwlqYB0WAAAAIAd2LVhmWt48Cz3qczyVbMuvLtH+pXotDxrK49LwiTCYPH6Id2uy5laDGt9hjRzjWXKNaG1NY4hjwnIraQSREAEBMz15+NVg0/kKMT10LiD7FwtSP02nvRVy7DTgZenpXy8xrEHKtz6NgmkfYyqWeF3AwTm94vEp/zhtCOhIDq/Sg== /home/staff/johan/.ssh/id_dsa',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAougxtaZAyGf1Hk5gZxUs6VSSaV+cquTW9hrX3Cc1g1sNrNj4Z2PjAnY9L4JDjhcQ9yegg8I/x459gYh22TuEEkzNpxou1N2PSXFPj4vu9eIRyAVaGPbRJLJRCJdjdUNo/xcpprxCYm6i+sqf4zoKTHOWA7eKxETqM2Mg1F17ANc= /home/markvh/.ssh/id_rsa',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKfxXPpw9mx4RHu7Bo3bZEz14qafCLyQz3zsug3fBRXSW5FlxZ+omJOYPLWUShl0cIPwJ0Ea7IKgJYKIg2IzlwwB5TU3fJ8BciydWqhwHl2ZZFwofVHCBQjmTBj0tag6O2SNX3mVgyODxP56pBcXbWJpvc2KJsQhkzpS/7vXBprO6urvhVsOFUTTIJSKICvaHX0FJnmSwHqtVfTNNtBDNp26XgT4DfjeSgtkDKUzAA0mka28lhq3Uj3dKBzZ9Y4xIHiw+eQgStRkVoc9usjeph1p+GSN12w2su5s7rXO0ncG0DEdEs03k5sO0CpZ4Le/pnWDWKRCrWBTtQ6yEXdgPf cambrium@cambrium01.ring.nlnog.net-rsa',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC0euDuFc4u7eoEocqByrMAwFN1F80wKpv5ckRGgbKupYk1Jig458/qkjoktjmvKRAfq2RCvme9ta97DmcvQJ7yuaXP4h748neM4zOTgipX3KGPWUQ+Ejn5EuGOt2m7RbkOFVszoZMYK5YNjalnbbuoJzT7MzahxOrYKNE13GbeoXPM30IgEv/jAg8k8iDK7pAmKknXbZg1HQB7SLc4CvhofpV7XJzR6KK1pvZrm7hRJeW9hV0gf8OmpCO+LXqpVqQiSko6ciuTUS5GVsU+ynyHH+YV5srqlLkM/6R28LP1zhrJQdFHbciWNVIqbUA5W9m7go7kY9VoactRKVBuYWzV larsgn@atari',
        ],
    }
##### END cambrium #####

##### BEGIN zylon #####

    @add_user { 'zylon':
        email    => 'smite@zylon.net',
        company => 'Zylon',
        uid      => 5008,
        groups   => ['ring-users']
    }
    @authorized_keys { 'zylon':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAACBAKfdyrV1X4PvcSvGKFW9sMSLXqGzaUOrQFQIAceg/tl+GZKkL8EPMSLW19aoORupsuJhQMIv4Qqe2oFITl12R6AUnzbcTb65B+YK/3dpMmzBce5IpADUdTyLVzQSiGUF5gsfw8C79fLAkgBi6JXwbVDewzqnQ17XX1qc11R0sMZNAAAAFQCWZNFJhB4e+ml9KI7d2XEVrMR3oQAAAIBuPk7yGJc4tgoCZKcQUUiXDS9jyv9YuNUkvCWKBtzgJjcRmtrF4b5ntOqI6mEnuMGUBznzFcGI9mCUQHnfb/kpLL6QSzcLpTCfNXHTevA1aeG3hrIEXnYvbh2R4IpXPjp6kN1/HUfJLHYzn4svfXXZ921cmoa7iT86M4/TWKH0kwAAAIA/IYO8R6PA1B42uqiSNVbklvrecua1hKexlG7JO0WitowKQVmArKe9o8uO+2ri7k5DXGlPLNpoc3OqEWo8GOG3YMtQjEW2MUblBVlAMN7bFLj+DZSqBrEdiFZnZ/azElpH08m+ojMI0yzObGqhrnEodCkYDYi5LgVXXrOMiMFnmQ== smite@zylon.net',
        ],
    }
##### END zylon #####

##### BEGIN duocast #####

    @add_user { 'duocast':
        email   => 'noc@duocast.net',
        company => 'Duocast',
        uid     => 5009,
        groups  => ['ring-users']
    }
    @authorized_keys { 'duocast':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAghMY9EavxopexZ0HhJvzDYBdIvcf4iBPzvfLrYshuF4keakyugfQ6mob2qlssVIAztJRrQfUDtgvNGKxOFrCzV9vXwf5bJUbCPbUIoSQTdoSBzwl31Q6dHpYBc5jQ5Xmez8wcc0dtxdMun+/eVOVG+ErghC8jpoCVQrwu5ikc2E= fabian@fabian.office.duocast.nl',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAghMY9EavxopexZ0HhJvzDYBdIvcf4iBPzvfLrYshuF4keakyugfQ6mob2qlssVIAztJRrQfUDtgvNGKxOFrCzV9vXwf5bJUbCPbUIoSQTdoSBzwl31Q6dHpYBc5jQ5Xmez8wcc0dtxdMun+/eVOVG+ErghC8jpoCVQrwu5ikc2E= fabian@fabian.office.duocast.nl_1',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAOgxMrwySYHnOnrmMzUW60uU/wwVCNBZ10rvBpKCHUX7ix53wTHnDm8R0SbxswimdeoRFL9CM172Q4b4xnUZw/GsPewoVRoz2gphU4cXiTbrPpd9Ysq4jSrtJCS/ZsixsUPiivd1tAMHb3hmfNarj7rZPotnUslK1zgmmxqJDKzPAAAAFQC1RqG0hmsrnrusWTJvcgG+5D0ISQAAAIAHNW3sNneWyjri0f+hJ7zq7JcdPq+/pHO7XZDQjoLSfIUxxRZxsjTDjnfLfTbPNwlC9UiSE3Zc6y0DGWBVWQyDewzANJItQVb8tQC/snkZMtAVq8SApreoQtUgc39ZNPRMPOm8ROgH2GsHCt3AIn9Fj18TO2sSJw7MFJnTjRGCiwAAAIEAkCuxqpfHoi5R7HPWW1X2GfswAK4DVmIdPT5kqlqdPmAmm8IJ5Ifxcfd48/UeBq6cjFNRTxwjW14dFlHTUxNPUIEKXyXyb/whDQjPtvHSMP6D/h/P+nUPUK5bwHGaZ4TLKnIzEzj2htO4iBwz7PjTK2upMVvoQr2orBKuz4tnk14= tozz@duocast_2',
        ],
    }
##### END duocast #####

##### BEGIN easyhosting #####

    @add_user { 'easyhosting':
        email   => 'systeembeheer@easyhosting.nl',
        company => 'Easyhosting',
        uid     => 5010,
        groups  => ['ring-users']
    }
    @authorized_keys { 'easyhosting':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAACBALEAhT8vTvMAkAj+Uk0PrGh13BBWDzWlJs8vuWf5xK/7KF5sR2VHKBYmOJ67pGtRc5i+NOkhj8sWjvF3uyVupwTUICUqTpeBLI5R/P/jB5lUeiYVZF3HzV+gDSIalijjY7yZrP35CviZvuyP5Ntr+eSFNCkgqcAKZpphmDHPAASDAAAAFQC5GbXzD7xPYH0kI7+hOjyoSBdW+QAAAIEAgAAI4tMDOkDlfJCbQfDjPMcHsGN7HNxpz9obx1cbJdZOBOGd3fWsYlQmOO/NBvVDRuaQ/JRXzvxP9BKtf7TEu7icWU4Q6PECR7Z4NpgWX2amVuMy2ol0Bs2bcnbM3UHa06IgLX17KaE+Jor0utr9SHMPFClS2doKsTnuuzRQZFoAAACAMiWkNW7j//w3kih64KBvnozjrvDGj5hVyvMq7PZEjwhe2+vx8ErY+af4SnP/a3j1wyTLwMMxDr2+c7143ZRBil5Fmgr9YuPe3OQyx/zZ2AJmCQiWQiZ1EDvMFPl4gcD8XWH6RG+zs21uGLwSShthWUMclTULBIZqUbMA80bJdx0= systeembeheer@easyhosting.nl',
        ],
    }
##### END easyhosting #####

##### BEGIN previder #####

    @add_user { 'previder':
        email   => 'noc@previder.net',
        company => 'Previder',
        uid     => 5011,
        groups  => ['ring-users']
    }
    @authorized_keys { 'previder':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAACBAOmrANjEYNBp3+yxYd6T/x0Pe45kAKfQ/rnM256Vd1ytV6LbbHUXPizQjVy/40rA7Vem/uux+9Cw42IX2ss62TFx2JSbQVcp3HxPvW/FXd55r2kSVvARI35OYUWU6KQWH3f8zrFvDtMTkpK/GiB1hB8WJIMMtZZP64r5zyqsi5abAAAAFQDoRLfZtdES20c6SCYHGOtEn1ZVPQAAAIEAr8hFL7oZCs8JRTzVJtW6qp9h/j1cFlTFHDACRy3dN8VWIJUt5+PQss9xfD+0ACobqOo6N41qxvWE6JEfchd0Aeqwx2Jie70eorj7uJKUTjVDFGx5S7T5ZRq3czXlfckzo/xRI5l0nN3kt09wp4G1zXiBmPiK+GwVF06uHSbJelIAAACAXxiOe9j62EgoxRgregDNp32s5lxVFbSGqpsxLOsddMBOB98pa50NluvZEaUwRLv8kK6+YgT4WI/q3DcWwEVXY/ZUP0IDpUmtA8PUQyouy2lBWik746GqN+Re8b5NjO6OwuNfH8bTb1HllFzc339O8+KOHN11t10VMyXzEIo1sk4= robin@previder.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAsNdT8O09tlD93dRZS3bHxGeSwMlO9n/+ZaHlOXeLtnGd9IvNVe+4UxEcXNK7hHgkJrthhlhT/TEQN6irawfRANZw82HprEjQXOOWKprPXUKqhoGfkBI0FV+t+AzuLxH2gDsDQ/A7aQteKoAJYE4rT1nO6nDJM+/bAosSYBCFANU= nick@mustang.introweb.nl',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEA6inD1YOQCwDt7u4EJiMkSWhaC/qlatyExWaO0gpY+cKH3rsGxzibLDpn06f3luBP4fhKPJt5QTNR8jqjrCdmjVqBX1Ox8rp1g+JYW4r69Prwoi1og6FVHQGjT+1sLwoVGDOh+ZhY9Ef8VHpfh7QCkHxv8SEsEFTtlzxMAOwxCkE= edwin@mustang.introweb.nl',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAOzn7W2wplWml+5zK0GyuRUxzI6EZcU968fRv7ZhlH9STOBxl7RwBf5Zy8/ZWmj4BYe2tfzZO4q9XvIn/6pLwTaA1o3ICsChT5/QzoYQRkLXWZXE5Z0eoqqUxGRSzUUkB9/nBmBCbimiW/lhKAsq7W3Evwy/5bjmiW/7rkV/KnFJAAAAFQD181lTWLMEgnH3WdbJawJyjdO3lwAAAIEAp2wRg4UAoIMdwk4GOqUdJZ+VcP3XvefG26unLbbc8cxfusb5t4nP10zGIa3ahya0i3E7NYj7vu7D1igtJdYHU6DTPDoXztz5apikoHgEitt+2cz+TFENwnTkIHztQ6GKjrI8BW2XpAFYBGaKxpuhSxwGQGr0kqq7MDf40jNv8SwAAACBAKgZqhEiTRgCxffmM5Dy931IK6bL3K9Tl3wXYWCaX6Wc3H+jGCZifJHxINdM1VHPAhoNeO/ExIusM1CrY8NvxXP5xkru+jlqem3ciVNN4s8dcDuvk/3aLM62Bq5qhaYfcwOHBwya5FRIbIzGYXkxr9Xd5059ua6wUnNEJU+dhcRs erik@mustang.introweb.nl',
        ],
    }
##### END previder #####
 
##### BEGIN leaseweb #####

    @add_user { 'leaseweb':
        email   => 'noc@leaseweb.com',
        company => 'Leaseweb BV',
        uid     => 5012,
        groups  => ['ring-users']
    }
    @authorized_keys { 'leaseweb':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAACBAKrXxLnA6hi7ppZZHOwILVmMmG02n8tRGdgHXxuhYgyEoaEAVJrBPvdziYGSc1MLSXlXtmm+XL8uDMQTnqwb3YZiKKW8v65Se35GdWr1Uf3Gk2jF/M7lq6zR2ji/d7iFq5zUHSEWGOYDz73feDNhJu568k5j/WLSxaV0m9Z7lsdTAAAAFQCeSCQTuWFZVtQYezeFDwDpOf0OlwAAAIB/AlZANZgGYBIsruBaYXseU1jfHm4e5xNGJBmFUtrqLgi09xq+kYpCQITCpPd6eE3MLJ2JylW/o3tlREtvDU/oZDnfG8DgVIz2rtjQ7RkeVH0Wh60CrXn9wV01s/5ih9ISO6ECMV4vr3KWX9XgmQFG91YqXTdcnmHwuYZUeQLQ0AAAAIA4h0zTpnycHcmW2Bfwkor0X2mHdNSZad3+wEx3Bf4DE8VpXMNbJcYgyZ0STbvmGwyAnLZ78qe0+Id0ywkTRXtFd7GNoI02qMnQgBfgZDCcwxHxlcG4v9iI/arCCMGibIWf1Fzog/TYGiJIPExB5WE7G0G3U9jKnxQh3zxG2vtUHA== bas@louise.frogerstraat.nl',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAkCgRUkL3e3vm1UO+mQMYhnxdjOavmZXBeBWQO5X9T0y7uj70M+bX/Z3lhOF4Lq0VX4UL8UEfRy/aYa6zxv+SmUsvrPs4Lgo+yeLAVR+zxnZLjsch6r6zFV6+v4dPfKJUO+58bI69+gIUctuczwQn9nvmp76uPbsTvGXVdbtuwzc= GJA',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA2oT8VUGJb2Y0HtFzLBJ5z/mIUftYlQwdlk7/9O1GHCXgKE5cgUI8tH84wfMNMAVBQc+oJbUZkHDQvmc+bmUs+rSSwsUEo/y4obt2TwjpMqZHhX2PWAk+xjFB4GaFxiqriWqk6HYSC9N3DaBjpC6l8MSGpvvrcA7ZBHx+nt7jVA+f1zhd+FMDWelS/+Y6W9VGYzTmOPpvHYx+r9a7zwdsbVzJ/SEGKqyae00/Ke18lbjhSCy2nxbvli+dvZLuiq+XS7XHk7rR7b5LG6z2YjRZ2HnMsViEIomuzDisZ9XeXefAQZtUJbC+rbQ6XTwqlLLl3MW8agjdzplK5+3Y2nnh+Q== KDE',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAzBtWuVoHct4fH+EXBBq+OUNxjP7jIamG9Qomf9cdiUDDiUsvM8umbk1s8zRkT+7gZxUDwX/qyr1066P50/OV76J5clMYGeYPUbJBL8wBi2CmokK2EoWk629FlDoZq9eF82coi0mULJ6Poux45t1dcF8lbJE7SJRG6gVYQbYw78pJ652U4Y1wa3OzdmcWGJcc8vAlbZ6Cg0kDfzTeRscdSbQsd0PTAKHyr1G8uEQEGJTekksJ1SFHcGIvnl3uR/i3V8pNa7s/bY+ftTs+ZuruOOEuhbGaaGfKbwd6Q0Df/YUJ4fG08H2P1uELcnE8FWnEyAV1XwCu3b0F1Xiexsbe0Q== VLB',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAsLvoKmWCqyIrwyP0g3AfXpi1QB0e0VQU7Y5jCAkfb/V8sovrB6daF+XXFH2/lR9T17pVJmJyRfEjtr0EvdGY/o0C3R8CH7yVYoPEPk7GcimB8y6M//jc7vzZ5rwel4tXKQ8jWARDfEGmwx7s6m38/89KIm0DrAI89VS6Z2XNbYhct25POuIVJp5o/kVoyhv0LGZTSH//j2AzMW/ER3/srH+v7e+6IbypHbpw2xu8KJWUwfrvLgujASM/DbCquaQDd+UFJ+ySFmEm6yhz/gRPVbF99ihAmrtY0mN8JseLfwXAAz/vXe2a1y+aNBP4bgU7jMc+Hl6/WgxTkUaLDvJ8xQ== HBL',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEArf+dRrIwktAU/7jF+Cf0vfL8AF57+ybcLmOoboRzmXBaAjlEROWRQpT8Zb4gum3Y1JIodckTcXEJPKSl+GTeAWY8ZM46GITRjkVc/mYLItAP88Vd2l/2qqJA4gUHWx4nsPn5jZE2RbDBHitWnBVF6Jr+uHkkyH4pVTta392aVxoXWoI8gynXvD4NfrnHJsC5zs4RP5U75Oe983E+OJplu//AsSCnFg7DqWlJV7jSHa381hrfVXftrVO7ItewqSj3XNK/LitF6GHoyviAmAq3re4/hENglXzXHk0HmD7kj86r6V6BjrDVHqwOJAIypsPouZ6BNjncNeAJGEAXYblwEQ== RDB',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAwSJX5z6hEEp8e+jreaajAjf5dR211J3nJORGBEkJDwGmdadvPs0xEFJKlrmqA3Wng6zNufN/fYaB8RMfXS4sawg+xiHNv4lsCbJRTXziGPS3FBoUvDaAr82tAiStMCk0A67bvVdqnNNQ4NIz4BTWNGiL2nM+ZOm7p8rLNDpbOxLOJPZd/R85nOzIydsnzpL69OxlqRJtlJl/9ZZEW/t3KfaFvymNeeiNMwzwC3TO5LP+C5UJWrFTbx7xuvUfraHq+csHLeV2QsuhFBiUU5P8U3uwCKAlNnYzcywc2Tbzrl4OMn9hPFb/M4YD83tYmoogJmz/l3r8+6yxoCfpyNeKPw== HIJ',
            'ssh-dss AAAAB3NzaC1kc3MAAACBALwz7tN4CrCt+Wb7YK7m71vPO2Mewy9o6wv1G6imLaiHJPBij/JD572Dh7Fr6y8IBwO29oVJs2X7qadPdV6QwZKg+UK/OagEnGQ5RIXJYH8ztOrG/RrLWdiSmrUOJBvPVTrfb65WjB47BIcaoRoZVzdQLT+iKSIw4649Gt1NjxE9AAAAFQCVa1phbmLqhxAJuYkmOPf10VCZ7QAAAIEAoRSNqDSaf91DENCDm6Brgn23VhT+8v1dFTKoGLmiI33U8MG60QOZL1iELxVh4HVQr8mISdH3hqbYJApvFAtpqoJ6iNAEHVJGEPXb/Or2Kp6afZyxW3Ja+VYHJJJbsh+T2NwAwstbrQg/M6Sd3e8BexbKR5X0NlXhj65gG7eFwIwAAACBALaB/FsqavR/P4jmz2PuCc8KNCXbaOZIdIaIUxr0XzI+6KpmzXI+M1iRqC3qLwuTSw2hMZOxcYz7Xt2GOAqEShCx26bvKNaGTpcyhlTSjYEhBb82HZeb6nKjmUY8bQ5we65SMJ4Eti9K90USBEBFuqZiJEjspOiLAnj18fdmV86x rvdm',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAv0WQN636FgKu+fQL7Pipm3X9SqaNR0J0NEpv4otZjzl0fcqAsOYCT3KRzBaJoP4lhLwuTWXV7KyqH8s925axcLrPHUsnl7/B3r0ZbsBEoOAjCL/Diuyrt4eVAU+jJ5Cm0Pfbjc0j/KDTn6ZwSCVbiQKM1Xp+Bl3KtAjgAAar4dU= SVE',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAr0Lfhbgnorsor4SISntXucT/zTFIDBBisoeZ8sl5yx6YGqVJ/7/RhZmVtilOmyaFzj5gOFzFhhaZ+GaBM9owDSHnHoJBMJl7KIh6boS8rhdazshEYqKfrv2Hc4ufIoOUmQqXb22Ta6+97pFhsCabfCXFvyKPT+SI51dNECohuNU= RER',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAteebQybAauS2z3ogI8aUnZKMxBHnH1PP3cJbNPFQWf5bVfv30nXRo7MgkdDHdHTwCG9NJmRbvcVCFY4vsB2G+M7uh3EX8PZGgTGvywokY2HmZQojATFb6EmVqDk+zaRa5MyDw+4W6hXyWKdV1yybS+0MIve/NlUuKGwb7YB63RGcr7W7fAUMlhLQHuPJcj5ltpqw1LfjNkTk9I1RvrYesdcpKAk16ZUZoSuvLosT34D7wgMQ8bWXrTSNRlOhAdht5b+iPhsQOQgZHoS+Z1vSBEmRdftRaPMXqS9bCI5dmoNTcRAFXtmi2P7GVymnoYFKHG68g8Pk/F1TAiDjBA81ew== APE',
        ],
    }

##### END leaseweb #####
 
##### BEGIN nxs #####

    @add_user { 'nxs':
        email   => 'ralph.smit@nxs.nl',
        company => 'NXS',
        uid     => 5013,
        groups  => ['ring-users']
    }
    @authorized_keys { 'nxs':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQC+WX1MzDMc0aKMuafHCsmT0tYSMBC1qb2pwCsCqgnskQDvTAk5cjlMwotptbFAUUOxjLY0vEP0KoEh8OFjkJAw9vMlj/X+H5FcWymoNzWePg/mmUGZH2hBWjNCCGuJnyJGPuee0P2zgmQ2MmVLU35hBRk1nEJ7K1AngOGPerY4Iw== ralphs@nxs',
        ],
    }
##### END nxs #####
 
##### BEGIN xs4all #####
 
    @add_user { 'xs4all':
        email   => 'noc@xs4all.net',
        company => 'XS4ALL',
        uid     => 5015,
        groups  => ['ring-users']
    }
    @authorized_keys { 'xs4all':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAzq+/8IJputPveyQKOFufRTZREZ0uE/P7u0iYbdmMZFsdy56Wt6/Qvkzny/f9AKcHqFuwkDgvYIWtVeZNKa1aL1iWqyjbC9EQkVq37vEzmnWLJRk968W9owoFV8C1JE/iQd5/ZfoNUzcolxd2jTbuvdQ8LiDfEivfbOroi7KwfMs= maarten@macbook.carels.info',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAMROwonJ92paPJQkJEIVz0f/Kn7+U+Cp0o8cGmK0t3IUzOdks6z6QMmtvYpZCJBZKJP9PHiydUq17DE0NJmuzTHxrZKzAcklf3vOuViiG2OtphvrYjYMO9DljK+qY/5t7w/sLSjGRp/CobghcBr/TA/7vtS61s4uOQZkQ0+IcMKnAAAAFQCrxVJRkWcVx98y0uXA6UAYUIoylQAAAIBlJdVfbolpA2uzskZoAJt6DGEJh6jr9jFeVuuO6cYC0WkRJskGi9ZazwtDf49VBwa2/FUFahLoInxuaX8kaI6IozB0yLF6XzuTCeoAUBCRLXl0W28gfUebpMjANj5b662N7f77fxwrQV9dkx94CJJqOweD5f6MhmbxNFudaTFVVQAAAIBRLEAP5UCWsZJ03KE/soTLkU2LxC5Hk5ryQVHl+jiXhqSvTezUaKf8dIrmR+Aa8zsTzccQPDYwGnushk04fV4ASsSrSIYqn8WlPrcghH9XuzzK7cNGMs4/1F1h35ZchXkXBtIdKrZVdPjrmwf93LnVSolLSEBQc9oy39Pbf5YpKw== mikevs@xs4all.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAnNQRiS9gShwU5a3t6WwHDk0QaS/XrBBUK2SOq4vmH42GLsc/qwyVp8PVFFD+xepMx7XpFmSSMiDZyGDy6sSgQJauTbkdAVTSkvR62/KaBrm2uChoeYZyBVkMmMjoG8LoOp2mPheKLSuMgKoV9XbUW0qi3ERBydQkXuSksZU7U/94Zt0QYkBMecgGh6TZrXKf5OxAamFT5a6p1X0DC5pb1bFKLDuHHPSojBFCWTYU4D9GCDank6GhTWn4JJ4SeJEjdPegy1WKfEzSeOIScRGhByIRAzjPv2LZChIGR80MLHgo0PKrLKJlQu3FzvQKFZEfq7iiznz0g1l0+9c6ezLyeQ== carelsm@netadmin.xs4all.nl',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEA8dDGdThW8WV/k6c+XIpZGcv9IsK067cgT88alOQtaMo/cxCpX2ESWo++RCAwc9SUWxjrsOvo3x6JWGoVOTdXq4SnBwqgX02zZGoL1DjZwfQxfF3zN/AC+uKZTqgX1RnbFfr571TO9laTnJ3dSu5pgElsBAOfURaVGz19ZhN98Ds= Carelsm@beechnut.xs4all.nl',
            'ssh-dss AAAAB3NzaC1kc3MAAACBANmLy3/PuiImH81ufL9SiMACN7vumP1Q0QLHS5zOBAeh5Jdi2jMRKdR/M4vFe3KnrSH53j4INR/kCOqfpsMbdUG2HWNKbjp0UTbRQIsS4MOapSYx6ob4XRveJGH77yCgjmeuRR1OnbFzHTp4p8PvBnwv2muyBh7aA5f1q8Y3O2WBAAAAFQDZJM0i8iidyLhxS/1B6hsylC9lSQAAAIAlFwvhSXK7rGY2oNdLHRBWmKZ7SJLfObEZvnBSKSbzmPFK5wGLnTGMa2sMe6WAXnBaOZw1p9ZCur0VxMzrBpxde+EcbQ1b8Zni47QOUM+luz6We7CWboGpI+ZbJst6lwzl+CA4gGyK3QB2qIZHGwd+ooXGvDqNgQyKwIp322X7tQAAAIAqvBRhKigmTBy4wQ9bnc/wyoQa2kv/MvV5mlkVhIOhOyaSE7XPq48MIcDtSzuFPR86FDguibc4FKWFhkhs7CVs10iXXKyY0cUNejfMqvvOLundT3EU/r0wNMcuiw1xpbVChyKuXYIbTUHzqH9Wym9pI9KoyzisosodUI1Ab9ietg== remcovz@shell1.office.xs4all.nl',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAL+cCWAag3ikC/WXp3WF95ek82JDLLR9Q2jCrbHBaWVoi8oq57sXVWPwZjPqF975E8dhWuZMmlKeV18h9lFEf4WZIadx0H1v9notCMGWXIjgDcPv/vtlC0GYAeaRIRVaZn2DmAgDYDeqvrD77F2wmXHChMYdNKES4Zr2lRCNNxiLAAAAFQCaArV2oqbWTZwQ/0uP3tKPG6EVLQAAAIBTC2pUOx44tNYoWMWV7F2ktiskxlKmayT8R1QAtcCB+w2PYiIYHpX0Qo4pYpP1gVpSx6FWgUkxf+eSfgbgaLsM9p4Xp/iKQZw38W3gTWYVHv/zTohBBvlZurMU4KFLFZonk9E/7CTVf4z7a+To07BXXIR34VfxB2kaMkSq8ODcfwAAAIEArf9ZF7R8WNNpA21Xl3P+R4dQq0CSSdewnSwZQRoxcRLyQO1g52K2fLno4FaJw9IGr8P2z5hDKycoOojsEpv12yX67drOW8wsn+d8A+XkuVNPF7ArObvYfwAxbcV7J8cw3E55PnWfJF9zcaP2WOoc9FtQ/TgWGrE4k3XSQtk45EU= kiersb@mescaline',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAJ2TUhpngeAKI9zb6HTZ2G3yUfVp9F0b6Jy1Kbj4V5O/yOeR0oIYs8sXp4uvcunOfKDQDJhRQN8AhQK/FAdT3vIGHdZyifKrlBOWexmN9edhXHV5bLR59uGnq2Lm+3TihKgTgjcpx6STFl9C0HdAtcAYvgnDz3FBOIETXJnyGhXbAAAAFQC2e0EM+cqc3Pn4XpPiFq3Cys0TGQAAAIB2Skwn/2Myt5MpiC9jLplu+ZApiiohp6NcV1ZMHzGjH53efb8bI/BOIxRcNKlU8rHr71x6UJLg0w+fcbo1jdmgspayTaj/mwQq9wpNfcajlmnQYVCdQ3Y1f16KVXjAVTgcZYDWKVt15RotY2fGRjWEVmJ5HaOqCiDvGrSEiKyflgAAAIEAmvdEH47gTTZWqtbEPrXupIMZWWVhLaXZaP3yrLDwhy/0KqurYT6jN1NMJ2jcM0QbkywwgdL3cQjtfVCwG8tKfPXjCCFXjvTksmfyx+r9+MJqWIyf/7sk/Kl1IVmi8y7sCPEUvm5cMiAuD/6VJbTXQYQHIphTbOxWg0b0vKPBV38= jcqschuu@shell1.office.xs4all.nl',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAo8iWoeIUYwU1/k7inCwSJQWNDIkQbIklefwmXG8U94Xr07zdQzvc4WCiPycTKTjEmEtc5KJTrPanwpX7ohPgNcWXiW4LS2ceDnXN+/EbZ4nF4MywfRebAX7Yd0IwdqESIX/hvfV9GzmoaaGo6/U4WDfTUsoRu71CUEuBY2jIygMhupvcrD8CbQD6PjkXAkgFKqXoP5CW2puv+MExGpLjJSwcdgjRi2O1SXyTo1eNSnWY7DqWCF6ptJDxWYeBP1LdmnevYLxSoCcJLNUB3m4+9/u+IhYZCZD2N+rScSfGYho66SJq+giQ/peL28gJ3cBK7gbw7T/ooQq6e/W2AV3Wnw== arndm@netadmin.xs4all.net',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAPfAC0eY0EgYTkUMQ8oxMGdMqJg1LU75+rcVV2kmPThZaZ8CqM//7zrAF7T2vZGl7/YAAZwD9uiXv/VceEXbVifzI94nPdcULhSv2UvBr6I6fP00yA0jZrMNYEjo34m1OpDLauwVv9djMXOqxL/8QCCdrY2xRyif64Z+k00Nh0e1AAAAFQCoGGhUPUQ08k14aP+iVZxBj582wwAAAIEAj+iPMJieyhex3BIv4ESyjVx3QnP1g+WTXEb1aj1WLCuE/QSZvmD4qQMO3HtGu5H3UROsxJUKSjsnRE33x1V4XWKAK0yuoJTFKxEgnrmg2URUpqhciMCqgC7nbIFCSpqWwR+Md6vms8hQJyDbfWVcjmh4VkCeaqnL6FNdecsJlqUAAACAGfND6IM304KZx3bQ2MMFUpBqvUDq+WG+FqAlhCYvERMuEIYPfdTKY7vzELVKH77GQKTPWgDU1i3pYhVmSiNvQj9debkyMpdGzPIL3mDf/WEvrXf44cdhx87tk7zB1f9vOxIKigR3UpSxMn4PO3on3rJMPlvTNJ34cfj+Evlq2wo= timo@timo-laptop',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDH1VWa24jtQ256NJ+Ya+vLc3iK+MJOhHJx3oXl1a9jB2MOCWhIkWS2K7LBPDEISWSj+uqQJGR9XpM7AU2+aLYyDiElsMCgWQKahK8bfQarinR+3G9B8F4tD0WN4EIenebLzpI07RrshHzOnjQo+W9yHtSrenR9qkDWkiy1BsnM2j8yZtCOTJBnoXmh2h6bSUIG1568m2fKr6lGfiKVr8Ds+cMcQNotBPuVNO1ZQmTQQdCZP9DGnlSBi7tagQTqlzgu1wsyPkk7Mf36rXqVRva8OXlng2WOLjIX0CVVolq1i5gvrwNtpR+SWoJLtRdc5++MBLn21Ks0Lz9HNYWlZaW/ arndm@mabuntu',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAwQDcBPTWbbnShQKUKZ5iP3B2Yyruf0BuRnnGV1cZOD7x1xWBNc1RfkSdv7WU5rxWj6JVhppqNGBF7PMknwvL4DLO8hotH7IfXuJPA4Pqal1PbEUIkNQlheRkYVSrgqDELo3qfUU6HyrgDfpvVxWk8zmjZchQdOlXZnBHRgipw2rQN2BrQvOky38ouHhpP2gxtF5cvirndNyjsLGRUEgx9nvtJnYasL0cs3Y7/oS8WOJpUSVow3dB3JL3Z1daSJgc3Ec= johnpc@*.ring.nlnog.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDBAc08JRWo/4jJAfaP5hsWl3ZP74i0jNeLJvfvZhgHDtU1kBr85JRaqhHRtWrUGvXw2/3UAAZUuJyp7i0S9TfPdeOV2Ag8len5C7HrhUO3rfj21PBr+ZTL2ywvI3OUOHfxc5Hd40TvurOIjRvZMAOrXr75FRX2BmHs86unmIp7nXbPo8q1YxBqI2PwVjRM5eg3FPRF/xeiWy0Q1d2eiq/nY75hoUCSnfQWHN45N/s2pQQKjxvudakOk+CeRH4ZDPo1nHVcjaFXw5YQVtZfkXp9FJN/wuuSfmDnkGYFcu+GMwvEanEs8enQdaBK1O6LPrwCVwtrRZvQiK1a4oc9R8457PuZud8LPQbf4FgWyHPviLbA5Bld/FvbHFSxk7hoWOp2Y6OcAmriFZ+IVHdXP9jd5Y8Schs3OowhYpj0/sCsWV2yysNEd6RB8/MwAVb1qjLdUBrJ2zJIPbq2+Xh59TLKtK/j/JktkVctmAzD8Wy3+3XdDG2dGkVXAt2cQi0TYuNL8ecC8G1Lx06zgqqX13d8LLAIOxMN4cLRSD6WKzXsb2ZtLkSw45QiFfhQljtfkD31pBNh7rEV2Nc+sxoC7+HHJwvCqHkMTlXIe90oH/euWzIB8PZvEnn3aV/pSZ6GRMH/TUGI5X9qPlPINBOS9hj/UDNN8e5ri3BxOtLJq0Hi4w== Daniël Mostertman',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDwspXP1JQOe3bi2ZVDYK4hm7LBiRT+RviNRvlHsHajildhSgPtOLEIQOSRH5bTjpE1VTGSHHOGqk9aKnyoJMLUb0QTVZMDv3q0rWL1eaEbo0d6a9ss6q/24h9TCKvJdUwbK6hwLC+slbMrq0bbOPyIyyXkL2ct5/PjqiK/1cf1DrKDrjpunoQg791BGGxSGb1OkerkJlO3bmNFJ8KTdwGSy8p1lc4gSm/BiPO5OBC0LsAyE67AaXuFfN6X6Gu8DKtCgzLIQM2R/p8gCT/lxKa+C++pjAqnUxHMcvR0v35QtsGlZwOB835CYT3rn9gk3//umsA5T78H7I5Kk6sbTscvM0pXWp2IGyKgF8ar4RHG7bzMB3ONlPaUUdzajhLS0icJ7pumaNxYyNJ5jk6MbbkWf++qKM++iFgCQai/xiyFYZGzUJ13AJ733gIWxigmBZxFf+/8sS9dcwMw1L55MRTczHif1NhFovWNqKpip7tsBgBfBnGNjTblGD1nvcEZPwZK4vdvwWT6GabC3zeziSWGMqKJhUkrmUbFzYxObna2aZrmtqYDKaLm6LxCErUVBz14sk1V1s8DnKspcWEd2d0VZkuOSIXk0fSYimqxx2jBpJj+0TZrvOwMicyX6TdiGctw7/y0snGOWcgHopQEZ1omhjmmC6CJSqqgSeQEggnPzQ== timr@netadmin.xs4all.net',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAM3H2qRN98cnVqOOncMUpSAXpBQkBivb6fhOprrwpDAA35D7GDfeb00paOYj35XiqkS8YvWOoLhYnvWZ3ZNtOj1+TChv08QSFG0p5nHDdeAlS5/cQO7cz7AnaZOzOELTNirNVUumM/SW3E+Bgc6mYPa1c75XL31zXZGI6oZQ2A41AAAAFQDUNTB4UUvglKjrkxBRwOIvNwPC0wAAAIEAkbMdwgBg0MkfMZvlpyCakTXGzx1SX525e+Il+38r3e4VV+vK04I2qXV8EhYLKCo/xK6io5SEXiHiiREJ5jwvnHGfATzq1aHyJ0WsZnHZPElCRX9iYSNOYO+VlxIg2cxb4m/f0I/zeVw+QgFfjubljLnYUr0db3ceflxek08T8s0AAACAfRMtA07hUbbvhKnBZ2krMaPs0ZUpDkkVF75Os+QaLDFMCPjvnZYteuM87GqrWimZ1dD87WVIiueUhz9T1xCe+eMjo9VKRfCKFkWTU92/1tMDjAV3eD+HDDPrKn0SS81I54wN6I/7Apigcoh+E+mJlXQxl4TN4WzqT+X7lq93sxA= cor@in.ter.net',
        ],
    }

##### END xs4all #####

##### BEGIN nedzone #####

    @add_user { 'nedzone':
        email   => 'noc@nedzone.nl',
        company => 'Nedzone BV',
        uid     => 5016,
        groups  => ['ring-users'],
    }
    @authorized_keys { 'nedzone':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIBr1P6kiPiQT+xCJVAmMQtL8VOerIv7epknE3n2ml2rcdlmWIMizGEtRI70rLZmBqyU7EMEU0c+hiq/k/HuzU9FW2Vla1VWi4pUtiqmwQK8u6uHd7tMKF7Vju46U3AWTItDtETIbPkSQyqx9Im1KZGj8FHrDlJ/lujk1olMjNmocw== bram-rsa-key-20110201',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAiFqSuv2cZ0riwTLeNOfXkrYmlAjWCDTYz+nTy89wAvVWvSTihqrsV2TLy10/ucH5ZMs1TYm5GubINutD13vHlJ8f7DqzF4s/uslIvrQ74GicGNniJuqD+K57nZFocEQx3Gs6SjW/lXoSdNCOR0mHkfpUQ40QGX+OfVXkYg0Dy5M= marcel-rsa-key-20110201',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA1KOp1JepL8TMPpBN0x1AdwuSw2mkNS375VFM41mziYLO8P6XUYMzC00xmSn+nlblFSV33eHzK6gi/X3xNr0b3DYPsKORHxvkbMmG4dUK8MahHwFHDl281Iv5M3e5dM2FOsyT3aWt5GdbGtzC+VBp8etVJAYtzU13FiIxZAxrTxM0Vt57mYNToYRtk8Skxp+TAkzXzChMRi4UoTzXcGcFGJ+3ezcGvRn15pSAcMQHT231taOQ3TJWQsDg3vBo3/b0+BzGng1VX2PCBKL1HZGWOW3/9stLLgHlks0oZsqK4/crR76iYAG8jUOc8KdS2eOFmCqiGKwWkthZY2gg6CYsUQ== joris@Joris-MacBook-Pro.local',
        ],
    }
##### END nedzone #####

##### BEGIN nlnogbot #####

    @add_user { 'nlnogbot':
        email   => 'sten@snore.nl',
        company => 'Sten Spans limited',
        uid     => 5017,
        groups  => ['ring-users'],
    }
    @authorized_keys { 'nlnogbot':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA3Cg9Jq+mEZwlwrm44P3swuEOM0VoVVP1Bm5r/+wO2luQWu9hWx3RQrKNL40gcavaW0e+pv1WO2BkLGVk/S7gcH9z9bFf7JRb9AymlYkwjZqHN1EQs5eBYLGrL2o20L8Wsb85LjdcRzAe116kguESzsdpdp/qO1F8UV6w6D7b1UDsP7lGANEJtGYIfJon65gEQjnI5X1cemEcGAcXi1SA0stazNaHGpxGRuaHHpgXc5k+YoU7+WAXLuTi5NR51NjDpptU2CApb/S4HZ3BH0j7kt9W1AuWN7+eaP2u3oJfWZZrnB73Ko/73WAF3uVDVabI7jEv5D0Dl+OrkEUuamCJ9Q== sten-nlnogbot@zem.blinkenlights.nl',
        ],
    }

##### END nlnogbot #####

##### BEGIN oxilion #####

    @add_user { 'oxilion':
        email   => 'noc@oxilion.nl',
        company => 'Oxilion',
        uid     => 5018,
        groups  => ['ring-users'],
    }
    @authorized_keys { 'oxilion':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAACBAIH4uNqbeod/QUf4DcKCHEFlLm5+8zf8xw3uamyRnJl1z/C1zMW5xMbPysRPNUJDJZzAxu2C4AwMSaOYdTjYKINfZWYD0aBcbgn7Ggz1bG/rxd6JcOLzp6X+Pgz4lP8RgMyt2FsiEO+5KtwcU0EA06uXO5TsFco5Eot1xLvpzi5vAAAAFQDyRQXCVHwVZ2loVneB5+8noD+x9QAAAIAb0ZnMNjefY3Lcd2ZRZKic8Gs8vNJDLuckwgytLY2HfJq4VFWs+oVxIq7C5+JVwroR3cz5wLTaUZ95Vnc4/SlpklQewCDwlL0SWOnh59TwlGkPgusypBy0UQHp/qEQH8TXiqtZLu4QjArCEO71RVqypgqTVV8NXE3cYkL6hv1ncQAAAIA1czSkbdbQfQjtwTYFWpSu1DIaQaeNsUVMnScA7W3RvZOIm+xo8kdqXvCBTyDZyZf04j815k7aZOA3fycouepZHPJNvfQj39eagcDkVmPI/kx7rgpLTFWQO+xZMJN3q9mA1gzxG0b1g5ZClUgkCn7xm4pzk3/YxOMqIqvkvKEnRA== sander@fedora.jronline.n',
            'ssh-dss AAAAB3NzaC1kc3MAAAEAU45STvUiUkfYhqTjXXQ+T6LEvyf2iMtxpMm8AgboFB3w1c3rBciveiBEH5+fp0p0OIw5Uz7xkEg2UT9Xut/oT/GuDCGGtHiBtDw+48IaMdGWjvYOvSBxWNgcoVXh2RqAZNGFzMEFWHK//QraK7HEyK2mRrwNT1Is6L4rYZjTDySoxmkPulw6tz0sy5yLHLySz83Qt+CE6HJbJvRHL3ZvfOzB8BEHQwT6wbYy3gI6EucZPHIPwIP4Ng+SC8ydEn1tq3jhQgqBcsuXBs7TZyNkFH7Qnp9Gskhga6EriOqQyQUbvhATi0w7tQQqbVqGeAeBSfeMe1YvrPrNhzit6DSNgwAAABUAn5oAMYC464Ki1cW8movZc4rUx90AAAEAHY0vVpkd4YhURJb9K4GvNc6rXJ2GDcVkvPVaZ+1pYdVuRsDntYi/vEuandm++gLP8nZoLoCE+nP0laRz/Y96keCOcHetxUBdyMPvLaB8lW83Z+Ukxa4rE4YSEOJeHag1rBmg/JWM92KfOWL55jJeJosXwCowybWcMQ3H0QKimOyQBatc31R6kRqrjA11yjWytRSJZo4csKiSNU3F1mCxrrouA/Hhi8nl8H0MPDd3CHA8Xa3n0Ri1jH4Kvpk3daO/JviHpqD/0rlZYcV7Cm/WBtopqU/GsQge7501KgOe6c8OA0LHDvDzMVumijK9mlbeIrdFHRDJYyRqnBIXfWhOzwAAAQAC5WrUj/iMsf/RXYX0IPvHmcN6B2RumNYdv0BjaTmKmtvUhKbA6rf0vvwIWKeEwhi3HR1rL41Nq3fb4QX+KlvmtHa2YQZHRmByRMe21KBXXxpl1rBN6L0W99hb/MqK5R/E1hBuPOdRDgmAKOEfr+my6NRLRMUVQHmvZ2MX3JQFGSor2a6ur0GcSbcQgT0E5jOsLpk/Qi3WCM3ntI/27cnUhmlOIbzNAyoo3B44UQbp99+GuRT+z5y5a7e6jgEsBH9pmhz55KgNG620fd/S2IzEXLPMzQs1/rSJrjqH9O+pq8vZNj1dgQBsr3jts5mq8dYpPAlrcyhH/qd+5v2+QjkS lj-key-20080618',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAL+naGa4gWrWrzVdGEkw6zlzjtrmkFxw9dBAe3sUimXlQ4iq1MqhYm+PqbH+7XT35uZPqwucz+u0h3daQ1GVy3WsmXmKpIj5sDe71ymJdMILiQmV4k+6wLociMpon8E+d2/Wyn9uVmtkZyxNNBroJuejcvcpi1HtXOP0Vetd8QH3AAAAFQCIda0YLTQGt2xllyBOFpAEj4fS2wAAAIEAr0sgCIhlXbxFLj9awUS/uuCmM13DLOsHxfl9anUyvwN3GqEetpvl9AcazD8JWBXt8x8e9OCKbafF/qy3yQaoy3vjPHU3ofdvvftyJqE6JUaGgIj8z7rIjxqfbdbC8Utld2yMZ68NadTxn+q9LuSyQ7dmQ3uPCPrEwkItNHpgab8AAACAR3xS4OCBNglVwQGf+HMjb1+cb/p2mCtkvpFAgiQT92790y0T45PzSDFQN20LFOfwrpRqigrxpgwHgX6thfOLUck+IPbkMPLa2TMlJYaY/IYhr08Am/hWFoi3TRPRDUPw26CSU5qNYPmfH7suC5EzBgjfoKvL3wY04eNIlSEu5Vk= tekkel@fedora.jronline.nl',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAsBbZp+Zo8Y/Jw4oqb1KHWONjGxesHSd4g6RYGrWOG1tOOqDerK1ZiFJcleIYXOFyaqyyZaVyChRQU6/U3gojP1a5jOvPX6LUo4WW6z60mi0C7utfHnKBV24wSF2s0I+7e9Saokgsw8ZpULNshD0sJZuzWFN1ep4Sk3jIPokWOrb5UR7ZkpB6PnpHQGpPLsEitbRiu7Fms6piYp10Wvj+U/alu9Ua4zWz5XtDOPm0aY13OqokGGlJCdBVmvMcF6wnk540X2y6Pd/fqrcZvLKwFFJSajW6/aNF3ZeP01M5MHd8xiE+duzL5exI9gAQY4PsV/wpKiMPM7AHgwuwLtj0iQ== tjikkun@peecee.hoentjen.eu',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIBlZkdBFEeyjt41M+JefGGTz+qZNU0IqH3yQ7bQC6GccJ7OqXsrHIkw6v1wqKxxp7fZgROxTlERQiV8CU9EHRytRw1oB1AXugt+gYd48qS3m7/e7ldUfMQ4bCZ7geyAbDuxCScpmBh5xpe52zALSgw45HTEvL+RM21sGuwOrIgiUw== wouter@schoot',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDK9rXRYxGmM5UNG/s59EKVDa1Fu7wXbwb7Gvvrp3XjpVC1Hhhh0kSJBFr2Z52hzePtlsHkCwcQYxJQfIVriUnEVmMUb+uD56IZKdLrw10jlXbU02sj3eXv78gmgb866GIbcfXqMXnk1nsUfbRolI2sPLkOi212txV0lf0u04Zx3dXAJgGEJDhWgeFP7PHytAvFkSqG3thptuUr/IiErkzgO7IqEGuHW46WjRWoRSjA0xxXrUlaEqyq/0LQYqFTevg3CfHBPn7CxXS38lZ3wBKXAD+hWvD3+PZsL9TSLFsEXlaraq1L0mqhmkmEExnLEHiWKlB84a4Biku0jBELz/mr tjikkun@sleptop.hoentjen',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsp/mLeYC+KUWmXd0YE1Wo0XfhhfPih9ICA20dvIZBeloCCEZoKSj3uL0b7wZwvbSjIgA8b3zcSG2YGzHGNPBBjf5ERXj1ZT8qwzc7r+mwzAufNZQUhuQj1Efud0HY0pgF+bBERAhBb8W+AWu6SbaEnwt//2DmFDXeIS5SPA5buAKeofFxvnRkumYrzvcstqMxh3r+qQaRRX91D4y3DblLuFJs0+cABjG6xlZw4UQWc3Xh+Ikv2PQHiZU8N8IucCXUOMY0Sfc22h+N9hWm/SHwzfrj85cCGg19esoGPSBXwozoJW+sJ3C2hgxngR2cBguUNUZs0cl39+8scV3+wxE3 ekohl',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCYUCD5BVc5ILSXhBh+Kj8gC/x7ctPhpk6GGrB/nJCyoY8hBXW6mspaVaQeLwDmjFFH+YwpfJZhCI1GFVsNKZWcLB319stoQkDEdYFcZZ6WMD4dc3kBVdEUqVBbe51pQlHIfuaROXAI42cjbJTuYy2AIVCKYdasg3ztFNuDE/RPuscbn9Kv7u8bi0CYjEYeSTML8YXX0n4xS7k1v6r0ksRnUxvNhgiEi73pSboRIeyizX3iaHB+vqWy9EoM8YjnJOUDjtMsflkHoV3UHWmcKOPjjvKNJeuUJs4rCksiXGM6iGdHx7jjcx9iW5v3L0mCuetV6AoZNw2bkXx7/6o6jao6vyJATAKQbHu31oJiPWjbtSgKzg2OepGcrpSm3fuDGncXqPSbf+RGYm0+6gMyt3Wbfl0q0DsB5nixbUqtx6BlG0zZyWhOD7FDmMh4L+fxM/pndh3rSOwLk7DlR9UiDWGvn7jxPXiinTn6aoef20IF+i9sRImpGYQaGDlpCIYI+3+V4MYm5KcgGFVOk4TSxqISvzKr9Rb19VxUV0QBd3v/U4TJBjLjmXlN5feSmEROWFURemvlH1nZfZOxPgAnR0S2YlW22q1Zoz6Ts/uq6lZTl5b1sBFFD1mCKS4aB4/R2GE3DWcieCpdZVLaHOpT4DBvKMovyMOp+dHBearmWs7NeQ== ekohl@donald',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQBgclQrR9xAtBCEeHHT6yXqiAOnR1esMUeoxnFniWimvn9ArbhT0pFOo7g5UKV9X9NN2sPuD4gvRB3dmHq1hmCSWERkyzpewGH4oj2KAnHgNRAQ5DfZ57Pq3/e2AtV14r3/ZA5vfBp9OqnZ5G8hcYK1K7gxH4XETBfXBKmsFkj8xqER8yxGtnkZ+zknvv3UVL+ZxRnrHUijkFQxkPpXn6kKK7SQrimDlSGJmPbLhoxNYPtTBG3lxBESkUJNhbSV0tKFs/BoJub/I4hfgaUoFTShw90RRmhazSsPCkMyNArOnPZUxdynxWkL/J9obLE6vCsb9heE1jDmkrkm8H10fNan Maurits',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAyichQW5tXDYr50BLt3aH/ogogEPEaw+atySmOOr1VqFXQq/sv9J+fJhQhAJyO5veSe9Vc3hp8Mal2uXuu4F8yvtBi0dG8dlwe4LC1GThDqA04M35uBvLVh23Y34d5W19TYqC3iun1SuOUwdx/7WPBJNUk2nGqd4Ln8AYtYx52gsYxNeEEz+CGli+ffU/cUSj6vucITe5S6JDpKcpgEh47ddpstLBIyB0mrfEpgXw2UaROXJCaYt9/rbxfVTydbkiCjlIS5Nn1JIVGeL+Vtzr/XmFysNaRp01CFJ8TmXzoZdnLbkYLFsMz4yKs7M2hnywvaCDtfCohyNapFCqEgGwxw== niek@oxilion.nl',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAumJ86e02yat/LOKMaxxGNeZpgDbTTqFidwC3h48FhyH82tRw4IR+47/LpNXRTPDNV2rpFHJq/GjPws+euySN4JKG0SCh7Lzn0A2kLoxIwF34+98jV1++pjQ3i/m9sO2hLOX7AUJ1yli5Etzye6IV+BNKNpFTMzjzD6Rsr4/ppIjoWzkPHIzNO9zZItPUlsOHs/TLmpsdjdWrMJQkY56Ap8FftmMeTgOK41zQPQ6Q+cNRNR3k6dON8J0N33nuG9V8q+fosZmrf36wLZb3HMp34EkFLcp8VGwh7WIF+kfXdoDMdl9twXxRXedhzv3xG7kdnXnCThrE0lPKv6gf/E/rnw== /home/wouter/.ssh/id_rsa',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQB8E67IL35a4I2gGhP44E0gO/jjtiBx98X6Y//BDEvUzsVCjZFG8rgKVxzPVHgXfJugPymAc4fvy6+cX1vXVl7vQPEUJUFB3cA32E7eHQRpVp5i3jtvno3dqCVncjpkjKG/9njDpWtvsH+mtCCP8BB47t8VRuRlDnPkoFjMC85odOKDFGEVrdWI1ZVkQw/PO76bUNJ5lyeEKZmboRfS8HSafLsKfaMHRz1/sR43QwSCXXVcpmj7+2GVpCssfbZinxFjgzS9SsUKg0PHkDcC07BWMiYeB07V4x+HP02HXPp2yCULRLRjoR0ReyyXjDLZeZ3/M/ENe/qDh2PW2LNA217T Arnoud nieuw',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAiiyQ3NMxDbA5oURe4dVoYu3XgXFpb5/vJp1g8gjxi/WpVkBNa3AxTp//cp5Z3Mv0lf/xxPOaukc0DZqtEVN8bcdF0Iwr/C9YlUtmTGTrlMykmpLjXTioZE/WdOhbnzqKIfUlElNcMjN505zcUibp2oDNDybHtkQujP5JSHPF8/M= rsa-key-20120607-rik',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAu7ljTiYn4c0boEG3KKeSyxRyH4tEe78zuW9ijiImX+0nqryoHa99AoqyBzp+QdATK7cRQgh1nwT0Xariimx7MPmX1Hyh0i+S9AmZprWXYPY419lJa0QxKjHDnVgrVRalXCkG4lhdFO/cyKorQJZAwjalNSIuEtiZZFwZYUSr2nE= h.j.stam@oxilion.nl',
        ],
    }
##### END oxilion #####

##### BEGIN ebayclassifiedsgroup #####

    @add_user { 'ebayclassifiedsgroup':
        email   => 'DL-eBay-Classifieds-Networking@ebay.com',
        company => 'eBay Classifieds Group',
        uid     => 5019,
        groups  => ['ring-users'],
    }
    @authorized_keys { 'ebayclassifiedsgroup':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAtV0MJYFlw+xm3h3hNKWWC3DKUQFhFDDoMBshhCOG2uS7QH38E26ZMCH0pi10h3ZNIBgVoToyOSXVgSYvhRqOemqL9xt/TbKWW9zvod9WocoYHPqoLymcPQrFK84VqcZ6ymGvjMeR3f5wAyRoVAWuSPocwEMFb49pOeIkjpF90oO0LfkNxrkhfeIxecdkyHHXa+WZmSN8YFGc/6ev8pMoAhx6x3/GC04Fi+7QQLKhcRZoHrklzU9qoK1XiI7VtlLBI9QjGsFObnE27z+XNgtzuj1j3yUXZvjCIZ4I53a+Y7k+rEEYwuV9Z/SYyX/I4esLIUJS936qN+k4o76ivl8XAw== mmoerman@l-lwr-00122309.corp.ebay.com',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA2BNYw6ZZI1KSZ/3cL/KqewqF8OVnYiAHTOQjzoUc8wWgEChoyDsGcK22OUN2OnLaI0i5aQftwyNSuyQUtCgrQis0AHtkdfINE2hOmCzjnNsJrb+vR9+6vdV0joz4nn3EVEzrLWvsmYlI6lm/Bi23XzddF31/izaspbp73+cs6gV76mxDBwfkGYyInwU2hxsAZdGHZ5fXime7V3fBwep1sXceFBMEyKuplyhfEZ1InV6Am1MUyRQcTLUj5bdnDq9dD28G2lP5ttGXP1Ve8VuoauNwbLMCMGWPs3HdvYcpMH0jc39Ce8DV3MvRcYaYxuaFeUFRcDdPOTD+/0x/2SAKtw== kvdhulst-ebayclassifiedsgroup',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAOdtbDlpjFQPmNd9EP0kXWdtr07iol4eRxpJU99wGTSDZAroX+A80iW6+erIBkYgiaZyuxL7cLd6qvNbzUjapzueh8Oty+p+6HxZqdXYNtcJzlhgUGENw8ibW2EeQLR1QDl5Ncw/DaDMFgIU7GRjRqvSXJVzGJKyMh6EERe8xMGBAAAAFQCVyV1jy1OeY4IVIsuvolpmFrVWGwAAAIEAyi0L8GqB8kY1sZjgMpYLWCBCa1pNEDTh7vkh2O5VQY3mP0+12o4VL/K66dqZIjis3DkJWozqOKt3hFGtbIRv+2sqg/6ySd9wzoVcV5xF47RKvvqRWTiQHWdsAPeKHpjb4Z/achjMFD8lF5Ch4W2rPiAu1GbA3x57wRycnMwryekAAACBAKorVt7GGZo1pLksOC+E774xDqhwnB1wkln20lQoamcZnlC8RUmg8NvvLPmwYiE4Rm06/kwMp+3bxJvzLvoR49m6syizIh6Gqo6PV598PpseaEU8r78qejlbNz4Ngy3IbWqmoCa2/9ir0a8C+PNTx+l6pgFO5TJyRdj1YJMII/8F willem_ebay',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA1tb31t+ULMn/4kPwghnH8E6Yqp8EcbOXF130hNUiEDTM467q9ItLXAqf64yXh5O1O2j5QyHjD0A38oLRXYdH03Cj5IPfKWmjiEK68OMBTJHDrzLXNRe/vLRIFzVLTI3UKMC24roPRWgOaQSonUL52bo3GSHanfpKxjdLWcpJeBTrNw7q1gxNixCbB3J79DkHUF7l/5ckKH4tvR+eSeQpYtu6HsX0voZS29GbqLLt4YcxYsMhmQrE31tTtMo8IGq6eN6n80Es4ZN72pb0GuBUpvFU4WXswTMeYPvQIoconPoZNvF6ynbDGDmx5+WxPhII5v2RV+1onKjpTuR+u+lhtw== fdudek@frank.mobile.rz',
        ],
    }
##### END ebayclassifiedsgroup #####

##### BEGIN is #####

    @add_user { 'is':
        email   => 'netwerk@is.nl',
        company => 'IS',
        uid     => 5021,
        groups  => ['ring-users'],
    }
    @authorized_keys { 'is':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAABAEA1LcP280wU3pX/0+gjhm7VYM9Zd3t6yg44+vq8eEp3Eku1Z2I3AUUqwQgWM1IJIFIcnexNR5VWaRsUDaJvfh+XmEzO2eJIqSxbIh2zBp/8+QMr7wq0HDzqwfWgk2wL9L1bMwR4ma/qEHZUJcNVKiI+xXbTjGfRrU9ATpNx5Rh7tS2HunYrsU7m4a1SHUk1MKjxXI0/NAG9vJJ7oyQ1LLq4cZP9BG1vwyfKYHSNgdMJvrOd+9/BjbgX1EJ5E14l3f7c700TuPSPV5x5QW+KbP74GG0/OhIvheHtRf8Zi/N3LcKRNtejbO+hctFhgWu6kp1ZqXHVJXWej5Yir5OEuf1OaRRCVyFWgoSWzQB4T3XPpjvuO3OljC2mQ5yxfWNOKqqxN3B9n13uBMo36I++RlDFkwHdJy50xMbWuTMGNTURrB0dSa6uYY5v0qw4BInXuAOIlrqdqNSPAMuQkHuHIArTYX6BoVE/6/WClYN+6CQ4u87RKtfnl1Hyuu7QEvfh5eolxz4FxpXCykv/dMPkwjV3JUIzZIEzLxqF5QA5Lofmd25TYocjMxvNGoe0hA5c8q1EjN/ll7R4rVn97Db/CbKqe+pY0ZZlFCYbdwCI/Tfzdph93CZjxtLAcLiCLDBi1ppV1m6BDztStBih50nNAe+Ivet+mVJ4bENuqBer0kO+oGTQPkYii3lzS7IfBuLZP99i2V0fkLsFYYYbrWDqESAwM9bUmw77IIjWZfRixrw6Z/cyRGD0lXLcrM0Ch8MJ9bE2TjFW5juvqQ1TITYRtWPAF3M4HmqXIYvpFovdsD3rm3+/9h3c1vQaDjmTbpO1pEOBdEleIRn4Ni0OUrgLmJwcjbNgl8bqpPTDJCPKBJchX3DVDlrJ6qYk+EZ1SyhOg+sZquoLZiRz6IIn3j70m4yH3EPYBZfwusKPZjNKrDHIxZ36UKS9hHQrCVfeP1KtJMZi3rjVC1s5me59Uc9V2DC3y+DYImWY2wcWw9gYgCNiJKRQJl4ESbSvEhq37mNH9sVMQCUJeuGv2xx8Rozrb+O9D4Jhe/GjixfeSkFMVFkfBLqyuRDJugLDA7BLdbwOKYf0xZtZ4neyxc2Kw6Il3jY26MHVxYqoqv2y6RgnzHJXdGZr+16oIWf6wWxLwmEk/kkO4namcZbJLMqlNegwt8grMPiIjLNXIa+42/pLwy07naHEUBr2OsO7fD4PokDYFKySB4NVMUU9CTTTF/eloTW2XGnO39N1k8NtGkQkffhyI9HqbuCvD8U0FdwSxFDajf3MIGBC+kL2pKQnCNRH7oJ/5oj0FkFTMO6kl8jJFLdj51Q7hf8X9oACPKmCGOK8ddc3AM0WyMkYW0OLPqIfOwRew== admpins04@shell01.pinshosting.dir',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAJu4y0R5kVef0voCJv9/9EL9ZO2TvKLD7HZRQfG8x2kxfd+NfUPQ8HKCTibE3CQQrSoZdH6m/y4c6LMMyGIjHAa7p1dX0sdse5ggQ2yfttQe5xTJb9HKhAH6XZBNGc07qCLnC3VkM7d15Bey8Y+/ZBP8++peu0dpiLJrcy9697WHAAAAFQDk8XIJV79MtatOi/iFKmVk2EwVxwAAAIAPOFq4vmckZcwGDia4o8cXc7KY3GY15oSGnQBtIA8XBo/wu0EKgjmFNOGMckwn4Yz82HYw/HVG0YWR6vEjE7j5cHJfOqAYJGKEd+XAl/CILdlKqLMNmOK5G9tdjmWhsKO2dDFXwVau1t8Mb2ib+4+FZGf7+ueasn62lTBhtaXToAAAAIAmRAtj9dM9IBzN4qx0N7VMqtyhqK3lwwm6fvAensrt+vKKvoCdgchXJ6hI+ZFolka6Xs2Oo6CutzC4mneHt8BYOWFEuiImdzuBkyvYPCTLVZtW51O84BHv6BaMHCUYzymn+EjvnuY/bigaG56GRuX/B4h338qq6Kq7WHdt9elOCA== matthijs@is.nl',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAKY4DvmUZi75w1EY4DyL0K9tnjoDOX8iZatRe4CEQqHQhVnwm86SkfGxW9Ng/tZnaxtC/cwUA4z5yIeGIZTwhsku1zCSG8wffirdTxpcvW4GngDEbZKnfPpsMxdmH2ZteNCaZbtfM8SCp7htTcgwlTCFtBdH3sj94zL/m+ysKiVZAAAAFQDVjMM2nB1e1sfuCBUIsZnX81YT7wAAAIBADnR2tvd+X9FJWmnU4vUtFxQEL+A+zRhtwqaCOy6iLHm/GSubysev9FiAzXMM2XrrqTa0O7t9WvKsaBHUMZ5DHJBvMRaiMSVw8u1Ab4W7eM0SK/z21Bf68SNR4AnbYFKJBq+eE5LQxW01+/FAwBuv4Vo6IGaR1zBP3StyOXk4wwAAAIBuEWoWhOMX18cs42b/dQgdTLhSi+TioRE2UUhvRgDG0lyqGHYcVF140YreaLBfpvJS77T1MmLxC/Xhuds/yf5l6r7mLmAptFeo4KvT8GbZQE3OeHkRj8iD2Ikhq702R48kJc2Lik6di7vLQ7UUrPNUtCqcPHna1mXqOHgGGc350Q== matthijs@ls-la.nl',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIBtMCCABQ+1QjjNa4HdFRuBj70cNl4/mUPKfIO6347HXiHpK5BhXcPVpHUr7EQgyGbyQ9Lj9GPenV9lopuTW1Jt2AzR1MQ7G8qouOnM2ChKLXXF3S68FPX3HYjePvO5IQSf9kEDU5EDxowgfk2Pcb0+3aDKmkhyH6caS/Y7WMsJCQ== jeroen.vanrenen@is.nl',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAm8trz2yx/2Xwj5F7Q7Tj4D6DROvIdUYr2ROa06c9huqEcpUh51y6H5GyJmxolc4oOFbm5aU9wFt5jCQC1gWo6bmLw6bQRibi7chO2bFQm+2SBbTaxMndhH7Au9uv+ySwM8GSh2UTg3cxW+9xiJcPNKzhJtaYZ+8vKlxC/WL7udV7g5uQk454n1h1Legcw5xMpLUMVqflI4jWw7fksmktZKgmT3I2zVRynOVN/6PbVMYUbHyEdjb6IjQw+mhUULpP4MxVYa45cLubfTa19kGcluBpJtDZ2CuggBtRwJ6aYd49c4SbcGQjxeV5yigU9/LrV84/EwKr1prkvJourCTgfw== erik.metselaar@is.nl',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEAwdbtJOqdms95U2yL1bkJvBWCC9IEV8gZL200qveWNJhf/zd+/jcRUdq5RSTQyRmLMNJ4QL5uDwQoAt0tr1AkWzzcvz9PIBn+nwLagyJ/y94JTNXgxFMuUyRTf0Qpi7+GhXw12wdaO75V8I62j7wf+/gxDlvjgIhAiNY4W/MxaH0BBwVGew5813s4uFTKwMZsUdJYr1uKV+ZY5SFhZlalyglqNAtFsXs7+ktepAmCoiNg1r/9E1uoinGM5px1R3/bE5JagyjCB0pi1IZrS6R879+U9qFadUKFcs0m1T6SkRgshFTeonKMyA5vND1CiKWH6HUI5zUhCTWc2ObXR2SR/9PIY/4fcXKTEIXkvKLO9ZYbTjoVkcqELsfXqwA0/Cv9Nu0ODgox+HLoCcKrnVZcMIedTWR6hySadvyEZtWDYQ2bZ4sNkW2/C7MNXveJvNxiNmXCfATAL+ytirmTvaz9lRwAj/ocgu6vKs8i8wQ/+aQIzwVVTQc60b3IlFcuY4mUx8I6qmESZ+2/cXy8j3JTJZHN8V2fsOQlzXS8qUVyhMl9qCvE3/ydjARwRvAYZt7PJaojPgOXKrNtMEGnDeskF07qHQAQhT8ukhOpl7WCHu6g0X3gl7LHpcF2Tw9+0dwFTGResMXeuN7qtqZaJe2y+5Wz6ARudRgA92XJFTWSUY8== etienne.vanrijn@is.nl',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIBPmeyaY/BHlQf62ovvojcaMcll06EmsK8k29M0p+UE4hAQUaovgCA4PwNvcuOTWahDM4+JR2zgms8Ar88GRbgMheD3FyaM1xereaSjyTJnbG3z24AsEjvDjojk3+QF1Iel9dnERqNXdvN5AHYgRZPNuc5XIUP2eMeNIS43CXY52Q== etienne.vanrijn@is.nl',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIBUc/lveeg4/fWmusKbiBPeOKLqlmbYNJS9LuCsE1owlc92jCS2s2B8/wibNNulrE4h1gL4H8KJJIhONyi4/2eL9Nq+2p5JNFP+qmt3pFA7ottApzepr4X4SPvCjMl0b3S6v3N0DWTwmJy07C4QTZot1bIAvSuBbZ12KjiIjyKcnw== bartjan.hoogenbosch@is.nl',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAJDwS5LGqF1ti3Qhd5Ti7emh+OMDi8rQ+7aWdoOccok84D7bjYIvGGY1vFujnPFfD2xAcbKYJSM3WMPQZd2o6qJzSKrmEt7EVrCguiZHyDusEXbBN1bwBMBjU/ajzV7kRvm2hK+QFBjTROcSIgoLtt1jZxHz9GiMoAdcW4j398crAAAAFQC9TItcx5JCsjp90eqWRHC8IzEX8wAAAIAqWrKXj8zTnXfdWzCoS7QxbAzBxBAoprcinziGJ68/4X1EAm2YBochyTss2OeJ51iOa4uz/hAnx1luVf6Od9S1FqAjsNCxRuJVn/mzR//eNiTfecsS8Ow1rsYo3YJ6MrqwO8+9SHnHzOXIL53Ald3crkWMCslru2QJxdRu6wChjwAAAIAt/GKJT+qo49EQWLVhJ+6CWwyU3Y5AnyCV5YvXgxXfhqs5m0OiX3DZAASL+Ye4LKu0ASZAuW5PM3dUP9g1v9GC2q0gphgeKCdfISu8vM+WhpnuNLJx4QR8k9J6KQL3/rs9uIAmSkW/UWKYJ7FzM6jrlpVmtVo9C7xBhZaV1x1F5w== nick.schreurs@is.nl',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAIbh/ovz/hxQHfn+AMkb/G0lNWvdiZtjkSy+RCtNYdp4CKZ9pCcjhZLigQiSiYG1ZFrGhYC9ep0pLjTceXNX5BlN/gwe3k1+0vZVLlBwD35V0mMhv3JFXtsTHPmYmuv17aCTYdItp8qDIqma0+6FPDXonk1iARKmvGlA38K5rc3FAAAAFQDmI63hMsJAwAw6aH33VKf8qOMWGwAAAIASn3joueX8QU2eqWDJ+ARax3f5C2+RYEiaonluMu5irdPaYYqfmJGZcvj13TvMz5zR+0px1jns9QsXZYF56ksI29DoCjZ0crZu7RivT8harzhMRP26gdVraqHwD8HOy4ODX4sc/VbJgVQ6fZ8BC+wFv/flKe8CQOkYDk+XcJQfewAAAIATudYGlJDB36bRBL39qgOqAoJ1sVbUPwEzKXiEHyth91baRIZpTHUrxaSQYnf+dl1wf1UKWwqrQQyp7LmXKxaNYqDvQUZqcfg1/VkpdWYuLbyU2n0rIltL+ySeWFMJyO315VUY0zERnduigZSoMKAKG/pLM5TWZRVghLYMrBtDyg== Marcel.Kolsteeg@is.nl',
            'ssh-dss AAAAB3NzaC1kc3MAAACAaH4sY/s9tMMyzgr1mDhDoO8XFUoXBfNKMZsV24FylwxQ09yzZ4R3GRF+sTiyWqEqmwKJsM9M4wCnrEm+7CjjG3eCddO7gRwWjJZBarRRUkAYIgOBF+5xpxbiSlg5dB4ZYgKXibZgqNWUFyjqPLp41uB379g/ByZucJVC7QAyZxkAAAAVAIZT4BA94t2Rox8NJYY7MSAG3ujdAAAAgAshGKGPPJ76ZYY1wxO7+k/uzvpQrkB3PIU3J6b/iw1D6/tRXtkUl8Qp3LMAnhO89oIUt+8bzslC7JahOZOjhnBBhrCCT+sTGtf5ipmbV760T8k1dpAsjD2FRzzKLzrd6E5EGvcXj2Z7xhvZRPv+qqr1o95wG2Do4VMFYNwYbiDrAAAAgC1fAl0InVFiBXwAQEIuEw0p/14rz2bdv7IHMKCYFGyjt4pzRIQy0S4WywFjkwDbqm9sAnTKm0WkimculGsMbtzNiLvJaXA7H3TBeCvOILV/9u2S793kwyzEhQ8Mg79azbydnzidCq8IAIzBICDks+2RBRgWK/htHKOy4Ak7dysX niels.vandermade@is.nl',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAr9Zwz9wkr5RIVZ7f06x+3KXyz23tpQob/THxCT8xgm/K67AkqqcsJo2J1fCdiMQYXo4s6Uf0hyK1EO9uuFpZ2E3WN6nL6MNK3kEo/qkVysWagVenauZfJ7Qq7RxYHl9RIdk46/KYBxH2iNo1PiJT0jCHW5DMR5x09ZBk0MWbppsIL2M/mLyTzCEBRu1w4dETh0/3KvUITnj/dEA/6VnbjfuJxo7HU5YjK8p1r/rGgVSaKP5hcRGXzpnOBL5uDGfYAcKzngjzOhgRwHmnzxeqaosEvgnrhqVDdQAjSTMS0ppullS0CjS2JrNXlj8J5FdpC8quKl55v//u+KiSBdZiFQ== niels.vandermade@is.nl',
        ],
    }

##### END is #####

##### BEGIN surfnet #####

    @add_user { 'surfnet':
        email   => 'surf-ring@prolocation.eu',
        company => 'SURFNet',
        uid     => 5022,
        groups  => ['ring-users'],
    }
    @authorized_keys { 'surfnet':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC+V1P5j1f5fcETEuGQWB+t7K58Q2LCA896JFN3AIWrM0cUwh9UgFGIqKe85WSdu+IoShXbyOR3JgW2hEskTsVuAulRaXOvmFQGM/Hg6QJVEn7Y8uvYLHx/1j+XEvVpTuA91c8ZR6VSH6RaiA7EYwGCZkIpfOYPpysHAC7bODM7Nkhev3ONV58fgoawC9ywYJMEhKNhPgkrTOFMLuLHnSTd4ynfmFuALAN8E4jHZ0vTcydV0GAtPfJWOpeg1Na4TArullroA7G64EYuVY5pE5Bn1JK/AEgpksBZGtOs3YhG+sa+wVsqf5UUIKZPBZFOf80xWQ9ZclRW2W9pnU3+hwg7 prolo@surfnet01.ring.nlnog.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCkcAiR5CL4/+jpBs8fM92G29o2XGDHrAEU3ZcZ5wY/tNGza245Z1ktuefjF0XIQ5KjsWO0WAXrSZ5A1CnqS3XodvBjYi3wLmNXORcvnvulxDpuIAAjpWG3hdRui0yTYZUiTrA0L3QbU4EebCC92Pk4weFyQJB5hRX6GZM1PK6WjQ2lunKkPh4PLVT6Vos7iB/kMXoqPX4buWND2JXBtnKCmK1HpFr1S1ybTDHvhaFBlRGdjJ/7IKM1FmlB/TXxYZVgEA8pQQRLz3ZJDqy6L0N/VybyjfeWww/YRtE31Mu9FlTJRi6rUUk0e6ful15lJEirxZSI3jOdqJzGOwwd5CTKonwenYzWYmJVYSV75BPATjDWlSc+wWHlz5MeBWsKH7R8zHbNw69ArPqFAIVoCRKG3IowOW4A7C1C5D1tvAFpBtU6amthdpVAYqGn8hXlmzxt4a4IjAOoMf+kqc6UnZnp+rAdEQxAffXL+P5x7K3rniZ4iK8zqN+v3/iqR4BRhYg03+RSwnM0RrFMFdRH0cdAK3wpeycdyhYNtYQCb2m4xXXISjwejYFhueyVwwxVERaunQu2vfT5IWsTKTYWF/BzdR14kKNbgrS+bFcZY1RMj08fGyphK9WAAS90hB7mddgfpWTEkyHhlyfK25DCfZZ/wgIvL/2jIerci49E8k4mbQ== Wim.Biemolt@SURFnet.eu',
        ],
    }
##### END surfnet #####

##### BEGIN prolocation #####

    @add_user { 'prolocation':
        email   => 'cedric@prolocation.net',
        company => 'Prolocation',
        uid     => 5023,
        groups  => ['ring-users'],
    }
    @authorized_keys { 'prolocation':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDRNcgktqQ9WEYDV/kYEV7WuTpxYyZDNt/jEQ8im/j9J1jh/nX/fAQw5XT3yz0kIDOS+vBanewOwLk5c3ZGt4vYYHzV2lT6OvPuzW2RyW23DbGB4ZdUeCD92HfO/aDhQ17jZtaSx/DmhBnxFIqHxvKfBkS7zMlPxiSQCLZbt74RdBZFhosaFfb5aLe5MIBTCP7Cqcq8o6o93rXyQjvnSxuBEZZ2T/KQxbtji2GTF2ll98LkUsA6xSC4Uk9Jm/towZJ6zb6ozBQqsnZuncl27QBGXFfYjryEcQvMW506tYopThbJx5k0DDucrIXZ7F4qOHATosY5vgq0hvq+IHY4oFN9 prolo@prolocation01.ring.nlnog.net',
        ],
    }
##### END prolocation #####

##### BEGIN in2ip #####

    @add_user { 'in2ip':
        email   => 'noc@in2ip.nl',
        company => 'IN2IP',
        uid     => 5024,
        groups  => ['ring-users'],
    }
    @authorized_keys { 'in2ip':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCrDK+oklbpw27vY28Jr8qmxAgiZy386qHSndxCjNdkMh4svm7qde6Caw4pbh4nH8aC5+jB0LoHatCwM5NG64tT8OqG66+VcyXKDD76+nvX24chI/Jv+S1rri+KkFjQ1umWWJ7gu4G2qYvVjVtqcgJU0EpbS2Mr5JxGCSt6sWZSOwGBwfcgVSs0X0+IwCifiTtN2sVphMPvi74qwEx9CeyKcuAm0xm19aB2GyOnpBtLAzc9ZCMU8ne7gY3liH9n4ARw+z0M9U0fAlYr8FG0VuAsR/8I5SxIg1CR4aFQwa4TjVQ30m3OpvszkRj3kUk5bitp98RRTcz2LksbJjZ+mLHH dirkjan@nmc',
        ],
    }
##### END in2ip #####

##### BEGIN netground #####

    @add_user { 'netground':
        email   => 'systeembeheer@netground.nl',
        company => 'NetGround BV',
        uid     => 5025,
        groups  => ['ring-users'],
    }
    @authorized_keys { 'netground':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAAEBAIK1dTAzNnkl4InISBuBqcL3LzKX1KSAX2ywcdvKHpsVrl/cPDwYWFWvDqNdN9ekpV9JtTNh+i6bfG/MBdwZ3cPzA5ws6vIYYg0MFj4EM79TRM6RrgLNS780yn/EzemzFU+NDk4Hbmn4UVVpofJa5z52cexBGK/sW93qJtZjjX47XFd3QAHf7s63r4TSI8fe6OVB8zh/T/otwFAHRHMLixsTqPrjSYa8dfi747QX1yolUxUeMLHWarRLGl1jK030ZPR2DAhgv5Sq4Zgt0VeAH1I+kQ5O4aD5EnV/FMmvp351HYv+Jh6U2+HcOfzgqG6vWnthsjM9yVX9T/wwcKy98K8AAAAVAKy5JRQBRjlniBPV8huhYPPRzPrZAAABAGsa/UJNJO5liT/jUDU70MsqL41ah7K/7gligzJRsNgUVOPN4cfCrHa0397oKpHtuFhcu/tbS94iPGP8YKGARplh832baDwyVktLWlwnI3yF8BejeR9zlfF8j+ZQ23hR1EZOU+gFWoWT13iAzc8ZwWsnW/8nDYRrKMBaXFqBj38/ugZrX26aLs/q6dPalcB3xgKtgu1OyjGVrkOFB64VBvye3t/zTucFewchyXUdj+Kj6vGAQy1KCDe2l0ftWzN8/OIuH2Zgowt7aFLsF+l4mpBchhaivIh4WmW0K86FDjOo8oEhDm+n/461RZIHODCnOwxQ5PSl1qGon3woJxHhCw0AAAEAcAtpKiUciaFkyyyf+F7SpwAPV+ZPsONBIbU8wpXvSvwUvWqPBJApIvQElaC6QaAqGD6IUnoFXB8dAuCrA1YYkL/dVlOAPkrKAAXJ55qQoVjv4Fg3gC1erldUXk35PQKpHv8elZjeSXNF5GyE9VTPzPhUvMYTEYqth1agYWmu0lT+E77At3mYnJWxMFtyNLiFStaL9hDNXPh7xlOnWBbDXynX+su8byZi1Ix/LZ9ImmdbCFDEDPv3nwhwT0eERWp5Lnz/7YK6Nqx8iTtxHEP+YBME2NqQbcMhVyqZJgF6P++D1o47gvFndqBtsi5r1HI6URCbdWIhTq4tVB1rRypYUA== Net Ground',
            'ssh-dss AAAAB3NzaC1kc3MAAAEBAIK1dTAzNnkl4InISBuBqcL3LzKX1KSAX2ywcdvKHpsVrl/cPDwYWFWvDqNdN9ekpV9JtTNh+i6bfG/MBdwZ3cPzA5ws6vIYYg0MFj4EM79TRM6RrgLNS780yn/EzemzFU+NDk4Hbmn4UVVpofJa5z52cexBGK/sW93qJtZjjX47XFd3QAHf7s63r4TSI8fe6OVB8zh/T/otwFAHRHMLixsTqPrjSYa8dfi747QX1yolUxUeMLHWarRLGl1jK030ZPR2DAhgv5Sq4Zgt0VeAH1I+kQ5O4aD5EnV/FMmvp351HYv+Jh6U2+HcOfzgqG6vWnthsjM9yVX9T/wwcKy98K8AAAAVAKy5JRQBRjlniBPV8huhYPPRzPrZAAABAGsa/UJNJO5liT/jUDU70MsqL41ah7K/7gligzJRsNgUVOPN4cfCrHa0397oKpHtuFhcu/tbS94iPGP8YKGARplh832baDwyVktLWlwnI3yF8BejeR9zlfF8j+ZQ23hR1EZOU+gFWoWT13iAzc8ZwWsnW/8nDYRrKMBaXFqBj38/ugZrX26aLs/q6dPalcB3xgKtgu1OyjGVrkOFB64VBvye3t/zTucFewchyXUdj+Kj6vGAQy1KCDe2l0ftWzN8/OIuH2Zgowt7aFLsF+l4mpBchhaivIh4WmW0K86FDjOo8oEhDm+n/461RZIHODCnOwxQ5PSl1qGon3woJxHhCw0AAAEAcAtpKiUciaFkyyyf+F7SpwAPV+ZPsONBIbU8wpXvSvwUvWqPBJApIvQElaC6QaAqGD6IUnoFXB8dAuCrA1YYkL/dVlOAPkrKAAXJ55qQoVjv4Fg3gC1erldUXk35PQKpHv8elZjeSXNF5GyE9VTPzPhUvMYTEYqth1agYWmu0lT+E77At3mYnJWxMFtyNLiFStaL9hDNXPh7xlOnWBbDXynX+su8byZi1Ix/LZ9ImmdbCFDEDPv3nwhwT0eERWp5Lnz/7YK6Nqx8iTtxHEP+YBME2NqQbcMhVyqZJgF6P++D1o47gvFndqBtsi5r1HI6URCbdWIhTq4tVB1rRypYUA== Net_Ground',
        ],
    }
##### END netground #####

##### BEGIN totaalnet #####

    @add_user { 'totaalnet':
        email   => 'noc@gl-ix.net',
        company => 'Totaalnet',
        uid     => 5026,
        groups  => ['ring-users'],
    }
    @authorized_keys { 'totaalnet':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIB7OjD4FexzjUO+/FQ2Ao7vdbxS6ARqCdtwm1aRZKgCAOIYQatTEeWeCecOYyJ312uEFAFW6M5yTpDnW+8B5SmOSelLSs1CdEgNLHKj5Wwo7qZx8hnIleFGcxnqpMHQiwWkmaJw2FJ/4g1pDDWR+vv5F9wNxpn0bLwdCUC7zKo3mw== rsa-key-20080204_2',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEAv/TYlnItzyIn9i4BzCjFluiaR/Vn0iwlz0K5DbS5TWfaHe3RfpSiIlVN9LmasGGG+F4dHxqzFx6FrS8Mxz0Lzqbpog223gQNiwJU0eabUCBol8rWjd5aE9S98HHYpaBB27suslCFRQV7rgBdx6AMn0rcwplE319PpIYEbga75SeIOFLhPunxAnAn019HrdryIO81vdQJKeOYawwwp6YTUAvnbLfBNVzZAVPB7Q5jwlEWX0/ZEmqo2N8dczDj6cPdqbMZisvknGff8sVymM6gvk2SpbHFZnFLZaJRjEjN5Phg95L/qMaavMMr0fMxMVlWlE+yw8Yy7Egn4Un15sPc694F+l733IrbQB4gKnsoXyzZeIaNFlmIk4omDKwWUFTtYSLLZU0+V0Z1Nj4Ys959Fh3xgA0/zaY8zZLgzJFsn0KFa0QsQXUF5FS/narM6Ex/wUiAmj88TNJIKRomPK42A3TLhKh8Kzeo6K8n1xdeaOS4OH1ixgup+NMYb3bK8BkxB4S9FgkVZBQo5jKYqmMLZoEOWB9BCQvmgwOtWudxymPZJj9hzS0TKDTzUPKpAw2e+o5tZDUAhynu+F845Gda5//T9m9Ykq098ZMltXdlXEzAwz/q1+83ECrYh2PUtDfm6bZrIXwbCo4Rfi5xMZg8JcnW+Q6YsKkSGH6CwxKwh/8= jap@jap-laptop_3',
            'ssh-dss AAAAB3NzaC1kc3MAAACAbqLzvxX63OVeWsGoWVQEz2/oIJhm4DNladm4ih1Wz+LSTjWCt29QHQoq1oDX//O16SSy5yFxPm4TOJAB9oq83dF2eeexKWmbRT/adh3gtNDb+oJbho7SyZXSvy6dC9tsiqbjV34OkaWYjNPsLudpuo7LjpQ92l/UdPZig/k+GW0AAAAVAITJyEMwSqv8nC0PJxv18herrINvAAAAgAg0P/fdCWDaemekCTmduK/IzlZJpaGFj3mlJ1AO2IsNVpLhCTbJSJAxDXYDFETc1FwBT4kN+O2FwUGa+zOta1w4SmHx1xzEZFfa6FjGyXRSZxRY0C/iufnaFF6+yzYnTNgKv7yxDM1NALkeieXUHXKzEdQZUuJl6NKyoxMdE/eqAAAAgDF7LJn6EY2rWIG3Ekaos6M0z13hvGQyo9tuF2hPQ2iGTpJNKyDlF9dYscI+MRe6yfiOrZc1C77+vX0axDV/radNIQ27rMHYBJALHTTJskNL2S85nk8YrZsG3US/Pz27b1aBmxcN0Q2kzXlko5x5qiFAgBorgFG1O+M942SuYEsk dsa-key-20080204_1',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEA5hyA6Pt8K/xXoPWk/r5sOc1ted3zT1no5ptMB91jXyy/DGUkcYie1ydORu7zGjU/oPSugG8Z8GJg0sdIk+gmKzbsBWFs17fqoCpPkkD+F1hgJKmI7e58EXuQoPADvceMFGYlyixuN0LSezV0TxJOoDm1JbhMnO9tbm3LxDJtJweGNPjSi+VbdLL1LrfZ8FFVdjTsjgfix6Z4rzt/em+AMrD1KWGEFC03gZX+ZKGdGc+9D+LWeIBKv9c4neKD51MCoULtw4EFa4aI9+V538AoROIAzZNG81uPZAMpYHulLOijuE6UMfJok6BU4+FJTUwgMfy49ZY3YnTXYAmUDzSuFyCLNMUtt3IxzdLGixILZKpXlq1mScqXxJ4ubwOuFbxBYLqVzR9G4edMDjp+hps+hsMrSKJ2G2EH5iezaDSh5L8MJv/GbfDfA2sLSkkz9FCdaoqzPbkCA6UuPgY48xwLmj1T/v10LQFgX+a03l3883CE7YtLtxFr6CdHBCfhL+VYZLWFHvFXObCCM3ldeYVM/RQalaY2zPslABDczR2+iq1YhTk6shUbEC18Y7/nER9UJmGXzqxWrL476tBlx5ApGMXo6TmgyN/FGB5BGO7pfyymU5mwM+QeM7a+7f81w1iv7TZ14uQvKdN7IYtSMeCks2X9aAxedNHqwtD6ejR4Q30= freek@Blade_4',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCa0FK95qnkxCF6s5bsc1uuAliURQTzsQLmuY+JKSnVKPG/tZxAV5FDjCnKmwMd7yopvENYI5lApwWu8JYpfrKgLk7WiW9Har6Y3+Ok89BXRCaEgYuO3jxX+vCMPMBeM6G2M4vgAYDO4DGbwJdhKyAqJuL7DBq8NKgf2VEKIHaSMxGpPjqlvgarPNbc+w2jBRbiXt9EP8OFoEkcbAzDTNYdbkToctIQ09NvCf0Di6/HwlNElAB5uQQrQRY7H+ZVeNx4XGdQ7P6qGDWcPnpBAA9NBLNGCUowU5CcikZPe+/JxF8KLB3Njae36bJYEov2iNVCqMDzgN+7Z+Uu8SNdhT9Z rsa-key-hkraal',
        ],
    }
##### END totaalnet #####

##### BEGIN signet #####

    @add_user { 'signet':
       email    => 'noc@signet.nl',
       company => 'SIGNet',
       uid      => 5027,
       groups   => ['ring-users'],
    }
    @authorized_keys { 'signet':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCm41d0scEXCFFd8kbpAFHfkTp3+smrNkvpC6O9PUKT4JNg/FBi1mlXrknvqJg3CNBlWtQ1YyfTldhGdELr85kFlcEycqtd60MsMxepyre0p9wS+hEN8ySmNzZ+VMu4blRuFpS0qGNG4bu6lBckx//VIagQ7xEuguXw8k+YhbHxGMOQ8nF7WgZO+PXHCkYEKgB9XvcxV4s5O4/ggyYl9KHkzRmntwO4+hOyQQp3WmXDc83NMEurIKCWuNVIBAGtaURiuoKdUMMJdm1XMiGBU6oLDNToWl0usZdfT4FSaQMLg78VDfiJr8Zx3WqychOwWAmQ3d3GPzKPtjm3wTel9UvkI0P2/zh1CWdR+wlddxLftiMMx+ZBQN+tOJEG8SFeChNAcobxDSy2l9koAnwv0hMmaiWKvQ+oe/OMMHp5MsoQc9BDeZeznrpVNR6cnOuFt9tiZKZfcY2RmvwT0DQHTvFnWYlIRPhEpQ08XjgMyt7kqzEuIAfrHs2hF9uYF8K3U6E= cardno:000500000C32_signet_ssh_8',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAtZ6WsC4A42OoIluLwepVvO62plibJBZLBErRCXsbLwi7pCaVxriWHncAUmrOKUi2jq1YOYoMNXnh/REndq7DERSgnMleoNPj0T5l5VhOfLMk42eFZbebL8Be8858I3CvQyjmFmNV4bnuQVHSgBQaL8T+xX2Lp6ci3J/ZeObpjpQ9MCsBy6tTe2wxVTY4QNxY5bxsKYOD7ZBn+qVFjn+w01pIuvF6ONcojA7+1JdS8AeusegJYWqZ50ltGyjJWy9DKWdVaG+iVtlUJuPY8fqKKCTk3K2hTStzeogbJCR7fd+VFnsrlpd9U6fB6BEbf/RsqWMu/3F4tyxIciX8jGkzCQ== adrie@d-Adrie_7',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC51Jz521guQFDG9kGq4fg/uwRZ3xiLsf4eMh7XyC5sCi76n5mYd5nribivZxwkt/UmLQMVUfawmcQKuW1kc36mtXndjBmeQJ8JzX7YBydXuzBhZeE0O058SIMSpYvLlK4TJ+j6z/YmY1UbbxagxyGzmCOLRWTgATO0L0pCiJ7xGf34Nm4gKgdqYzRfizdBeEKWkSMr/dVp094vOwsEYLB7xKEBSMAbjb5IbBS3FPZpBgwSB5+8CMzfIgeeNUXUSBOk1DIKCE0y4DuyFHcdw7QacWltF53tDfpsJj31OtMnR+fEYxD5hPcb21wxJrY74ICPscN0VfMYxpUn6yOlNtM5 _4',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA1Lqdb/bpSjUth9hA2yrsElsnaJXVJeqVVXAQvyHpvlXJtriYwwO0vICzpWbo65v5Pn3oZR565X4xy6m4DhZKs8WylurGZnUphXEdSRe8LiEOVy50Z+ownj2ZaAR7HRtdx3IdbPLG5f41EdVLDWpsg9MWRRz7iu4Pi/ZMCeYiJfGZ/15ldUGYDj+RBaxntWkpGr7q7kjJAQFr3NntO/qxtf4S3XfHo+pfsNVUeIWwnnI7WSWwu0NUuhSG0eLrD1RLrIDLs2bRk5nB45ihylt5DWzICHBQ8S72EToMSqw2kvn4YeLJ/BPj/z+I/AVXjmQ7Wm5hPzKDwA18ruF2MUZUmQ== justin@justin-desktop_1',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEDxq/SSPQJ0y1jVx5ANcjrtrnrR1pD+3HJvRlJ8p3vqsw6Oshyg/O82xl0Iy+DN0pqQEPJ20mGcyxGJGZMmx5yUzKmdDb5aRkOb7CqpMuBILKazJaiHWvCRaBcAgdE1Vsq2j8J/OFnEe0/a+xLTdBvjyIQPqojmXUL66+r3P1kKNgVHylSGMTr5YAL7NC89HQ5MjsSzaOju4UM+0qp0FwId+2QJEdXz9VI5ej7qjeoBKoL76Lp4Co9gL84zNwBg3OrIHiZpf4VDvSSQU+9hlXN0YHLf6T13POQ5u+bWArQzV/jn/QL62TCqUo/6T1EUl4yHPX2un14f7FAL8lpvDB post@keesmeijs.nl_2',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA1WKEYV/4jxiWGWXgb+tNwPQEO7TYblCrMfyexnTpSHA/TWHFmq2x9/V+Hyie12mM5RkIKQoRuBfFnHUSal8PS4nPQvKFbbxE1e7oWHE8Y/VzECAtmDXhaC3zLwxlXesxdy7WJkXBqGiPmAyrXl/C8Sbs213nDYAz8etex28eSyTvMl8sao2vpSK/6n5EGcV3aWMGazZsvQhk+cwXUIMuCFR2a/YqkKk1SKAXX9W7VHaZcMXwEhxKEcvjS3p3a2WGiN6vg/zY/gEgzPOTs7ZoBGyfQn1D2iSG0FlZt+br7QO3X5iKHT736yq5hJRsXBLFo/1ItpFAAwQWBHWKREcyVQ== bart@pc-bart_6',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCJ4f4eShaxk6+RvOojbWG7ayUmCsozsKV3LGT9n55g1sXh1CVnBx8o3SQb6bjnsw6oPawopJ4yH29DY7TOAVw8DzwrVs70TOZGtx2l20OO+cDuW9cjsDZsLjmayfqHiJtnvhDN0satBucfHUj4C7r7XqlGJaufc7Ewa8O1HKXQWTGIIAv5vWPVk3UwT/aSSCm9ANzrRJA3WN0xA+Ax1mJDXQPdN041K2XQjEXNejBXV4TQwmunk84nm2SmuKumhDxqRWqcKizVkmtrRw1wPF+po6KvYENTPj295qgv3nO0R4nbq6vyh4Gssn8VmRCjhyl7U4jtxpsrh6kFk6AfDE2L1PPg13K2+w/sOkS+q435s+QRKLKArzBhAF6bEeUUcWnrcGWY+jZldlVMaqQnxW2mn76z5j1V4b8kWnEp/t6YBE4DeY4Ljgv2wKG8GaCgq33eMY6hP03NmgAmwDAudczBtRriboZfOVw8JCa20EdORxGdNGFHfA+yIlkGk2ECNd8= cardno:000500000873_5',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDHC1Nq2QUeyT+v3vhHk/6tSQTxBIsg7x1wPMHuEPVAYN2Zd+ZCSUlk7pPAHQoHVA5QfihFNA5u+KHyFhRikyndaX90l8bNiyPs1tR0bWdeN5R9cclIOcj08YukDVOgGecBQ4NM0niKU9tjfbjvCLmcJEVvIw6jmCFccBQZlMEgAVnYxiASxI4PoR7NWERmv/lEdxMRS2tyoYhlPZX3OT9fTyP23gHR2HW6XofME0xCZBDYVP02GsLC+C4LPv6Dlqw3zdGHtk8NCTqdNhmNokLnshIxNCIdwkge+TYv1HvsUkQDdLK0l91R/TPem24kIonqL116MdXWY9d/vIDoho/R kmeijs@signet.nl_3',
        ],
    }
##### END signet #####

##### BEGIN tripleit #####

    @add_user { 'tripleit':
       email    => 'support@triple-it.nl',
       company => 'Triple IT BV',
       uid      => 5028,
       groups   => ['ring-users'],
    }
    @authorized_keys { 'tripleit':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAv9gYOuwjTzYY9OoB6FCUvDfV/iRohP0T+IbtMyiZu238oVtYGjCl5t1PRjkk8z5wMC7xBBhHD2NPOLQMqT/aYnoKwbM0uYEyzvHjplyRdPqwpSW9wDwaMYUXLoK+7ECaVm2ltZGbIuLZ72F9a2tDHxlt5VnNuFKLNPlduKeyHIA2XZVw/b/X+snNX8fOh1Y4iZ2es4UKQbjye3cQo7AmxBhoPv6PMjOswI/35Pudb0J4O0m9nAEzBgMHHLdhuIdv0xujqhUYe2tZuQU6KUuWs+suI0icjvz4XvGkV6yF0uuwnrWQOp1dDFjzMnHI13SsoapwdeY/7s/Ztvfvn7ZUww== triple_admin@newton.triple.lan',
        ],
    }
##### END tripleit #####

##### BEGIN jaguarnetwork #####

    @add_user { 'jaguarnetwork':
       email    => 'noc@as30781.net',
       company => 'Jaguar Networks',
       uid      => 5029,
       groups   => ['ring-users'],
    }
    @authorized_keys { 'jaguarnetwork':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvzUjHZ47GqvaO4SKo1wDVfy65v3zF55EryW0zUv8fQUlCzsN0veJCviqSfWfFicaGeU11wvhuhtj2G/o7wc/8w8TuifK36EKkGpuzz8P7asHyrNP0SK95dAGalWTthhO2spAFiT6LpgByZON+4BQxKtigCKHNWS2KBfG+janh8zqc+ICIpvKgnetGPxvr+yyi8Q3gaDy91cDcsWvmo2/BcBYvWg4MbB7EhWiDnXUZE0PSmh2tlk0LeCzLyruCuPO0L1s5CNhsToM9zar4J9fP49uNe6BjCOsFY6A+UQHSySyvWwi15jyUH6Du/AgPw5/+dxuVbraqmTC2X15FSUuJQ== nico@olivia.as30781.net.home_3',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEArMGPKn/WH8Y1peu/dC/7g2EbvAeFcuxyGCUougnRvqwwPVxfalgDSYHFu//Z86FA3p+micD8cJSbgbftEs8fpvY6ja8jndRwEWUfBa6gKFhKu64ccEpwk/XKgC8rzsAfo+5+f9wl2oHiiocE7yf9T4kqeBJsP5g7QoIcH5G99ZvGAWAb0krX8i2+eg66ig9XL22a2lgm+Gvw+aiagmVGVEsIPmnNsiwKpr9PP7iwDnfXUp9SljC6gvGZrWNu8Kd7vxxiaYA9gBZFqvtCmv9ntBaKfKpBXVqlt6bTULBiDmztc2FEd7/aiupa6P9iiwLj5giYkDIpPTlTI3ii/kO8yw== jerome@macbookpro.local_5',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDOj7L+EAiexpV8mCqG6gJzdFzz/lsR5LGLK7nFSvyK6e1zCgXuDiWh4vfbwjbXHdC1Fll9dyLFE8BpQvq5wO/V42K7EZgYV/AayQbGgcr79qF+2bAx7a4gvTo8emxmyPkKeBe9sUjBAwMw9jlgnZ4rkitkzyR7xuSAfvhrqrVaEBBzpL6PWPmKj0z3g4gX6lIklzomHpoNdWVUQdQyEOslboYwy3g6szcjz9Zkftve0GEwvLRqJldfBeiVbwWcByxupU11JUDQOnODQQ7uK+wAThiieJQSlBDj6Zx2UseXtHFUKKijdY7wmxMNBqJe0q9VbarZvgZ2CXvT6+kqBuzIJ0cswxfNEfE5s6v9YrClDGmP6hHDIcAzT+NqqFOUE6AfOYxNotzY8nHAYgR1dETx2xVjBbtfiFozD+qmS5CJ+ZxUnrIOCL0gKbqUgzTc+13J2NUVQiVXrvcTaT4P70s3dOY0G6Xb09me6e2urek51mGOa8y9RIPmc2eVXOcIzHwgVMeZ+Cmj0D031XTQwxk0bdvnsj+q3GTKl1hR4AHaRzp0UFqfSuM+Lc5+jnhXyHb9GeInbCtDkfvE9XDVDA8R3zZMYp7g8bET7dZw68BCYfuU771t+W5yz64RtaT7/BCtL9hAeIA+k7eBs9YxGvIvAD46r80lKvngBOyfahlN3w== alexandre@alexandre-G5210fr_1',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA36bkgfuHi2g6fVJuIp8yChWRvR7jVguCuVgniiI1wKTw7Ve//Pj5WJaWUALVTPZ9fWu34LfZQqfjgeIFmfokqQFg+sNHNEKSto2c8sFn1t1I40kOoJsg69VPXMKkcip9F9LVfAIt1dzYrqBM2bFliOsGvO2R73q+bPXN1g6WpA9ERVNofYJ4wVC0KEJoZJKqpVHPSHStKVjQ/oEkMOfxREhwdlDzhx5w1khBq1vhqY8sJiAFUMqTu8GJ0HOLDVGLHGueDRADteMttCI3PmRwhvWWQp6SQPw0dz6kEyY5gVwoL7dtZsg5ZBRNIaFL5XnxiukA4gAG6L7F0273afGdpw== nico@radium-as30781-net.local_4',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAtE1P0ZDzqjlAcAenpqJt2i7AP0yBBaGBAl31UF9TH4vyCqKNxY6F41Vs3nmi1/GldCfTm0ZZBluxng0qCridTWpbVL/J2ql299TbRTK1Mrh07oZQhI1sz4/z7Sjxx8SIfJXrrhYhorb4sxFwzioIBuuJlKYfuKWR3WHi1M+KbTzuAoQeepfx1xqmL0vANEhyU7SQ8wCod61C4UxEBKmynZAj2yKqtUPZUrN8znK0YHpXWDndm70tQ40bMBf+Jt4B8CbMcw6zxO5OqNJWBcqhRw46ALgH9wLsvidnnxO8KIW6rdUk2Wmg3mQCXSkzQxI/6dLIORcFyjcQ3vbPJv6kaw== matoa@general-lee_2',
        ],
    }
##### END jaguarnetwork #####

##### BEGIN tuxis #####

    @add_user { 'tuxis':
       email    => 'mark@tuxis.nl',
       company => 'Tuxis Internet Engineering',
       uid      => 5030,
       groups   => ['ring-users'],
    }
    @authorized_keys { 'tuxis':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA4N7eB23pl5rXVGyRzY2Aqqsk3rI968VTWBh8c7KHJtZyygHIa9IB4Kpbpq99yFnYvHw79GyE57Ypu5lPvmUODujQvZpKxFmsOQVQX3nNL0SyKpbdY2/JZ5B9qqLB3NiPDIKwNLICW2MJ2tUPEH2rnYOKVyZArZi64cyAiTt2nh80qG+W4uusTtuEYek02H7KYr/Ox/mk+7wo/ugvLSSnJ3gYJ3xIid0oVusZmB+lqeRvPkfH69YVwHsGMAR8DbCERK9F3YSMF971oX8vGc25kpGKeQ9h8p67TqunoBXQGpDTvi3pqDlckFsvWOiWJNtAgJXZog/yu6XkVlBe+O/Abw== mark@tuxis',
        ],
    }
##### END tuxis #####

##### BEGIN tenet #####

    @add_user { 'tenet':
       email    => 'noc@tenet.ac.za',
       company => 'TENET',
       uid      => 5031,
       groups   => ['ring-users'],
    }
    @authorized_keys { 'tenet':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/xAPHmJk15to6xgl3qW1rUEuHcdodOaoGhN5eMTatv6YNuu5NLopr8981pzY+nZmTwAUw43+UzSUZHA7Net57epL+6lMpKYyZm0Qa0L6og4y+BY7ksC4MOQEejJV7m1mAC5zw7sUUNPy7wtO3Ni3ur784Oc/1iQZOXr1Ak7Z6KRKt/sY0ce3gxsoOB21AwrJc0RRRr+AONOU/drswNTL2yobtGEOYgsrDOuDDTTL/6cw//lKanKVcdQ7N/GEQFJPM4Hsl9BY0B7gwsG6ybmx2vN3PJcaOClRjWlooRuWc8uZndQyGHJFhYOUEuHLrjI5vEUzo0mLg2Xxowq66EdoJ noc@tenet.ac.za',
        ],
    }
##### END tenet #####

#### BEGIN bigwells #####

    @add_user { 'bigwells':
        email   => 'neteng@bigwells.net',
        company => 'Bigwells',
        uid     => 5032,
        groups  => ['ring-users'],
    }
    @authorized_keys { 'bigwells':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvcBYRMAmEMmj7Wlh5MWf5wqoJePWtI+Hrpes/EoV5bsQAY05rGtb1ZZPZG9TDjBqblZeRv+tFMlsEathscuSSJBtR9mAZIicfa/799EjuEXwVGkTsE36VeSqznM7efELJn5l7Nealn6R4WpXUFjmvutVzuqhNIDK/1ZvEY62wRQtlB21flFCulrHje1KxCv7TCfhmRMf7J2A8jXXXiqEVsZ8yF6YNsg7bHpjadgS0vxlNXc8RYqW6LU85b2KxWaybRoWuMY4S/AEQNxrMNUHLUD+qjxbmkTV6cVWlx9yfPb8c3tpZL4x78/Qhae/a1dZcYz3aeO90TJ2cx0xmSLjlQ== grizz@sys0.dipd.com',
        ],
    }
#### END bigwells #####

#### BEGIN atrato #####

    @add_user { 'atrato':
        email   => 'nmc@atratoip.net',
        company => 'Atrato IP Networks',
        uid     => 5033,
        groups  => ['ring-users'],
    }
    @authorized_keys { 'atrato':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA4NNE9wlAtxviuVJuhSjhzbHiOWploxKseVGfxFSPOBnay9bK2QNFlP0xZAGDWDPZfNQxTbf4dc4qNs0Tv6s06ZvA/DW0QuOWuDnghxXPZAzlzjlvO9eNZYMADhIRbnA6vXH/N1wFpA/23uMM9EoQPpIbt49OjvIq/pCvzEuejaRfV/vIILA5whFi/1z+LCVfQRn/eT1hNdCDWSntRhh5GeiWi/FBzvD84MO0EWtWO+fXTHz6Vzb2rkjpzU8CuAuA4IQqcByhhuShJBgwDITPPWIaLqCSPkOmZqueczdHyXDMGxGYv1uHtBm6v7KpNypuK9hbhWqQr4xWVj/ylmXLHQ== atrato',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAyoQKYlEKFNCJHtxOt4L7XF2eYeHy+3oR4ZqkxsdtotIkcKsZOy/mAFxPWJoranTCE0ym21p2NbAzi3xMZAIv3WfxG5LcpY0xWzfMBsCnNEwvdqXlZsweIcKaX98s6vLdU67Cz3dCwvu1i3CsxjtEW3FEyY6rLy07q2yfEb7LSuh1wPrCbci23ZPWil6R87zkWY01/deHsIo7VooiqCov7xJY2/+NnUUPX0UOXllnFElHfp5PcCUOJKVCWfGroCZTtjZVmN+76n11UhjXqEMgwH3ojcNNwXtVcXmnMN68Wt3U/d3dVVfMKCMg6l+m88dKKCeXatV6aqRHN46WZ63DPQ== bart@auth01.as5580.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsNZi7mD+HV83QWgxcillmcTCyXvdTeWqjbqZjYWKtz2h8bX5tOMYmfJTWHHlr0/Bq3t8g3X8yJmaBY7QPQ+xoqgF/ACap1tqXzLr/+lI4PU31amPRjtMz9ih+Md/UZhDHbRXmHQO5izjEAWu5d0MFi52fDVANtlRYi6jN596RdLy/NcGdvDG4udigv4YaSyodNJsMzsxrui1N6Tj6W8ExhJl2ra0dqPRoRo4RvhFvX1jXD6Ajpp1NzeSNN02qiWRjQHtRn7WBmxNx2TspnILWB4tLtU2pgW7YQxKtSs5Dde645dRYw+YpCI7R8Ic/NfizyKSS/fsshRfDd0o3YGJb stephan@Stephans-MacBook-Air.local',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAIHiGPWXaSitsP22IRbSU3F864FAUafR/XaMBtwyBWwTEV95xQeCiKUlc0/+xFPxkM6ZI6CWTai09FZH8XhsZz0y9xpEs9DDxYgaM70MLZ9a94qNiClfYf+B1ci/IF0uhU1cDZ1f9TaX4zf2WEUknlXZmWJ/vSaTN6njX1G7kmyzAAAAFQC3X0hxPFHrGh9wBgzTnfyK+IxHhwAAAIAD/8SWkBMSlcN6BejsblckFdEHyfTeUQCia1Aug0OVneY5ye+sY1imwSK/YDyRLv+NP+9xz41AbjDAl4dRn7lur1AbRs95HLjlo/ryIWcyfw25DhLwgVd1EAybeOSkuEQrRRTlxCD+nEbr9mDeAyViVXui0ydXZVRchEscOUGGLwAAAIAUx/m8wCtu5aTB7/jSBViJR+Sv+kVZYbMhb8ZWs8iWaSpGUpkzl+PP+O6WWkdgEaklhGjfJiLK9hsayEdkmuQDBzJVHZllMO2PW3Nwxt1jQ5Clh84kdrTkgqWww/7hio7L7xyHVjvJgVta2NQmW/gQdXsKOFOq7NX8iW6A3yjSWg== michiel@MaquePreaux.local',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDwj8S3y3Rb5s56cm83tdPc2Aa2SqIK/G+spdC/fsnEc2hAFCLPi5as1MpaSL1TNNqex7JGZO0QyQ5NPKVGYp+yFxBAb5FtfhXXM8SlqlWm5p7Bx70xMrH6ewiPr/Mliyg0XmesKE9eicj6TKx0Wa9izRrfXgFSBTGJ0n59VFF+swpNRKamrrgTaAPXSA/7bJdjjWSPiOJFXGf6T4ZizyX+jObSY53+MI5j5eF6YCxnGy7Yxb/5fKR5MnBrKIBUqyJjdKBxz21vtcneLbSmMHEFE2cb/DjHMvFj5UQmIEFJaGXNDmDPPrjQ5aAWM3uJ0lKi2SlYp/DKjtAVMB1YnvTx michiel@Michiels-MacBook-Air.local',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDY0kBEr78xwvLnBGa3HaaUeiNe4KnG3RWycj1xsFKtaVZm95oqoeHA0NgqcDRROVz4aEe+FbtvOVTorJsYbYg+K7qx5KsZAeHnYHDQKfQo8Hehmew1XsN4rOoB17yrJo7ewdfglw9GDH2xLTeAMq6c93yRBlp688E3L5w6UrMOMSsXPvNzDw4dBwXmf+9bwwjfllWvouUO2yHzM94qjuobumDGsCGXQWfqsl24rYvw3nhd3Il8jGgTNCdkXZMPJ9T7GInxrKXjJHsvgtI5fFXs2AwXK5NGFLodEcmT7uMtwC8iIt3UKt/qYDBXz+T19y1xjWdia24J5DEhglPZ8gObhqHHP7ckD2tAZTFBUTqfUCpCteXLBbC1ATlQN7ariQJ4QrpzIqvtn/SsfpZJPLQEBPN+ZV4WsPY4jzj6g2YY2Kw1dsWUCRQPGYhuDa+S1ha3iko9guoDYh4XSe4m5PMUE884JigHhEiOBGlVXree9PM9YAAX1q/ycGkwcAA9/MCIGd0LC+dk1EViWX1Zp50qGOHeTA+PKYG14DY3lv2V0b3xnmV4m5SieGEPUqF9aAfs+RjAbE3bKkSA8uWkN0RXj/WJiIp/eDQwEPA8NsU2U0nbCM+VX9wWqPTaefRF1zhDUsLk4/iOYWgECHSXZfHyR9fkvzOe5PwnjhetNxm9yw== matthew@Matthews-MacBook-Air.local',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC5f5N99RBWEn59j+goZquSR1NvMyaWyMFhipm2APxEoOtVunFWRpYKk0y1G+4jxMeZ9F1hJwTfsZ3FYYBkMSt0jiEvnhgpGwBVrPwRW1jPT0vUF2QldN6B1QClttPBOAKj6knpX/j5u6NtRiirqA/5LUaGHBqfxUgS7sCt99NSEITKsHe4vr4Y00BgS9ba8Cgk/0qOklE7QE8JtzBZz6dfTpdfV30KLLIppPxsFMId+pwL9zo2wGEfQ8ijA1j2StDCYa1YP1Z+3e3y8MZo5b6Xf6l/kv/rYjh118JufgpdZNnvbau0dJIUmSDSrqhuopwdw+/G/wNLuFOIFrFVdXknA7AQfBRhzResGH5YG7nHSYLXFSpOPXWY6wVJ0wwbtxuN2DTo5S6foTV40KVw59j/PPuIcQNDPeLBtK+xceZrdYvYGIH4oUi7hSRr6hOrgPxc7mpMfnh8v/5zCCD7Wl9gSEZ8RchtY6U6GccjJ38KcB6ZVDZEisK5JbirJzqgOPhkv6/T5uTVTGxmF2tWZp599bifhcvpSrK2+PWRKLJ6q2EQ0u5hTmnhmXnouD/lLNq+7+Kb6gmfBwWFkVi8fLynqExLiHps57s8X4edXlgsJ5xFrTmtV4uvnApkLTR5ShuT0S+FrpS+8KJj+zWukwkpRkAR8IO8esjnP3L7/BeY/w== matthew@jungle.loopback.nl',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsNZi7mD+HV83QWgxcillmcTCyXvdTeWqjbqZjYWKtz2h8bX5tOMYmfJTWHHlr0/Bq3t8g3X8yJmaBY7QPQ+xoqgF/ACap1tqXzLr/+lI4PU31amPRjtMz9ih+Md/UZhDHbRXmHQO5izjEAWu5d0MFi52fDVANtlRYi6jN596RdLy/NcGdvDG4udigv4YaSyodNJsMzsxrui1N6Tj6W8ExhJl2ra0dqPRoRo4RvhFvX1jXD6Ajpp1NzeSNN02qiWRjQHtRn7WBmxNx2TspnILWB4tLtU2pgW7YQxKtSs5Dde645dRYw+YpCI7R8Ic/NfizyKSS/fsshRfDd0o3YGJb stephan@Stephans-MacBook-Air.local',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEArr9s13qBhjfQcjZz7SevsocxeyzB58dxRfhBVrjqN2uxRenkgomDr/HnC51U15TyVcY3PTbnGOQ8FjkBJCDuzU3zLolz9qUjV0AtYWO5MY5hV/EqUoPgUF/xZYZrhjS/h/Te5PL2+z5k7LakjpgltKO/NNdA+fgcmi4WAOifgnexY46ZnLNZAZ3C2uObltexqHV20Du88XEb2J99rSEBdbMXyOIjOfq/utvoQC0CdJGbV+noCb/plU0C3YSpvOdFuIy9x/3bNnOsYbxk99jZdUEfwGqe5Q3V2Ju1fp4rGBI6VYzVQm0lRzFD/ucCP0Lv3ew0SbNx0hez6KoHzVvHvQ== x-noc',
            ],
    }

#### END atrato #####

#### BEGIN cyso #####

    @add_user { 'cyso':
        email   => 'noc@cyso.net',
        company => 'Cyso',
        uid     => 5034,
        groups  => ['ring-users'],
    }
    @authorized_keys { 'cyso':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA57YS+KcnoCLi4KLZI+v/AW/TauPoz3YaaOMWzi3tIudclULf91YAODJUoy4XbSbeIuhGqd0XDMRmUWua2hoPFcXP90PTOlcXm7SqLFsJ/dYPwqIcmqG/x1MGN0344l9HElmkK9kHqwvv4DbwfcJXppBISc1izrWMBPRo7PxAbpNgdF3+yRR4q9Ik6fq8+rBhh5XZCAzkn7JdyANcq3CN6RpIedpF+hretPGSv66s5J/G2yzEPUrPSa0RL0e8PLNgn3v/Rz8oimDeki3cxDzZ6Ke736fA3seagv8YYVN92RNFRJ8FQDjtvwbjpOsie7Y4NmlZi8NRqsg5JlgVrihJcw== stanley.westerveld+20110131@cyso.nl',
            'from=\'85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\' ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA0a8om8aAyg3GrwVhxRWItUZA3NOa6mRvIPoi7VeJ4IJYzOMQlgo6QAgsTe76w51covb/mMJoTteMvuvk9arPrdYklEK02IpzbuvsPIUlJGFOsCb39QIOUmcDfJXti+nqiRT0XMuHcGZuGm191/RDzufn2LPLELVVWIF50YQtOmzcNN9Jnz1RFutKCj4g8c7sTUGfaWd9agKsheeM1+g7Y71scqlKSq0T5TvtjMY9aYIQNGYWjtLQ/CcjUK8J6y/Jr8tsft5KZavBUw8ugW4vwBNn6DEj0tR9TJjSdl5Jc7JMA8w6eC2Q2mvVHmdUo4TcwfgrUmL4sH4R4JvPDdr60Q== tjebbe.dewinter+20110202@cyso.nl_6',
            'from=\'85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\' ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAwLuJqOb0NOq26YX2Vqay49fA8oamVf4EEymB6b/3N+Zs9hX3uhXJviKxYB2X4no5DOGLRKQPI3LrGs0x6WAo8PwAkdLxhrCJf6Ie+wKy8gun3QS2CeagkdP/Jd3F7Mh+Yb4owWTAY7FC9fS84+Gk0KMMRXZDuIFt0IgOXPLh/B3PQgWZKIeSi3rfzw5xL0KNmje7PERwTdJccHCPlG+CiKbzCJLjFIaZFCXkkD5hr0n4bqeoO6RgOo6JRXYfX389JdDEfT35udRCshAx/8DZf+Yv8ef+th/WHZyXtRbhnyLRdxDbXfnb8KlJxnLrN6lirOV+34hQ4blPHB7i/6u22Q== paul.bankert+20110211@cyso.nl_13',
            'from=\'85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\' ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAtSHiwGWR9lFHWtNsQET3cWtmG3TwFZOg2W/Uy7jLw4uBKn/8ijSNlp5HFNsR0KbYaisvmwi2UpaNtBQySP1cuO7SDZ8cTbxlrT6wCFV3kmhYkyKuRKPWE8md6mUKiXpCmIrWVZ8vRn+NrDZ8i2WtfOjuYQz+ENoS1QwjnW0ZYwvQJzlBlOyYVQeqyjAzww26Q4WbYpQaZ3G/RPehoMK9UBnxfMF8FIktUcR63J9mtPCuqjOYGtMIypGkL31w5/rX4sO5bAjv4ivfsZlGdSyXCcWDR3Frnzguy2kqFDyeiWZVB59CuwiyAB7CfWneG2gCEfOZeXPJK2Lze48U56q2yQ== janjorre.laurens+20110201@cyso.nl_5',
            'from=\'85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\' ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6LuybMF1wlUfPQReIsUMO/0PeJGJmWosbk1ZKAxbybFJwIcC0Y9doO8CbP7Yi7ipzBLfphHkhWhFZqM4955iTIxITdzdHAetElMDLDR6ubTIztd9t8l2/PXq1Q1dnSIQikpY/4o7KRLqScYK2mOX0SVZfhPuhZdLo2IR2EbtsDzsradlzd+2ezrzdbz790/vCKZZV2SizDtqrRjNNn+9RccY84loSgkRak/L/IpuL4mwmuCaXlaWqGyE8FiqlFFyIm9PKTS3dYjdHH4LIHpye2pP75Ba9gwM0/Fq8KYM856RaNXuJ+ZPgpAiNQFzU0mZ+CTd+MHsViqwWs5COIVrkQ== erwin.bleeker+20110601@cyso.nl_21',
            'from=\'85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\' ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA2erTf6j7/iceVynY/+qpvC+7YvdxzgS5sRGWCFidCYNANbkP9eSOW06vb45JyOZHTckh3Ot1TAUiJSifFbDUnxnxswAwl2zOd5ifh4Mmj97VFjM14xwe3UkX2cd2vAGIOWpOW9AxelCyYbpzKhOBWDZu4IgL/hnWKWvY4+OSkkOB5gBwD+FAsXJi7ZfTW1z4abCkL4ky3tF/og5/ZITx9ImRd0AP5mZhlzsHwgkF0Ihj26WOdXziwlStvcieS5DVoH1CUa6PrAzPHU7HFV4Pore+jtVmJRykjJjwA7BHUADpstt3LyuGkg3+VAX/D3DFWtX9mGdh3kLXmKW2+9cQPQ== daphne.kuipers+20110215@cyso.nl_16',
            'from=\'85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\' ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA8SsgGI2qzMgQsd9PtRun4Op7XtDdgZRxVe6HZHp4fpNQOygnQ5Kkob6mmxh32SjcuaLn9coFc++sOVttO0kwHDcJAuRIxDEz/22lccr3xbxTy8Eu/64hPHXt9A65kuVHur9H3gBbnQ6ifP0zGLYZNR+XLaFFTDcCu8418JoK+zxGW6ZtNUnKwiCCkMjvZLo/22AtFPPY7K09k8Yb57NqsOO6hCVULeauVcixHZGtAqkhM1OzhGa/5JlpWsS0J/Mmu4Vve6WgV7QYPSwaAnJXSnRDwbpj5ycbBTj6cn9WLXw0Fci6yslXcdtWhhVFibu9kEycrdqYcjyHkflW/uoyaQ== peter.geissler+20110211@cyso.nl_8',
            'from=\'85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\' ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA57YS+KcnoCLi4KLZI+v/AW/TauPoz3YaaOMWzi3tIudclULf91YAODJUoy4XbSbeIuhGqd0XDMRmUWua2hoPFcXP90PTOlcXm7SqLFsJ/dYPwqIcmqG/x1MGN0344l9HElmkK9kHqwvv4DbwfcJXppBISc1izrWMBPRo7PxAbpNgdF3+yRR4q9Ik6fq8+rBhh5XZCAzkn7JdyANcq3CN6RpIedpF+hretPGSv66s5J/G2yzEPUrPSa0RL0e8PLNgn3v/Rz8oimDeki3cxDzZ6Ke736fA3seagv8YYVN92RNFRJ8FQDjtvwbjpOsie7Y4NmlZi8NRqsg5JlgVrihJcw== stanley.westerveld+20110131@cyso.nl_1',
            'from=\'85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\' ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA1LH8m+Gf458Q1qjlB0XRmtwt0g0UR3GgxibzGd7xbdaS2mPr/yKwvyN/2WPUK2cu+RU/oYb07w00d4sDS5oshTmxBTcsjdfF/HkKGN5d/y+YNQuL6gncIiTnal/2xJ47E2FfpMuPboR9tf/jp4rgPfHdjNYaYj1+fAwKyrGe8vY5N1Nq3bSzDuMcxRMMYfVLWgETKGFCgTfv/T5O0svGTrKY9GIvhp4bHSEmmkmSJV6vSqqYvUuwC90MyZwEly7vTkD0GTespAr2znahfzgbJwiXixU2NHmpvDwhNhrojql0uUXURDWaEHJy4BL2pD6TO+q/rgO+WGuNhEQiYKAXxQ== franklin.hink+20110526@cyso.nl_20',
            'from=\'85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\' ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEArLTEWhR25z1ADs7upqBbFPyZFZUZXJF7Y1OWyTQK0OZl2KAj+rv7Aeo2a7s6A8Fq8Wu7cb2RikbPhhyJU/6lVGH6Y12w3Q+DSnW0uk68ydvL45M6e+2MCrljIealB0Gq8eUz1uQL6QeVq60IoRRkwt8LnkMh4C2NAS2keDwk++VglZWN7Hab73yw8QyDyTQxiLBy/Y9OC0Re9tTQUQTmx54EV6XSstmnt/QtutzhQntof+dO+Rsrd6ZRUNgfN1+voIlErTgDaAxYTggRqdWku8jwUuZt52bEj2B70RQtOSmFCfG4VoPX+iK9MQEs2K206clXix8QjKrfgrsXQvRznQ== reinier.sierag+20110211@cyso.nl_14',
            'from=\'85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\' ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAo3N55XzwYFN9irEjH+cohTAtmJpKBjU0P4cfhiz0r59S2K0xdAFSbBoQap1to91OHZKDkQskAJhWZIQLMJc6qu+Sj37L0441LrjLs2oiS2uK6ei+3Lf0MIVodkiPJ/7jWDXUZFEknTcLUMqGrOM1sl1LSJp4EYFVVFKYug/b3jWkINpgVVu1Jcf+B0R3qraaJnWSZWF0fI+xjT9i9mESN+zyU+CAeDs0L+4fi8XK/GExNA2x+J0zTZTbb8S8r2/+zZ7sJq3UN49O+3mhSw9myrSwdZGTIwRPsNILX/oYU9j3J/UaRvPk3iFQm0nFOU3rjMm5JxgrFmGvoKzgB+dD/Q== randy.tenhave+20110131@cyso.nl_3',
            'from=\'85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\' ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6l6ZEmDfbQ8omCurex9uAbyjwIU55RKfuUhDlLLhG8NOiasV/715XecjHroTyWTutpbFXR/iXeIwERG3qsC1pfp8XgdkT5w2ZaZhI8hiHy6pN0Ah6XgZKMaIdBe8CZKRekwRgBaK65ANuJZfqlunXFYoTEVt80Jr4nfk98Tn/ypM9wlfoRz45sp7pi18oTsCApQLdlDcRQkuUoWdNnhCAPlgvwn7+xr6cypZQLQZzXrpnWPNWpGIYT6dWZ7HKudYCFuXa4TP2Ar7kOznr87H1OIX4H09Arfwu2rzxvysdGZi3aDkmtZag0lzIi1pcUaqpM5WBjbjzo6glcFEtcmNuw== jeroen.bakker+20110211@cyso.nl_15',
            'from=\'85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\' ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvvB9NFjeiO6xcXxaf3pek6DhHWvY1gJnDSTHv9FvflD58f8bUiuzL3R8AKZUotjO91CQZtkXTpJ4cUzio8t4uMrG1la69dImOcjosQOiVKMRqRkIk3v61gAs9rECfUk4X/t+rleNY5FTXj1pHJMjB5EAJThcImzmEDuSLTTgkCcETBj9ys95zdhmCNLiyVZdaUKzm/uTX5Dg6tZU/GGaXE81q+54G2/InY1eDzwWL2ltp7LQIb4JEOl7U6d48r1p9a5TM4svqJklUyUS0/ozYnjVK2MeIqdV84ezbNiyK64CzJsKxDiu9KxmDhRgf8lqkWM1Ls7Cfzb/0ErIRLGyTw== nick.douma+20110207@cyso.nl_7',
            'from=\'85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\' ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAuWPZTntQO3i/9rFNrTr4k5OzxuMrj1pqEfnEiXBN9npwEYkW0g8mry3kHXlHHyGCaQsYsPaV9T+WENJneTwbJg8ey4zUOo7hRT5ihsCIKF3A6X2+fvGfnAleK208PnZgiocEsIvySqgYS52Z18lwjS3gmj6X+RJTCl65pQBYtv2QDilK94izs5PuNJNkHn9MEU2GofOS8bx2CDAN+GzCaXvhBdfGrvfv5GPKNX4bTRc8j3Dr6A9cKyZ1QN3FvAVlcgkOncDlS6/+C+I2WX4wYydyIdRoeUQ/kZecugMe4ijHiYf/o0f6yL3+Zl3fN75McxvOOJEAW9n3KxL1Ua7ENw== bert.driehuis+20110117@cyso.nl_2',
            'from=\'85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\' ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA3EHuFO8NWZ/Cg4GRykh/LDNjr2uz4/Dczv3oSxvHYmbB60qbeu9ezdDmxPRIe9YCZpYLxAKhe46J+xeIUK9I55BBaDBhWgbiec6I4d3F+fWxWKARxPx9mF1fKsGvw99ZUMuUzCVsn8An6+y4wuG/eGluZJ4N8V7fkJJM0JYILwNAs0mX6c1Ra7a6XtteUYIimQBM1ZFWrAGkCnqyotcR7Q3bErkU9SCbdTwFTbmyD6f4ODRjg0NSu9zEAGamJ9bzbTYmoNzZn5Do7MeL6jHdKRyb22lTyWSdcrDVRDAVerd3nQZBujUjyW0nZrliJ3Ab3xV1Ozn+fmIoCVzNCeSLeQ== barry.schoorl+20110401@cyso.nl_18',
            'from=\'85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\' ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAt7LshrQM9hjsJhwZEnhrds1Id+akbvhl/nvJZFxUBfkNqq6Z3vbOTZ7vy3KTYGhrgklBnWs5F+WTviSHW6q59gZJ3EIyK1xy7KEWbi4N8DfJ3IhBY7sLd5OruM13y4OPWMe5MhxQgZ62bGXC7l3i37Oxc9g3cxSAYpdMUgXTKIv15DguA3sARB8jvnjlJJABg3sOj9TNxe2PS5JXiko3v1yxDD1h8kWf7Rxy9oltL47paBuFKfU+nwyUp8rbbXaGJFD/fKxmAfMia5MteznGB8P1oAHTEEqtoNyaytpns/hn3iukG27KBxuCJftaim3MBwr4gC1c8mjgW6rQe67pZw== mark.boekelaar+20110211@cyso.nl_10',
            'from=\'85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\' ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAtE5h376sZGqdKG0C+NW1vhOwO+KNFcO5JzRL6Jl1vtLvwcKHDizo+JLrVHOcaJmJ7MuFnn7TeKteKcfG1WSfb2wAuzF5q1X4hPZDrnutLlUVJcFVJAZZKStKI54dJmOXYgJ9EZsZjRsFJ4QbHrAXiR2Ab5YNVgKZT0D3dN/po/wOChzljdRfAoyhcNv/PXXUUcWt1UAkl6vSnJk3WVHaDyN1mvBWGLHO9inlwaLfLTEx2JKXobmA9wgdbFetADNYPX37ATmxl0vZ+AKxqtmHFEc+X2kO3ueqtId7Pv1tGsBFtWS5i1xP7Fld8mQGxSBpXnRE1NvJbnPiUckr4Hjuvw== jeffry.visser+20110211@cyso.nl_12',
            'from=\'85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\' ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAxL+KhpyySKrr+ROvSnNvlZeXuxAC13JMHCCsj2sMxbPkr3aOuj4Zq0ezHPGuFIhJVOi37jctFRvwg/dBCsYFxibv/rcl43fEA8//zrtJBcFgvWJgpxtaUsrXakLUfGvXer+Ip7x1Rbks5DR/Jgm+LTSeJ6IFZ2tJLO2Czuvn8wGvioxri8xT9NJ19eyXs8+WT8RJR8BNFWfKDAVYp97qiEDY7JsQWqDxlc/M+V5qCCyhgrjyONd9i7hIfStZSi3upQ2SWUH0SyIb5b7t+x8QsIfikHfqR0lNV1WG5F4Pc9Fjjl9KTK/5RXCPqSHXHYMH3Mkn3hxeBe8+bbuhXK4CUw== frank.muller+20110516@cyso.nl_19',
            'from=\'85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\' ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAsrMOiCXo7UwuqdXagMgUPx53TwffbXfZ9wtHCPuWyq5nU3OfNEHSiQVUyxE+EqcqVmG+mNA77OxXeX/EU6q0AYHZdm1XapqUNfCGhGXuFzlSoT/IzUPBkle8JO7Q23Sb8YKCOuvYRCLFK0tgrLOwU+/rzsMNFe+ej0NbVBdnxwNLuWkATdedTx9uUS8wXgukxKCYxXWk/L8OK+7ecH0NaOvMxq1N/j9sxVLiam+98tg0obcLGLSDj3980DqEe0LkkIoVU02pF/BIjClCB+emsGlOHlBpdNQn/m06rZhabxHtq6aof1qEN6M6AEZmhWcSOcRR8kSx+RMGJYH0XtcWmw== ron.ursem+20110131@cyso.nl_4',
            'from=\'85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\' ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAxmcR2nYTrSwfbTUzTPIiETEyBxSBy8/AnBTCzP2A/It7sBi112mEuFpcth7AP01zgbRvlCZVUDnzDpOICW7c+QRuF8CHQSpoVD08T1iGvaOub4fnT+SYpjYgsg7nOaSnK3W/gSqxiec90V2gKSyQ7wZ3We+gXAXKT86axtKAO1sAOKdKlL0KavWVtdJWTaH/eBnJtzpnEjBLKfFOB5S4ewuRKMrNxcNGQSmZ2xbVT/6OSwyBxkoqi+tlgKcg7PQfNzUNQWJtfQSZGqtzU2+uTKgK8KAuLiNuLOBnn0cxaFNMaJMl5F1cTdwVEIkUU5b4esJNsoB6L0HxLGjqhgVVVQ== tristan.reemer+20110211@cyso.nl_11',
            'from=\'85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\' ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvluA6v2U0gdW1zZAALZUaU/0wF+dOzi7mRzYe5UhyfrBcaa1X+VWRuuSaT5dv3Vuq/GBSQxMokKA/d3iiyuBXeK44gC62cgcUHo6cNZLn92KcEIRYaHn0FZlEIA1DbpsmsZ4D/wKsus7iyKYZsNeH6lXrK4W6EA+wkQVnPIxhFVNZaw8ZPVgZsfM65EwX7A2a3JJE0CsIPcbRhjcXD4KF2C3a/adfPoyE4yIw8UuTuEeGVZdtlVdLduPdCqzdJ2jagEF+Oms5X+ecbesX9Z9rF38DaWYjrtHoxtqpsHu+CT9VxTzjDPm1tdrBfFkgvmWhT5tr771nFcjDU5+zUAKZw== sven.visser+20110328@cyso.nl_17',
            'from=\'85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\' ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvO7Obuq2Vqzq2G5K/Him4de+k3Wn/a2qfbu/i+TpLjG+5VMUk7jKF03Vpvw8/PuSZavSP0uMLPh6dyWMyBG18HihpC1wMwA/rxL9370p8kyWkQi0waYsUlDXoZub3CTQdD9gL6LmTkzsmZc/f8779N2JGIXgf6HJZD0Kbm7jhbx5Nhp/5pTidMDz+Rgi3NMyKjb8wAkjcUmfq90BiYyXcKUH0ladpQfUrw7eSM13l5FqlKtxyKICmaVBzVrTKhVIGPzsBJcIs2FPwkKNAbHsluGpY3eXHbHyHo00q7YD5VgzzBssvxg2aGzNxBzopMww6wb5z51yNs0kcWwEb5Moyw== mark.kraakman+20110211@cyso.nl_9',
            'from=\'85.158.200.*,85.158.201.*,85.158.202.*,85.158.203.*,85.158.204.*,85.158.205.*,85.158.206.*,85.158.207.*,93.94.224.*,93.94.225.*,93.94.226.*,93.94.227.*,93.94.228.*,93.94.229.*,93.94.230.*,93.94.231.*,109.235.72.*,109.235.73.*,109.235.74.*,109.235.75.*,109.235.76.*,109.235.77.*,109.235.78.*,109.235.79.*,217.170.2.*,217.170.3.*,172.16.*,10.*\' ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAqDl38jTxrAql2YmcI70oDob5ZamZUJ0csMsxuje59iNZlMLjMgtyTrhOVfQJJiL4PsC0RzDJ8dj+8zD9lHACDMAxiA4CtV1DFlNfZqlrCN3OuQIbOaPM5hD2K2M6Zc6dty56ky8wJDrkmzouL+WW6Il0WjHEC3ptql9DFjPLckn6K7kS4PCNlPzypZY2xa/0Z71h23dcMFdcyKGN8PhGz2N/jMTNA17eoZ2WMq4C8hV8HcNQKop4ui8CQ8pQkMW2tL/lSJeUZ3NsnHZFhldO3tEOPKz8BgLvjTsB+ONFLhwzajrOISjW3KUIYKfOZhp5eP8UfxXAPfz3C4DfwLdw/Q== backup+20110705@cyso.nl_22',
        ],
    }

#### END cyso #####

#### BEGIN tdc #####

    @add_user { 'tdc':
        email   => 'noc@tdc.fi',
        company => 'TDC',
        uid     => 5035,
        groups  => ['ring-users'],
    }
    @authorized_keys { 'tdc':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC4GMHaBV8/XeKNyVLIqsjoFGSjFQYn9psOmzyCAYSOq07kOHcBXsY9SWlU9ytMBd+QUcnKdRlYms6f1AHUWFdTzxAXjsjaxl8E33PzblfOXmvk5iOjm6KVjvjyAz/Mlw/cDOqQB0pQUYnEMnL5pitGX1QedtOGwfw591aYbIGas8DNb6uQ1sBZ7RhAZ/Ifhmt3qiSRzlBXvAsT5bWq+2U8u3VGp/Duq90/4P+juJV1cOqXE+6hwdG+xTIWOxN74B14ztEJrTruYtFHErvClRZ4tx2EtA0UAcV+fXpE4DoeDHWbHeTF7sngR5Db+s4U65zYUbyHItklvol6hkNK5U2EeZ/M3FGSQpqdwhdGwSGTydnlqvuFxbY0tbJAjWOW4FSKeBiUbYGMPt8d/U5bNIK2Utc9ggWZ/Qk3VymFdz2Lk7Am/kZ2Gr6EX3ywWn1cfg108BMktGeMuRAqVH7bCsUcY3lrbmQtDIT1gzfK6kAQzA1EBiiD9thaUSNeZfOJifPaXHcGBShkeG/Tc10kuW6MDbM/QFthz7JHnNaOYqSUU/6NFTlBJj/hQveN1BLww+bIlY1GAFap3aRjxTVNy5Kv6mv/KFX8TYqJBahC0sxbELiT9aTeqg5qJQBwF6JZcgjvudX5UpFUsCh6H8jl0FfHdiulUJpT6laZIuk02NPJBQ== ytti@ytti.fi',
            'ssh-dss AAAAB3NzaC1kc3MAAACBALeqG8B6qbqQ1pWIgHBZWWJoo8O+dfjpcj/8Hl5CfTdJK/7RktzH8GoojCJOhIBYe+QTdjJ1i2j7wx7u0ieCotIMQD+Fc264wK7O/8zlANTcjP+veKKC4WcrDQycyng3Hk95esnNP3FXtlK6ttSDyNnMb8hPI9mSyq6klbqyG/GDAAAAFQCrpu+fO0D3i9zKSbKSKczkZZZrAwAAAIB1Yk/heZb7THxfyrK+8bHwrBPLHV0+CLqkzjvCG54L9fmRmvHs2pX6aOTh4q08dhiENAXANPzzXt0m4k5Cjjr3K2i/sauyvyjlhW3WQ5jFfl90cEQkNxXJS/emljjLOFVaXQ3oU0sQDxqCtDwtz+PYmSDhxhn1pmAKCynUsIS78QAAAIEAlbYtP4gzu55JsM4HlT3h5JQSvYjoY8ojFKRxi9ilpZdJeXAYUTjWSsRuLB4O0VH4IDJV5PrwzBG5D31RwAlVO9xYGkmtARP4272VbkaQD3dw3nP/wd19c5dBRp16xZnNUkO07z7kKS3FH9a7ONH538cxCF9ZC8NRlKAxNkIZxFg= sonny@unix.dk_1',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAKa/44RC7jLRymJsWtZ5T9VPkvsH7HPM/gSsMOUDeq0hOLrzPxLXXQZIy1RUEL2GqqBIfZaii1G7cJKdrk7LMFatPfxe8ozvnVylOErvR7x3ur+W1h64s8kIFtCqj6h5Mwq9IFRpBdc5lSlkpUE1PQLtSYQz00fKxB7XJqBocUBFAAAAFQD3m+4Hg/dmD919KlcuomVcTgkM4wAAAIEAit7CIM2oAeBo9CBWejnotYeCn2RGNoagHaXmVpctGYS5ZsfKYth1OKZK+beS5mQHh4AOdKgtBtCDDl07qgFneEE+gDHLhFQeFdyB6JNN6okInF/vVl4VwnlKWrO4SMBLWsxw3Q8AwvplpvcWX0OWRrKBIOjTMUqBVcV/BAxrO8MAAACAJPZucykYaEnjAtRApqtiFxxbsr5tyjHNVdsUhMLantBlkt8hl3y07QSmEIdU8v3C1hOCbCxo8JfoNVpWZVnB0MroY7NG5N+NlvNjIXlJZE43Wokp0afZ5LknmEFGBbDxOtYj4Xbv/aVwusT3/ZUja0Tjokza7C+BGqjCFAHg8oQ= aki.tuomi@tdc.fi_4',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC+qX07Yfz1lFM2hQEmV5DcrS4ZE5em/8sRR8kNJY/cAbITK4UlI+0N+j1OTglmyuL36tVBXZ7DsUoVs8W8zGpRoizMW2RxEgSroMDBFmVHRozignFnS+l4+ee3LVJgTFxXkIhBmo0FcZlK03t2XDyWRmOkjf35n9399y6+tO65xarpWsOncn9kCQT7Mwv1K378KoNO+J1hkmGLOIE3bk40VCy9FjPKgLa/EOBd3cOd60BazzFf529jp6h8q0xuAsctun/nTJgborWBde7uy/2RwB5nSvHbUobbW+oy2n2YD3hkyuReSliCai/ebiNaQnHStj43J/ykgu7P9zFx9cil nihb@tdc.dk_2',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAO+rNS6R4E5eSyhVv/6qxpvcibKrebG7OCc08LPiwKoKInHlE9jhRHs68yUE5fbeyaO9mFrQ0psRPR/JMO1nX1+JjJHyKrQ7yJl8Er0YMAm8/NOn7GNwF06vQNHwyt2wf74koXPZx/s7SG9uCFcT0gmt6sg726mC3oAQNzX4TOV3AAAAFQCThbu+Xcje4hX/gVNrW3m2+fMyDQAAAH8fDJYMbSFPtJBknrqdhQcRp6D7TnTqRe7wvqL4b1DkryjWSi2sCdEHceVp35o/BxaGCxE5Hn9UJ8yCQ3yyq12AUJ1TgJr4qjuUlaBXulOX2KbkeuRbveVyN7/csbqgSpa/phRcBb8qPng4xy5rflIniZDVN2E2BwLUvjaUq6zkAAAAgQCQ7j0aWKO3jVyrhVcg7OJe/zJVdCCjvem7iEVgwf9wrsxEuFo8Wz8f9hkgUbjA87VbC1lTjA+PVpkaYNldFu/DbYnhwa7ZyBF5IZQFoQtegXWrgwFvA5NtdIbClC/485UZ59tAlUyCKQjeKytvvDiSZmTKm/UPCfe9sRnLtZ8neg== anders.kalrsson@tdc.se_3',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAO9Jrw9TWYP154KNqNCQAaWEGNcGxoS06BpJrGu8QPUcKOV67ZbV74DWTDJupxp0k6HGRCJvFwY3/exb6lk87nQHpyAfotEhzPHEIHOEKbquBciO2eybtepUrcQkNdUqRVsNSru4Sx0ynUm8eQxCLnDFzzOHIv4cZmIg9oXlNnt7AAAAFQDMRD+tlPi1Xq2CkLvQUgc5e2O0kwAAAIA/HQ1jdGWHjdtPnLxjXkJEoWCLjBjSt2k8nZCpXTgvhdt6+F1dh0L2Z+0VJ3sLeMDfkkJiPPXPQfmettsWlBk3x+9YSte/6znPRB2oKSDjOE20Jq+OpWjkmoan/Bb4NKwCL4cCxYTwKVc7L+TFu3q9yj3A2nYQSoic+/jq1llKBQAAAIEAyYE39w4/i/YWjFMEOm/tBeNtRpB81ddHm7bsOCBki8g9VuvVQ/bcEq82ngacjsZv+/9Z0CkTFvnjWqjWpVOiYmYngVW4A+WhLG0/baSq+u8O9MTZiihxU0cn9Vvl0jSXLEyy1GhGIbW24jsf3PD6/flQihx0qvIiixmwxYNGfPY= mikko1',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAJRpiz8GOgSeyxl3osh84IAubonVRVKeE9Jx+xTxB8XK9BX6Tbk6nDqmd/pAQS9sYB7DllBns8bXpwaW0KiXn9Wmfw8Bkf5WdrG4ESzK1aIWlAPpwfsh5efBM5cs/kWP+YOgRA5eWTpTmjNyIMrXV7J8lKvFt848RNFDBVvvgeQfAAAAFQDRlXlUoblKPU9KiXmJL+k+7XNhLQAAAIB66h6PpvUXFNFaN19Al8QzmYOXuSxFunI5qX8kI0Qmr0XIuk3k/N4XkXdEfbHftGkSZdMFlfLUepM8ITbtaJiY0WXz06E88OueAKcC97zypz1/MxmL74sGhdRJljHSy5GRWo3YWPdkeXwiBXxP2Q4j+cMUyrE49sKfIrvPCrGiJQAAAIBBQ7gMrTAdNfT2l1UqSj3Rmeta7ZfiJU9y6EIclEAYy16dPajJi0bBp+eYLovOcK1Q0iTjeqindUYPQgPrQSmnex/7oOVQgNQo0QtnN7lXIQvmuVGI9PPoHUQzPcJ7e0TiTSAKIprAzNJJamCkC3JzjGwEIbP8m7VTkRqwTZgIng== nohaneik@umma',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDiP7Mu6W1bCu3+WmeWRtJmZyLj4ebhrLpB1FiQwIZ3nPoP1EZS3NkjdJYKYELHo0VXgMVyOAn9no12NPFewI0R4mTqZ3ZKSJGGn8Vpcmrw+rQojd8KZnId5ln4rpmPb7gH+d7t7xLf6rfp8JbuHAY7Pwp57HWrDH0f6Obw9mjaC6y416oYsGGmBaWDQtS/1HVzQLpZEiCklZQJH9RmHg3WPIsr1Ox9NmV8Bo1fpd+hqKYmFvrcQOLPv+fYnOMkv4eCRtQPTRqEVqO/KHnPTrYX1mCuKW2tdGiVyhFfCxmp3QU4wUP+u0MFjdm3Q417inboz6onedUW+BJcLaMcaLKz FC1420101222_11',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAIacsvqd5XowdIBhuk9Wp2UDMdXbEBv+m8dkOtP49rvKcEfNfrwOkFQql46YeIh4yLNPoDzuhoo+cFvaaQg61NRAiAzkTJptZZ7XmuinS6HFdLYLTW7RFeJcNbT6G/pIYmXcNbjklm+/++f5xMY9weYd79wcq7MNhBEfULiyEIjnAAAAFQC8QZnAK9EmD/JyG+tCE2k99rzelwAAAIB4gZBWMQRw5U1k0KteUtYb2xtRgEdf516hW4BswPgwXzr/kzX8dO/zWGDGCCe4Fn7wegDU4395RNi580DfK8FM8ZiyvRbt/b3P2aFvsIkJf0U8IX7ls4gVhntxhn6zAzRneLl3Ii//UQh94xU2ET9rNJD/T5wZ4a+P45AKJuTPMQAAAIBmqUWdJK/RPS9XK6eTpuf92oCANBozxd6mmIawNlMpIsyXak3VdfAeNXph4FiTl5VwhzIWFC560nvG7GTauQKxCtG4CB0sLvNrrw0p51Pn4y6Thtb7H7Ee1AF3W108O+QZNnDa1ld6QNjx5/F64IeK42SJ2zcDQbD8WqfsVre04Q== jepl@login1.nms.tele.dk',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDABAiWdBlWGSlnpDW/1zSVHVPElA6c0Alw/ampPJ82wK1YfvV2dUufr+0B4N05b6G9BxlW7YwIZ3pJjc9haJv/6riBSrTorU2PjEtPyhRnL5s6eXHGs5oODCN3eydOQb3wZbeizei6Zt8w+svMxuKe02a7Yc9CN2akY9wbIvCaHkQGYGYqncwDfIHelU93D+b/M8icva/TVyE48yV+HhamhKuIviwiHPuOy89Plt3DfgqI/Yt+eLcu3UfMLvn3CD61zAB1u4iENXTBNaHV++EZ5wyxj/BQE2UgcQj6BatrGkYkkP20dV8WmDia0q4M3g0Ka1s1K473nDoZ/30Z34Ul lyngbol@wheel.dk',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEA7pqIvq2ISsVnlT/isbgwyZxkWvd2u6QE5ZJoG73snDvasWeYaOhUDqcOM9DpSYkNxIxrgwkawwuKf2dp637BfRWT9m7esB4RaDYwZ/dpo1OMWBVPEhDETCREDde3Vfi4ZmL5QVOlfSnFKjV2NTl7zKnFpZNGS7rzVS+XADdrhwk= ssger@tdc.dk',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAOjpahyea3ZBNyZI88M0aGxqXwHDa++KBYXN9OZLLWhinHc1lH6yJg7AJJBrGJcp6iAOuO/7EfRqjwh2WDJA4kMiaW9/3njYIZAT8S5RsdV6l+J/i6I/2xrNnYaejV9TyVWtrZTO9viB4+ArevWcXf3ajZ/l3zZUaZvcgjwStrkLAAAAFQC28OHiJeGZOdbAsobsHRrsAT5vOQAAAIAo+KHH2jwajb5luL1s1zmo7jr91n5PnXiBRk1umUGeYSxUaWu6HKa/dJsgeciWROhAa99473fmvNmGybUeZZivR+vmE2CyU6q9MoCk3VlrlT4giQYM6iNsxUOeTSiLtTe2lD9OapaMym0HyWJQgmiyBnYBiXh++qGpG/jg2WNDUgAAAIEAyYc+FlQnMBY01dqgjLMxaKEF/+jlukJ0WBVFUgkflMTwIDX7k4kTjRUngZDMZCM74iWH1Gt8xFtm1Fs36HxOEZjppL5oe6vuXTyjTQRLN7MB+6KlQa6l1+6YIqgU1WnV1vD0+Td3XMC2TanxjAxF4ggcMYB+IDbqupZhUpIE8xc= fitomsjo@login1',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCx8DMM6bKw9hGtxvOYzufbviAINh0TXqaALn+z4ktkchKUdZ3Bw7hH3qLo9CiZzzqezCP8WpfxPvWrd7mb0O36CfwO6xK6h8+WJmESbiIfUZ+D5W9sGZlfou6TwkXBWrSLqi063AqvH3yjcvz0C4oD5Uu1nHHdw/Qk6lU3NsBY6q6RKAiciiaUnG4n+TJ0ZNm3eBvAjotb5gXEFDElMIcopYjlruBgVd27i8ku1BJM0dqNdq0vsu35gx0rXL1ooUsDEzA0OrM88sjnkIF4n/BhqEN1cgDySayDa200mx5qFvIGWwrUgcNdZhwQVNnCFgUqOcKOBl0IAGeF9tyE+3eJ sedavand@arch3',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC89pm1BEJTwXiEpcBik5zV3K//V56wonQTIH91sYrjKwK+IRshzoKj8GKwnmCjOtBvyNCuA6T6acj8nEABSITH4ClsumYLQmLeU0mePDC1YRbFuXMA8Xc0+pEX/a4Ux/D62JUMtRT3oDlPBFTYKvzNiDKabtfoLz/+Bg3JJuz+ltPNEEwRZoHkpjMoMylS0BFTTIJbb+LssN34K7+banxjuzH9P6X++YECQBRvrx0lkeDVcFuQHPDaqHrpgZmzqUMcbuvNyiOoZTyM4olfCPs4JA/N5w4AkDN/nZB2pq1sVdV7KbKoPfHmG+DaJCd10fR9I4h0ZRID5X+FM96iHvzd nihb@psyduck.local',
        ],
    }
#### END tdc #####

#### BEGIN netability #####

    @add_user { 'netability':
        email   => 'nick@netability.ie',
        company => 'Netability',
        uid     => 5036,
        groups  => ['ring-users'],
    }
    @authorized_keys { 'netability':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAACBAPb3R/3W2SqqWLfx2PHMADzGGB+LH/jskYUYxkO9kRP+raoeQXL+yKKQ4xFHaLpK+wx3RSUptTq9ckqho581cigAJoCktzBsHTM1kMSwb/Z70ljCe1Q4Z6L1Flx5+bSu1YS8Eavyb7JdKJJZKbUBw9BEJudOwFj0Y2sbL/7gU5JjAAAAFQD/W++RuOykpi5XWwuAbxXWRc4/pQAAAIEA71XZxf5hin8bNtpvKTUlBgejhqt3Lso627DCwcxDJilo/oifkXAvmFMC+56arIM/G8zqAWwqGPyX8AnbooHQjJJHpB4/L5kpfK/DZuEjY4XP+vmXuzkMMHbn1TtCeOwXcTjEOSJtDQ1B9qqIzgq3ZgRSxmruyhfLFpML5+MAorwAAACAYshCkOiE08NLqcs+Inq7uBi0AF2cRDYc9gySbL85Fhff6xC/YysJ3ZcsfPk4dXHCadWTZrUfLnwgB1Kyvm82x4CMIMRQ7vWlQdKIeSfErqRB/1E2Xhkj23s923PKxjMFckUoMMcziDSrNsFT09fYm/xq6E3MAFSX4Y7PIAUDPD0= nick@pancake.netability.ie',
        ],
    }
#### END netablity #####


#### BEGIN unilogicnetworks #####

    @add_user { 'unilogicnetworks':
        email   => 'noc@unilogicnetworks.net',
        company => 'Unilogic Networks',
        uid     => 5037,
        groups  => ['ring-users'],
    }
    @authorized_keys { 'unilogicnetworks':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAACBAMhjsVCvtkpwRLl9MupzWARZDd/MWKr1lJw9KwO29vPof8CmNPnLSAX9HsbTjthPLz9YyNyZeoqiBKdpfdsxbI2TPOB4dGnhhlh1ZDWh24+HBbZLtkjEI6lnTJfRwvM5Ua+kBFXTsxntqMo5858n7OtBOLrLUz3E1Hv5K1XibstVAAAAFQD4QMdCslwP9vQnlnrD7PKvGzKp4wAAAIAkP85MPa8u1eMSqjLuqS8N4Mm2roEhTzCL86jsaRfxSPgpLFx6sWiTvict8WLNJbWHa67bxxCbAoIl+evBTYGqnhFbt5byNUnyaw6e4i4dzO5f3cTpByPXbU9Xq/aHA+WpzPFvfi1XIg31R/N2c8JTDI82P5Tk2Le1DiCGXZCOYgAAAIAk5uIf9YCZkZq4aHX6kVL/uadbVQI2Cx2kL91la8thbDpeH/cJj4ns+0rSCFN5uKwfyouzUS+eTvTgccRBXuAWb3CJr6bWxfyghgZvavLohSxFkFtiQhvWPLXmy1VGzhmzYtCbwGMeqf/l8CtpQm3+UrP3ZP8/qtqFQDkHguHblg== cliff@dropkick',
        ],
    }
##### END unilogicnetworks #####

#### BEGIN maverick #####

    @add_user { 'maverick':
        email   => 'noc@maverick.com.pl',
        company => 'Maverick',
        uid     => 5038,
        groups  => ['ring-users'],
    }
    @authorized_keys { 'maverick':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAACBAL61XMeI9aTUHrUF40gqRErN0+bgaMV0o6DwtgtTqtoNE8bz5z7T8S1liKLr29ddIJCjDzfyJTy5Uz3C6U5uniQRFf99GufoT7VTCdbvZyFhZoTRAbaje2xnmDldoklJEgZ6erRWzRWG8W3mDpkJ2SD5+89hBfimEFZQ6AGbQry7AAAAFQCoxN8ziy6Ce0d4zyFkdyxGO1glmwAAAIEAs2Y7YWTzlKMRNsrpbsjkp8jQAI1cOSbssOuraD57H157s2ZCKTnVRguCpxLU6wJnOYgZBGuyQ4qhcn2kfEGFiHuihyl1vBqH39wAAoFuMRi6fQbKxiqZBj48g9ChDIMbwFlXNEypNdb8KtH0J0z2vF+BEK4uh3L9969dH65RQw4AAACBALfk1F6yr17jB19k4BWUJA2+wXzuH2HxQ/G5KTYClb8e3IYflI6ZTLOmDrnoKtbZsKI7rMcdvot11Tk/+WZNRCl4LIyc9wg6L4j9omirOj8RXqQ3YOdOm2gqA9iytJM72LtgUjMnCMPS5HxSIXjnH85aXBnGw0mRCTq2dk/StMoB undefine@ac',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAKq8VKg80QWwgwxIwCFIckUjuNZkyz4zcm520ZY2yTPxbHIefBpghzMLuIPyfTl59QtEe6XeEO4fOAnOdJY0Vv/6assuDRImOUwMYDLBnBgwJkdfMFNIXYaiZ2kohGT4IzMQ+6dHOBxiqpzVjtZ0GjTsZJ74jaJCopH0gO2u6lUxAAAAFQCQ6apc+CoLoLq5zT2eE7Gxk+KmKQAAAIEAmEcW/hShJcmbbu5UI1Vy6zPdEqdQTJDk1dfE9tFGlEZ4ABA3Azk2mK77l7Eul1VvrhNEbQBlHKKYSLvIsCiF3KbQciKO1D22IfbtsdzBVbyT3q/E0A2hfC/RGAQnjnvwM4DFIbXl8odqULoV4gmum6p/rpH4dh+bSVDeP/FeQ0UAAACBAIcRQ+2Z5r7f3HsvdvxaiSdhxIf7LtKaDaj3WKGggDpp68swzkJRjmWkHtk9RVklzB+4PFhdtm1o7nCzwdcsh2BMoA7Q1EvNHz1nQbFDhw4Y39wpp6/o2yGMzsVoY7oN0d0xwKomucioEV1k5mExIIeKCoAGeTVLjcz5JOvxgv7c maverick@maverick01.ring.nlnog.net_1',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAL61XMeI9aTUHrUF40gqRErN0+bgaMV0o6DwtgtTqtoNE8bz5z7T8S1liKLr29ddIJCjDzfyJTy5Uz3C6U5uniQRFf99GufoT7VTCdbvZyFhZoTRAbaje2xnmDldoklJEgZ6erRWzRWG8W3mDpkJ2SD5+89hBfimEFZQ6AGbQry7AAAAFQCoxN8ziy6Ce0d4zyFkdyxGO1glmwAAAIEAs2Y7YWTzlKMRNsrpbsjkp8jQAI1cOSbssOuraD57H157s2ZCKTnVRguCpxLU6wJnOYgZBGuyQ4qhcn2kfEGFiHuihyl1vBqH39wAAoFuMRi6fQbKxiqZBj48g9ChDIMbwFlXNEypNdb8KtH0J0z2vF+BEK4uh3L9969dH65RQw4AAACBALfk1F6yr17jB19k4BWUJA2+wXzuH2HxQ/G5KTYClb8e3IYflI6ZTLOmDrnoKtbZsKI7rMcdvot11Tk/+WZNRCl4LIyc9wg6L4j9omirOj8RXqQ3YOdOm2gqA9iytJM72LtgUjMnCMPS5HxSIXjnH85aXBnGw0mRCTq2dk/StMoB _2',
        ],
    }
##### END maverick #####

#### BEGIN acsystemy #####

    @add_user { 'acsystemy':
        email => 'noc@acsystemy.pl',
        company => 'AC Systemy',
        uid => 5039,
        groups => ['ring-users'],
    }
    @authorized_keys { 'acsystemy':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDlDTT8/hWCy+jxYWteDZuFVFnJmMF30lPa2K+x3vDbNosZa1dMaGe5lkz0NM55JIQYC4c1/j1kem5jRmK7+SP3O6Im26Ca6lyM7+JiDCQ9trjj+xQhbQm1ctOlF6o6zQmvcCxBrcP+ED8I0ePXRX5DGf5Vp0JD41T+0hSDcN5rQXwo/5Xy88VK/HoWl9q76VLMx1vEhE5RLpfPuUP0mtVjBhPX8UD72PAOiqP/+/DNLnAgrr4Q0LF/t4dlhfSwRq1ejRDgf7lqYyjEfpg8UAvs47dPLk9pQsPalvKcm5kcel60n/6YXvZhu/ZsnnZk3FW8dXAfgHJWWjZx5xMiSSX/ barkoz@sauron_2',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDz1HLSDMIUFR3wlhQE4JwXVDsH2VA+A+Ox9SkW2i26BxFiZbizznN2bsi6N1y73XLVoaE824lIrw8bXcZZBwcFphYRQtNz8v8c+B2lAFjKL+X9uTE/v43lti7y/a+zvTjHwoPRiC8GjmlhLNVKVjWwEeYqYrRM8Pa61IECA+JbxuKl3Ko9Rnne1GZhfpzFf5nVSYt77MtHklIjOUytObu3b6OcSiDv4TLf95he0jkaAmNSzwZpLKl8LIh7U07wEk8qY5R1qUgRZ5+IQ+AImeKJLgQ70bA6dwJ5sKPxMR7P5x8dgbtCfKuR/i0lkQ0gIJCml3I1MPa/3M21JTYhjDlv alchemyx@cerber_1',
        ],
    }
#### END acsystemy #####

#### BEGIN netsign #####

    @add_user { 'netsign':
        email => 'noc@netsign.eu',
        company => 'Netsign',
        uid => 5040,
        groups => ['ring-users'],
    }
    @authorized_keys { 'netsign':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA0MgFgdVHuY8T7ceFo9QGT9bjVguAjYAXMqDEaK+OgCk6+8SBACyZvDLnWOOxu7fMT5kyHXwu3vmdpkE4B7A/3mmQRzBy1lffZFYRIvzQ2g+5C/lSkFMq46xJt0Gqm8hZASmNXQhCiDP9t1dLYIaWh8ecr/kFNO/T6pW6dD2d8vP8EQi+dwVylpaNK25mAZQbKPEQOPldbN5DyGWRqgcI53Rxv5hSFi1FjSoJiXYIpqSC+2Hfu29spEi/Z1ypUxOFVWHbZuMFGw9nSNtLmYY9/tb8N+DNAlWdasdEFnUtXeinzy7B5zUPIxDlJEz7KODkpvJv/VR+VLUure9UKiIkuw== kre@netsign.eu_2',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC2TPBhajtPSFDGLauDodU21fG6bpFKGCx1cNjJjVYEcNVOGZMlZGV5Ocd0w3ZqDk+7oi1ZUufSxecLJHII4CXZIh1ne8F5hBCYhuGL9oDiMdxbpmlsL/yWeNWiede7h4eWlLqtyKTy7PGm4IweSv/s2oCoFjXeNG18VB5+HUNxrBvETZJPQzltbWtkFGhmPD1pK3ayWKr1dYYphqn73g95u4BAMRCVaSjkgFNmYBhA6+ZZeN4YObHEdog5MqP4yjzNQ/ACuHucigGi8QGppl1Go2FlzMLpigdczZet5YoW/UDzgwVKb3qDaGbDI7wSzZlZpH2mcxH8TTtQXDsdCQ80r3j1NQmTxTrb4FuZcRY7okKiq38h76znPeAZ9OHLc9aS4jxww96RGKJ9cPoAwqNwA9MkT6Iu6FZEZow/WFhaiC+xEeUFaa+K7hTr2mr2y8Y3WpUQf/HT9bOF2Suav6e2XdzPdXt+pmMmpwgp/Ouoneyyg+nHMHOCs2lzms1E+Fg8kmk/L5r95RsR/2XaTMI5po0Yk8o7Hi/C+WcvFVo5pSAQERiCizHAFOX1s2H3KkOA9YlX2+mLgxq+bFzADw6e1qgNDzBH1JZd6eRZSwcx16OWt6P1Qm32S6orEY77RHFGUa8cRl6/BNYRw3xTeo+F3zI0QcXDVvJtAs5H0Lv+Hw== leon@netsign',
        ],
    }
##### END netsign #####

#### BEGIN rrbone #####

    @add_user { 'rrbone':
        email => 'noc@rrbone.net',
        company => 'rrbone',
        uid => 5041,
        groups => ['ring-users'],
    }
    @authorized_keys { 'rrbone':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDj1aoVGGlFRLLx/r8hbyvWtef5TFuNTsDCsSnoz/p4bh4xvR5iOhny0hmQmJ9XVNsN6KNcO9Q+p1HM2W81V87OnxbNWfgb+jMJUbo6Y4wLOMVLBwiucGgPmnS8q6JNmIc6UeNlACbtZoPBvci+6nB0OfPGiVeZqWSNXFl0TAL2jTKDbOOZqmLZ4iTUjLaCCAPOv2zpijPICiTSpVS/QKf+kX7IhIRPdqq7kGIAwx1fA6mVyImLZtmrc14Y1tyodgnqdLt2cY0ekpWWrKrEfA34TNpsRS32dxQfGBX+xx2JRJg9vxCMb2hZQXmGcRWaB3wbqEpPdQl6VPS3H1njt1Hj desirez-13092011_4',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEArUhe9k2ZJD9/u4/517qCjSlsFlt5z4AROtmPVq8vChFLi1B/E1hcePJpq3fDYYvgqfRntp6DNxnMh4h9yMuLXTbgedyAkAHiRZiioAbR1J99NpFuZCq0Mo/TvXQ89B80ZU11suG1GTNGxIHV4AcbpXgpCFQRMDYCBd5xGn/xJwjWSthKUUc83Hropgzli5Aa6HNKUsMFLj4Xh+UZEvGm8wINThvUPyAKcfDtPibwSPsef6qE+eM3p0VYU7YZzJditQdTaBsj8lAfda2z9qVckwxzgYh/W5pz3KGu5bLjEXfGCtIlH/78dxENrAjztIkEO4KH6JEasgonrPemcs9hrvr6l1Y7aOkfBf76El3bRhGOt0jBM5C5dbSufLB3CTi36OtXd16JUbTAHCUVfRtdpLLbaSNEcDks6ZLmzwSYapBUAHzpVnfa1ZfYCJdOgwj6D207mJdSFa8EJxH0SfExF9VVx5pxOquv+vBxnAen0EYBiDEgiD1giKy21sOCqRYk0jBGJ6qY+RsTQA7p3ynlSN7KrEARxdYXQQ/EWu2RwmQ/Ua2Gu9tw5VWBxwAA0P7hWvVqPkoJ5qPtUET80Zml5bBA9IxiBr9InYUqb6QagKyp064uL32/b9V9wMzZN/JSeMmKQKOm98ddw6uzw+aWqZ5HpOD3ScmIR0QG8RD7VhM= courante_2',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCG4A9uL6M6FzO8hDNN+wJ0W8Akxu1MV6V1xMQqqQwQ1Ba7L8v/5DebM/aAMsq2BMKkIYKUnSHAXAMqlIIhmaFsByuuwhi7pYV5/OgjGbr8Vvct8iOslIKQWUSmeSOmYEuWG/oepzYm2nmhZhNlGIiYoCQK6+3Fov41e5hGTWFqSuV0m9MJpTSNS5fnZ4t+vCJkBL+A/POhJ8D395YHdI6VXjuIIU7hDqNhtf89AASBmSEnGANhvlIAQQLM3j+/zXQMO9Nkz/YlWM/x8T9XyeXM9NWFLYjb5H+tVnNg1cEtUr5HsiAYpfFMqDJ60pRvxZodzGsljvQ/nEJty3Dnm5fV cardno:000500000CD6_3',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCYvhbtmv3zEE/QdeBDU0//e3elV3jCHMLOo8L66jwzTMH1SOrUkJXKs4UlCNC18lrFj7bPrtdOlIRc1qZh2PqZOkw5mYMGpzBqTAST4YADCbN7tdMcUarSaAqiepNyCKe2OcoxdhxxMtdUl6abqaYK1C2ktzMGCwaA2ZzOXEOiR4e/h/r5eAMN/LlJ2QSIlxT4/Xkc7xd3AdMehJTTQydF0sQWsF1ST7q78IkMdXoGl6Or8p2952QpOTxJcqGPM6JK/jhbQK0JrS8cjaSpZQEaK0imjIsTN1aujn3I6AQTzTJIcVoBqRpYNE2323BDbrMgb7h6YcwQG6lCQLGkEZdp cardno:000500000CD5_5',
            'ssh-dss AAAAB3NzaC1kc3MAAACBALraI+++Hln5igK26HJ69Nwt0nNVrK/pc+g5KKwSGvF2mWpSkTBEAKc1ZGQZBLMe0BOajM8feC7f5Do1QAN55slIHSwANKJnmsbyCRhlTcNV3GYvGfnwmviIN6mI5CHKTzPal3eWLyD3KUbbWP/+tILT7viK56uS+TIE3bcp/SpBAAAAFQDUoYhqv9hValZJOSg31ZX6MBlvzwAAAIBcgO/YfQHLaT4DBhi6ineURzw5JBjurpOik1lKgm/RLB5QN7xqhe3jlxAAdFCvtuZAd4d9gLaOb5dXZFdenK63DyRJvkVyhVJCbVt/psf6Pvp1P9SZ/9nJOtkdounftiyhT36EoCzp+fiZTvRrS/hXzoQ10pGJ/GKVUo8C6n90AAAAAIEAnHNTEDBLxzpdPc02LDs3EkvMe756H9Ez7Bw6gjortDqeu/7VyuqkJbQSXSRes3XKffoKw3eTHnzJzyG8SYW1fBD8bk4JOwMTjUz28XqPNg0P+Lb8vuxr7ZepsG8+epXGfPUyIr09uPApkvfqAMGT2bgsI5dVRlS4I8sYvzH4oPU= immo@benabuFaUl_6',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDecKLqLNKMvdOqNt+6MvfmNSE4hlcl6PVjjxQpkvrt5RdoZBq6jxdwF2hGSwEk30T+wRMr2EFoJ2ZjKvEZ4SwIPdji+UtI70tNc6pAS+j4/S/stX3FPPLNAhJK+Jy+Qtl07Q+myD8oDRp9I5wLKYAwHcHFOlcBUYTFqcgrL58OO3ZETFJ89qfLwag1MiNzstP4c84iIfA3ekrVK5s1ZiIlSlalDTbGmHplv5jLjoXWJe+Gaq4KMYfWO0ahm/KtZ/AZJMq9LHw0oWS82CmWMM6gtToVDUmiAaLB+3L7cLab+dCG/QV2ygwyTaoz5Mro8BU7r2fqkXs2/crVJJWH5c4J immo@T60_7',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvyZgx/+b0YU+CqDXLPbgOoRmpiyKYDkAsfXMpZ+aKVCtGZzmg8OeIVUDv1lbq+qQwNl+fOi7/V+U8w7BpyVUSf5Pn+ld/+eQK1IgkjsDyfdsFiXr4stzCDjpOzRTs/fludZ4WXEtBRJ0IsfX6VJWU2xXBZKrgw62XnbUv/I0hzpckf9Ug9RsCOdS70FfrmRxh2rCEpVdukS4KNyq8MHkwIQM381k26wvsAH6fhNJucICeBIDzfcP61bg4zWLiKQ+q+5c4U7cRoz/N0G2FNOWwQHooQueVC7+SY3Vh2o9AGG2H+Lbrg03e5NSSUBJa2ixZM933evno1yniv/NiTYbGw== lucas@luwo_8',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDOYHCpCpSDFjzWTGLX9yACSGEIj2K0wRlKSENB79pq8mlDXN92scRgjCCCBssSRdozS3k1457PXhwx02JC5mQ1JK69f/xN4DMsYyQYm+pzreWxm36ViNVTBj2gpqRHzl+iakjZFzeaKgAPtmSV6giRhuHrWu+ZAorBRaRVaDBQqAxhiBanyU7AjmMFBDgAhJm/DN3Yb4GMYfXyMhZagsZ+DVH+ZbTts0ZWwPZgbfa8eERXwYH3YvscwhBCRulySG7Vffksz7ekds/csQq75Ta8e6qjaCI2Xs494vnfdmaxUeBvuYRm21DsWJyBMXTv9y/2ustOFsEHpo6K/NpgbYBT libelle_1',
        ],
    }
##### END rrbone #####

##### BEGIN hosteam #####

    @add_user { 'hosteam':
        email => 'noc@hosteam.pl',
        company => 'HosTeam',
        uid => 5042,
        groups => ['ring-users'],
    }
    @authorized_keys { 'hosteam':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAACBAMnb4PC+YODeA5I2WwDLAwUtp1ZYQ0YBIJOgTOfHeuvgt3iER6IXIpXuLO5XOxgyK1/Hw6d1jE8keWYy5Y5sL7YPg7Fz+WrkFISHPnK2fxHY1KDrpxb+FiPk9nFZrDb6yECGelvq1SoUPMaM9oUZ3sC1IgiqE1N1gxZ1qzDjnQSvAAAAFQCdL60wj5PwnZLfbOU0VeAs04xf7QAAAIADlEhg6LaMu/7+Jz8iMFHnJfe/+5Az+cjwUsuQfcCXaf0wmNavWwBWXljqQbBfee2qX9cqvFNdiguOY8JnDmdLHrGsg5vhg/Yh00CnkcMJf4a5hiaWkyGM4oRuyyFychQE2o3xpfSG1lDdvHBIYnFEY1yV9dgH8Jx19ItMJ0ed/wAAAIByCBbIB9dS/vvFQeBa74uYbe/O/r3CGMpPQFQu3UVfR21aHs8zSbT/SBleIg8HIgzM0Nz0s3yL76zpIq4hz3YCA6qMQnPHWvco79/eao0bx6b4wN849kivwStkQcpEfzWxNMj8IN2xflDssWGiTXaxkEvHn8SW8ihxdkW7ygj1og== ring@hosteam.pl',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAs1ACqSoo3R4LvDgxGUuRP3EGGgmKoLwGnRdOVBLBEjI649eodKbC42hlbJLITI4inHM6KtLsZTmcwX3nSOr9Mlc+rm0SG0iRHhvGpGJ/TUswGR+e4ZiEcrlXoQEXX3Z3VaFESlR8Qoy1WA7N1//bG0piwa7z0WSOtfPwZmWXKGE= rsa-key-20080513_1',
        ],
    }
##### END hosteam #####

##### BEGIN msp #####

    @add_user { 'msp':
        email => 'noc@mediasp.com',
        company => 'Media Service Provider',
        uid => 5043,
        groups => ['ring-users'],
    }
    @authorized_keys { 'msp':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAAEBAPDFF9GlMyZolbZutT3evQ/YDuDG06hk2gpP0VhFdgIQCggib8bs69B6t3U8JJYExH9i3bmom+J9m8vh+GKBHsN+rBqWEHLgOd9BVZWwXdRud2U3869VbzW4y+FqVScRz2pCamCBu90Oa4LNAmU3dmw1RGsnt/jsHCUPLXIDXPcuQ+qyN0lyigyqDxTRVJwMVJoIQCFSZm4aPMPK2BObIbGj/hXLnyftaHyUKXH1UWG8Qv0EF1+1zjCaJlAkOyPpKEEt6UD/iKFaJlTAXetcLNdDv8SfwTCwS+1elDt16aFdFRFqbkLTtYbq72HlUZALs7sRF/Oe5D4qCHcMqw7T/50AAAAVAJeOh5AmeuPKC/RQInPQHVZxG0VjAAABAQDO+6a/UuH9KgT7tkHHx/V0X5LJXhCXvs3JTEKswpV6AU/Tmvo5YjVmSoyu6UtTDGpwoVdG9JniCWY+YjahsRD+Q5oe3pTUlZG+DnGlMIOM6WIBiD2V7rbGHEcaGu1xOLSVD3JnXUqJmlMegILokeR7n2kLpHeILunGIi2POjuGcB2yUvEN+naXPLlf1cPSZlyoFbxbQW9W16uICLqeHCMzpIqoQTtUIVqtLhPqclDcJyHRtpNCuYkd07n8ko42SHgl+s9OHOgt0x3w5THRamjA56cHoO4JVpcylCbRKbfBXqdzG+D8P7e3TbjEEmWVG/spFEUhUTiNZKcI+XxxT914AAABAQCnuueFHN9eastS3TfoWiJI79xTZiZ4Q1aZmoGTWJHwpuoKOXp6AAyvsAQxH6teYLttdlAg7R/lbo/Qj4XQrPMFcd8GYEfTxuSRFXqjYFKef/qYv2ms5Bwk5eclL9HKyz/kHicObH1KvY77HlQbuBuHyVk+bSwHsJGo1mqnPr3y7J3i6yYdu4igArzqcSfxYerwuK6ZxUr+xy65lVjM1jg0Ai1gccfHIEshluNGMcEJx5y/I49RJULrxEVwhJfcApHou/4sQTeEkSkgUytoY+QbErNYu2luXXb1Jbci18RDY7Unp0Xuk5I9GAfvmGwH3PSyI7SlCULB5Xsb38lyQbxd charlie@playloudermsp.com',
        ],
    }
##### END msp #####

##### BEGIN inotel #####

    @add_user { 'inotel':
        email => 'noc@inotel-voip.pl',
        company => 'Inotel',
        uid => 5044,
        groups => ['ring-users'],
    }
    @authorized_keys { 'inotel':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvQMA3dgZR9kirWPiu4inUvZCkBUOy0DZEX95NexlfkNGoqm9wm3xcWZhJIGc7aq+U1DNe0rOEBe2oxaCfaVBeorwL4Wg5ZeIW8Mlfrapc+jVYBjWLrZrHb/ZJbxWSDnYW18GPF2EcZPTtyGzCmm+3p7BXYESqpi+/kQvcleOKNoQiHz7T5Wgdrr1wRBUJHuYRuwFRDH029pBNDX/zBciZbGhi2WPjapn49iLCBUUxfogKKLWGYO60S4pMQQ7ttWIMNJPoPYOMVOa/9iK9PAWxYSGh7c7XjTdsZjge5XSE7z3coqGfoFn989rSu+41JzYFHTXGPJ16c8gCW2qcSRCwQ== rozie@pluto',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAtzZcJ/YrEd8YoQk99YOL5U57pCGTyPGEkpeM1eEvLCnPfhJfnw/YU6fm+6/ungNqexJYB+78f3ihx1u72R0qa534t7GT8wwbRIhEVKzoWHVXTTBKKqitkRlFg8PbQ8awcJXVVrNHzzZxDa+rlM9yxpw2aySZpmMW0fE//z+UkvZ17SubBF6d1vGy7Jq0d1uGYHuxY0gPUJxgXape2vF2qUBIXgU8OC2yi3060tvYZLddOCyZaKBjWqPz5Oo4p7OXPzD/aTF0l0FEtOEL0WH93QZMX3i3zHnz5jr/rIRFioCzL+uCMfhAvK8KLnOM3zBxYaitLvi7+TrlGzCYViYvdQ== gigi@tauri_3',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAoeI4jT52M3SqbYbvHNEhq5fAwUohTHHTNhvWR4PhO58XztVlCflUe+/6elpD3uMGIjcngfZC9z5L0jnGjhAgndh6WN/eEBScRg/hyGIfhTVYrAyL43xeW/c8UrbtWBl3vLFUO1ygGfNj+TSPvMGmG7aXHx/dyFrzlf47I7dWCAKsxdsLZIwRgOsNsUVWfnRO8QSOX7caK+I71FA2c6RJ8zBiO8yY1yJij0rKhDPq/EaVl1SZ0qqwEiqx0niOm7UZO4Nn4nEhbhc9it3/N7prjshExfFSgr6+fN2y7Yr1LQOULXEGEfabllQikHxGzcoSCR6d6ihHXM/tp5Ev8LiFhw== sniegul@Debian_1',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvQMA3dgZR9kirWPiu4inUvZCkBUOy0DZEX95NexlfkNGoqm9wm3xcWZhJIGc7aq+U1DNe0rOEBe2oxaCfaVBeorwL4Wg5ZeIW8Mlfrapc+jVYBjWLrZrHb/ZJbxWSDnYW18GPF2EcZPTtyGzCmm+3p7BXYESqpi+/kQvcleOKNoQiHz7T5Wgdrr1wRBUJHuYRuwFRDH029pBNDX/zBciZbGhi2WPjapn49iLCBUUxfogKKLWGYO60S4pMQQ7ttWIMNJPoPYOMVOa/9iK9PAWxYSGh7c7XjTdsZjge5XSE7z3coqGfoFn989rSu+41JzYFHTXGPJ16c8gCW2qcSRCwQ== rozie@pluto_5',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAx2XQAqwx+HzOec8uRDR3eogaD2JvCkztS4FaKo+gRP1aJuk3/qgEJtgYQnMZXQflYIXtOoHwPWL0Gq+KXvvmra2BXri3X6f++n6FICz2eAFih0I92HFmpSpkz9QU+Jk6fc1zMHI8gNeoCYRvJiuYkhgzCniuQ3MtPD+FSLg9sarVksdxp1saizGuDwEaQ703KGwktzQfWnWahVtISlx2TlTU6QnR3M3KHrhg0Yj1vztRDelWV3pLofAMtEHYO3o0IYKSqfHt/quUxn86xcQcMIUXOmbVb6dTgZtbQnKx8hKPEtLQgZut+Z+O76iMaX9vrES/LopNFWgjTwF9wMzIuQ== szymon@sjazy-inotel_4',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAxX/wJQ2VY8n7QiGhmZz69Rw5EqmbmkXqDFf77rKfvvy7KjimQff56mE1CKR7XgF+0eeHwoiOJatTX6tUMAyguQYFehznnfrSa9czIYpMFP/+M0SGaVcxn/lPW9U8PA+DAobdvRgU94AGXGelGWtu9546tRa3eASWBUxVucSsqUpRUuMApfgiiDWayVCcyrrECPXGbLEWWCChzK1LSTv/mfCzjbwW5KV5Sg5RhwTReJNgpxdttusaV5YlSRCBSsiRdOebAv0FpsYqBxE9vPWA+cxLbkSWC8tyt/3P638pGITa4IRXGgYoxSb7VWNb5NNi19i56S4cGK74zag65nHl8w== sniegul@stuff.inotel.pl_2',
        ],
    }
##### END inotel #####

##### BEGIN fremaks #####

    @add_user { 'fremaks':
        email => 'noc@fremaks.de',
        company => 'Fremaks GmbH',
        uid => 5045,
        groups => ['ring-users'],
    }
    @authorized_keys { 'fremaks':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA0mu67fLeiCpRS2Muv3TYbI3181u8QgcLPhNWUQOkABT4rdaGK4bO3TsImOCjsXg42Xx5+kJXhuX0e/O9W0HxdIt59AoBvgSV7dcKljIqaCRm9vgwZuotW3zcPMI5NgfyqnzZPCKWlEdW9lDY3ayyYWUmQr7/DUtFA0AaKcBeQ/y2aNJ738Je3vu4f04GUBqZfCkIn4OBL5DTLH3eV0v1aFPBCn+X4aQLuqnHf5dFofYzVTUrJw7kYQFi1uHq07cxj79Mip7YOIIm0F/z2xySPKu58OP4Dz0izOQOIV9f2FqQqqJYdYcLnt716QwaiFLqmQrbT6k45WI19q/WI/ptTQ== morpheus@mbp',
        ],
    }

##### END fremaks #####

##### BEGIN blix #####

    @add_user { 'blix':
        email => 'support@blixsolutions.no',
        company => 'Blix Solutions',
        uid => 5046,
        groups => ['ring-users'],
    }
    @authorized_keys { 'blix':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA4DGMd93hRqdTn5QNWD3RbN9dhslqJvWuKuKHXeAkpymwC58ccLYafDKhe0YoYGYskKUMgtuPXGYuNJlhWYSqpei6RVHlG2OZFVnaXGnYyUm+jBBfetPEXOByvldq45r+0Dha6+VVUyL7YFYs2/RGRv/uTI7Dtxy0PaIYHJo67rqBGG2BdMRP6nwhxZ/6KcCQ8YZq14MHZ9tg/W696onO4qWiK6rV9uNAO3d7d8COG9Ipr8RpRh2k0/329IBT+8ADuVRUH4GxxnDO9vUC+6Mi7dDJanAp6jL0mVGsRCsR/cR03pcQU7Y5LQjrC10a5a8XwYXGO/qcpuTgNzjrXE9q1w== root@jumpstation.blixbone.net',
        ],
    }
##### END blix #####

##### BEGIN portlane #####

    @add_user { 'portlane':
        email => 'noc@portlane.com',
        company => 'Portlane',
        uid => 5047,
        groups => ['ring-users'],
    }
    @authorized_keys { 'portlane':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9hFwclD6VWkrQBAY0DHWTdLBmX5eHbByPdFI/x/L6YmnrCBBXpCyiQLJLaIU05i/iCNw/hhAdph4/DvPy1vX3Il4koYklL15RJqLB4vIymb7Xiw6YdS9e6orr1Yh86Z4RxEK3OE9p0LCh5ZGtNjmuW3Hg5XIuklE9jrkdmJKQ927cAhomxFc7AGH2Uu3g8OCIG4TD3EZkAiYOa/kEF47nL+0PlpdPYXdqT8+EItyH1enuOcLeD2joe8LC+/zul9VPWmvM/7EiKdFDMkWlbj+JgZOeVkR2ebxsr/mmmvzCUdwmBEeQnJp1kr7QnVJn32NWsFFEisHqJjMuNCRXL5fJ tobias@irc',
        ],
    }
##### END portlane #####

##### BEGIN solido #####

    @add_user { 'solido':
        email => 'noc@solido.net',
        company => 'Solido',
        uid => 5048,
        groups => ['ring-users'],
    }
    @authorized_keys { 'solido':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAACBAIwjS0UfOSr/io59o+peG8Mft7eHFG3Mh5lVB9gqmVjp7TxAlpaGYUxafd37SCgKFCTGGawWNEa8q0bIzmQ2q4+7FPCs6PmKXCCUfuQV0nTl1EPkuKSELcpb3d/qYiDnQEg/WYPjfQoxLZYV6zRz7pjKxl9h91idV+0NeMrsT/DfAAAAFQCEZ0W2fKhCrfNrUbP7K6MLiLjbuQAAAIBdhA25mn/C1QqfEAeommmhstHi/SDwhJT43SxQGYoOvM8gKx76oAoc50tAdC2Rc8/Jv7tpf4XOWpcmenFy+f/WhdD+Ztbp9NKdlqp5g7w7hmG/EWGSedru23UghP5E4leuXzClsVX/yHcZ5xw3NNglzptASVYkBGYcFkpwNr+HmAAAAIBgBtG267r/K28IZ2QhHcDWTS6alYkh5gLYP5xFrxfMHzvlTOy+FhvMRyoLiYC0lCmX558s1WoOTFor2HKkfLL2bCKfkwfRmKUDH860U3Ff1fNjduGfj/TWHYIB0WFaZX+ptPifQfKdqeKE6kla8JqCXi1MXnQ2Cn7hXHV7zSuWfQ== ch@solido.net',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAK+GFYxdV9BaxV1ndXhdQCjqDaCbfpBOyaPOaxUXwVo0DbcO8Hm3kN9iTJ77vO1XRk042uRLKKclMdlUx8l7rdpYUtC1iFuQBqbiGjbmS/7oFIQGdUzNkNg42QzoMfd4g3nYwolY4f/aVxtj6CxThvGRcFgPf64IMqB8gzSTxz+HAAAAFQC8tvDwK4el5vUSSax1ShTfw7AFaQAAAIBPPau1I14qq8hM1e4j9BBWloUvnlyiy/S/LUfAQtbuRHc2+3gSeMJrbPXj8rkawfKcsXW3nqQkSaLwyCZ8OYQp6YwDHNyonGXynelrPYSQdq7zofgBXoujyA6gUNVtp183Jo4UVYQx9vYFOeqYjQaPpTo70kyb2bSZYg/9cYo9KwAAAIBo5BITdTVIi5DjXxPXLJLEU5ARBo0GoSLyxYqo2MlM5vsE6bmV8UyDt/Aww+gdZN2x2UFCMoVLOJEE6iZ7pCFLSfk0oCM/8N4szxdFK7hXL++WXjqXEgyYFPlGlDYe8aXXcEe8Nd4v1nh8+vB3TclJk9VQSfIM9GQ8KO19bvrHXw== tko@solido.net',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAMzGjfcnofM9W8WAAZ03O+gX/susUi1prJYRpomsnHMwICiiqLL1R5J/FUb/E79hhcVtyXLh833YeEQlCm25Jw4gmYABfRGyvcWYDs2zQd7Li1kBXlXnRoxd1pxDTZ4trUSSklosKCZYHqOhFNntc0789xLkjuZWe/IzYVJCW8wrAAAAFQCQiVrdhQWLXzogUR+mRL5WmWYPtwAAAIBvRrUEsjLMvl+EZRGnX/UtOaNyFjKvGh0dzLddjJ03H9dkAVeJDkLx9LSyUEvGDMYSY+gbBoakHCWVDnF1109y2m2UQ23NkJdgkXyWBkf4M4VKGe+Yl9M1FaR2Lvr8o5qW4hZJf8XfC7MXWTiyPxuonc7xufBj1ibU53nQVcEzlAAAAIB5cgVBZTVGKznH0/65JyhJmcMNMimtX7EV/VjnCK+JK3s8sJnNo2fu297IR+XQKlVO8oyw7n/9peYEMkksWrOPW/jvdK9ce1nLGJ81T36Ppiui8G/4GsSkSd6x3igLCxGgB+fEv0tyOyEsIbKVVZ8ySTRg+LvtNlfjA/+faAw2DA== hlk@solido.net',
            'ssh-dss AAAAB3NzaC1kc3MAAAEBAJfG5hHhzK/O35wO4l5NuixnPYiPP/1BUijl0eA0Zb4/aqrCoPJBeZXOZVbFZhN1GCtJAa827Aypaxqn06ElS/Of3MZ6oOx5IW6iXZvk0tnb8TLe+hx/ct3t4ZkJZjsch/kE0rosvdvq+2CCRaeJ30PGQDIA3BZWUsjdZl1Dh2UAUfabOqmuFPuCLJG41LCrkVFdmkwf4hIorJ2pKKWzkSiZJq+8nL8KSFCXqsqDubC9V7IThy3B2OA8Soc5kEuFo70FnaPtl2zLfg9QZRUY/L1HOmdpQwvnvmjxMuqBZDhu+oHemTydA7Txtg06SNHTAzPclz85MkEcP+tASGQBs7kAAAAVALQBLy1knsvIhWAT07JiCbUjtfepAAABAEz8P3N4Nlc4Amyd6KlEGz0b7CVway0vJZAm/7HlVQcQJZ/4EEHVzLrjiiE1OBdhyE/ccp/bMeiwA7Y7OlW49XuvUbGHf478I/cI451HD/hxMEU0GsuYlU1PteF370wl1Epry+8GE0EkK3qPFlywIiv/FqbT7dH2OX5w665T/LzkT+NsusVqDRFaLi/GK89f68Du/AWkmDYJUqWi4DkjzM5GINvATS1X6P6FpQBjAc9pFlQ7GRfOMCFdEpdO3cuyAZdO5NyMD9HJLU8PkKmPZsNnOPe/xXnCg4JChAQ3uUlOwO+a5CaTPZlTzhzXARVAa6aRTofF9lbbw55qZqFhxpAAAAEAIOw+urxP4YrEKuV2grB+vSa4vdp0ZDBCTgh7JW7QVaXHFaH3JhDAkNQ8eXx2GuNSLOY+xpDeVW0UUeHkPdOfkLRIBpNWyuvK1kj2JF25Si4TbykcOPyj+QC/w9PGXjLOGGCb8IukPzqmYsFU6BYPOe/Xox4/U8lfMl3GS3XO8R/UEKqCW7ZjQHCjqHeL546zMdWOS5qE5hmuS3yL5aKTTwpny6X7SaFRb9zYgLW2Zg+spPmNrKUicg0KJwxM9SMbxBk48+srnMgtx1kc4OWbJaXB0PScIw0AQsJq9HCf69OHrtZ3LdfizQi2YSxzq0DZ14KbQ16c8pbj+ukWIxaKdw== Andrzej Soinski',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAyQNdrDEWpzs3bVJ3IIUrMjV6UCvQYW0zOHxdWNwQvleNv4Ktp4XIIYdRkUsnYEluLPuZ6BPXujqXQVOefzD6EIwBxHrfZc6DpLdjw9t3IUU7KR/n5bzwQ/4buL3uPCAyz4zbEcRva3/rHekMK8/1CsGU6DclD95vFmzA8bpTjaW+i3YIt4t1yd1hoMZvr5h8sl6EK9HSwltZM0voadLQWArHMrX0RvUY73RoxOVUMTcxDU2RqeQL0+qQnNM7WX2dxeRWTqMk3x3DrWMno/F9bnl+AwGi5B20a/MVJdzxUQlJge3KwzoGOtjyAxlCTZJyovSa+6yoEaQBmmQNZBy+kQ== jes@solido.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAiTxKsttTlWM3Tts99pmIm30BtBWf9bDHvY7DzH2WQAQR64CMhmNdQBVda3GHCOzc36jKt7+lmcgGlUJ/1omlKixm+URXiuUzMdvdhgvkmWd/EQ/1d5izHfx9xzDK4Rsqho0dqroC0jNBw1wDjJ9k6O5CqgwRSnYC1V/yxtpfAYs= jkr@solido.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAlCGGKCjHpBjsjKbDWVdp4ULbbqub/qOXOtFeFd9/cLgATexF/haiSNmGTpGRKxKP8x7zRFRBNA7Yhko+4Bu2fOeqZDcHdO+/3f/Pz8u0oucfwEUs99M/jIU9VEZXN1LXaNRd9yIV047etWrubdJSU1ZqRYCLiNDdGjqw2cK79e8= Kevin Farzaneh',
            'ssh-dss AAAAB3NzaC1kc3MAAAEBAKNUpizR8cLnVL9aj4++bUn33LJdanBte8gnJQSNuqhxn2J5BLOI+o6lwbSkB8+sIgs41ak4jtDa0L7iIA4Zl436mjS4tKlGky3opBtpYu1xnzgKI5g8xaPESZVv6+PJtps9r1dC9iQcH6Fwriqu4dz302pw3swKtZF1jc5NJBsSzy2AQaIR0Bl9TwuBZ8Uv6i4XOm5lYcx4FOfOB71Qg5BjDsOHk3DQYOtrIi4a8WrNeerpFy9a+970rI8g22Y8qcxvon5iUfiX4N7g07SSFls8D4l/rPP6sLvxboe6IAy+bPGni/K/Dds6/MqDWd/33aT1yhRzneIqfZ6KxaTEXlMAAAAVALwf/FeNcH8gc6LqW3YgTxDZmW4LAAABADJsKSR3dKCo44Y2cxt0YaNlauj8qhP9s3fRslF5krGmqJPoIGV0vR2yy+u+CV+5wHIBnOaKo6MIB84w5uaUu32BTA/1vIiTJJJfrw7ErJUbgmvInc+u0eF9j7f292RhB7AfQjenLOf93i74xon3SdIl2tl5FWLzOAnB+UCyCh4l+IioRonHDCTCRc/MNOsFPANm26q6WGbrEEUKT7R8LLMk/f2pDGOzXlS+hSUI93Vi/A9tsvufcDSwoy+eqqWFgWramza5Y83s6OKH4ExLs+YpAL285trEpc8NzyeqMF+A91pKj3t8uWlbPMfwxYAXNe+rKejA3cfJkzeJqEQd53gAAAEAeqWWPlSOlyvb8vGnw00KDo/TeMJh2LGkRWO8K5v0yxPSgDKiVIS6U2ESwP4zGl3CbdHWMCEnxpu9NXd1wgDVbPdz3VA+IuGFCjDMwNxq9+glN+8v6mVm3ihaAY38onNVuz2D1mrpNxAk21q60AQdmvTQlm9+l6a2agH8he4DZBPx72DjyNZX2MOUZLNmtpBa1yG+7rFvFPXZv8HkSxON7Rb5KvpQLlaGotA8YOr3LequDGvFMFn31XCpFzK3pYE53XZ3S0jwto3ASWwZ0JX/RpSc0rBn3hVJCKspkwDwayklnJIJ7PPowwtIxmoZf5Fwfem1UuU6Nmh0v5XkA9vyvA== Daniel Penk',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA7Y3Gba7XyLDdqJuJhVyvGv2eEceBxZI54JkJD+T8LkFBazSxwGlnbsVrqNYjavIU4lFdunSfJLPQaYIzA27BVViUmlml+QtFm1RVB9qPZ6IqLV+n/sSb0/2B7DPVWCeyba9LcAZdJELTP3XVnEXwFHYlSk745SzxvlF1pcyMLOnv3NccVZazBVwu4b2lxLGTYQ5IVrd+qsq7R58o85fr3r959zgBxtgapKq91gnL8u7kGWk/ph1OUYQZTNTm1GUGXBfz/5ugMNnEobij69Q3T31lS5D/Lh6rWsKRN5O4P9OCC9cQY7pjBne59W20ArZ5bo2kOtClhhlIB+B5do6Cqw== rsa-key-20120813',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAKCj1jQAIgCJ06qUxiAwmnv+rkUZsAL6ggGP0Wd24QQz5toWQ0M6xCgPJR970r8Iou/XFYX7FiMBokpJD8S1dLI20S1iUnm0hxSbRadAFaPT1AGHJJwnD4dHYI+5qZtYly0aLmsz200sdL8LeUy7bBOWdih9VoOCaf0P2ob2p/wbAAAAFQCDmXQ5maYlhipr5G2NXHo/N5/h2wAAAIBlhLdL0ShyPMhzSQmgXJq/ZG/lMPFklYU/UJudLTzwpN/78UOin8IWW+zpJbkKx1c+SedWNgzIHMNsLzEPHiymtGPCLdTXeNcYiJhGuBwalOgd2E49OO1tFMawfcAniVkldacnfV3jpShEr0e27+GuXUt2/Acjopai3a6t1swJKAAAAIA4H9kBXY/NSYcGhgZXNiLkJxhdYqmlaXcqBKYtIyyoFgrTPwsvi7x4tBwtEO4gXhPvXvWviJp93pNMwyiUrX6zCK4htv1yeKK3oO4OPNuMKGiDgQ7QIG36Bm8XFNxtVXrdOFBXFipaiicvSEToRWlzte4yLjPrQjzuthcKaFKVvg== czar@peter-larsens-macbook-pro-15.local',
            'ssh-dss AAAAB3NzaC1kc3MAAACBANTQ8eMtYog3BKw/Di8FIVmYQ4ATl22ocx3W5X5j7HbBHrzRtPVMv5KdfMwXysgcMjYSlhPSlaxaBipm7ZbZyW285fOx9mfG8Lm522XaSkvcJsEGx4iHeN5Fr194wZfB8DRoR5l1/bSF6r/ua4OeFVTUJaKVF44IvimHOKCqJ8hzAAAAFQC347PPE4SIshpGZDqPKGmyE/Fe8wAAAIBIkZMrzsrxmXe9NHwfMJQWkiHHXBRH/O5l/RLRvxNM24+6MK6R54hJzy6kTCRCR/t74NuMbGaKUju50DgUMroEFSrhOMhWsw1LR1fpQzXL7aFOo/Ur104+1Uiyhl9tv9nTObj2DL8aJ3CJFtXGkDHzNY5tXJbxykfT3UaIaZ53/wAAAIEAjmx7tk6dudmHv14ryiFphr8rculH3nae/Nuhrg80VjliVFDlPluLBzFMjtYsHbjWoK5LMQKbLsWNvZdugsEq6lPEf9ZItObO53k+TxuJqpNtLSDhKAxZMLpBJZdkP6iqsVADkIi20ZIO57c7639OmDt8tXuvKdqh9oIM+iPIurs= muntzberg@mtz.local',
        ],
    }

##### END solido #####

##### BEGIN digmia #####

    @add_user { 'digmia':
        email => 'ring@digmia.com',
        company => 'Digmia',
        uid => 5049,
        groups => ['ring-users'],
    }
    @authorized_keys { 'digmia':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAABAEAsBEIu0o/whw3btR3JUOifIOg2CmV8PvcfNpn9LvVo/W1qZRGQQnliqU8IbBf7TAHrssZkRF2tnAu0t9PWzI303u36QIyJm+41DpXipt1i02fctw9qBbVSinOfmK0zSg1EbUVb9HCcLM4EY+/fd3kyKmdnsCSLCApQLiQ+rqFKniSE/i0ZG79sidfDVeJUMHPtHQ14wuS3JyHc1aMHj2HhJ8r+1NXlAh8GGFKeWs5yu0kczmrhot708DQOAene9vhtDl1sfK1xQBq9BjuxDa3r1oFmH2vC/tHDiTMMTzNFqPOgwEOpvRfi6QSbUJM6taWoz40S5rq4zdueJ+bnsot6DstVwF2uf2wnA5R7Ll3d/h4akOP79pSd8DGmFjYROzQ0izv8EJKZI9P/xIJMIp+Wqd3WtK3xIDOpOjgOnX70l19iSstyjtTZFm3CHMSythpHSD6M/fwzcpLub5BjNFkFhtiyZWmiqBV/93AAnxZBfW+xQCfb1lZ1FStGWJKeSL9oFbKYpRf8va8SHR0P25twSMw77Fcn3RQSVPzSFPla1hBihnDTIGrSBOIhRQJNEvakJJNgE07XQg1xjILnLe1p8sD4Z3xWIsvaTAflkgMuxhGdV/sGaOvNjmjzVAr+lmbw3jgVtZ/+WdniDJQZnyoDqxvX33DGV+pDewm2pcO/3dqcpOw7a5oz1mPUkLTmerfw/S9wb5TC/V94LRCYDNdezZ8oRL6ryZ6vf4l4tAfdPbTkX4O/H2+Rze9VofT0G91cTJC2XGHOIJzh5o1Dungvp1wcHLS/TC1srnZOcm3LQJcORbUt1/wzaKWVo1p2wUrbCnn64/noIt3C74YPJdUu2Oy/lsUz7zZkWUtGc7dLRTcvg18EcOx9wLeOTl6ptwEI2vshJQl7fCIOsjVQ+TqEMd1YFKu/VRG5a7f051Lvtx3J6VMRbPLB/e0U8PtVouLQGW+PeDPLjH5jKaS97UKUhxDU1mtEIpW0AmAkzLQVJh4z5sUUn6QyIMhn617XBQn1KCFT5tmZk1qymdoxqFOO7wZB2x5FJKmMRADmvDmHPmt5K0ERscIJgQ2XqE5M1GekaKFnb3dF40OSStVHe0ljKfoyNrH9WhdnMlWLZwW+egyjDFsuyyvBSJAKdhRy912ZcQPJOYSbxYwihWl2tcWLE1o3uFmq9693os7Ku4QbOovsuKh6/Ah78bljzGymRTOHtUlUnGAKG7WAnnupvJuT97JU6xBCl1y1MKpdfFPVCM1pqHnOBq+VG7TOYB6Y5kTcq5fjuJUIFOTle514Vq9qTeWz89S0GOhbxodXLt4D/Q1xafRchVJxNwh85nE/l/t9cjjfmaFB9nhqykGNB6wjQ== digmia@services',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAjtfZrGC/oXVu5wydMrWtd7P71n4CbXtdkogDEFEkWC+9byKFBWcZRgi/DLUrqZaigbAlgh3N9ThwPLMIWP/Sil/zNJWFMhUM5MLGXjtNBD1q24P65J/y/976mz7zHIfIPbllhghc+32tH1JekNOpZpUjsWUFLfxZbixxh432P8+U6ncF2yWrd4oMkjPRrL352htxWYLQsoz47549IbxjvXjrHx8RE/M1nIKE32B4QbdGJ9qGfA6AU4UalcgELyjGnkXG66lajGiMjlRP0UJ7lIT+I3RcqOZ5rCmGd+3iAN7fAuKb8HXm4WarEu9EsccxZcRuHuYFj3CHem1B1mDAoZdO6ZmGV4HwcIIEKGEYoYpIyLt7waVjXZ24070cj/s0DrF5OGNDxWnvQJmxjPNqxy/2Lq2jZdFf5ayLBaMkprIC4iNA6180BaiuZ0IW2Xth//s8v7Mr3BLBURWH9f4yDJJkXz20mlEkztH2zhFIGm2cBCdGJsoyHEge68pDLU3neN5gBykbFq596ii0MtxzreMswQcT+VbI4HQWrWpILae56f4phSA1jbzCWCrnQj5u+1hpgWgORdjxN8nEyLIqrYjwOmZUqJHEfHLCJ7vinDJUJnXngq2JHzGz8Qealoz4hCcV+2hz0/Q7P6m5YZRd3zBJQOo2+D95BUqHaLT20nMnhUvs6G94L/MtJIp7/8qJtaHIc3FqVlE/81w+pbFpiGk208xUAnRjKth/d6VOkLaUyf1a48Jn4/DleTl digmia@100929_1',
        ],
    }
##### END digmia #####

##### BEGIN rootlu #####

    @add_user { 'rootlu':
        email => 'noc@as5577.net',
        company => 'ROOT S.A.',
        uid => 5050,
        groups => ['ring-users'],
    }
    @authorized_keys { 'rootlu':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvz23VR+/11p4UGf8WNe9RDIKAbMOz63nWn3Yyd0gGmdEDvEbIvlUaG0rWzUH2K15o2I4ksEpb0gmsPLxboBAiaaib4n/dHOw5PkxxRFfpIFU/kG6y9uZOB2Q7Hf2twQqJo3ov7532okT3J2Q7QRlOEH7AkwVFdp3DmhULqN9Y7huCvc135zH81agvl1+SrDg+QMJ99jPOjJQZJOas4RvCx+zaD6eLLwZUlwPRItZmqhxESzFSBGbLqBI3O0t6IJ05s+UbkUpL3SIT7kIOZvNJ/8NMiHwKjAlwUIblm8aeHUmyWPzZZVT6slfZMzfW1Ff1oJvqOvdAUpHSY+jo9+SLw== mullebutz@mullebutz-desktop-root_1',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEAym+eYyU79lyAef3ged04g762cdoFF7jz2127/RHJimeX/8vgECLl2/gsXuBuOlV1mcnHiC3EAp/0SjGVhWN0IZU/qGlGJWmPOKvzB6marEBEfRSsTHnZJO0XqKQG8GdcrWSJUq3raZSndc5L7eUTXoIiGLJ7osEOa/i9Zb0IGNFFIB63QMEG2QBkOmVDN99HSAVARu1PBO/v88fB7p6QXAz3kRvs+XhHWFV4PQlk8avZVHz3DovphncN9SeLo/5JmJGG68Fl/r4GXCvognT3hMx9ZVab7es46iDqU2t6Z2LY5Lw3o0NedGV+VsULS0CzXEP6pyIxOMNU5wplwUPTU9VsuoBVO5Jo7va1y8JnAOeJ+QP062sUZlgk6A57c2AfqN+fmP36hP7BY5YgDzCaXT4MMxcsNobGAIwJUCWyBFbBgGGiUc0L8RfHxm0w4mI8CGZ+WAiltPLb1wZACib6BkDREKGRrBOrY836sn55M2fxmkstDPENzz8F1Cir5pQJXMXUfEcV0AgWaHulrFbnpHvf0HfWqm855uz4bmNsQ8oy7wpik600/iPD97eG3YX8fBBWqBU+iqLbUnJ+BFNXOCHznVvZxeCefB6dE+SNUf3DixcrrSW20MweAjfvtO8ldQMiNxUaN7OBRaEs/XyHTA+mx3oXaTHb68LADMaiLcs= andy@bierlair.com',
        ],
    }
##### END rootlu #####

##### BEGIN globalaxs #####

    @add_user { 'globalaxs':
        email => 'nmc@m247.com',
        company => 'GlobalAXS Communications Ltd',
        uid => 5051,
        groups => ['ring-users'],
    }
    @authorized_keys { 'globalaxs':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAyRNgoniiGQbtJ8YOuKfWkK+1x3YELpVhfexNlPQbF7j+tbHIkuSP4RC1vo9XsmGhFN7co8jWAmZPtXx+peyXT8QDl5BPzbzjPlK+C0WTkIl74zqAwb51JHwo/TaRlDsrI6JR9gVO41q+ExtWcNmTVQRXzRJ+oo8DeuWt30r0kPrTGhyuJC5L7X/xW6vCBGVSXso2Ck0yv4xCUtWJYL70vt3qsvoEmgQY70XMHooZj3A7qMEITJ6akAzajLukCAjbhMrk9melANx1B9FxoYUxIAO7SJyn9J/Kh2TzZ3Hg4G8KYy4HJ0wFFOcm2O0WXdghZIK8RoiLPo5S1tkyGll2xQ== shafez@jumper.uk.gbxs.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDSmIykA6o/1gtFYHHs3Vj/YtVxX7Fc0PMoxgNs09H0bZI4ebg7o9oyHS8QvD1/AD7ndB0s5krDbEMMNXFTv3vRLQIVvQcO4tD3LlqQDx8Dk4WsO4RZdljlQczbTC0V1w43J/72y6fgTkFvELVNUgg3Tcs7VqdyQm3n2MHUxYWMIpji0qSyx0vkfNlz4nK63GdV+aNdkk7MeE0bf3m83MFoRnzuAgZ1tRtU+ZzYYgvGp6ZDPwKFy+Q9zwlKierTbn+ybrrGb1XMPlRpsszh89F0UKXHksRRc2M0xZUJttmm9d3bTrxRXczqCEkMuYB2Hb1YwVTZFIz05nXmYQdvWN4h shafez@jumper',
        ],
    }
##### END globalaxs #####

##### BEGIN nebula #####

    @add_user { 'nebula':
        email => 'net-core@nebula.fi',
        company => 'Nebula Oy',
        uid => 5052,
        groups => ['ring-users'],
    }
    @authorized_keys { 'nebula':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAACBAMzvPKDvQFoHrILbrpCfxiEJ6itfemSo+IVf7YwKmjriV8zYEvOfbcR97Gf19WIO2pxud8b55U1Uu10yUlhHwSbb+HhSeWZBPuYoepvKLGb7RQhDWhh3gQW1aznoXgJvL30d3JChUOGCG3mZSB1GwLSSzl8/ammTNU5kPvxrvNWJAAAAFQCGyeTGpNeJRm6hbNMD2egQMak9CQAAAIBkJIInr0pnY/7c07+D3Gz/wYZ/lIQ2BXpCTXp336dtr7I6YXKspYbthrQ0ZFFG0+6wRwGhalM7V+jyMyxaAZ77GPazgfrqmqHWhoValRfi0fjep3MRe8bYUrodGAVe20oajLRRf9IB3PemaSw5B5Qpmh5lOCYIX81ZovQNXgRZAwAAAIEAkZEpPwgKwGRt5l62f0Bo7hnNSAlKfPTOYsfxtowObw8X0I7vKpCyM5mxO0NpNzddQmjQYKnZJpRRSxDmBA4ZoufCWvL6ZV7PmhR3n4bsvzkwmjaf3qWkVC7L8PSf0k/Izqzix3UesdhRCsyn2wOIN+oBIsqzyqbDEjkeuaR/4o0= hcg@netstat.nebula.fi',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAOtxdQzJrSk10RA+WjGiRAPdJAuYyVXJ9VXtNPg2H51O4hJaRR6Y/arGWF8v93IFpffrN76IanMu//TYglLOa6mzfvmX/IxPuO2SjcmxUnHv+y41e10tTW8KdOx6mh/2M2BgBgbqkbwg/h21EWfXYRifN7/mnVyezID1+a0FpXPHAAAAFQDZGiUqsJNYn2UVuhuFjlvHpcj5eQAAAIEAql3Or5ZQAghJAKyQk2vnVVvyHacl03RNQONAncqUMxmSAZkM8n8qtOwSmFN7OzvfMdb3W5aHP4QvUqleaA86tLWdpEjkE/rbnsR9VAKGi0AU5/q9ps63pb4HZKSmAn87F5Qx+0pNWfbiEaLi6vKNrAhUnfy+xHKrvyftJsVBvc0AAACAAIcnmU6+ZI6AILUBSY0736NeRYYMWLF4dchHjtMBt5UroPPgqGCFravpO3QrlVd1GuVaH0X7w9kIKk6PvcQCdSDA6bSvLXf163tLBIy9tJzDDNFe87QjnQr0YGuvFWO7W/2la1V5pOL2WCDHMvJW59F+ujNTzyKqGq1apoy96NE= zabbix@zabbix-node1.pit.hel.nebula.fi',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAMZ/mS1N3Fqb8xt2uigeRossmF+IEJf+aIFLu13eP3zDXQeFHK4jBDEkNMpH/o0a+lPmbv+t06nc++y4lsqBja2tBewIWLv9DTgUmzFszaIaoGi/niLrXeZxkFmw+2ZRmhl5F+nzxnND6Ylm3ufVjzGF0bZNN83PxAwVexNaShoTAAAAFQD0hCNlc+73oLzLnDPmiwyecO+FTwAAAIAuyuwroSjfSTG8hNPoMJ/iMpfdvGS7HvU1TNJRxFGh4H0ufiWXiCjLsL4roE2vJObmsAsxKSJGG/GE3ER1IxyEWZriDm+iWjWYCMaLOi/X6WvOjAuXdYlKgittTiyjvC2QwygL+ZBo6j87YZ+yTXDcHWirvThBDO0Q6JyhEacZVQAAAIEAxU0T+6abdi+xLPZFsb6TYkcp41yu908/2NE49kDWckgbyzKM0qSo/3ji5r1HSBHi4eyKgUiQU6s0avmjaKmx123Qn5d2LkcfWwRj1m74yqLKarBgXWGqciTvydWdkEON4u6hMg2nCqA8i5uek62EEkcGbeJZTT2ppmxy+ehzSSA= noc@netstat.nebula.fi',
            'ssh-dss AAAAB3NzaC1kc3MAAAEBAP1jOaIBZaRw2m0lc5mDZgZcNGOATyrm+eHV7RszuH9jxIYuHRYwVK+9M/drjd/aGLaVfCOA9ZdaFHprtoC9nAJDRu4HJc7uniXxeMbUsei/v17vcI2z2Q7lHPLGLq6IdduyNvv+jkYZWlCACe/vzN5NfFG5/6yWnEUqgGpwkQZcFppEuuDzuixLyeJ6itX4KxGDu6kgEaF/t79GmC2fg7k4YhH4JhxeqQXQKWavExRnlGUrBdjD4tCvQau5Lgv+PmzsGWNjwZ2Z2Ff5FdMP2Pb5mG7slundzkwHffG+yyishQws2nYG4R0vLpfi5VlF0a4KsIqKrCTcNhN95vMSd4UAAAAVAMZ80t7o8zWnucN8xQVL2k5RLxHDAAABAEkMyiSxh2SwLBbtyI2gCe8AleZ+6nhAv3ULWGBQTs0oSduVIBKuk2ZzQ1I6pSRCU/seBxdk08DPO33/nJxJWOtw7fNIsPzZ/lo345cGfBJUUtQaeivOgq3BYjvPWf5LOg/kJdW+v684rrsfHb9FT05e6Z2hhaQ+W/O+zrUfcZtcABqARmaHo5hyqJPThbVhJCHhPnDwYoje8JBM55++xwcc/l+zjZ2n34ASWPb2Fwd2jEQTkAoinU+IOvVJSNbCKtI/2JirGYp3d846xhfLWQ/YssDXxQa0t9hoG8FgoruVb65RW5myNbLt+0mgDfWNvoUPfCbjD2Widi9sjj9YvccAAAEBAPaX65mhG2FcZ2pqH+Lko2C5bPjzbOpzjpx5Fw30vjbFp3r8uyVoMuvAw9jULojvEyOGKnBS17XhhLXWTjiXbV57JgMf7DEmTAdTs7dIdJKz6jkWUoNIhVRniXVCYQO3qADQIM5GZJ8AWlwS6CHrRg9cNaBKVtxxDmdxmsT+UcudJ5rrzwdQBBfGivr+xvb9uSMsfkm2Y8AzR2++ZiRrdQRZEMKKXBNiCsYSJGr9Fh0T/f54dT8HnhsJxLoG+x+BvkInTmPHPZsEiEXBqQW9uyHRzVhUoQHIriIiyKRyaCu0U1Z7ZJRS+JAs2cI2Bd1XaVgK3LhuAqOEpPeUCDwTx0s=',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAKpS0whXmntm1RXMx3nQFwSJfVgXkqq+wiGP6UunXA+BIBfyhWdawhj3flTAME8VsFSGrS8mKcsyvRKLMfz1Xr4naGsikAvRmcuJ/aR361ufX8VjdtI7cXEYVE0Asq5tN0UzJ653hcdqr3CeAE78rELweMcGagnowwM7srMFtyJ3AAAAFQCDym05k1iMUMfFyfccXLYYWH9ZpQAAAIBM3gBpRBQQPl8ZULHhVGOt3xF2PKmTNuTQwoUBwolOQBp3mVT2Yf0KuCKtIW5OxjHVLBIYYcCeZV9bmo2xT0EYEHPAtIWHWp62BuSDOqWQsI0Cvig3hzfP2208azVxIn+5iQQEhZKzViuh+K8WwU5rTHh1Qv9kue5PCeP7fD9QNAAAAIAg9IS5ltyFP/owj3e4wo5lvSJofbvGiX7M87f8Il8YRNawFvysP6uHvwI5XCKgQOQFNCMQ6gceKInFlc8SrLH6AnA0WZcWBtJ/0vlkWOQrxwd+w/MFwDKOlCZi2+kf57jEavJFI93SKe9GYl1f4vWOsCTicmAtbN+1vYPdBJnrnQ== nebula@nebula01.ring.nlnog.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAhHgZ4BIjNgZ5D48h883vjHSNDpY93TkSjpebNbb/1uLGFf9BFp0+xmH0yWkY6mtSkCOCcJZVc3YCnqHKMwYlDAe/8WfsTzulr+ORxmm63PJZPytOeW4nlWo6y+ZkBQFCzQituTmSxhqBeXltHHX0WAjMTQpLvQHeaLtfNmQvmVE= rsa-key-20111213',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvb7/dmD0Oi5hoouVYB6YbWRKGHfe0c2RTuT29B34ffd0+RJL4vkMy6sTsMSj1KfukGJTU3ydyLGc6Wcrz//1pq/WQaINQ0wanmDnOkbd6h9H9RFko0LYI5RMA85OkWF8Zdh4LneNz/nrH9UmitpM9z50lzTqweaqH4Et5ikDPG/Z49dwo9Ge1kjD8greCTUpjeXPxzu4xWQVej47K+k1dRy7IjxigEeRAsQO3qxoDGzOKx7ahON9hjVqc+mokcYDQ76CoZ8iqQJSvKNsqiiHOX4rRF8ES/W4xg8MfRjBfBpeQE0eIp+oRT1Xqglbpf4XSDrhabX+/EeTcFt7zTR3Mw== teepo@nomuka.dx.fi',
        ],
    }

##### END nebula #####

##### BEGIN tilaa #####

    @add_user { 'tilaa':
        email => 'noc@tilaa.nl',
        company => 'Tilaa',
        uid => 5053,
        groups => ['ring-users'],
    }
    @authorized_keys { 'tilaa':
        sshkeys => [
        'ssh-dss AAAAB3NzaC1kc3MAAACBAIEoXfQtARWvxrJZM+xseVIdFfVhGXJERIZEg9tSmVf8ojsmc2OEszLqU9olkoiEt+rrrw5hmQt9iKN3Wu1xo6EEH6A2idmX73jkH2AttHlRbQ4ugzXUeRdlQNTIsR8X45cek6/yrFRQORZCd0wlL1/r6WGWYsV1wvdPYxRCETHfAAAAFQDIFV1iKo6tAPgWTaUXHzq5tkGyUQAAAIB6mpIYyFhTMOikwWLub3XfEm6LC8Z/wD4Wwd5YTQvUKfNjFeDZ5wOtB8beDoSC/ZHr/lT/U6MH1On7UTnKnUqniYkZrwyrbc9nYjsEnY77x8/CCgArRsPvVIOfUlX5Ea9Td1dVHLNcrEKAc9ylcVDG+w4A1MIQ7OA0cTmoyI+TDAAAAIBcXOEOkFAf62cjR6YoGfavchRAeRYdhkCrRVGWYLNANFtO/uaUb79+ZsmSAjqQ9tZtz+g6PAIZgddyUGU19gQhHdH0w+jMhJdNzJnwj+ujZd0tzTw6NwK3Vd7qD9pyE4+uCl1H9Os/7bn+BNlwk080W/biazvKU19MBhwO/f1Jlw== dennis@tilaa.nl',
        'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAw5k6B/Qri11fQut8NuZ81N2SiUBcbEi+RVaaGTJlwMpze1OdcdYNpD2BQv14D99rU8LETALnSBGyhn2ZEEmVWfKJErcToSLXADVEm4Bnfu4PYROLlky4EOuZgxJ0V+2h9EUmO8Udrl+b4GDj/XGIJJDswr8JvZPuBcDCtKQqI1F0n+mFXCwbXflQbAf0O+Vuu1A3nKP/OCOwRs8znt77FHqEwQb4qGzfdH3yWexSXvbiuG6eA7D0b5vFmz0i4tei1BdMBXdurgM/LK8bTzGGwoSwknq4M2SjM736VogvqXLQ6eHPe23dKICZ0wOeEszBpdjW/YeCBnMp8K0vn+yy2w== ruben@tilaa.nl',
        ],
    }
##### END tilaa #####

##### BEGIN nautile #####

    @add_user { 'nautile':
        email => 'network@nautile.nc',
        company => 'Nautile',
        uid => 5054,
        groups => ['ring-users'],
    }
    @authorized_keys { 'nautile':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAACBAM1QHeEXtvN4YVfDX8fFitHUOb+oBJWrDoXrkH9xYgNG3D66XXJgO7k+wqaV/qkYQfirFiCiQmfAkGyLVOHCq5ivdU3ittw0b2e8w+HkHuqEJ01zIiWu/g3yWYytGi/IVeeteeFlr8F45kUiMX3J9I3zvupj5DoySnYjtCEARraxAAAAFQDe5zH58ku+x4LlX7OAwZNEyLZ5TQAAAIA9r4qDmi5akAU9qQBZKNv9/wfyz8xjjx+PyeyxbRlNgk8v3PtzueEdo488OpzdlXpdqk+0A7ZMyq7DdDhXqCUzgUMg5lgAp67X2U9hv6WmE2YFAuOmMVzZAladPHaBGGflM2VI9dmrhx3Gue1eqgPj1ppEz4x0xzvUh3ce5z9jDgAAAIEAlUKmuU//6KlOiumSBm/B55DEbdFQRN4a1r9gCNWeW2MySgKIjkIl2Mbf8qLcE97fRrbsHqsLBDMrMu8il8EMR/eQasDGS27gQmzn6+bCrzXjkn+OMIoqP6P5TDXFE2ALm7DI6HIT8AwPzkXWwXjSuap8m+6m7rkI7IXZJGHgK14= Nicolas Aupetit - nicolas.aupetit@nautile.nc',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAMg3BthpG/wHHH26/kUQWNBRAED6e5hUQxmuXKzSjrHxscqsLYgG3J7HIVLIgALbZGZu8FMCl/DMtPlK5C7oRwfWnEDEA6SiGq4Baf2F+CvBNiqCNU2slGPwCUGi1OIorD9/8IkhcvzyCNpNih60j+uKrNeMwJKFpQ+Giiv3hrX3AAAAFQC3NscdsBQCYL5/HMUPNXNC/5ShIQAAAIBGUxLMkqKffvZcDPQCLjO2tK+TqRqwITDNj1D2hEv9gE6nLVwpL1NU/gf+qzO4wojDLkp6nF+/Pig2sSXnetiOxCzo+xC/uTbdIoxHelGfFPH2JWr3mh9pF8jsZ8NyjDQ4M4BrOVrRHMl9dBOPTZ0stQIEhyJzZV73Nz400qZrSgAAAIBKuynqnRiIS4fx3CB/iJ0vQgyQ+1/bzRzpP9re2nZ75ZNpFeAUUbBnFJ6wtA/+i8EfE6C1AHTjOUzrlfRbOneOlP0d8n+vXCFEYjpMAze+3sTuQcE2jTYika7uKE6pphkcl2C+R1MWYaKNarOQhjC6D2T9e2I/aGL/99MP46vClA== Gregoire Payen de La Garanderie - gregoire@nautile.nc',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAtXQqZl51GHqHdnBEW/1Gp2gUzdHPGf6z6gAN8CRx8M7lHp67vZs+6Qk/fAlDXT0O6C2otBhbcRwzVk8PSlLpOLFsVxMYpT5bYO6BTaUQyUr2xrIzr/avyk/7aK980LmQmEjXFcQ21fQVOLTdWZbaM2q6jEzh/29xQzECkEfG8j+RRXaGF8J/hPAW1BobF2Urq6FtVHykd97hQCRSYVDsGYupSNHNUF/L0VGocr3/mEXml/29bWoQaZ9iZlRqlRBqoQaisAg2pohr8NS15UAYJVecT8sNsoMntQMhx7uQjoK9TdnpHJ/si9cvQ3L9kC9NpioRHX+nn18puRM12gon6Q== Faycal Labrani - flabrani@labrani.org',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDYnDbfF1baQOCiwngwQhKNHt6pIt7tTy89eH7y5+hO1x1Wn2QglkuPr2PJqnW1gjIqLH1uh5jgnTJ4AvRWqaG87yj3NybMLJ+ilhkVs433vQ9nBQu1Wur+kwXyqCFpSDOO/MZ6MYp4qj22GEaD2S6zNKBEDYMZiTezXFYlds9H3chEXrSMiNNG9dG0GSsh/S6rNOea/5xssDWkeqFq7/94j+pHwqgLU7br75mwx1mdCfpXVl5385NQlW8mlHfZo65D1nkpJcH2sPkK59X3lCmb5xm4MGxuIuL9tXNIGeNKvisC1tQCNUFutKPD/FRR+tSxxP9u9Bl8wtWAauoRb9Ct Amandine Aupetit - amandine.aupetit@nautile.nc',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7QsFCzQS+Lf9R5oL8+6Kvb1ZAWmY+UdM5Da+531FIKSUonOPF5aZ6A19/MWMY9OXHZC6GDT5/gnBFiLXNCsxN18+z0CTGBBCezrvnCAqoL26xFv64vqrPRCIzlbTx0m3NGbgEYxbkAKR0g+45WM40Pa4dFg5162Q5YAeoNAgAskE3nF4JTF0/+YI6eHPJ7I0xQv60ltxfSTWyvxb2WYL7YeISsZETuudGO6SLUAK4VFNMuO6dpp4epaAxUosEmJDXfAl3cc3uWNbZNCozGA33HJrf6HmdaxhbPzgUrEGqxtiYgN1aOVb/oZXtJ450ulDWUQibfhDdDAovFQTDkHdr Frederic Gabut-Deloraine - fgabut@nautile.fr',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCp1VAIGp2Fy7vz9XFjcvcXpYPXdTFMz7oT7A189loNofNASGCRlIx8t3PmasBftioETfDI2T1meuGh0V3Fdc6zs7HySpgxK28dorjKY5aXAJBn0OX27FGsRoeWKoFF7S/LR6fOIjdcP9jg615iL03nmFhEJT2B80Dno5f1pBiwF/hkpLzll1uB4tPJP7kdwVMMOY/Ujm7TS1ftbqxeVQih0bOP3C6uJWn9TcTvYgK2pplVk7h+r145ZL9qBcB9qsvLn6PAjs3zVo4hWHuJd3rTu+eVlbcGL7/H4eAMBMw21cJ8YdmsDvQhkv+R+baxnFs2Kl0Hnyfic/wjFZu77Een Franz Studer - franz.studer@nautile.nc'
            ],
    }

##### END nautile #####

##### BEGIN voxel #####

    @add_user { 'voxel':
        email => 'asr@voxel.net',
        company => 'Voxel dot Net, Inc.',
        uid => 5055,
        groups => ['ring-users'],
    }
    @authorized_keys { 'voxel':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDc5lgQnH9tU8sRCl5jZnBfJHi+Z+kLXmJIaYMa4CNpctS7k9sUihx/jugEt8h5cCPzK3rU13M3dMPGDwu7NPyTJa4PVTKGYicBgeXSQ8Z3rw+H7Hlsi7/W/D1B2FeGDXqyzJlXsiL8+7yEkHUNeKHaDrpMaJ8B1b20Ze6bLS9ws2fFjjqL8jRXrtcNO/ZuJgqQWWENpaQbAUDpnyuB0uqqLDa2r9u4cf7eeFNiQff/SURMBowOwX/cY8jW71yaRpbvRMSXxwrPK6ZSGHm/2mEpaT5cwCXkO8VTTGUlSzW+xWCnvIi7CafoYmsTyB2jHfM6mZrEhu6/UgSFeLaqgUTF asr@new-og.latency.net',
        ],
    }
##### END voxel #####

##### BEGIN neotelecoms #####

    @add_user { 'neotelecoms':
        email => 'eng@neotelecoms.com',
        company => 'Neotelecoms',
        uid => 5056,
        groups => ['ring-users'],
    }
    @authorized_keys { 'neotelecoms':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7QsFCzQS+Lf9R5oL8+6Kvb1ZAWmY+UdM5Da+531FIKSUonOPF5aZ6A19/MWMY9OXHZC6GDT5/gnBFiLXNCsxN18+z0CTGBBCezrvnCAqoL26xFv64vqrPRCIzlbTx0m3NGbgEYxbkAKR0g+45WM40Pa4dFg5162Q5YAeoNAgAskE3nF4JTF0/+YI6eHPJ7I0xQv60ltxfSTWyvxb2WYL7YeISsZETuudGO6SLUAK4VFNMuO6dpp4epaAxUosEmJDXfAl3cc3uWNbZNCozGA33HJrf6HmdaxhbPzgUrEGqxtiYgN1aOVb/oZXtJ450ulDWUQibfhDdDAovFQTDkHdr fgabut@orion',
            ],
    }

##### END neotelecoms #####

##### BEGIN apnic #####

    @add_user { 'apnic':
        email => 'noc-notify@apnic.net',
        company => 'APNIC',
        uid => 5057,
        groups => ['ring-users'],
    }
    @authorized_keys { 'apnic':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAACBAIlV8pxtj2dOQG3jrDoKnLhPyio/ZtotOPJ35B8t0SnhbQHsIvhNNkPI5Z2ijAfrMH1r+WWRAbjlzcXWLrZ90EoZKh+6sHLM5eZN83NCbknodZtOiJNQu8Gb6kz5ty17WRDKFHQGpmpJK+0XYztsaGFhe0zHu5qQ8Z5nGRblJv77AAAAFQCFngaSE7yxwhog968sE8bMoAHCEQAAAIEAg9i0P7WNXz2UHybP4K6mkVvane00MOPozJHQ+Zcf8G6IHkARJy2qcCeQJMeHSQJ56z84KYvsCky0p2Hi4PVDsg/6ZHgD9jjYPDY6dhg4YUNo7qOrxlEi+EL0NWtrasMi9gl1yV5UHTYnTPeQYkWO1rx4YMwdh/ga56ckjj7ppGUAAACAIvrq6ZmxPkkWkWO1Xt5cMbgmixVlMvx/wDA27yVMLBM9P0v+JKGAV9CwBp/bPBxELl/BOizZ75dzy01trTArcMOeMFABS9l+SlKpjsrGn0VLlPAXgwSpripyy+vsoJGIkgvsAVgG4krpC4CydZ3Hrjzw8ecrCuPguXOmpH4xXBk= ggm@garlic.apnic.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAvW+QNCFfiFOh5iJNaIgXQCqCKRFfGBRv2o5TpFQxNwoEU8Vzxwo+gmM/kfeiDbEY4+sA6tPMs9SwQ2SjfTAHzFg8/rv17rILfG7aUiSk63vfiOcSOL3TLDYn0dqB5tsH9BGaXZ8v1qgmYTc7K+gZDApcxCqV1QDnaKnv0WGh5Bs= ggm@garlic.apnic.net',
            ],
    }

##### END apnic #####

##### BEGIN man-da #####

    @add_user { 'man-da':
        email => 'noc@man-da.de',
        company => 'man-da.de GmbH',
        uid => 5058,
        groups => ['ring-users'],
    }
    @authorized_keys { 'man-da':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEA9g8CEQtrvAp25l6x3b0i/h9M+ZgJYz1DdKgwtXoSQ8Uc8w/wUH9Jkf02uscuZ/SGFNm1gPt0Fx1UVFMcXgfVfBmM8bfQdoFFAGftIpHjGBWXlVlbTJh91wOQtk/pF32eLtgf2iaB5huFrxLv2coA3ms6aZ0orzENanSOcx8r1k5lPPoBUC5FwPTZQ7jmmb9V5kKkOTHGw2f5GaMSOSvKbIGM3VjOrg7pJR/Smxz+0ath9KQifLS+II5yYen2UyL+kSGGvD/b1uOeYQn4a0qycuFM3C2PDsI0NB04kNOiIwq9Kzuh3/EkAGKUTLh5sfbaGnVvrVi6ubGLAdSpT00cbxJ36oG1jN4cGBmOgNS12QzO4nnl0ziMoH5IbxY4CvqFe6s7QfSB7F5I6lgknxnnTiONVDownI4v4rIs97N5DB3RERKYzhEM8WNUdD+2b5Ndt6N5KI67P6YwTZSVbgd/FLiReII8w3+00YMt7Gx3Y2GK7QxAwKsZ+PnCtZ05XHX7m9qw3h4ufq7W+Qzah2iNR/NgGaUsBNYjI7ppF0HzVGtCNH1mspZMPQmzJGJLDxxY+wCPxUJna87X91Y1CV7JNkabR3pWYABx8KgBxZXPYSpui346wbEXRsag/Ndo61mQttrHhJvXvFvq6hpgievg00sK5LQtHnsDLcoRFtLUfnc= lysis@sparkles.man-da.de 2009-07-31',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEA8WX9IBwhptxxIXYwP24tjNGayBJy8/N6L7OLJnU2v8ce9TMj5v6wj1ATlztKxSxX6aSmXjlHWsMjBQjuFxzS6iO0Ok5waPDHVToH68gcPOJ4dbpPakDdiBMgfUYzF6oSAp1Yz6m4uzyelOVmVfYW1pU5BcK0YZ4vhY/5p3YIOsJiSPSwaipg0GkBYDg8hxRyqBzTYbzbS8vQQ21mwf6Bf3/z4lEtpeoschR3Zwt0oVdoeA9nTVqJl6HAcsp3uWLE+0TLnELh3XvyaNj7DlRRG895yi3WyJHHAcCx3LVfCXMy43b55UfXCU7XWVJH5JknxU18HFgxfM8Ad5bv0VM3aJQKU9Xbf9q691S82B7lQAYRI+mYz548MMyBbHQM2U00qzURDhOm7E3Vy5ombBIlmSPJSWQERjVzsGwcYIziBJEfUntbzuP7Ai/jQLydGFia2p4QAXZQchMFL0rn6WocD1xzt4xVCHUp4QYrTHpC0pMYjKNrX6kFQtapnpJxhAKCVW5T2sHefHcXdC7pBKcbHkTjIh8jKjzC9EBfIorrMlCMozNqI90/utfQXnjJ/t6Kuag0wpDFILcCW1Xdhv3N7EjCaP43skDsA6DQcp+9deJSgeyO7X6niH7nyugYdcc7Flj1fs9v5S6H2CnBtKOfb1g9jKz5aRcdHA3c+l+cPR8= lysis@twinkles.man-da.de 2011-05-23',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAK1r3skopjljcFeZlVKOLfDM3hqVxV2H1zzl+5ky78XcO1TH7nTa5mSXBAwTrRCO8w2TzXGGQNu5YqSer2AoP/3YGYcDxeRyAZkgmxZH4rMIPExr4M17PIqX6qQnMe0bZMqfrpKggdK/LzvawwkXTqEe1zRBNr97pbTSG7bALMdhAAAAFQDTs80cw0WZorOlCxYK2UCf42TioQAAAIEAgl2wWXA3BM2IZooQaUCWbdJNWjGQ9il01dmNxrfvMbo5rjRmFnmtlpKO0cykVof5CC6brmn3+z3gwoeAmaOCOOEa6DYw6YFkntHq1jsurSQ0bbeIKQ6+itl8KTeca5lhcbxzfocqqUUdS+MW4130cFj0CYOGqUmIj1f9JteuJPgAAACAGf/25xmFa4hkE81QdlG76z8u/7pyi3AohJ7TEmLLvEnr8ybF9oOiMXqE3BIyELGaOdCOpDgu3D5FDY37hdeue+xYmj8bZg+1RtoYvqrfe+ZI/FC7vcRRnNlQcK7Iu6/UOws2zzxhtOgTf5f5U20uVHcWCrTkU3j8+EQ+fcviZuE= lukas@lukas-desktop',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA4c/u+OOLHZwYlmnbsvgDJLfXTLt3uzuanR6WDUXXWad13akINZWK+WOtnfIn9Q1olbcBF7C6Uk1xH8YdowAx7GQ/niBpoHggeQlWYgtZcP4Ay8X36h0E3g+hDDbep90tRrnatLUYfwyW2ANuHaWb/odMvprTCkWJ4XIKvM5/NGIerkM9ve22+VnnMNpSMUpt8nsVi0tnc76eSVP10EgHSupAqDLc31L9s+8Oajs13wbUsAGASq41UvbbOYtNFQQa7BVYtq7ndopDUJAVeli0rZUF70VPkIPN7WQbJfElIHbuI3IeHC7aN5gNm/98dp2ZC6PgXOT2zJ8fHa36JqPUhQ== kollstedt@ws-kollstedt',
        ],
    }
##### END man-da #####

##### BEGIN webair #####

    @add_user { 'webair':
        email => 'ipadmin@webair.com',
        company => 'Webair Internet Development Inc',
        uid => 5059,
        groups => ['ring-users'],
    }
    @authorized_keys { 'webair':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAAEBAIe2NdQl9lAwpAQzVcuuQLomZiD+XP+uNPEZH94LUVbCbA/X4IJ+DVROWaXfLazq4QZaKRurbGAFnGNBqTi4iOpvO3vT/QdhoMIn2lEu0sefegweMSQTCC5abaMNPOg7v14DSjkXda48yKm81zumR+BuIuaWa7wHx5kNtz2nxWitzOL3DjmLa6IEMu42AR1m2zFwfD6tyawZyppw8+RgphiN0AyS8440Ya5HnrAmBM9NW3FRK/bZiGCuNaOwBT8lM9c+wmjhgvyAjHm4Xw8tTq2QG92augzhMRSSsVl0MzOGNG+bZtuXItP92fYJPMWp9taq0Sr49O3GPVOHdvaA3EMAAAAVAJVigsweDqNZx1d862faYbVBqSEXAAABACenCy6m4eW/2zVHQ+qmsch8WCdWAWCJLBz23bQ+DSL+82j/aLWdsGfizfTUXFYREDDbjyyt9Yk0GjEz2nInz1hJGAWFkt999OkJX9YBV3vzCGVaUPY0iNevAi9Yj57cJMJBO2ecUNL69dsfXSiBGJaUkKXVcXg13RfTZumylBxYtjbZ4amGogDIPaowelV1RfMUiDImhlukhgWQJZtMXjf86Nr054HL9hLbz9kCzSTjgwcDub02wv+3d72yLr690RFDNymHxGRJRr9luim46a3kb2Sa3eb6iumCB4/oCTe2RCMYFV04vAJgcQlEiZ8RLy1fHLQzhvjC6iyO6gI7kqIAAAEAPgbfGVXfuq93VT02S8ax/XLb7B4bRlSrQ7OjTJjliKZI0BHEqs1B0R8JtaDGdMG5539YOE6RV0RFZbuNETqc5I04fPRk4jhADeHlzljmLhRauThTkfjGrB9FKhI+CM9iHqatw9sPtQdlzuWLUy7x31LNi5Zq30IYnaH1tlnv7aaALbOeNB5rmcgHcOYDgdjDA2hSode17/1TwE7VIKWg3dA3xMF4EutTYP8mQWxGnmcIpVr479ip4lRddJYhLJWo5iN/3n4Ds6WsenF9HGYWwAoAJbNEObeZvdUymZGxmbdNMC7spjBGX6uOFEoLgzOls72uhqsHnJiZZYYH1MSVFQ== ipadmin@webair.com',
            'ssh-dss AAAAB3NzaC1kc3MAAAEBAKXBkjLHugYb3nsLssm4wg0OHxl3gVBRGfg3E7x6aEylrDlWupA3iLeXEySZONr1enDEm8bmCuXU+vIxNB5pfcbn+SdDxbX/a/Bsu4QdwxaGhrYEsWJtxBZAx/+fCMijIYVrYYeKbJxRjbu064PeOEjlUO/cGAn7WoKyjLYQc5F2CqDQEet47gjhHs286rORaTNE7/yMg38EQwU0onPa2KkZ+UpRtF/agifECZRdMtYCzpze9MRqFpUSJwioiKzfgQzu6QVjLogxe2HWRMSGL03q0t7ZjN/XoxrcFQ78YOF/SMZI/wiHWkGqi7EA/9tBUK5OXtaYouIJ0u719JEK1NEAAAAVAOdd/PGDup1Io5bTCOpVCZA93vn5AAABAQCMPH65Q6/fJaBFIMVgbl64RGPfbd0MT0lHW+m/9+psKt6E6uI/s3WK9zjSxiSlI0zcjX2/lk2KanxVT/G+ndtCEsGpklUy4/lei9odLkouozzwqyOHq7Nh752M1yYABbFolvKnJB3FGAM0k9yhW7J2/NnlqQZBj/SVDNKeH5cMMhfMVOO7zmu8D27yY5IBZB5kPh1u9c8qu0dsCkblb/chni6UPdnGu1WaTlGbrBrAy7pS1nglNoX0qULbaE2RnX8bGqbFgMHNXIE0xBAiEVAuDyRbv6TKBaXX1Eizh6x5yFQOuNeRgWhGqT1eG2JDlSBdPoPcY+07ZL/kjQo/82NEAAABACBmxZ+KJB01l9GbZb9LZ9t9jvxNNeaW5sUOmBrFQNEmXkBCi7nYDKyEKNFXmyhYFT2YuqeoZaUu0FPJCgJ/W4FHX8DL2x4ra7DfpGuxmO5bb/WSUeODta8xNTUbUAPewFvxqZrjTH4jUfmmd32Ly3K6l+lWaV+ruONmcp9/+SQ/jxjB73H3+7GceILqwaq7A6lb8FSBTkW6G2fHC/AH3K+qoU33xGkS5PG1QENHIhAcXhYSkExSw7iQXavMdR5ogbIGkVz49Z0bZK5FRhxJsmOoHwhmk1brA8Nj3P6ZXNLsfzAHeYws9wWNrt6L9gcp1rE/YrT0fMGBJ5HI+67uwIs= sagi',
            'ssh-dss AAAAB3NzaC1kc3MAAAEBAKohlTtrUyLAO9BK5cz/c9dUfhYLiyIw2kRNUmrkRnrK4s9s84kZDIJhTSG0xzrikhc3h6FcC6gmyVq0CRUrtASstTQAMU4b2LCfrSlT09RXgOA5WNDwGUcGwGpJIkgFkmA50nPJQWrI+k0cUNm98KSYDyB9q7eH7XOKpf2D8PgMsCnW+mFYLboGPztVz/PJfuzwp5WpbHh9Fr6pzU98cSd9IPDaXuYfqbDKr4lXLj3hG0cvyrFBlgSr1fPDusPayT3mnZR6lCcSkYbHvj5oW0WLIiGn5gfIIVMZ/mv00ShNjr7Is3zbnu75zaB5Dv2n8lmmPvwNBeJpZRCLaf8yEPUAAAAVANiH+7+HvmfKNfYTQy5RMnNEawITAAABAQCNbFMkc/wH9tl2uJ0O2kdsFmpweg+fsZkAymlCnEB2CfjUkWwvwEUnpd7XkLq8iV7lGNoAm14BDRcVLpW6Qad8BiqLn4s2/UnVKhIBjpcw/52loKKPbkhvUVx7I1fhMZz0BXoa0S92tPsSDN+OeUkaTb6fRKT0EDwKJ34JMTpgamLh3mnq5tg5bnZineiU03+WNIDmqPbrBAFeMB5aNAqqBiv6CJHCEXBHrGUFDaYYUP+RDMHTqLXzpVzIRJ65EgOPaoUWJpJHIXwUbuyF5QOtTEZjA2M8x/O+3/hqzrf8JhRgdroMNRWJrjHi6OMwUX2wqSY2aqiCMmcUBjzaz+oAAAABAQCXsa6VpQl2c+FPYYm/BlJomtRhNNTp0/eZzm5tc88cZDzYk7472baa1Aqa4AugsSXvV9mxAENykaBlyh7Z+p66Q5ufVWxs1OS5y4tyITdQ5k75IOwdqM74PPFAjwVtH7xe9FqgqIKqMhYeLAOqUPDorJiBqa1JJTyjxq/RD+oNASxwmn4yzJI/Ok3oAHQfdbHFVCrlrSzBWwd29jg5MktdyJlrFS8u2BAzHYpjImhoFeTAm9a/U7gZ91DU8+Yyz02vtrPsVBIhXrZzXGzd9XVr73fFEuPZldbHDyONjpXPlvsyuROq6Ls3T6JjT2IJa8PzajwFox/BtGtxypRBdI20 sagi-gsc',
            'ssh-dss AAAAB3NzaC1kc3MAAAEBAO5X+mcg6r3MsTek7hsn/Xh6Pl9Lu05ebru9YqO9vfYVrkuHZtoYZtEynwIqCcf3g12KX8XYubRVVMFz40pbiEgJ9xINwHuDKt+54G4PiKJaoYOEX/j++YpNqeq1/nimGIssO6Vo4shjq9ExB6FSyBXJmcujyyBx7tKzRtapbm5+YRi83QEIjnb6FTjBU7mWwX31qUm7qlFhoNv3yazeW231uzuHvyrbyzjTgLdGPYpo48V7iI8nN4Qz+67svn9RyfkvRvEqwGtDSAIukHS9i4N36jyw/2wEroAW7FqUDqmn8Pg1cWF7kvof2e44FmdL9L0YmSKslkpdYVhRYjOZsTcAAAAVANcTgHqYx8qM0AlzjvJqUz2kJborAAABACZuAADzC6jpMs20ksTp5zrlLfZX01ToCuQ3Gwr0f3B3Dy1vwBvHwt6MyI2HPVYNQx1JC8/NDTTjtQYnP7MEE8S6DLgkhkDM3GMtreSjeT7DVmX7yhslvRMlsb00QmZ4DaQe+1c6hNa/gCGapJHHzZUuSuVEtLOmooSAeLW3n38yUF8jMkMJB1tr2JcXaLZ23ngFpSEN07MgYptAdiPOpPMSrSbuMChkoKgqFrIsLk3MuxDXWUDlcltMwDbHvIe40q5g8kZDOFT1VV74ysUSth9knxFvnPUp+xSnMBqOXFE8TRLSZ3rUk8D4R23E7/xWvT16DYUDe9iMWOjfJMAsrwUAAAEAZ8OIxzIDLWXt3o/VwtINwfhz3E4v/PO8+U9IexlipBbmy2CcQ8maY9IWDa4ycUaW6iX6tg5sGGmlocVXiovxZrFXi9cwXN1o3op9tDpiExm9dyuaw5aeNTCoL8a3moDvYuNHBdWUUNJIRZhI4gIfIv0kvFHih52XVd2IXWoXGZFT9cbpcxLz20lsgIUguKfw5WlQzzGLHbBG2A0XqOkzHmgJeCeUXU8qpQZRX+3eLotrHGJdPo1Zr1LDJCeLX5nKEHan99tU29pb63ZjyqT3X0yRvntRrAnhgj2Ubg0DuDG5Pd2Xka97jYLaG55OYaxBhtLFbE7S5evkVMb7na5fjQ== billy',
            'ssh-dss AAAAB3NzaC1kc3MAAAEBAOROe+jcoWoIQev9hDl299Tm3erENiwaaWT3cKAHiQpBUOrNYd3+K1O3eWhVwNS+po5Pj4G7CO2LxLpBKaM0Qw/y/R/k5LvADBH2JBEwPWQIOVXJ6nK35eJ/VqKi3ZnQh2pkWI8Z+nOkMyibX37UY6DEqpV+oWeWvLAt8d4gAl2bvQG8817YF6KqQwZglBSx1B11uLKstKuV1lyWqOvpdyFRroXv/jwbBy8fMCNpsLb2AjEXyKVHta89Vj7LbeVylLxbiCOoZxR7QE/l9XGWQfbV5tuz+BWNuSVdi/ya7XIRXTBxQrAwtLFZ1zoDPadDqitWQyTcQc9VBVslfWDrcNcAAAAVAMxbfHqclDiqGvElxPbJj9uNxhzPAAABAQCsbfiSJxfCzkqYAYwIZTzKm3RGlc+/wHld/CLwtuqM9BB3XXqpuo1iNvpIZqtP8tIg72Maid7AvdCGTw89Q3sosCLFp/R96SQh5vl6NrDPmhbTda9I2GpDrce2SaWUwvG7zobCQUL943YIn2YFfhy4MM/lOKqwEvzYB/q2axBl7e/mX6vxZiEKf+OvBKLwTPQ6AitlnJNYHlgzgExss5JJ5NSrZcrdUihHpQD0CNWFgQwfy4V4YaSNJZkBfwAFTvVFyaq8IFMz6EcT1ue1dfgQsfR24xM3N6EA7I472tLizVECotwYiQY4bB0emGst9HPbXU49MtUnv/ydSmeQtAP1AAABAECWXLIE+UrPzZBHIfiZHmMtYyWN92hS3uJcf+0Iqf3ZdQd/zdciZmKHaRoSS0MNX/Ns+A/u+eFsPlNQwZG5U0qhplYfkivHLgVFQRXthINfN8i5K9PDTTf3wvhqySHtMv1Sn1QsoWywa9Dq19BsJYFWmALRYFHNeDpEtbaMI70PxeoYgSn7gyG334WUf/aoKn+zeR40LbvlcNk0lVCbzlMMHafh89wFATbnhi0su9NuSt/rVY6CCPzunmWl6ej5gFZ4xL0JOeLUDZ6DPAscZsi3z7KYEMprRDqi9Scxqll0Caal0xlH0svMLToye0T9dCzkcSI7TPe7Oaq5lqBQlCY= mkazar',
        ],
    }

##### END webair #####

##### BEGIN concepts-ict #####

    @add_user { 'concepts-ict':
        email => 'noc@concepts.nl',
        company => 'Concepts ICT',
        uid => 5060,
        groups => ['ring-users'],
    }
    @authorized_keys { 'concepts-ict':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAACBAK0QLpVtmgMtbAZqyS/Ts/QXWil5OEC+/S5sJ8lp5NFPS2Mb6RN8jowrbckVb0vIH8l99uKbZ8KXE62u/ummMHpwU78iIJDBmSYc2c3zSMFgNHpc39gPzMpybJPvNGBrymY9pnD4dgsXiSnvhdXpkv2OXIK+zmislBxp6VPPcQdzAAAAFQCwagLER1xTBZUjqOjUSgqZRbhBQQAAAIBfr//KC96RQ9R7/xbHf5oMyuBQt37ty+cCtizj7YDuCmk5lQfTDFQTE6TKOF5JgOXR5WYyNj+wIP7Lajhk/aNf1sdFHS02Py92mmrI2tgUsPKmoKOWXkeYClHsdxlFB37TTRV/HzzY+tqUoO5Py2WOyknW21bXUomnmklaGUljoQAAAIARZE6j3HkaXHYa7uuMfsDHbalgnyTkRRDhL6phiXUhzNG7AxoXQe5Zb+ePqAHmrxIIWRl4LeVpR00Af+04L69xMeDtpWjSQa8LSRTcDuCkxoYb3kH3YOXRl/1CXQaKXkEraoMuaY7yD5ooViUuDOtTbdVgWKOLEWYG/J7k+Lab7g== richard@paradise',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAONWYwz7lVEcrY/BHxx9pfHY+whpbrWmS9eKclbKLgVd3mjB45D/Wf/VUTUpOmGWnUHRL0bJjSN8rcCJMKS4Kq/pgEGRk89tQhxEFw1KfrEGq2AipQL3Ens2BihYE3AtPahQja2mRlt2a5MYxyE/SB35BxGmYikbnBcbUSpoU6zfAAAAFQC1HLuRM58npmQ78AuyLOMWh2b13wAAAIAXlPkXJ077F7uSVjyB1qH1ScPIl1d8Cbc4llTk0WmmgqdX1H0Bw4c8pVudWnbf88qt4uT0zV1kOBG517zoSr8pcp9pBRnSE1ratvtLh9Bh7oAQvorhtk73kU2eGTCS/2XXN22+LVOB8xN77VN3qIrHLnuiScvO9IVARlBDMAmcYAAAAIBixo0OJPyQyudCSP4x4N27gTQXobQQEc66GcT2JqdgbPjeSwL68wuvgmMNy+XgXIZxnCQt1MtR7cjhTrUZRCVJuba1p043VAT50NtxgpZnnqxDRQ/BqXyTj9jiWd8c4s2GtRN1PweeewXk2lxnB/NQEShGsxOTLdnUw7H1R9tqpA== frank@diepstreet',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAJ1SYO/Z15nUoggH3Nw4qY3zX1geFEDxQ+15yGkBsMPKZFV1Fujl542synB0xdi8CM8eP4VDpVP/POWHDTc1MrLTSFLhqERnayjrxX1OpfpeFlbThY3JW1p5eMWeILNeqiiufXrIl3Mrl87eyp3PU0dMa8XSKSmG3bP4vrNLhOE1AAAAFQDETwVqKwN39ItigMowmuDBAS7JLwAAAIEAi+FwjYjNHBjf/g3VJvwj9hKR0YTGElYCs4OzxA3Tcd7mQ9oCi3Xh10bAzFWUS6Q+GlAdkRiaCLQ+Z7XNcVxc6TeUimMIlrDhisW3DtD4t6je8Kq1r/ZchxsKcUlGTLB1kYOB2/aFZiXDO8Fye1HRIUa1WU3ECN1nlrQqRKJOieoAAACAIewaeUp8p5ng5mOncRTJvb60sEUppFNJdTrrKDJdFnoa+Lz/Tgl0mRo/9S6i5AHeMW9xjn7fh/LMkvvXllH2uwV9FdaY1eZVOdgkfsqnUE3pSxwXktQwpzxcZM5AiF0PnIgGOiBMAgw/A9nA0hd2e8dc8iG8cMEbC2CeOU2eFh8= kevin@kevin',
            'ssh-dss AAAAB3NzaC1kc3MAAACBALcKqHVo8y0T+hjd/P5UT2+r0DQtzcl9BTSsz8vU+qz2Ia+Ua45+xoZftMb+rE4AQQU2P07o7nCTYEr4r8MUAzRGdmvSec6n4Ayeo0tUKcrGLFOc1HZNujwQ1kG+DYkBfuQsJ/z5GlkfLUxXRbPKoFMfmSmIsJnv3LpbV2eDj9JdAAAAFQDY0jTx/LxoXjkI1ggGPZdxfd9RcwAAAIBZ9eCYN/c3wkqTs9iIcm+Iu10hHfA7pCaXZMR/J/tVQQ3zyPPJF/AtIUdI1+Ii+vd9vA8Mb9lzwfm1y2llm+kweVwxm/mClLgCuAjlFRs+HPBFKaadHCkpfsY8uS6d/ZTxD2xe0WjGN1XkarEB5mXgxDuv1xd9pyFdLQjbdTA16gAAAIA0h0gL3KboDhEU+WjK0PWqDfbCq/4JeME/9v66UJMlbG7+/JH6IFQIVvH/C7IhE3OrfqbXAe3mgfswEXIWV8ZXjX5D4Gg4806wFjoBCZcD1ac3sKSPCMYMTfAhb2hh7/tpR6WOt2THxMNqHX1HuTKm9U/IcMF+kqr/uFHWgBfJbA== richard@heaven',
        ],
    }

##### END concepts-ict #####

##### BEGIN dataoppdrag #####

    @add_user { 'dataoppdrag':
        email => 'noc@dataoppdrag.no',
        company => 'DataOppdrag AS',
        uid => 5061,
        groups => ['ring-users'],
    }
    @authorized_keys { 'dataoppdrag':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAxEQXXMliKUWODgsvFwvhqwqUlJooP8sVqPqHeGoP3Yc2X+bNc7m7Xt/vQUukYq0il0PBOl8/IStXN68lVgbqZcLsQ79LpQXhqaMrCFFsrElwse4MF98ya+LJiQvN6mUEehG34g4JkzOlsXPZ4PcBecniJ7xBf3/CPQFyjROI7Tc= henrik.ogard_AAAAB3NzaC1yc2EAAAABJQAAAIEAxEQXXMliKUWODgsvFwvhqwqUlJooP8sVqPqHeGoP3Yc2X+bNc7m7Xt/vQUukYq0il0PBOl8/IStXN68lVgbqZcLsQ79LpQXhqaMrCFFsrElwse4MF98ya+LJiQvN6mUEehG34g4JkzOlsXPZ4PcBecniJ7xBf3/CPQFyjROI7Tc= henrik.ogard@dataoppdrag.no',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCcKfBd/eaZRcn9l9Ng+5vCT45xOcXZ8Wy2KbgFaLoc9uM47BNIRLODvg/VcqZ9UtR0rCMtYhlMNXr9iXGLQYUsyIY8ijlAY1Zj3M1Xb3HMZ+G+SwDYYhNchvNfEuzqHerXN4Hgx2GJbxd7wC0jW0/Xb2CT++eEVmI0nXDJuOljXW4cBGXZ8QgdGVMfbMkOKpPt8CP1pjtWH033TeWQ1wNtqSF/fVVcSnp7pjRabWsMOFJJsvuIZ7ZiANoJy6qdYYMt4xQOhFbuTbaMKOCwJkL53cq9XritMAxSmjLvMyqRs0gbMWHaVmbBWqt+0/VfRGBtwZRBcUGqbj8UHk2xhv2F ole@dataoppdrag.no',
        ],
    }
##### END dataoppdrag #####

##### BEGIN tetaneutral #####

    @add_user { 'tetaneutral':
        email => 'noc@tetaneutral.net',
        company => 'Association tetaneutral.net',
        uid => 5062,
        groups => ['ring-users'],
    }
    @authorized_keys { 'tetaneutral':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAm6PG/dmzT1tmS4UKHnH2iNSrWrIi+QfDHv9UXI1kMqulRDfb61nyR+jgC8lBQFyTSinFtL7jzkh31kx7fIK/4adYGRmPLuXkOY2lT/rhhO9PJA5PVZJbM4kggJ/e+nSlXt3mbwsCv6qyzHaavdaQK1IKNgkY3OW4Ru5LDCJ6UfM= guerby',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAzDfBSCVqDCL6n+fZCXmTBL7Jq142isO2pQSuDa+nFCfpIUUnQI4caSc9WheOV4XVkJLslHH+qUyTQTus6KRJWlKMQc8XY240mibedD9CAarvnRshX83uTmHhkGGRp8sSvzbPWJno+elTCh1QGMy1aPSUDut8wC4LeTRYbc5uEA/Qrw95CEQTjK+1ePR6IE+QrPpaHbbi75+B+Yvd/hO+kT9vlIk7HIV59kDPoboYKjVmbzLJnxrX4IOaIsAuHgqB2SNPD1qGC2kQ4DOW538b3/2sn3Dq+daED7ZIqBIkDi7GGyzju6zJG4+VM4lLG15+z/ysG57WsJ5VM9Dm4Ippsw== jerome@ceriz.fr',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEOwsmePYd24yVNykGofhuYEqI9i0aCeRZe+g8PEs2z/9Xi6+apFuycD2oPZZqoX1Laz2FHh4BVQA9O96LYUjlR1WiV2COijofkr6Gx6nMRWQmkMqA1Gaqib7FeO+0WWj4wie3etWB23LW3M6GdcNOMoSuSsj2uKoipqE6Xv9FtwqY2UUvCrl1eOYXzFh7VTBgJLZ9koG1fCTuQpXkY9Nnjc2L4zs4TrDKLk6A4Z9tqReRTAOlPvekAQqMlRBypNMhahzeaRG3ozvwt+YvgTSqbfX1Lc92r0BvgEAUQ4Mioa9+gGB+rujuXi1OiTedo77cDv0E+RxjzMHgVyYwxaU1 sileht@sileht.net',
            ],
}
##### END tetaneutral #####

##### BEGIN jumpnetworks #####

    @add_user { 'jump':
        email => 'admins@jump.net.uk',
        company => 'Jump Networks Ltd',
        uid => 5063,
        groups => ['ring-users'],
    }
    @authorized_keys { 'jump':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAnV76xJg0IH0nuQ+W3ZRRrfXtK0Vn9eVHghl0zBxant4lx974NRZ3RsVzAaaa8CjX0Sn3dEjd9yMFaoWximMMt0pGQX1abth6qfxdskyyRtf5QVsZoojPOfrgNDx0MJn+VKoqI1J6XTzHdGjPlgqa9kwlUPhs8ejc9pLhCljVUJFD1nzM+pqvRE16ocWv6lPAWaFVkEL4EYB61WARjLve/9+bHTscNw9nLWjVpGDe1HN7wiztQ7Nd5CoGJumLCU6wInd0hx+mznNbTsn9PV107aU8aEBQgRYH9Kux9ey4k0ebDK1ggyYN4ALFwTlngDj0Do8mOUHxATgPXpDnOBDmbw== jamesr@Airbus-MA.local'
            ],
    }

##### END jumpnetworks #####

##### BEGIN iway  #####

    @add_user { 'iway':
        email => 'noc@as8758.net',
        company => 'iway AG',
        uid => 5064,
        groups => ['ring-users'],
    }
    @authorized_keys { 'iway':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAACBANy11H0NQYAPvKHLWuSyOlKWPD2aATF/9VnJXK/epUJWXCrLRF0WvKETJjYTLHafBb4WAPIi3h8l1jDITvfl+Hcc6Yf7zv17kkDIAgY0MNk0CMNEiQdziK0nte9D+2zQu+A0EootUHa1tPVIUgL2wtM6GyDvVL76v10xyVMMKKKXAAAAFQCc1Od0oqMW0/WUUHIg5wSVGFZyqwAAAIB14CTuwKua7tfKL/V6hRS2q6k1GSL+VMj43jVGb5u4LMyoqhtsqlo1fTzys6lRxbZFbsdrRCbeWG7uy6kB6iLkZv3U6yXDn9+C1EOopM3eYwBDhzO0KCF0LOjvbJozanDjSl+/hg2qiRNIZiamcn0qshxh/x7RLiw6DsSxfwlz9QAAAIEApMdsi2B+ehuVSQjl3Oy1WsvCeBY49w2IHNzEQyZJzVX5Hkq2tFlM91cPFSh/+TbGwmBuP8HI6JZkqVsKuS3nTdStCJgoav6clfgufOPhI6NWFVj0rEZO39Tet6ElCuLUDXaJkjxOEPNCF+0i6wuYxMP/M0NWVF6KlB0nkQMNMJo= cramer@fiji.dolphins.ch',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAoBNp3xgryWm1ZMcEy1aI64EPLJb61o8AL8q+GZ9qw5wvhvutwgY9gvdocJqqOHmvHNRmgLHKt6Nk4EfuDW1kn+iWH8JwAeophk02/PULGxbOSzTJGZcdA66R3vMWsB1CL9Rm7fvutDuVb4o9qjgR5lYdbwriiUGbqEDkXSY66Yc= christoph@brigitte.interway.ch',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAgPqTawM0PMf0EhqIW0H/FZlBPMe3qE2Cu4enZWoarH6ezsfQ6mreUnNvR40n5hGQmc99S8rUGDOlJevaeGR9T28tGq59Lu3zCMLBQMBCkx/Dy6VihIhs6A+8V6Y2Z5QKGk9KoOz64n+saB8XpX2mk9qMznqQialvhqBfA5uNzTc= renner@iway.ch',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAgB+7C9q0hLaWQrdlRlHd5bBm9kHS5nGPHemxiNd0zdukggJPR38dXaERS7PAA4S7QyUYJOFnYbTSDddMacmA6Aj903D3KcAORDdySSWybAJT2cU8RYPM1sZp5apnOXgEVAIUiEo8UYqEA+LIHxmhDdJC8H1yoyZ5GNZkJxkKFoz5/uaZw8rtWkYdDuUwhX3bTka56QPug7hF4cziTyq3GyA2SphZ1w+6JIba8447diNBQ740X8yvfY8RmCH7VuW0tCP+RxWNVLQS3fznWRqbQgYcX3xb3Wa1UNXBG55UQSM9FuJvIEEvUgKfoJseLcP9l05Y0LoWkfUCMWBgizlQqZqD/rNRnrz34woTa5ejdAQWhBmg26HVZDKD/i+8vMjLQTLyPypk6TPorEv5hn972W3z6uSZbOm/1OgDIYf+5UCR41d6bYumvmosxr4cvG7LjcCebMVVeme8SRmr43SQkKkBv0eR1rJHHiCgNRX/go6iREZ8Lx5j6Qex0Qc3anMGvMNs5kyAiRSzcCvPr67hzzZI4bAL/bZMWr72zIH9Q0+Sq6ZpqMykkEdj6DLhcpnyr5CRQ4BSvPm9O5VCWOOf5sIGVpgbFYy5dlPeN8p4g7NKECVaPJfcNdftjAhL8UAb2XvqlE9L0CdS9+fWIXaZUZNaXUDEky3YSf5hiPILA2xwQ== andy@iway.ch',
        ],
    }

##### END iway #####

##### BEGIN timico  #####

    @add_user { 'timico':
        email => 'networks@timico.net',
        company => 'Timico Ltd.',
        uid => 5065,
        groups => ['ring-users'],
    }
    @authorized_keys { 'timico':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA8/ANW4MXT3ttfXDfMIZlnseXEDuGHINtEYFlDl1a79pecZ6UKj1hF54RKmXLU/M2g9/qlCv+5PYFN6mkNkuTatMldXxZ6zCiZAFOyVRhRsfbBp0MsyAMI1ZXNQEiOmpwuJd43L/kSopVYfL/DOc4cKbHbVv2Fmw63FwfYVR+cvpKnrDIwptOi2tlfIBnXqnQP73oDPwltD+Mvx9nN2qIG/16Rd+CRuMOufKdSfceWJcYoxtmZEFJvuuZicKFiuhALc/xDAs/Ur89mPHdKOIRBZsnFk0lgPBQBagLYqm7EbEax9z6XSgtG43l49KyVZ8RDhjH6y+wC+5g0v8aplzJAQ== paul@frodo',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAJ+FP0Pk9dIVgVizdPVghKiBTKjFr0wikAHx4Che02LTdRGuW8CnJVFq/sBdNbiVlBV82y8SrT3UBcQ6E6KAN3iA9fLuIyF1eiJj25ekuG2EaOsCwhRvG3KHky4HdT23a7KckBuJ3GuH2lablgiRWYI1gnJ39hJE6UVtunybIrT3AAAAFQD5NL5ONTj5LVF+43k6DgfIAeHFSQAAAIA6EjCtSZwBQ6qCV9pLnSPqElTFMQaotUt2vMsbTsZ4hB0q7L2//C60TddkFz5qSZVwyC1sUveXqEgtCV69igdME+I2Zq3WunKo9qzYKJKM5KVIWPVDRLQ+yKwoCHINral+Ay4/Pida17FrrWTO7uxfNUue8EijqI0+yyAGIshQhwAAAIAePMkZTy2AhkG7xY+GP+Rv9xlFSYaHaZ87pofE8DoEcB9fsERchHetH59jRHFZaIA82Y2HdLUa7HI2L1jGK8RXRXf30JXz7JLkA0hy7QTP0roqLgtBlBTH8QwChs0MNgNAN7yLSvWFMLdLv4c0kngpaekNfTh3KOoxBGGK+Ru3pQ== ben@didge',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAw9V5CEtAyU0zDrQrfFAy4nq0030dyNyK8gzxRdbXPpl6DLTG4UWwAfGX4r/tHgDdnGvNkRo2e31GNadCDtZhWzy0nAaO5HFAGdv9Pgr9OvdB+qtfV1qD/TN1NViIx3JrttebUmULWMdKk5maKcBpsp4vusQ9BbdGeCd5AREIktuJGXJlw7O/tmYFwNevaibfFfHChYpnDA98mCb8yJR5DDEJkP0n3Rp4PuiBLmcoSQj2uCgi7Iy2NcnWBYeJhiuLOWE6sUwu19cAF/HhtAJThKdapSiOA3foF029fMG5FtmGJyvUFaNUYG3r3nE8My5cSDRYF+a/elrS3V/OZf8wYQ== n00dles@atsuko.keme.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDVQZpXLggBbc/1X5AiBKiE5kbwaDrjBwopHXDk7/RV7Qrb+Mbb3DljFbHTTBgOodPkh9UsE4cQXrwxPoqdGZ7aouWJWrrxlCzyxuHQFkd3mYnQUREhleVj3E2dpCIG/2mvuytlKR01xNKVwykC6vYXU7mEYzpUaUuZ0DBEr8ukkt6tbcui8H7M9NhwebNv0zWg8q11glp5DQ1wUfu6/xMmMoRN6nQodn/9YZYAnMcALgGA/Wo4dKevGJhRk68Mi+U7f/vGW/6VjDlHKr4atOEDT031qZMtqt5umSrvLdbMTnow3+iwCrMXxWYNCI/8RXCZDnl/QcA20015+Rf7/rrj nick@didge',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAw4TS7hm8xsJRbv+5XIJ85YC64jR+KwzmJPYKLRmCAdWuuwkAXVonNWwIooWbh/eui6GiXv/chnDfAg54uNHbdwVyw5+YnETq+hjenkBK5Z02XOt5vbOuoMKg5pmeEswhCygzXFhHIYcvdhKPVbCGHB2H/PKaos5x8qf2Oruesj1YRG2dKWKvzVb7zYd/JeVMecoavSwhWm5ngCk92eDUaewPGeG7Q10kgYavg/Bwkj1IeXI/fAFYCyVqBPZ4CR6zX5KO4zkd23AZ1SSle0XRt/ZDqeZLPU/EFD2v6NAlzv/Gvb+4dCVcfG//O/Z8sRsYBdPrj7Kyf48vgKy07JDg7Q== gareth@goliath',
            'ssh-dss AAAAB3NzaC1kc3MAAAEBAPtaknwvTlmx4YHAqfCma+NGPSlGf/435KI3oOAsQmHda+hZP46edK31bOhK8Vuel93UMQmK8EzPXMvXpXEWzT1mQYtoTaRgaX4zNl1J1mj1M5eBXUkFiQ2D6Jy2WDNBua/yl45Kslsk4O50yRrJxXLmqKWdtCHu5dHkx7eqfysrI8XDk16sTq6FAXiwVAaAC8LfLX9CXTB1PKRXMXYYhNjvUBbhUT2kOMCsxwu3b/aZmcw23J12Noo8bntRFnGiTHsZjfNdIoClkJq+gzv2fxOkH9GCoBY91vlz6Qwl6eo5CdUMtqHeD3mPO2SmeFGtgt+T0C+MGUrA9tIOsBe8imkAAAAVAOXzF07cfE+zLSXVSx+fix6Tt629AAABACfTng4yn/ArK1UDgKAhAqurrFrNGFDtsq0NjkqtM5/cBKeNs2E0XH427mWMrw5vfjtTUQ6/TaaSNSHZEFIUu7XQjBpjqSzEsNp/ulrIcaBQVWROjQY2y+tQ7cg9DwihJVbG9SZcw+SngHa7klacOFTo0RRd4rgGZYLDaG/AzFhnvbS4cqVmjxKCvPT3D14Ysi4N0akyoXr0vwPiPlDKEguEpBv9H0Uh4V2AO5CHzfOhJIH+ldy6Xa0bHFwAZ4J3bm34Sc3pyn/I7+VGxaJj5pFs1AnnpcE2J+F7/M7gmSvuNLE4j5b6Hi3WjnIq058wGplXa8Xis/xcA8jE7GG3pogAAAEAIhygbStlT17eTIiXvdooZHRyLQBMHBmQg5oCh2/T7jsm9Y39pv7E9AysnvO71kuVMjWY4Cqkef8mPWZzeWkbHS2JRF/Oo63Ua+lRoPv/4cVjMmUTDUNk++KQri4Mm7ZZENtQHSQvXkhwGcE0BKy8wXjpDEUWY9nmQOPUE4QBWhAGpYHhJLLazaGxRa9j48hBBwRiYWMXPf2j21uBFRNh5GHmgCxF+l6Mo0wc1X57AX+AWGu5lJaHxLpXnJhpzyNqdcx8wNOFasH2lXGPWsQcLtulUVhgGAI33JSYrNINhyz3iyMPnuVepJ2lZCq0e+iGjEXo59x/E09aKVlXp4G+0g== pookey@pookey.co.uk',
        ],
    }

##### END timico #####

##### BEGIN rezopole  #####

    @add_user { 'rezopole':
        email => 'noc@rezopole.net',
        company => 'Rezopole',
        uid => 5067,
        groups => ['ring-users'],
    }
    @authorized_keys { 'rezopole':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAnedtToCyYTMXQLAgVPElfkfBdI3/WEJlkphEBrq9Ezo0ywXqTP0NciA/xh9XI6nx3zn7BAfCbuvgpuwsjMys5/yb+UpG9BCfVbV/Y+pH1KdcMwH8GHnlwY3Zl8Z1LDsK/C6JOyLOqLgax14T3WFyGP3Gb9ptHWj09k+GquY7gtBP+yBDJ8Sy4uYsZiwzQgUC+yZXO6oHR9W6AVbsevH9tfTubdhi+1kNYIRTQhZPFo5AiER+yYZrzjhKEBGmxRDfZtLN6jBaET4IKoH0zvCdue27BSAehuXl71yr9H2OKUiOK1W5TGHE7+7HfFqJihi1ACnJyS8miwjHHsP7srRu6w== root@fondation.edx-net.fr',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA88pt28yU5jq4KZQ88nKsl2iYMhxatRv742Ak52c8/qIqivw+Drs9/r4ggnjCBrQ8+nycmc3QeDsAa7ci3bXUYebYHAuNbOF9QKJst2SquFSGUu5kGGDxNhdiYdVVuqH/DEzXN+CXaLexykSPfe/YpHRhHVK4Zhv1Vbr8pmLTtaOBepdCUE+s9anqzDHRIfm6b/3XJSLlXx95mi4Yj/0BEM6SYHzsAr0jhlfvbA84HZpzQBrEi7dHrylm6UDtPXSWkZq3Ki+rMED6ZUUjWVLO0YuVq5NJi9EkgbVSbhK+hr9BndLOpl0jUrjxHT4mtz7p+RTM5Wm3G7AB54LzNhxHWQ== afenioux@bureautique.rezopole.net',
            ],
    }

##### END rezopole #####

##### BEGIN solnet  #####

    @add_user { 'solnet':
        email => 'noc@solnet.ch',
        company => 'Solnet',
        uid => 5068,
        groups => ['ring-users'],
    }
    @authorized_keys { 'solnet':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDMYlqkBGkoKb0+laUPEArpUsPYN5WwpDWelXMoIcdT7Lq98MR7cJbMQGJv0q5kAzTrFMOWBTKHQIBc8w3BEFuT7n4LWuy6mnO5O2+v7Z3k4VGRstgHulNF/ORBdhbpJiP9WXXAFrjHL4M5SHfzVG50yAoL1Y9veX8A5ion/tZ1T6+CYbzQvz7dN9C4iGqWHtKe22BhPcUUIwG+lxVVJG75qfvs4IKd0ggLb46fYZqb6SFrLo3C8Oj+hJLFqgPAF7x9ESz1EHGl8zDfpciJxf3qYHcop/F3zxijIHpcjwtF22YcpZysQY+NIFvdM9iFSsanFlJgtAuCvTDJYpfoMQsi+eFxSmJGGbf4mPBXx7vCPyHZBwOE6xk4DyKrsTmgaodye/caHTvK8YJIunXYkM+ui4BGPsRlmH1Hc7rbHgFSmfqy+U//+h19RY3K75KbV8H/IGyuNdZ1vPjRLkRb1o3IFbeVtgue0D8eKGkIwfFvdUmN6neD9qYeQPk69Xl3ujrY7wSWlcLBIumRzQIfpwuAmwUZ7GSfjeeJyYHP2W7sEANP52Z+kARrfihAFqNs/UkP/CtbEwty8PEAv+RewBzjeW65KKF2jvKgAGOdA4BcrIA+YiuKkYLl3v5gQFVJpK0Dn+T5MaygSjnKvmNzH+gNnYcQrPm2579W8C8TkheVXQ== nlnog@solnet.ch'
            ],
    }

##### END solnet #####

##### BEGIN boxed-it #####

    @add_user { 'boxed-it':
        email => 'netadmin@boxed-it.com',
        company => 'Boxed IT Ltd.',
        uid => 5069,
        groups => ['ring-users'],
    }
    @authorized_keys { 'boxed-it':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA02/wbrDk8zfI7rS8ODjB27dDqoe6nchCf0c0d4OKnnBiHLHjBU1AzBn95sKa/VIdWSMtTdhDUa289XLA301AvuXaF7CtYvlOaZKMULijeaVr4HotRGNK2VphQsvFpCE8vFzxjozBscnm+vTHdPBFHHOqyO/leM9epg/CSExG+kfBfpGKAzcFG7SwsgtqCI8dzNa3KZxINEZj/rQVghS9mjhBCh9QJgnXcFFZC4n2rxdHc7Rf/sCc3CvJnTctGc0VJmoThrG3txmI7KvT5Yts+JvC5VHZ+IB5VHJEr+ml5GE+iaUnGb3btAqmnsxRBpxVix+itiKsxvyyqqOuuwouhw== tom@magic',
            ],
    }

##### END boxed-it #####

##### BEGIN spacenet #####

    @add_user { 'spacenet':
        email => 'netmaster-dist@space.net',
        company => 'SpaceNet AG',
        uid => 5070,
        groups => ['ring-users'],
    }
    @authorized_keys { 'spacenet':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA2HkaeILiO0zPNCeOxzvLBupjqtZ6bjKna7rpEnpk2wj8U5/m6AEkl7E5vLhytrgo5B3D1zxgR5a81oYlUaXMSSnr7y8l0+3tdS5wSrNlTPcuFM6OeMJ2gx+kOXHkgWUar1xIiEIBpTMgcCGVodEJkv9fhXdABrZZCVDzHU52i/tVZ0OycIHuoXeIPpS88wDZgref/DrZuvz3KjKvctxqOyt+SNGWsFygLKEi475W8qaOt8QIuExoRXxUPabKN7q8CWCRlV2FKLv8AxCJngOjwSkZ6VLXF7+Gl72UAzhjLDo8d2N8l/Be3XQBPw8tfRoYHyXlG3hx118oP4qmD1LMRQ== gert@moebius3.space.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA5eRCNyQxIgO30YfSdwWOmY3dw5JrrHBSbo6X+kcubJoYRRgDE0nhydPBKmDvhWYgIxzpYZrY7X5ZjeoELE22+pxRq/ubX3PkTf0l8bvLZn/JrOXFrZkucRU1/YPeAa62XvsIPj09oMClJCTJlVFst+b+T4DMJDbkrdr1RqbuttJaZ/xPKizr9gwlkvSp9GqCSUcgw9O9vpgSXd7ogfgmg+eR6Nj0jPMmKeV3ai/5l15xfaLivuLaA0sT9Ozi1JoBjG4nJve86ooXv7jEs1WoGux5xa76KIJn+Kv3ADV7m8mwv+pMlPGzi8uFbu0Yt/IXPj/jiim3AjbecSXhSsrXVw== jpd@moebius3.space.net',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAKJoXsxc+n742aWryZlgLlSbrUUb1WqXXcwNOexAEAkPRPfZN8NA8aRFrXX/t02+XNE6KsC75C9BCaDBfzTZNGhyq7S10N0le0atQvzdwQEJS3SjLCqncIfFtDRwPS/C3QoTUUkfAm+BJf5gW8wXr6F3/yZ+oeBwgs/6N1LuOTRtAAAAFQC/sR+szr64pNObeWTFhBHMvpQKMQAAAIAx1LIzWYI7AZVoSmMyGQgKrCdR3z2M0ocVV9e/nRagrW8pxi8drsSbNXolswce5lB1oh39PqMQEFPvGugFxgStTfYm+uHN2Nl+Pb6B4Pt2LkG8pHeX2LfVctS4b9tzyIgN/Mef2trf8tc9MW8CgyFcxyYwTuGsnaPgBq8rmH262gAAAIAb0EEEVG2i9pZJb61bn6yPyYzuJu36PANDieRo3LxlJiNjrmLO0K+w+gt76RjHw05jtru36XH2K5O5Vzf8GhvStfhYoBrZvxvRhDWMlzf+V+yf1veKTrcL3I5hX+m994NFimZKSGir2DPKGpCmT4mkDWQ3xVeNY6Z5FHG8d2KdFg== kts@moebius2.space.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA9OVb21dZxlxkZOoM9orOmzwHR4ejRVU7sQ8gSx1orWdJ/XOPQjv3GUjt1mbYF1IwdOZJQC4SdgPBai1I9npOwM/nK0AQ5rYYPx1YF83OIZ2S5l8l4d2PB4eN5Urn0dYPZUEvhV6Cs5IFXNhXlYc8ym2N5WkHnLpBAyvKBkAbgwU2/6AU+WhMcjoq1gS9tIAbVLY54pOCy7d9H7Lut/t5yALa40nHTVCUGSp31DxVKwuKSrLuMD4t77oHK8IoHS68vPAdk5hj5V2yq7iWF9c+oSbgLeFrcxNsOX3Oa0uecErECJPLSdIUIWVoGT+44qBmo0K5Lo+jYRwLyH6xb12yGw== mme@moebius3.space.net',
        ],
    }

##### END spacenet #####

##### BEGIN mironet #####

    @add_user { 'mironet':
        email => 'noc@mironet.ch',
        company => 'MiroNet GmbH',
        uid => 5071,
        groups => ['ring-users'],
    }
    @authorized_keys { 'mironet':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAyzRI4GmVcOvOm1j6JjMQV/+H1cnP7VSBMsP+einHp9F+M+r8XTjGezNlzguM9FkdP4heffYJbMBcoVqNpxaTc4jvRuLGQKF9/bY4FTrBvBEfIOjIQPnTgHucgQO39y+SRt+3k5fxu+HMLk4aSBaMdKcixUY/n2qwHa/tnMBerV66a/SDrdr91kLDXHFFVvofreFB0lmSIqLGqzmH9tT0B0WNDjBiP/R+QN2xGuET7XsL5PvwAOAQLnEij1PE0nllgRiHA7fLGgpaaFt0BuPN/p4MfRB+/PZxIIvlX6gOiLAywCFQDXPLoiq5i2thjKREZgRqII+GvtADfStkbNVDSw== nano@macbook.home',
            ],
    }

##### END mironet #####

##### BEGIN seeweb #####

    @add_user { 'seeweb':
        email => 'noc@seeweb.it',
        company => 'Seeweb s.r.l.',
        uid => 5072,
        groups => ['ring-users'],
    }
    @authorized_keys { 'seeweb':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAxlcb96uJhrNAstsPI/OLjfeSlv7ha+hcr+zPe623k7RxpxpOxtiWYRlnt7O1LNGkNuuMS1zKQtWbQLKtjBys6xZkieQpt/AlbaHzqxyVA9PiiMUiHvjH6+jbYa0N7w8+f0kllWLcafdyfuTER8Lj55sjAvL6/WON1UYr+8famx8= md@wonderland.linux.it',
            ],
    }

##### END seeweb #####

##### BEGIN networkdesign #####

    @add_user { 'networkdesign':
        email => 'noc@ndnet.ch',
        company => 'Network Design GmbH',
        uid => 5073,
        groups => ['ring-users'],
        ensure  => absent,
    }

##### END networkdesign #####

##### BEGIN zensystems #####

    @add_user { 'zensystems':
        email => 'noc@zensystems.dk',
        company => 'Zen Systems',
        uid => 5074,
        groups => ['ring-users'],
    }
    @authorized_keys { 'zensystems':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAoqUkQbD6a+rapnErF0y3Wj9UDYc392E66qEeULBK90Fdk+b8aRsskBPm1ygp1dAI2kNUVC3EdZ9McRBB1JYl/zTZ4vuWOaPwm9hR7fzjTFNczwuW3BKMcK8iYWl3dfWNNUsqXOkdtQrdhy72ok4+iGaMFO70ms8WoLkMailUOsnSsVfvusnXDfFc6+qQleA/wM2kJoq8vcVTsYlPajY/vVErXrfhVqR5FKNCf3jw5uBDnsFNRfeA300bZQlkpFY5Y/ZufbqwbgT7OQFNpVedsfrvYlKH7pazmXWzDobbf6JEtgn3QwcRdtGwxgK16i53ZcdnHRNxLCGQEi6puFzzEQ== hein@gavey.zensystems.dk',
            ],
    }

##### END networkdesign #####

##### BEGIN westnet #####

    @add_user { 'westnet':
        email => 'noc@westnet.ie',
        company => 'Westnet',
        uid => 5075,
        groups => ['ring-users'],
    }
    @authorized_keys { 'westnet':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAACBALG7J4Yi0Ro1DpG8MNmoY319C7SHrDrfBHclRGvPbhmhhJUSytXSo5Gsk7/gvNcJFTKyt4c3NIKWzZ7SXG79U6JLzS/BL/G8S1L1LKGE42IrsopbS+n6/AtDx4vdWNRAhrdBZMgEQpQNnXiHbjUL8lxioe6Yb17ZAYww6tjUg7l9AAAAFQCnDFY0FkME5aFplnujmx+5LwXk0wAAAIAZOSOWhzTG20nKhpnH4uwBXhIZaGtwfMwgMpHs1EXeutovvZWJhyE+9dPYLO+cK4+ZQvV73CfO5BL+Ozc6ZHtYasguY0uZDWSGrCJztaTQMhDRbSYRa+uGODFKQ1Ap5O+dFfDiEJAguDaz6nFEKSppAJv1ZUK2DnXZk/pIQ3xh4gAAAIBc2q8uPlPVCgKJynoWa2u1GKE3ckLy8weaxcAYmxo0JMbiHmfYXtiwX6zCkF9wxNoN4xiNnJQp6DoU5XsANDseO7DHDNS9VhK6dx2cDx9SaEuWeWMrUEnMHVY/5GO1Fs44hu25itCDPk1P+jutFV5Ov0NyQCwRpJP3kENmVZKsSA== paul@orac',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFFNxG+31F+No3tqzmNuqfzORzSj37GjY1hLNNvHdRBN1IyDwYqDvfHCZ8l+tGRJOCuWT/ttgl3GfULCgsFjfFtNJBGcFKf/r1rsOcVp8PyeXqAULU3A3+fzE3wAUPibOAXEo/a/LnmzaZD+dm+mSuHQiB+v9D2QjUSfhjHQZ5O06DQZ7vtfCeUMJA+aEe+naW8LTAybDeqiwGOksb5yb0pbOfo4qUFMyi3+ywOeka9gYgpDKRwDDb6nwYERUUlxx1kFqutlMc//ESNTtg1HhIFI7/gx0BtEYyKlBTYEc0KOfKw5QmRuPBEU4Ho81eFEwOxnHVVkXviZvIbzTjPQ+Z bminish@redbox.lan',
        ],
    }
##### END westnet #####

##### BEGIN kantonsschulezug #####

    @add_user { 'kantonsschulezug':
        email => 'noc@as34288.net',
        company => 'Kantonsschule Zug',
        uid => 5076,
        groups => ['ring-users'],
    }
    @authorized_keys { 'kantonsschulezug':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAGxKBimIrAZcKsqr6Hmm1zrihDctrazw6q3ycf1MByZSzAKs6BJ8Y6+tPcLCJvb7cwg70SB+JHxpR5fp1yOryKIc7Imwlha6a6Y+8NwuqWIbTTMBAuUJPZsbfddH4u+hx5D4/shAoqRg+e7M6ADs9E/Y5nHGjhXv5p98KmiwLkRV2lB6ciefoDCEb+iqOwi8YyBp9CXbF57f6AH2y8DoZj8cImW+GrppSQHVv32KOsKcbKem6P2SJADlxJMG/7ca07xKldz2zXwxKC70MNAgY5D4DUCI5xGj15NTdyoWgDXDWnlg6/zzDsi8x+0KBJaVlyvUOo0AJ4cIpkZNqXNHwBc= wiwi@as34288.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAFjmuvqoUzOY4n/ZeqpLDJ6u6l8LhuSCYYYhynsxHHRsS+VhL5pB8Exj4b96QOsF8lJodCAv1Y++UcPbCEXx75rs9Pff03kD2ekQrv1d5Doi/sGeD8By2sO0+p8H3jW8PLdR+rdLycPSwyb1o1Uwxu5wGjciNRhqRhkLMdIf+hQOK9Q9O4gJrQOD7ArkeS/V773mYXqOtS2leeeJOpTpa3TQasRoOmaXciYvXzblFGvJyG4jXL1Ejpqm7oqkjM41gRgLI1v9Ugoo2ajX2Wi19XZsN85GgVx7w8jjEUhDNW1zgUorlD0wpIoXmRDsyvCh4mvWh3wivhYPh9FsWiZ5ltE= alex@as34288.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAFpzPqVUjvr1IpLdmlfKgxcZ+Y6EwaFlD25Evtrp2EW4ex3Qsm0kxyqlstGZSUoY3CaXSSCTdsXpurZ2gbPbmrTxmaXd8RvPwajW7Z1AdZDrLk5NtuOpBCQVrZJOaRU1w3BMTUm6eU2GhjHunPyLIZlmCRwPCDU8OOaWOw5jIFKURc/2hiT5g4n6rckzHVnVMdOUwFlBTa3aWg/QUM6R17eGLpVxIHZA/DgPgH4ra8V6uubP6OsRWLTObvJ7C6KPVM21PcaaADEPHw5sbdZbkHa2B9PTknJDd2zzTzMiJ6QXR3LvQ1/L9aizbf4FsAdtpyWsbiS8ux1sTBaOikMgxU0= winston@as34288.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAF6U1XW4Xg/nofWWLJfJBwaQ+QkMv6e/E3oy7swBtuHUd9swmkv9bQv60U8kiMCAo+k2z8KK3CcYmMZrG/cf0n+Iye3XffvUP/BcSpq/ZcvXevTTAbty4mnoIgSWlkETskBzS0sCb1xG673lXoTXqBmZT1GmIJu8Sk8tF8MOQ/zDA3x0felKGXykPax1ynKVygy51FdCSFCHmzdznvA3InItwo0eHHG2oScNRrkC+5B360gfXlHWKSCtLRNqtTBX83sOEKC7OSljjhoAB9o/XBJ18qa9N9rvDMzRcWZvGl8BbGojGJUvcL1V6BKrlXxI/5vJYF2KVz0OlySORDp0Rf0= pru@as34288.net',
        ],
    }
##### END kantonsschulezug #####

##### BEGIN filoo #####

    @add_user { 'filoo':
        email => 'noc@filoo.de',
        company => 'Filoo GmbH',
        uid => 5077,
        groups => ['ring-users'],
    }
    @authorized_keys { 'filoo':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAAEBAJ9Wmb0rq58TbYzo97tYcK4J4hjW8ippUt7GwIG2W2hU2r+d4zi+C7ylkUqP4F9DHFFK7QCNFINCjEYt7xVdcIx+Xqxte0dr/8VCVuVWXk2aEEpYqHza2gef8yd4PnSwf5Kav7YbygWTy9/ElYZB01YcZAF0S7xfAGBt3mmMpshiK8uSDgjs9XVBAV1g30k4Cg7IJCl3r/i/CPSn3Ilz+5YN3pOVoTFFU1KWM7tlc7K3CkV+CMZUUjhkV0rO5368aiPCdQdXkkoZrXmxQxknlGKTbgAooQJIPfMV6veDmp0J+JmXOJDVLWRJHkrIHnk5LiLTYQpm0eyuDR98ibKQwwEAAAAVAPdLrLIhZ5jePFSK88hjIbfK2XONAAABAARif5RfvT1X57fXsnkZrpLwnYmEGqiP+Mc9kJ7O2qOiraD+paL7C1l5zwx/C8+YlKSwVKSeGnbocQaJhL1sZmKbDfxZ1GDL2RQPFOPI2XaWPgfMETVPWR6la/j1v6K3OBmgvGoX7qcKU+aR4aseBnt51DOESToUR6mOE3j4gnccH5Lji3ql5EBEkMKPAqAnALuIi2FT0n5/q9hovGUR9uwsydx9jiwrjHxCMV1lojD79L9aXJw6vajJ1Gm1IEIdIq6sQ3XgYgnScR+XPlyICqD77ZUl/h3rXab1Qat/ipaceNbvPZG7RcPAXuDBuhDphBXThAfDS1S9IvhX+9SsgiMAAAEBAISwVFCtwg/LeRllgxEdPCmQUEywWkQo0P49EENfbzAqS0vGmBbWBEFSQ+Pg5LA4etWn9nO9buLkQL+K5qob6gBMSx/oqLunBQ1pBf/WnScXbJ2Hnbs4NhnWnu8EwaloqIVtZXoZJO8uhRanKOJFaLd+wug/HEFTzi3PMgyoMgv4IpZGtsbv0vTvNVIbFeLgcr3SGA44zVTdUf1DxYHQiig1FfTV55kGv7q3RVc4LeDsJZ/kLYYZxd2h0I8bX6OPF0I6LIMndmO3wBfMq6JcQHjsRvh5IRztBAXBQnYSPOZdu5Z/LPct0mKwbCJucpzv8tob5R8E6w/jBnly1ZsHKzw= chris@filoo',
        ],
    }

##### END filoo #####

##### BEGIN nessus #####

    @add_user { 'nessus':
        email => 'td@nessus.at',
        company => 'Nessus GmbH',
        uid => 5078,
        groups => ['ring-users'],
    }
    @authorized_keys { 'nessus':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJeX1saUzvOdltwTegyOUOAO41GYFtEBS7rJIjXSK9b8yjw2uxyWJ6WmOv5RBnUnuo3CmVdFNVTUhVGy5IBtVriP4ccUJSBEivWOvsaJRizz86Ojp8Yy6QiDztMh9qSr/pgvK8Iz5VpXHYmhRZsMreYA48TWgczFtORKMWaJWSmgTs9H0nehyD5IYAfGhh3ZO9tJIA26DU35ct69EhGB5ovOoXYPTAWEO63nYijy1/1nDzTczMFqt3RWB+V7sr3tKiJLT9WtLCtMkLVUpJz+6AZMYBwbojm9QBbJCPjdBF9mqkLN4wrRLOjXmlLqeJTL4oaXnKmzvMF9XxUl+LtmUV space@space-macpro',
        ],
    }

##### END nessus #####

##### BEGIN amazon #####

    @add_user { 'amazon':
        email => 'colinwh@amazon.com',
        company => 'Amazon Web Services',
        uid => 5079,
        groups => ['ring-users'],
    }
    @authorized_keys { 'amazon':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCPn7U4dmSLbO7RWO3c/iz0JNd56UCac0hPOJ+TWb7Ucbfcf07fhyfG8QX0RJpm/qiNJQTf8MDTbEnjeVpXnvwtCK5PV7W+gBwT3tqomkjr06/xjzwjwemrokd3yhkDcsoPtOOIOiMLmXj4EWf3eFPzgZ6jOls+01zatB5H4zkH0V7Uh+cDEvgC72jlSSkBwkiaPR76hoALu4lJoOXbPdaEUL8FmV56O83hglrDaIlxOvX0/Ex2m73SNd3AD6IdM83ycRunAG3GJUgEJ1yUCxgoLChulhxW4dCblG00/PySlYoQ4OSBmzpKZt/rBbyIF3YFFDtGOQDiw2l0BegJ+Y/r nlnog-key',
        ],
    }

##### END amazon #####

##### BEGIN equinixnl #####

    @add_user { 'equinixnl':
        email => 'servicedesk.nl@eu.equinix.com',
        company => 'Equinix NL',
        uid => 5080,
        groups => ['ring-users'],
    }
    @authorized_keys { 'equinixnl':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCM8n4yposdFemLg3NUvd6xMmY9wVxo0rmMkGpUwnhKZ0XQP7UBNsBu90jkesK9jTQ49zTgYq03CkHVdCZJDEyZRVbF2G2skeuN5JKnfdYgzFBthndzR/B+ePvkHTz+v+IMxsocvOCYt4ovISwW88SyHGwxrc34UUDCUfHr8F3Hjwj9EUNKu8SwMmAiO4qP3UHtbbSYZXUtwWs+4rtpjAuA3j/8LlEXMp8bmhoJvb643BDw4I7K3r0LlJukOVwnJtL7ycaID7VIUew4Q6KDb1YA72rdCodaGlYiTH7PshEHc8aDwV0/RjpUUqv3UK5SOpszpXXECSdQyC4LrO0oz3Q7 jorik',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDphzEkcizgKMYkzat5bqKqemp9CoBSBzxuyR6HqofAFxsLICafmHv5UFgE6OPjrBeQQwGmLS1hVDnfuJ5gysdCnjUTUi4TkEKP1Eg2f5U7HupCekQop66WYyIT5P5PWGij0MxaXVlIA4c2G5Y+pQ+YCg4tpeGWI6MRcNpLGR1pmHp0rA2KWoH1TuqzBsNrh6ttHFxKrP/xm3jF9JZzdNnDY7qMg1dabAf9Ayf46cKy7+T1sWwMvWkv7wtMGYqK7JjfrM84t1qxUdUwtWQj2ac/9BGleom++m4eyECSSncKtyg0MyEkeAEGtd9b82F/7zj5YPPTHj1bqu+oejOOTL9 tjerkjan',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFzM9FdDEq98Ess6XWPjBu4O2b6TBx3uufT4FY4czRZBlwiGt2TWNdmJLuVuRy65r1rZByRyJopDtkMuIRsXdP5B7xZeD7jIhSj01msAtpOt2DxPD3y8u4xlPjDEPsA4igzMp4FNZQFHhCwXtQwIksm3T/GAwK/1kUbro/bT5cb9MAMjd8rWBGJA9ClSqrOjKr6InwhoRnNL4PxRRE9QRlr56GAq7YXjPGgZ6fCBDQlI3yJwPo1O2ASrjFU00XfFQA1hJ6FALuyEIm/ts4L/z4B6f0zpzS6PmfnM/iSjVxK6U+ApOyNtGWMkFm5xkgerqzieuQwgsnoL4gx287bzKt lennard',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEApPdfbRrd0tqcDB4t0WeqDCyQRUZ6bUvRgte6eQEqKJdo9GycABZTLkGZQQKJfyv/XnDZZuXV83uObuS+kuoM3Dj4z1pKoLOFL8skCM86hgivR0rubc0LdXhmVOscPgGrrVKzkQ7IK/6MQikVbF00hJ11AWmznAfydCwJgaqtnnkzoQnFsSPRQqyAJg8zq2TiX7OAaH0jlY95zhu+Wci5qVYAFkvMjlf2aqWD6Bt7H15tUMvk172uem1mV/e3TKBUoT+VNFb89naRPaUATXnManLlnT9tsGTGhkFnhXWzzMAjoXR9ehSPj94T6Bck1rkilPrHhQM30hlnbMW4IxCMtQ== michael',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA4dqv/WEO+3aRTnrKAhrvo5i2MuyW1NnYpevnqaW2a+DUHDH7unDopYNtdFzPpNlIDfoI6zu6wFYrpk+nDgQuHkMx8q3Xi1txAbvpOSMmP1Alqk/b+Zci5Szy5rB4hLXBimUqTh/mNtATHAGj5HE/uHiZV3rPv2bAt4eDIahTSjC9/up2ebXt+SsL0Hxa2viWMAm37ncY8+ZkAKdoplR7EKm8UxovkpuB8Xc74tQGOfwOcpI8fKOdUfAk8Q840tfKdWQETRoHOgw0F//VsOGxYHE5X0K9tfwnMsjh6Y9z2qWann1YYce5KHu22ur5sxLh0poP/Vz4PBu+dq+2gXUWPw== hans',
        ],
    }
##### END equinixnl #####

##### BEGIN lchost #####

    @add_user { 'lchost':
        email => 'phil@lchost.co.uk',
        company => 'LCHost',
        uid => 5081,
        groups => ['ring-users'],
    }
    @authorized_keys { 'lchost':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIBO+f37Egb/S+yvWF5YzXXacaOhGK9WXbgTc8hOxKxkfLbIEyQL4Li+xG48aLUJfU1ombW6jhrB5SUUf2MefdSQoLw/0ycWGExB1voCIxH9LcgnZCT86LguoRd4+fNsR28RpikirjZIcOO7SL33NfVNn2mofXvMa6OFYxaz8rbX8Q== phil@lchost.co.uk',
        ],
    }
##### END lchost #####

##### BEGIN hostway #####

    @add_user { 'hostway':
        email => 'noc@netnation.com',
        company => 'Hostway',
        uid => 5082,
        groups => ['ring-users'],
    }
    @authorized_keys { 'hostway':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEAvs/X3YfKkCsnjTIfdGW7NoKm20C0WmArRsHw3E/EJ7r3sbYfsxWNwDc5FTXLoN2tqJrAUKS9PihYFZF335KiwxSkjXiJo3sbrVqlhGFsCc+B5C+tu+qhqOCj1jgW0VQB3j6X6rtml/FLSoxlnl+qz1xgo9UByyw9vHtMfPaXuxwAoV20pzHPXVnHJjIIArxbnVXU4zv7YD9TAYolTWtVD/ZUx7O/YkmckZast775HdBzZOTRKtc9fMRT1ywRA9DkgHjvOnr4g3oTtvHo+KbektnDT9MMC03sJ3/qJiYdAIHB+J4Y85UC482IeyiR2tu8K2jgwu9rDZZNmIXTvFAysW/RgI7JfcApGTNWd//zg1nFRTmgFrRe6Fhd7x77tqMJZJE+bAM+ky8ZHHIjzIxHNiW2TNGn6glv4yD6ECCQhp7s0uV6Alxc2bKIaduGpOBW/DhzirR6lgyklR0tlhxQs1SR5YxGfkeR10dbjaMSJB1G7GiRMRI4qrqwfghYgClT2J2jDZHxMOyeZ8/9lXLNuTKXIrft1Lwr1R1RGhN3h9ft17gNY0XeyUH0TcIqdNn6E+fYZfFdtZa91kXQBR+po8PEim1CgCpVhfZP9FEAj7Ti4698Gl2LxdlwDOhgCr61hitJJ3k4LHAEecsKIrHb0U1xNPJhP+CLZioF/br3z4c= ryanm@ryanm',
            'ssh-dss AAAAB3NzaC1kc3MAAAEBANTZvQHaSkqWJOQcpETgL0q/PWdvQHdAyuMUEbtv6Bbmi75Lkqr+Rr6a9tJ8dOnZcReBuSKQHFOVA0I6fUW64lbFvMYnB9rSNeHSThKm6EzBUeRXWnkgaAsyPOzOzYLPdGyiBt2IGgUjidza58TJQGpMZKbE+/gkIro6iTc/ZNwkAmIKy3/AKPZYOAqMicHSykMHPPXrQd2Di63q7bY38zKF0JxJbymr64VyTmSiA1KoRsMdoEtuet4s8CKu+pkQ1a1MwHSuh6uBgQljmPCOJ5PrcbAZRCJH6yo9NZGZd9hfauRl4Vwrm3+wFz98JKkf7sF4Uca7vQIfjyFzBnXo4xcAAAAVAOdUDi/PUlsY+SaTSKpHUlMqOiIvAAABAGzH/RWeT0K51O8Eq/sPalnFu8cWT5oABoWcQYiG4nbVGswlC1k11HXm4dsgv5oipxNYDyi3E3E3OrD4UlcXyXcIeOtq29f79nztO1SECzth6jD8IfQWYji9/ZM2Tg3LIrRPyRQKz/OnbKSesrlk+0DKaUHExcOl6Z0VAhi1fE6L64raxotR5F7w7VUGPReRG8HfMagQAbONE4Ccdm5ahY66q7eDf3qOjwEmSlDnYb3OWWVR1EIDKkkIRXGV2NrQXIOJf+YSRtPDgM+2zMsuaKa8VN+9+UcGnnM8AbCKmHfHK4FpB3/sdnnlKhZAnZtXt9e3gfpgQIqhZZ4ViqWh2eAAAAEAN3/U288YBuzLqoZOEjniY+0eV+Dsr3JvKrNXSIxKLhxZVtfqyki5+SWMjrGBflcUcf9aQ3ZExf+jbwpl1/KJLYwiP16iPEJAsg3WcxPN3Vr3cNkpqbZyizCGJVhcoBgWl39phrBfvEBahBvyyZp1veoLu3z53PXo1kopzjlZAyYicGf8fd8zze3m2iXAVUywWEHMiyW8LnCkXI9lIYyQ+cAtGV5CV/TBfg+KLEhb/T5S63dhN5kEtqZO3zAoNIVDkygpb6yFpfFC05B7sbnmfflipVWj2DNjFV13aiGX4eDheba4in7+9bugXaHPxc6bZMd4y08SmTthI6tiu9D5HQ== sim@simonk',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCxhHDiL23iq+VkpAnR02uSB1LG1Vd56t1epOz1kAefR+2EJLu9XE5BakD7allaP+m9iiLCBaWEP3ru/PEpVYHWuL69ywdT8AqwkgH+A8wGEMUKA0An7IrYZG37Bl6LdTsozG+thZRrdnfQTBew657KSaQ9lb8FfbOnstcNdpMmzusrthUdVttFU1PU4Jntt55O3oi236wFbY6fIKWPnOX5FAMRF/KqW1yBcUgNrT+IwlIgte7COmSiwOsIGNyG8Z5i8AWxGPyZgvBNIf1OLtwpHr6MUxUno3Spa3ySa/oXfFwF+28LXG/i1RK5O+6yMzpOw34BeJJgy4PhXYeSp9x5 brent.sachnoff',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAMPATzgTz387C8mI9R784FMSELiurbGR39BFIc38zQpWw3rFYUxXFZuLfMUf1FS6GHakEOd3uXSsDfWVSq7i/J1Fk9ZxDBswdg9qawwk0jQ2pKoWxAWq0iu91XJwVwujptf9r/KXAeYgoL2q6Jr+q99Q9lGWK0dGkNXmqyY6DsXbAAAAFQDAhgV2s47f+vkPZL1speuecETeEQAAAIEAwAYZVAblJNAorMyUmYsOVilYYAQ+nJpMDBowi11qJ8b8tgy9elJXXY317qoyEiZjQjJ9iJCuve6+jsTiSHTMflftTXbBoz420PHgaMCTCz4jMLZR2KP5+A1gLplH92vyNRhWDKzCHdkVyNILrSACBTSgRZbWJmUUCOZvnIhm3E0AAACAQTlxxcfyjdsE74jQO+Ylgl4GduEAwWF60H5LHvj3JcCgjZUUbnEKpVbfwbOwryJovBPwdbka2FsbePsQywL66We5SOsyQFhoa2wux7qeWUMKzrV72RDGqK4JFKD2JqsLtFS2nl5TiFDxFMoiGS3KnPR1sKqgz8WDHvvCUWLBzv4= adam@adam-laptop',
        ],
    }

##### END hostway #####

##### BEGIN pcextreme #####

    @add_user { 'pcextreme':
        email => 'network@pcextreme.nl',
        company => 'PCextreme',
        uid => 5083,
        groups => ['ring-users'],
    }
    @authorized_keys { 'pcextreme':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA3WYuprfKF4Cx10KZbR9hpgKy89MRkT1yWCty8PUHVTIwFcwYRFNaBRncb0LZ8MJUWm8GcohYEJMDduNbFRiU1VxMYuxYEyD5gQTS9+8u1PlLo+ZgKOHMhl+d4aDDRqec8i+qMbYbcsOzhWTtXhT0HutQ559DqxAj602kmFqGad8ZT49U20GmCkSFWdQZR1s8jZrnU+NQO73+YMU0qQ2y7qNOfMFdnWK975FBRD73SXiv+N9t6kMLUD3+nEPMQKn4+mxpVhsBQzuX2O0smgvmjWY3WHHZDmN7D7EQI+D9AZQfmuQLVyNbiv/uHOaHNQbrI1IyJOJGa5AcLx9ga2k3/w== thomas@pcextreme.nl',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAyrHMWelsBMdJW2O+Vs/WGD/3Pf89rW72tqcYnFp6Xs+XWhEiWqoyQls55CyttAUO0gU/HrneV69Ts9Bnh+hVgXNZXHRepVbBTIYBvN3RH4lLHBfbL0rVH0SbmgTJBI+O48b0lsLpm+FQ3HLUGN77QWUyoRaRrtF88n9VXXCZDwNVNwZ3vPBDpi82Dou1Cwt5XAIVOXwwetHXo96lmruIJQcGdnZzn3hj+10R5FAkq88bY2+4ZGpG/W4dqvmBXc41+fmoSF0M68fwrUqqhCBS5sdgRyvbEkBcaoV/R5l5BU++Xk+2lKMkiH7vedhbkSZIQeSFCsWxSfae+OlnRrRAJw== root@crew.pcextreme.nl',
        ],
    }

##### END pcextreme #####

##### BEGIN antagonist #####

    @add_user { 'antagonist':
        email => 'systeembeheer@antagonist.nl',
        company => 'Antagonist',
        uid => 5084,
        groups => ['ring-users'],
    }
    @authorized_keys { 'antagonist':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6rv0fYmFDSeFwSowAUN7XcagzRrlxLeiAuYlgHws9zU9/uRZ8xUnkYPrAigwbwVfUHX1I3yQcsSjm1uEfu6QEuaHpiq88TNCMzkI+bbS1xOMwFQL4sIJfupZ6NeF4aD9h1odrmxcrei70ajLBU3fy17gzLU+zTrcZuuu2vXuaYgu1BeUGNFLbV9+VsnGqC7TTh9WGFrntkFszjP230j02FR8wtXpu8eBOiugdFIEVBmVca8DhXMQZlvSiiur1nkdnGCuB+5cAZUjWTzbvWhUi00UFor1vphV4MgW6pKTAaUBXqDTNqseNFsi52kncVh+Ylu5XIt/8lO4f5IhKL4hMQ== mail@wwdevries.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA0db7IR7DqTd1w17G6cZFQHHEwruJhOUje6YHRPwbKH7ueOyujsXaiBan3n5q5HG/nFmZQr6tyIbwoaqOBiA2d0/ZVeaxQWQveLYJO+ZbyHNlGB8fb7BvP20F/PdQrphfveWPOVrwgi4OZ9juCBbxPFmJUsQyC1LZ+OfusDQWAe0deY2ocWaXkJGF4//ZNeFhsrBCXTyAC6krLEm13gLuDvg+Ex46kZHs41lfeeYb26mf0s6smCdrZDL3QPo7xJGj0lEjdeUB1Djugu/+FNUu2+UPdcCP/f+nl7T3FQUiPUcUCdQPNys/uuzra+KSfvIsY7jd+u1dT5tz4cdnP+8nXQ== erikjan@erikjan-desktop',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwaSD2XPczhErd8B/BwaPJQO/NRd7DjUZ1sAek9f31zEx5j2fdz1AA4FXl0AxgH+MrCG4JfOLC+IXy876oSxCdO/8NWYuyWerhn8lzxbpusJSd3qvKsOmXev3itZ8ft+4DHtEsDKq/6O5wUPQQKfsvxjEaC+Ke2XNXb9eGL3eWJLm+X0yY55YwxM+f0WqJm6WCu+m0Y09bSZUCgSpSRZlQBP3eC/OShue4m/+WSzRmEEtUAAWa1kazGWLski/dSYEpwp9OHR/xd34CB4VftWkXozqJD+2kn+JlHhLhi45da6DItztci5TNe64H0GwouwKNAcsQQvk0h8FMZOTHg9nh erikjan@erikjan-desk',
        ],
    }

##### END antagonist #####

##### BEGIN nts #####

    @add_user { 'nts':
        email => 'noc@nts.ch',
        company => 'NTS Workspace AG',
        uid => 5085,
        groups => ['ring-users'],
    }
    @authorized_keys { 'nts':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAACBAJHXyuAmrEAf0kAD1Sx4JJHUY1Y94XD86gPITXhrYWb6uSEr98+MDo9w7ivxD9dFpwu3jplUkSwKWBqmDOFCFw3th5Xdno524kQ87U/T6q49ff5cIjPDjioli2EV2N1j/tZ1Q9uH69TFeFjrDMOm2n6wGeqFvchmojzWOzSG8aI5AAAAFQDhsSMBIluMe/zC2CSlIuux/PwNMQAAAIBaSKgjguWYAfws0RYoRQ6e2A0tIwgkVVKDF4gKt+ydOqn0WIw4s/SrLbVXRBa6bhhxCx+qBd6Ssd4PBTAOggfDffuipRBkCs3H8VH/8waJRND1KOpzYeVQ9IUuQW60h4cu2Cxyq/0W/KrZrByplOEzt1WCP/I3Myy5odNVHewAtgAAAIBcgfRBAHOTgPb767XuLi00fBuT4X5b8ZIQIOUpRhT1DFpOWDs8xP6Rw3T2mA970+5L8IHng1NCDHR/prxr/JhYHSII1tbIT1ptVRwry0Ff/qUdhik00Jxue3sS3T8sNXamtDjRKGvq82NpsLEJsNm86wHNrCBAYDfozUaQ6eD6jQ== imported-openssh-key',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDA+PAnWYjzg4xcyhjC/DE7f6rdmEjBVjkzKrn7kn5BTYUjDXA3JlKSNO4QOIZvutfqBcbQcdSnhgRKU395uQhteMhw17E4cNKI5RDKpBH4pZKvT0QzJB1Hi00PASyfI1KoTb2ZiB30GIQRMB8wkxYh6OxKjTfyf3vwCbrdH+PGZG4ylz8fQOJsp2OEEW4nY39a3/5KLMgqxFWYbl/f/Hvo/r1j/wmp0FenFMjMbk1U1oDsop/9edtkRT5f34HA56kIf+sSEetSbsVFfLhYrp/D/De5SXN9NAJuPUGTWUzUP4zA+SujUJMdUVcxc6Y31OimSj4/zmKYmCFGU4ZZ42UL nts@ring-client',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAsJkZohQUX+GmWjNoJElbD1vDA/ReuLif81IWB2BW1iIvGz7LFaDZB3ippLzJVBTsb0cUGCqDVJDGiIshf0NZJSGr62kFzr7hkiD9gAxekvo2YEie5u/no7hjh27EP8MVdzc64Zh1CxC+SvzlIxJv46MqtfZauwN3TPPr0C+p33u2afpb6RBQa2+tyBDFqb23IJEs/F7A8nHFwGbHBHzaSHF3uckBH7pCGoTN4Uno/mA2356FUA7tlZ3ZCS7+5Gt7UiPwbV0IftVu6yhKoj93aqzQfUkvAquP66y6g2wwDXmStA97L/spL6e7mSiS3zVgiw33RvyoljzAGseUeVi26Q== dhi@dhi-laptop',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIB+w3GvFYNs19gxq5SrtqZ9lGPi0DhiTpRB8Vde0ASNzlXeXdGugMoykxUtM7JmIm/rXqzTRaGdeinkMUm7l8PgPABOiR3wx9mfc7Vfo7CbVKIZuU/Wm+ihYC+soDP0+p7xhVkuQoxmwM3XH1CfrGKT7SwCbo3uZxOh42CQFatxdQ== rsa-key-20100917',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDXY/gjTCXLeJhO3nIhiHVomWD1sVriKHciAyRLxQ2d+wWXt+TSX68Agdh+RYlP9xD+hxhaBylfnlbdfI0gLSrIGB1NW9wyfb78BlAIbsrwAQGRhv2jkFRrxw0PTMnWOJbKc92KUEsFrAW1eZVjD1DXV2sF/K82Q7Hzwuavlrhmi3W24oXS1oP/+FU4eb3lXhFUvtd/7L6EoWy8hr8z/8+CRWBmV+jdyVXeK3r6Jx22nxTxJnBNn3WnJGSr+PXwnYxuVHz0vpbMAE2zswT02fgRYx61SKlpzcnDwzIXE3M35hT3YikenHkoeyR+FkEqB6chTIWDLwcC45ht3nLXzDdF obi@dhcp-153.be.nts.ch',
        ],
    }

##### END nts #####

##### BEGIN multiplay #####

    @add_user { 'multiplay':
        email => 'noc@multiplay.co.uk',
        company => 'Multiplay',
        uid => 5086,
        groups => ['ring-users'],
    }
    @authorized_keys { 'multiplay':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIBstcIqCoFrphfMD4C3r7da2OwiTyGrkJh4zf4IAINvF6KzFdvi0JdaojRDg6JpJ1g6P40ffTEYbqBlVHMyfW12e4ATi3krh5SdUW47ENrpyWacZJuNFQea79O2GmUACyqAVKCtK4Yj2YWQ8NyOhjdFzUNsVRNZnSorPBr+FTyYJw== giles',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAoB4gKVwPnsAox4fkh/tUgXZLlPwQUtVyA3+/qNzZUaqkJkA/MfrHsqkvljvFB9jGWR6E4AwGus8mDeyGUUhIl6VH/N5UXCmRuoGhZbiF6KJhC8Z4346rPQj5YKtGPUp0aViQXnyBAA16cgqF4TO8mTi8Zr3hDZwCb1MxjIs8/8k= Dan Offord',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDV04ViUEQkX6kARmy7B2LYkLwDjIFhAE4UVI+VLZl5QtRd67cpV6DAA3yBFZwdn2fCJaQN4LaVi/ByWmfyAhPmwans9KXfTmVhn8mTyzuVAzmLvSESPuWnxDxbC+RuPvE6PBW/HKoDpn1SBX22zYc1s2AVPQ0W0zJxJY4G/5UCC40/NR07FZ3Slx+F4BAPvYUPaxTXQo5jEoLYRywO+ugf2pi6mhwp9NOaRGMRZ6inpYLpH8A2YNDhselyzkEp7kCEJFfQMFR9Kusnx3j5YNbVijjrUX6yqn642969tlTVB1j4k9mYR7i7TlRobY3q/6nrKLt4LrxoZHfDpadQCSB DavidGroves@eve',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEA2gMbw0m5GR/FKBf9oeln5seL3SkcTPXiolpIYSDBnDCr+/BTKPjfx6bAgibpZYPJym0WlXwGCKWXLX93gz3EjJY8rFJ0XgjmSmvaiHG9XLb5Z9Epcb3Xak0M/wX6Fy0xtgGjPf1K8/NjC9bDdvhlz7Xb1hYpPWhDoNZBZM7sxGs= "Tom Penrose"',
        ],
    }

##### END multiplay #####

##### BEGIN softlayer #####

    @add_user { 'softlayer':
        email => 'noc@softlayer.com',
        company => 'Softlayer Technologies',
        uid => 5087,
        groups => ['ring-users'],
    }
    @authorized_keys { 'softlayer':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAg566CmYYJF34jLrYduI2hsdSzGbpfV+D8t9VqI1RNKUMWzZ1ipnyV24LWYwQTDU6mGrrHdFdBVaFK0Qprxl+ZbBziferA8zESEFJ6d9nQNmL0jjXCaAGsZpB4PaderoDQYV7BDqW68wZjmrgUUg2zaxGFUOZzZAqfZVHa/FbLAbGsT2RJUcbKYtolqqiWTklvZRm6AMI3/VDJ5cT5F7yG3DMpNG0WUUZF8SzrgcjUR1JubYejszF1XFk755IXsLQ0trcCdeMleRLExiheOMYSJFDJx5gXm5s0rknEfKV5iq7IgE98yTdSeiSK8zaxvRgxYhQaWXHDLquJ2ZEzePsZw== softlayer-nlnog',
        ],
    }

##### END softlayer #####

##### BEGIN imagine #####

    @add_user { 'imagine':
        email => 'networkoperations@imaginegroup.ie',
        company => 'Imagine Communications Ltd.',
        uid => 5088,
        groups => ['ring-users'],
    }
    @authorized_keys { 'imagine':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA2b38xyQjXQpigh0pXu0qRNTueER10GghGMTX6CrkRMtSZgfx3aU2Ji4FQvlRxh9fXGLqHomhS5wjSqaLmTyXiluDXrncMNHYRGM433h7NYE+gkmstnZwVjdDJK+s7xgYFmp1JQ0Hr+9PVWdWBNZ1yIY1HLYn4sbkTeVIm0eLQG2jWzVvSUtG0DNK7Dzg/SJpG13vsrX7Se+HXge3eTSK1W47q5fYqpdt5pH2DkkiY897hNRkdDy4FK2NZBq1o9lQtJHPNZtN2a5S0FvepiAqNXx9e9Ey8sKME57qlnHLPA0NQ/6psq+937TboQmoQpcmVax1PGgX/pPX08jhsxmcuw== dermot@mon2.internal.nw',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAv0jQZjkUIwDxutbbkMqD1WgbGSG3zmvIQWvZxTsk/sd9J7WttGnMyVzz2aUsJ5dUavHxvt9axmJr4k7aEaYwZRFsFEsnJuizqbXbJCNF3y2rpoTZRadcxKHyh6gySyCll7thLHLgvJsW3jPHnTfGAsxncfsWFO9MdGLUfGu+ebV9poiIiVM/MpHlAX01PJtkP51xaXFNZQjRu9uN/IJmEQbwCtjzhXEBCF1A4emfTVIwnBUMjnxiMDkL07pATrfOlKHwnsZGZnLrJphfw4nv62WCwaqkRxGEcnqm4Pm8LtvY8fDFcwq+ag816JssXoito9/VLKvoAHc421HOQ9qHfw== Barry O\'Donovan',
        ],
    }

##### END imagine #####

##### BEGIN speedpartner #####

    @add_user { 'speedpartner':
        email => 'info@speedpartner.de',
        company => 'SpeedPartner GmbH',
        uid => 5089,
        groups => ['ring-users'],
    }
    @authorized_keys { 'speedpartner':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQBwJTzLBlbBl8iJgXt8bCKhim2pHdrct+uu93y/CXDKEI8QCzRIWZ/83S/NucmlXXg21nVqpComhlr+r83sNHqSZ95vmEy8mvztHl21y9SMassGSUvz5flEsOcmosxdU4B1CFGuIrTzWao8T5cEMmX7RcwbSxLI4tD4ca1mCsbljbjkG+3kPDawFQPW2io/UG/3FBxjGIObyXF+Xjx7X+wGhKNZ6H4HUPtT3Ps5YAYQEW7wc0MQj35dxA8Li4Z0rE1Eu/A7Zqhv3l+KjwAnm586TuxTS61pkL5ufyjmwwZKbKHhmGH/EMTvoe4F7ll1tDh14NjJS96tsXAOzLCX4Vuz',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQBd590mCsFILaigJYQFcNROV1JgAoJjU9xJPV1NNSR+gga+tAaZ4jrFn7EqQc1U5HIedAyICSdb+bDd4s+Bq39Xpdk7J466pg7emIh3ZrDsO+eRkHUOy7cCcuNR/biejPcxJ5VYXcRNxTvPtOy6K3b+bXXyviBefqQntgXu3FO2BhtyBx+1pyEwT1aeyiHEPQRe/Ti9vigz5TNrS2JTIX+3MRhJa3R/q4m4j6XjWvoKUJrSqPEgNHPpHpw601dHtSgRK7D55x6Nqx1EA604gtIwqAc/48Gwtpz+2NrsRyevqaU7IrgCt7wl0gGBpWMGmMnmraDsLTvbWpGrNAmwVn3/',
        ],
    }

##### END speedpartner #####

##### BEGIN gossamerthreads #####

    @add_user { 'gossamerthreads':
        email => 'noc-nlnog@gt.net',
        company => 'Gossamer Threads Inc.',
        uid => 5090,
        groups => ['ring-users'],
    }
    @authorized_keys { 'gossamerthreads':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgAAqnUtFGSnPSS0j9uxvadMSigNEr7bERX8o2bno5deLEQHTSccSeXy7FU+lL7qMOm4jdILT1/beA5GOa0c9hDbQBYOWbvw/8PCD23pa0HUlcd8vmbhQPX6ZAr0Sat+Fw8k7eGi9TGR6OpPlJZbx0FXB+cPYQwyTCjL6mAQSVjs/DO0bt7Td+yM9iNy0m/GdvV2qAu8Qy2+a3F+/tBSkkXLj+AnFXXfgfSnALZG3WUFSeafQsYvKr/7NjuwhXEhyOx5ij2u2/bCez1qunEs1xlA60a+g1x9kFd4D8Bj7tumdQqwkZCBF/3QKQ0PCBagOQ/F2V/xpqfhCGUZc1Rh+tAkF9/EPdCBdwohwAxTzGIBrm4kpgZfI8FqMODcdRYgr+7awd9BdT8AW5WKc2ib3tiTKwpD/JFwFAOflnCw6nBAWFq6F1swQbmJL5YGe8ui7PAUDZIGOjlF6DNw1slv0qMSw0n2tHjWpzTF9U8qU/7BXL4NSNLX4IYycBsS24YC+UtVfgJiAmcw141QmC31YCDKem+OsWAoMKx3IATJYdwzt0LjVcQ+9NiKNMOilNlEULly7gauJsQAntYHS15UimuXzezOAUDqd2g0fKB+gZun84YxSmfr6BUQ4rMmeF8Cpgwp2cdQZE0/M2exiJDnZXxWXEru+fW8MluY8Bmfnb5ypQ== root@ns1',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgAA1awSvThsxjVoemoD+K8tLFw9ETSTAmktm96oxom8apJh/3SDPkArNznlL1Fp+apg2plODCqWBwFgIeMqeBLE02++y32pvP0l/jIO5KHHlisTli1vbJ12lob/6AnTK8Ga9fFDUmccCRLmi10/9z+qhh2DE3YZSgbdLzpK7wkWsQSEr1DXb2Qt/iZPbHqEjcn5LQ/zPx130Fi17g/rsX8R6Qd81p5whxG+ANnFBOQQ5qcH7uuoKhAvpRBpysyLYuM/QHDu7p6bpTyNFE5j60fyg+f75oK+bd6jIMEb0a3Uv9VtmFkqTo+wH0KyjgGiWSQA/sYkiN4uj+CW93hoZaR+xOCFdAxbUzfNhbIow7jX8QVLJJvQ4XCgKCohmmD2UmZ3gGF+CCRwPJ7Ap+B8XS0aY0p6Sh+f9uQdW7k+KpAdJ/xwwEOVUsN63JJCfo+YUn5QpoNYuMjQzLVhj+1X0bxvMyyRSeHY91k7hsv6NUK3eOXlzrUXEsJ2hyDjB8RfoWDBnXy6zYo6D/HSXiHn3LLQORy2mrTrmRiJzXM5TkUjgOpz+4X8b93doHCeT83XOGbC0IcNGwUsVhI2KbhgzhbaWCwexGq5e2fkbJkj4mHYCoR8rlM8UjaS06rGuiDg+n0wzRVcVcPgcRDFjHvDij6Q8zIq9eyv84BeInaA51/88w== root@ns1',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgAA0w+W0f8hbLOtxZn3Ymh0vQbBO6TJ+uVqvrNjbk40vU/WUBlQ58sT6yk9n4bKvBHB9jb0jmhIPptNHPYu9VdB5zhNR+rzi3d+uL1R7y4eq9FaLhwBzTpDcX9dHJp+mwBS3NriDeZP3zkyJ2+SOQApNkiqEWFXGUKNlvB2DNAZI1JixfwaBmzyGn3Drsg1yGKh+TdqdHY8cvUxi0I8tD3zkt01vqbJD8buHZVrb4FiRhTT7meAO0V6KlAVliV22rLbKlPhkwdESpGZlPRNPuBY4uqtKRsaEfSDUG3Obvj2+dTApN8gtDJtT7uvLD7HJ/DW7xQpfu0m2diNX1O/neioq0XsbkQ8L5/MD4r2NlDTcS1knR5YxKs/2d/YuTuY0fm3qdsiKZ83Y5oJhbgi/sjNKf76nRAVQIieTddcf1R9lrbSD/Dh0DaZPnaTKa5QB6S128kdNReuDGm7ROL5xlyoRSu/CqFbFbvWaJfaetXfH8A/AqiRuiPE1l/yKlCkUynjWFqOpz1x5a5PIWf21x8/BfkzBltTyljNZQwDbwZRWri3nuAnbF18tir0zvcS29ZUZm2QiO/DwhjFFUiZ5c/Ja100xRNGnM4uc6UxmTeD5TCGp8GUkoYSM82m7MzChuIl+vg0LOaoc0aWZ4b50lLVTZH3yR8aGwE/cLMkJvre0w== root@ns1',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgAA4tqVBdMZ4X3F0YR7nJq6I8U9UJxcPFJ98b5ZByfstASe+9LhiiTT4App1fogqJA7kQf95HmHsXSZrHB6Fraz/EHdr2MceD0w8nyoN0hvNO0jt8tDh+hpfeseWuOqTsPzHXMAf/K1g6pdMr85KomBVoHdnBJY7la0ODWQijsngw8HGBZUQVE5pkamT9MqY0lPl3JbyUaJLA2k9ybq0VPf4ki53NuKXqqSMLgzgIr5kVSytOs3m0qU6R/n8KZWmXosW1MosB3GCTBGR4F0kMvAAvMpDCnZa8yv2tN9yDID6lwT9V22NiI1QwgsScNJczRcFtNWs+JbdDWHkwqE6y9pcUeM7ZrBrFI2X8I2aYaASVKBtC42h+9oIAiG0oqOSSTf9Ug2YWDY9Z1jaXHtguHysn5kvo49LWhE6NazslpziAcAPsvo1JjvE2zEwKeSha58q2XIU2X1RIB4hR6YhjUgzyG0Z0Rlx6Tt+UOZQuDkuqlydh6w6Oi5hOWpD2M1sal0RaHQo+9C+eODLOjy8eD9wITn41eURa8Il3++pm01f2l0Is5PFJqAMBOPfqnCwtMDSwmAcly0Fk57wcYOeSp4oPZMhipvvGMKFvTHUcQP58NgQ4NPKGBgPfdkOJKFjNs4R4yk4NZEnARTbCQPrJn/fVe/Khdw6eTgBBKzq9I+Qw== root@ns1',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6Qijk6/PBiO7zCtLOWEgY5LCMJmuMvBgfvml9oxjsHTd8NZGOpPz8/Ad0q+Afi+L+wXqWNu4HMfDNZiEaYa/3FT250rxpnC5JBzVHTLZemtgm3nBXR4cjMTZV+9x0OLFZGujh8wjcSo59HfmGxltW7cQ2TspPPuk1el2McldVlovq6KagoNfque2B/RGK6Y/OOYwYcpOwA7g56R6pQzotlgmnr8OvANZXUKs70dWiavS2a4dsOu7z/b8vCDetwjZ0Av2sMPUAan7M6u67GalY3Lx+47HTb9DH6YISl+3hKhDUdNxv5CKwQARSyW6kwgW2lLNQaTgIgCKYdZb5xvteQ== root@ns1',
        ],
    }

##### END gossamerthreads #####

##### BEGIN towardex #####

    @add_user { 'towardex':
        email => 'ip-admin@twdx.net',
        company => 'TowardEX Carrier Services',
        uid => 5091,
        groups => ['ring-users'],
    }
    @authorized_keys { 'towardex':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCTZfGsKq33sb1pw9OO/bHAY0MuVZtKuuP84xRE1MdxkRBYxHr5w1A1hu1+O6V1fievcWxyji3yie3AvCO7QFyl3wNZ7ZVcY1iNOEj9le8gTq29WhqalRqdFUN1Dm2Z83JenNhx35uspARZ+VnfeLtVvhXujCUl+o/WEO/wl/rN3xKV8+K+uJsHKq5J6G1Lyg90y3/isIcUCcWYHAhrI6HeKQZyQFNRmv/IrNxtK+NPq6ztlre8LmerglyNn+EdVV5t02do0/LpE8sWx1ib1dAaOCSQSv5nDbtTd29wbff4i4F2nLiEx0VptEH3lb9cAEQL6iEcBvlo7aFiH686srrp lee@towardex',
            ],
    }

##### END towardex #####

##### BEGIN simplytransit #####

    @add_user { 'simplytransit':
        email => 'nt@names.co.uk',
        company => 'Simply Transit',
        uid => 5092,
        groups => ['ring-users'],
    }
    @authorized_keys { 'simplytransit':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAiTEcV2pjn3DYPCgjULm3AOjjfD1sdOVpq6vTW7KpMpfF/rDz5iOBz2jIpxyeNcurywdotgYN0CB71Ik6ciJMM6U3uXDK0+p0DISi23Fv4zvuWYa/zTqNAl/yD3b2N9d+SAIG9mRceDeJHV1Dd5Y5cAgTn60HYHtq8lE730JiQFM= rsa-key-20060527-Brian Ross',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQBuwueyh+GdXZk6JTqRdDMsICz5SzWDh76HboYRzEdioZAOEF0IogAtVt76ds8EHHl9rT8UbbeHX8wfgWcL+ouBmDqioJfQqZaQn3nKPVsjalerZmpBGOUd5qXbBCiQaMUSzEW5oeB9n+FaQt0Dd34AUthdZTEZZbACK1X0yrr8NIN4JIK5V+AZgOt2MDC/pQMkqt4YZZDhhJbG5DZibYr+9VALh+8Vgc+4stWGktyQ7KlgcNphujg+4un/i5cy1HvqNN7Ep46Wa5MArPgBTQiAbc9B8fsDjDLn3PDAdgcgy5SKaGqwKWZnwCD0hwwcfEg9JSzP9NPMXyZux9jZxsih mtaylor@names.co.uk    #8/5/2012 additions',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDFva0eOTamUxz+HGkR4EEdDf+Ifr7U6rqKEv44cvG6NQ3HwutoEl8Kdwl8Aas8GJYannzyvx9IJDrXGOAHtSJe4zulqdcVzQ6PzGVHA1VBYYpQjPBA7pnXPFrOw92PtTd32UOa93J8g7g0mRYRSXg0fwlZMCoLzwXO2LQ4tJyz5Vxsat1X9HxpTQkbL7tivcsnJjhDz+g5DpEp17J63tDME8xk/GrcPNx/rmOOsQgIW5yuoBw1rgq/Kl6j6s57f4lZBoADFBVRpM7tcEfEp5akM8TeANyryPZW677afhT0ny4rdZLQNlzudTkxIsUm/A1pqUOiGE5uSGzDlCsN1v3+A9O2NbT7jWpX6+uR2CO6Ot3l7HhjNxpU+zsPdINXcfJB6yYjpckjWLDObxPdBoxLGz0dv/1bahMp0v9L4qiRBKHmaKnTIRqR+sA0e6pGrqS7YGt1Vnop50s+R6VQL/Fo8VyBKMAPFNxEQpSU8yD7i4eIahPMfUXjagLeqvSohg8YS7dQxFvQEI2tuuQit93qxGR2dsVrj20u/gB9uzuIWVAAllE+APgPcS1ORh4Z5aBBpDRoVCtgyutFPD6Dfw5gTIdnBNctqO2xPE+1ynzESyncXNYZEKY65IopPzB9x5dhaNdN/zPf0qqR2tXM362t+0rB6SMI9f64hYvcJFJ23Q== dtinklin@Dustins-MacBook-Pro.local',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAMx6D93yBLQ5JTyOr+od5hf4BvCjHNkC9bqNfVQyFwfvZcJAezsO/CUfHbFplbkkISpdCr2WVBDoCx72wXuSAe5UcDy0GuzKv7Cwud68FNyl7gKceBmkkm1UbUyyKGrA+gYFbltcNNPPWKYkbqHueuzxZ/AmBzAlEMyIIkpt4hKfAAAAFQDRmT2WJ6YCkYLkhe8u6QPxaLZmGwAAAIEAzFvt5aGBR2g+4YP0EcbU9O7GZTQqb/nXIATo4o1Plv9hbgy/fwXQe6TjV4k83Y6bGOTJApABPMbwA/1W7+Q7jUlGJm1J9tPALrom9BX8mnIbvuih9xeOa/jes4rL25ctVjilhsFFvDhCsWV8YTLpWXkXVH4M+/0XXk+Uv5Xj1y4AAACAbRS3bSPOX7jA43xrTdk/bokn5/BvbFMkSjcwj8nq5cZp8hAjV28fmHWP/4UdMRyHqLhF6Wh3rNcjp6C6Kp/65Tt1nacbKRDUsEgaOaBc1PmnkB4RPxus7KDvVOmSwh6wwfSKNSGb4r3l+AlW2gfh34KrWo8ekL5d/Daep9nzfTk= villo@screanzati.wired',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEAy8sIjs57vaYI41gWqht3kgF2JeZeSFh2BuB1v2+gbM3D2QqWBuVueTYSIcktXx0fDp1YdrmyNhaNQpNsd0bMl/sDZUy/zPRf4ad5OJwWwNwfiRr7V6qAqonzP4M2//k2KiUzfGgY3ISaqKYTKM0V6ZvNzCdg+KeSIf0zqoWaba92aR956bAaF4v85g3uh5JtHmST50o04RucdK48Jk7jFCGE3w7cdC0OjAWhkQPv2HvO1TMDHwHRXZYq/mpMEZ/+nQgxeybxCrf/te50swJ97fEIgkQJVLxTio4E9jn/bungzCP56XaO37yWWkDkCRG4Gg/PD4nhqdIfPkr0BUc7otaHfax9HOwuVMmR2lD+kT4hQdkrIg2rvRwYBSaWx7C5yeqE3gUCi/tQ09ioM9wsSnXeQxtO1kAnUDO2KujJHGvwXsw7Yi8cs/3ZvYJDaofBfBZlZ6N2+nb4bCIxA4qbn7rlInniHUcS5yBvf8AwNktkreAxEcPuRvce3HlkUtSIfAzo8l5nw27g+VtwyHwoDqKSX/fKocB7sdiG8+/gSotppcZAw774qUTE9kuIUWMKNmJskPpHl5CXaXW/YCPX++doT5T9oz6YH+b5a1Be8bW+O18/aDWKmGb28kxE1gjT9jJ99WncjXER9qowFdzDy2KN378fWHdW7bGvuabC2Ns= vinceh@Vince',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAutgM726z3N0h/oj2pzLLaH/DgKrFo2ETBqs4GMaFDM1KLEN5DazH1SwVu1NnDz5Lf223XEeXbJJVtOCGUaL5mFD9SIbYvt2/CrlGGjplLYfAbwahl2whCrt3HqlpmnaBZeHME4ktt9kH7jSziLClOMRjUHeMCvocFMZPzLpYUlkLe4N4Bx2B9SeEetwMtCOv61ogUyVsKf1AftMNoAoEyj/1qWiontcGKfNdVb43kZZfA67CV9UrebtEVMnDc50UkjKJ3+DGyeR6/uRHwkKwCfAxzhCf4HMdjoNepu51wrvwlFNgiciHWt1GnT3PqWRO66SG5yj1UJ8SpE9ZQ8y5HQ== alessandro.ceccotti@dada.net',
            'ssh-dss AAAAB3NzaC1kc3MAAACBANKa6rup6AMtWoZAcrHuLAGTIlYPA3dsuuXdj2McweLSL2MBrxOUNczLc++s91ztVcrfDjUz6uNJfjG8x964J+6QGzX8Xw99vbYA55p1EkP2RJKwL0MMN2BCUpFheXNSZri9WTw2EBkQneVfPaIfEcnS+14olvs31KEd0WaF7V6nAAAAFQDLWf+FJthxVoHHFSjS2Dw5Oo8rVwAAAIEAs4mKaj0tXWRXg3VAgI+fu52GJi524fOB4DftcnBlwWmlJWM9npt96R61dd7F1PpgPZG1f7PPIw5Yu61nlbsXAjIkyOy0v2tUoUJhUjF5W9b9qDhaaVytdAPo1tP2YGEwgo0vcRurtMvo7UUc+GBLY5FpgYAHkdmSNDY/cSaAmNoAAACAa9F0QwgkPXdKXMZQE6Pd7fNo4W6CA0jnSotiWs2qJMcExZb8xfMfAoEDyZARwv06UP5JbYkN0EAlwjyjwUPiiw2ZFb9hFITZb0Jy27gDBAqftT3iQz6AHsqk4ykPsrzdW4hhu8UIfHqjoUKSJIxw1MN7SMSJuB2HaY/4aneO8AE= fabio.coatti@dada.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAyxokS5OyxUGzCG8uP3T7+KHwBIXZ7Qi45FO8ik2aK5Su8Q4MYFwGSB0LLtTBDdTVAA0aqmUfina8oSgIDnMZ9+Woovsa8aH42qw6QuZwBF/RX8UYZKkmAcfc0v0nsGJYkDD+TJrlWdmJ46Z8LFx/2co9QL67WDr6RTAvzM+WrTelQsipdyiP2JIu9q6HJ48s7UtoEydAkA6+uoTgE0hhsepVouNMwIyELw6bod25qjljFH9HKz6/6rIkRmtpdgJFjSFEn1vgDUsQ/MOXRAuk14yKgaJ9wx5rAWEJ1f6gnOqKwLUWWuro00klH0QARIyLX+k518NQJPoBSuaWCBF1ww== dario.calamai@dada.net',
            'ssh-dss AAAAB3NzaC1kc3MAAAEBANslHvBfL6Qb9USyxy1A1ny1/rOnbjDZLt5BoaeTG86n5HprnJRth5GkKWNLPT4vnpNDglcg7MGyAnB7EFJRqePzMoDuKmoixLKgN5wLEZ1LDXRpZPhy8a6+GQe65NDFrvL0Odfh1edySUqbus54l07UFL5P0nBA0Mg4I1KlrJG8/+0pJCci4CCOfpvdJblWz/SmsYC7QRLv1ApvhQctyVr3nKU3VeGEdWMkypUwCseksblESnMftXUpk72gRX6NNJbkuty+FUz3LKHc0iR6Gpa/8holJFwOukrOD2RqjywW+qK7hwU8qcpuUU/cRLSniJLuzPUtDdz7TIMuTO9nCY8AAAAVAMMNJeLie6MZUdpcq1YT0hbJkqP7AAABAQDO2byp4XsbuaRNjTjAa0I8b6vmfb7XtGw2/fHyv9zwKnaU0sZLw5bsuZNUyQ4qM154H26jeALO4tYHFiEsxRnS7w8BqCUtmnLkwegTqIs0QENDnajri3K/SXycMOpNKb0sv99bg8ODnVRVvZyjR9PKECRtbxc0jlnT4euH7RrX5KxtlIJQLTNLVVohQJAXk6A2jjlXM4ro+OBeybq0ONw4zWE4qdomcq4uM/vm5WbUg4z3y7VmJNvaPISAFAc7kuotRNhZrmFvoP9/ROXAOYcQiglq06Ssx/pH0cEOd1QgJNgV4W9iLvXFC/lHXj1Rs6yI3VkD0MTaTiGrTUlnvy2zAAABAQDAVh0Pcar0USOK4b1fXsW9x5ZDbkzgLBmdGbqhnyFARBZ6Mn9qHNtc4HPazhmnaYd/vUbOBS42hXg3sRRdQUlFXBkoQD8A2bNhjxzp6FCuPt+ANksV7NRoBs/u7krue3Wo6kz/2KBQT+xGbB0QG0yU/nRMPpZNvB75X3v1ufZDCVBrWN25W1lUp13hP2Z8FUTz7+o8mnK7ojYVBozKrVNi+YZtSXrKlKRUwBuNIDCSGtp4cf27K7zEfyQd5xfWlOnjnPRnArJFP5voeSTRgW0UAneLvjUaziU89Rl5rpaghV2mal0jZNgmxGp9hooQAICj8GEsdKFvHlUS0EX/PW+a daniele.melosi@dada.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA1eEm3a7VokSreuthh45kLoMmCbJPukg4q4hG9k3vUbcSwdtI3JMhjOGRyUZWDzHL58i1h5xFSPgj944388cTD4KXPWD4qmHvsUToL64+5ippCG1TGeINeLDMfe/Iwjx2sq5AsKtQ1+LF5JgABYT5JiPPB6C09MNnWb9i+/MSI8FQXqDiKwM7Ye/haAIvlIeGDRfquMjBVX49LvXI+aXpngG75HkVQvU66fVOli6jRaHARndpCDSuEKdtM54f3hbioWIV24M7hbgmYh53eX5+1gpUmRWQIOCGSwNXU+e8yooJVVrBVijD6DUp63Mf6XbDYrXarIVjAXrTLTSSEiEz6w== emiliano.certini@dada.net',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAM7mzNnxO6HrnzonXNyJe4EsEU5pj/8XJBrHeXCJ73lI16Wce0rmlGOdSYJMN+PJKEGvBdHziOuwerxcM9LK/5QYj4t+emXs22iu4tNyVML2Joh1DtP+w731IwBzUbgZbl/tBhPDasfa18u2EGlUoHPD14E4ueO4dAygu0xW6w0TAAAAFQD+Do/JRQ2ntyYfTql2/lX89J4UqwAAAIAIkKf4nnzjt3gtesq3os7swvn9lNVPIA2lFDWNOxzoiObstdZLXCvx8piNizm2s02jkWOp3QrIVpgzghhuq9JdoIvLsX6w6eFb61u6Ix3QzRfyMmviNzaqFsarAD2n7VXcz8o1Dv3TFIBZb7Z3yj49T8+zgqaKs4hFUPSrzWbndwAAAIA5kEQgn06OmiQNf5JoBLx3JQoju1L3uOR/NDAIOwbWN34xKuDdtkctQN9MBP6Mz4bt9Pv0GQgYvop2/udogyZN+VHToIFlAC/WEd6R/6iOEVRrvj8CPFoGPbTghzD6JHpsCnzHhAAVlfGED652GlZlxEtXUjZPeL3Mqi2VCn4gxA== fabio.calissi@register.it',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAMXtE5fq7543+IQWJpFX2iJXEiGrPTwHJuc0bjWgbQqE8wwgJZTTmMjS9GdfDDA5Pvt+fTGvtgaE2A2TP8UEhghb+UWwIHNP1a711CPE+qzel7RjYzWDwfWeb4aM0FnU1HjeSCykgoGqRXR18/grDIUmHMMWD9PP14hj9CgzVenfAAAAFQDJCIxHIt4uffhakzBZXlQ7nK3LAQAAAIAbMYGbW9yT6UVJ4XvXbVWqKmfx6KC3cC2RRDqqB2+QSJxQqYq1ddnRuLSWXC+3RgmBRNc36HmKrkiXKnXZWSgd2BJh1YOW9ajZl0wKGnoZz8e3tG8FJC9bCaMCJYZ4kIsLgH2m+ctSzVdWU/bW+BQPXimAgDJFatUkeohBVmHrEwAAAIBKGVAuE3m5oYx7P932nyfKVVNvCYe4by3bz2w0W+pQHpXlSbCVkrcsnmnBusQF88sHZxNZ0JAH7TPoVHkWL84MkTm3tHLl/7jtehiZxaI4hBCkPMCek8eaSV/JDtCZQLdI7JwSxV9wxi8XRXFSIu/JhBdRs6uhp0pd8d3L9vr82A== lorenzo.conti@dada.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEAwfxRKz+77ZtXvsLwDfU/7E2LzG7kKswVn34ZRu4IcWTwENVMC1EADQ7T48DCXGO/oCjQlUEir1l5X2UHhf//Cb8k5HTmkFJkcv2Njh5an4B6SkLRcsm1znnp2UAkalNlsFBsVawQMAg8h9CD+j6fKl3zqw/B7DEdKX+8kf6svNDUC/G6fdsIJ9XzZMaXFSutMlJQLrKU0fSNsXwzNhEPCEXnb55AiwA1cL9Wg8StEyJZ6+rid8eZAkHstEnvIxpOl7PU2hzAWqsuzrsuD3ODtz/0LZybNm60HZEGUyUBQM0RmB31UI3dcjttDBcABjGWdEDBbW9unt10G3chF5fFaOZXaNe6+JIgz+bgoha8y51BlGhTiXvS/wpjSmnv8gIBLdfUxh+EcUQoK1zwRPiOd/1iARnmLflDMhHi69lH0nuke3YNBCbaLOb2XkSIwKHboItiHrty9/sdvYw6DrDSBjIAnGSMOdWZgIsCYeRL4vOXUvlTwCGgFGNjoZjxX/1TDno+7g+7rlksgjfrLQWY1xScO5UEqoXzEU/7yLros7lsO8/2rfMWE8QV7B/6ZbUxG+2i39K+vypYp/1ZJe10r5BJe6dRROcpH7qMPIWbvf01Iy/gC2HZevK583nX7pjUP2NJdMeF/08Rdprpb4nnZJ6Qqg7My7yEg29lTZRJVdE= luca.pasquali@dada.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCkEojQ2S9InEx/hRLzNTd4b9HqyZxb+lep1pTa5ggnY24vIUe/wgyndNK03S3QrE8Lo1ntQChbY6kKiB1wSDhb60ua7EBSi0BPCXfXAAbfXVLknuOxMXXRR4VlWrKADN7QJMnMXUPh1XftykgxguPgRVvAfVLXeAcSWHLFZfn168FPHYtjbu7bteis3S+rCiCfIvlXH9YEjegW1UoeWYKyfql18Rd0QvKgRsG1Fcafwu2tsJ2TwzeDpVm/jW8roJSeVtX06Et6cQTidPAOCcyev/Bh6vo7gzBh9qXwrE8KB9/qe7jr9h1y1oMA8+aoLC+XbVsqZy0dOIVSxUWEOsDn leonardo.sorrentino@dada.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3e0el/uCfKel8NJeDujgRn05fMdaGy5+TYwITlt7rLDJs/5ntk80l1h4E+6Ot/iUiEpWBbiYjbfo4v5ITZUfX4diNeo/+zMtXNr6Y9193JgxDrqYLklqvASZcmGeqVhRVWkHyj1e7YzSJ1NHnIwFDdLNC9ZaA84eruyHhzQvkBZkXDPeJFx/JiuVQ12aL25aYkAwRd97CmbUZQnYN7UHRpZcHZJZFz4OfQ/dCX0rlZZka+J8FtRcj0F0/AkCbOdrIDdRf2+V68ovuivZbq9ansu7Cf66JD9ovzM5GyDZnmioBuCl78pJrgCtRnhNjrZ1il+FEvhf3OuWOEe2iaAVV matteo.gaito@dada.eu',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEApghwSibeWYyqp1OYllTiiIxRoC0LiEuVIrhWAUnHN+DINeGs9/bPx5m/odBxOO59tgl0uo5Eo7LDPX6/j8jEHB7POA3Ibrn8Unw8ZY/45yFKpqNzVmXgsox6VvD2DOALyyELeqkkDo8pQzcEJaPKwfspwSCH7fXDOQ0AzhUrP3X7ptBHdTqRbPtER9khWKGrLPznoGGqadatWU2OZlSoULdyKbFikgfOpubNMJHG8w0xUR+Y8cs+YYJU95L6GcXbyav0DiiGpeN5POp+NFWBZZziGjLW6VvZp+nM8mujYralxF7j4p0z5lVKPgbW02Aw2kl733WppirUDDkS2TenKw== massimiliano.mannozzi@dada.net',
            'ssh-dss AAAAB3NzaC1kc3MAAACBALhglolBA7ov9qHJaYbus7mwaqOhBQsNMOwUTFwmDwqn7KYsk+eI8VgzdHl3AwUpkzXdxpIbvwjhR+5KQ+iwnSYTQDeHPcXhNu1P0+5LpwIuidWaP9Ds0LaGeCzlJL2tmRa/0aNyXMM7gq18M1XezdJai4LTVeKfguHgsskrdY5fAAAAFQDZxeBlm68iVeFDyjm9EithtN+bzwAAAIEAiUKosQajvs2DrHpYawryLL0nZ/thQ5jjWzBBpF8SugkeO5e/xQg0onTup9ppluWsorZz2QpiYD2LgmPSrwD3HP6jn9kkE6iA9b5+9gYpsRS6YieGCVh6MbkhZS4fnu9Y/OK9H6/so4ZcdAYFgPz4biZi15NnoKTNtfSlWGxQw5cAAACAT9N4P46cgO33suxWt52FPrxTYIU6h88bBiUNP78KuCBTfjxWxroJLphenIn1qTlKBlzb/MNJ2pLDFAKm5hBLjmcF9vygfF7bRa3URkTEGMjoKYd2rZuCXo4GM3iY9mG5GWkLgpVIwN45a80HOHh1K3cIvoYTJWF5J6Y7lyp3HXM= matteo.niccoli@dada.eu',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCVcvLC/xf6VdiDj9RUzbZS4MAOWERjZ6SiSAA7LBzlrSEllDXQnJfoPuuSvfm0i/Y1ycpiVde6OZR/3S80vXxgJANgZlevp7peh+EpzgnfIPObMI7jcBj3a8522HSWExrEKrJyrHs82Okz8chSJHMHvlnN1KHLhTqoMG7zN9Vyc1iQObQd6LmEg7wnsAlFYUr4nrnGnuJrVDpCgWVMJ3qnzvqtgrkIHmPF7hDnewRts2A2WhfIKF05W3SASFNG2COywq0nqhIFy/sCRRGWVDiWJBdKKp9/OSpLVDp+65lILOmJ3GhQSYaBneyFW4A8a6ALtTMoYgt9RyflqKGOBlfl massimo.vannucci@dada.eu',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAxyj7D1uwCliVZTiKpbYePh0rZxZmzcNveNVgL8+8Tr5Fi2b6UGdwC1iAG9QJntiVZ/Vm7961c4kHhqH3N8fuupQTKnlvFOAB8wxxsJdVzDsTyJXw8Gs9nrKg8T61LfZGI+u0Ho9Cb7npjlTWJIJDIYzmpC8HAqJWdfE3vcjVWGXzn47+SW1lJJ6Xs5p2KNzC7Rl/Y6cS+8OBF0/bqe2cDahjRx4rn0gSwuJI+EH0grS1Gi1+9+PduUPVLMXKQ8YfAQdjNmZoUKk56d4J5EoM3Jl9npUZm3IvbW5555BiKiokCkCbicbcskFr6gpB4nI89YlLoXouGpGXereqmyMBcQ== simone.berretta@dada.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA1WKUEsPASDpWWE3b5D1UqszDrGJBsJlE1D/kXr+uC9plReUwv5APmp7kNqTkf6n+8z291BzHvB4hts/++Fob+T/0JuAGLOJlsJu2JunXzIlXmRCDVXuDQcIy4z1CfV4SwObY/ZZYuF4bd3NpGLya24g2GP4qla8tjMNMRKxGn8N3J0lEiZvjUVG2HPTb63GJjAP3+GrwrZnK/U2o5iH5+u0BgNQ8cH9R7Vdk3tEn3AQnTO0AY2k5ukD2moRh9sxRg/eyVNCFIcL3RmfpFqTFnE1TvlBooWcHm7SlExw+QI/CeXXR+kLEQ+B0yl/nhSazC2VIVWZVSIGvkbqUfg5yNw== simone.logioco@register.it',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEAp+iQOOhHwePy8gBVHvXPW0Kdecuidk36CSRZEGN91jRWLZmmTttqfrqNeuocOm7X3Rp5jfHFrW+DrcUvQ9ioTyxUJpaOM2C8ppPfR/Pgv9Il9FOqVBZ7Zd+KY3qFEQQxewVjA2OqAuaUsgtCyfUxHF6zgFjBwJE9LiA/x+2mXuCBXSByvTUGmaTVzsdPmtKHJGdo9RUJEM5gIrCdlf1btCj83oIghm7W8nIx+boVMklekRR5SBl6f9RZEgpRBmsE6JJ9x8OK640wmX7fEKK5501+OOjjo1/gFyaatqPl8BoCrdW+GhfRF3h+VykXnnKS0/IBqRDxcUp8vPxpSfy22+f/m5eFLSREBsuCLfpDU55Gi1L73pe/K+QgbzIQgcgvUHdGZdpa3TWVKtJZDuRXeo/81Q911aONyRsmELXANxz4fWAjIDDKgafBR0GfU/PLAmSuLuoTg4N9UQzZIcfKQjr0BKiU3D16dL0smVEvT28zoTX3WB3/QKFtedS7CCWTN2EmlVF30S7lwAgQjLgDfBLpaV4Sw/SB8d3I8hJYaa3Pyc8ZvRnz/QutPdG7ufXQBgs4yw7TWFe93YdoT4jzUAgeY8xYVvDOnRa7xVc0RJWTqHSG8IsroqsaHng4MuZj7D7yqgI14G327s8ChylVXVfoFMwTVfgg03+Nku9p/Kc= spartaco.morelli@dada.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA1aj6KdimBiD8nYLmVUIkNuM0+uU5FQEUcw63ZdG9pqCKcUROeEj4DWM+KLwYC2Q+QOuuLd0sNcgC9lpUS09FyDf0vg7esrXBwq2ZPx4AF1hmhV5HZepyRzHN8C8waifAA7DAMgZBhoc6n9M8M1gK95JKZqDnWJw/e4Y5tHG04QX8AGk+8463KYrW9DRo4oqLTV1DVNFPThlIKuAhTD4pjZJjmLTUhwDeSgirgMuYh7pKgzJRLS3hDy35Fc6adpCi5QxxO/I+IiwR95eC1X8aXNR30z6xCAyCT+sUGOIwjiFaZFRRDktBk7XxP7ii3goPAdL8VwtRfN1w6wNjU0p5Qw== stefano.diprima@dada.net',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAMx6D93yBLQ5JTyOr+od5hf4BvCjHNkC9bqNfVQyFwfvZcJAezsO/CUfHbFplbkkISpdCr2WVBDoCx72wXuSAe5UcDy0GuzKv7Cwud68FNyl7gKceBmkkm1UbUyyKGrA+gYFbltcNNPPWKYkbqHueuzxZ/AmBzAlEMyIIkpt4hKfAAAAFQDRmT2WJ6YCkYLkhe8u6QPxaLZmGwAAAIEAzFvt5aGBR2g+4YP0EcbU9O7GZTQqb/nXIATo4o1Plv9hbgy/fwXQe6TjV4k83Y6bGOTJApABPMbwA/1W7+Q7jUlGJm1J9tPALrom9BX8mnIbvuih9xeOa/jes4rL25ctVjilhsFFvDhCsWV8YTLpWXkXVH4M+/0XXk+Uv5Xj1y4AAACAbRS3bSPOX7jA43xrTdk/bokn5/BvbFMkSjcwj8nq5cZp8hAjV28fmHWP/4UdMRyHqLhF6Wh3rNcjp6C6Kp/65Tt1nacbKRDUsEgaOaBc1PmnkB4RPxus7KDvVOmSwh6wwfSKNSGb4r3l+AlW2gfh34KrWo8ekL5d/Daep9nzfTk= luca.villani@dada.net',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAOChM9JOZYDOpLpeDrPnylrr3mXgoO4hCv/HMnkd45F1QehRYSfGlzJjLVpHou1jnyyPYX/zXR07l3tj8tghIFmCLdzOetJRAESpv6ZrHbbWNHEUiVtOtTtI7YqGxXSUSqGKdJXww9SDxcDxQHbo/Ct1RcxxGfJoXEiu5Zm+cSypAAAAFQD44pFQgwwyd3BftQNA2gO+IJ5I2QAAAIEAuFsY4+5esmcsDQvrTCr94/Tw2+5OPv0fso9sHOENxIXYw0zqWqMVaCjm8EyzoB+dDWV7GSj3ZfPux5bCFfca0pyiUy5uG0RzdCFj9tajqNSHoMGGWumOyzT0YRYRWCkkATGL1e37MQ35LLLFhkGT7h2/Ck3sIfpcW9yodyS25uEAAACBANHk1Ugfxrv86mqwMWe2Dn2Uz8OQY05j/UpaiuGI1Vsq0b3V26O9/9sU4d/R3KhvkoDRFmvFq/PVEB/CyTqaFWAXoNbeQ8oNnruGURIP2Zl/+ZGJMB3IqJq7kwRJ/viZc12H4cMU71zyRhxpG/tXqEJvXtlF/95rRl5GtMESL/wV cdp@bb',
        ],
    }

##### END simplytransit #####

##### BEGIN isarnet #####

    @add_user { 'isarnet':
        email => 'noc@isarnet.de',
        company => 'IsarNet AG',
        uid => 5093,
        groups => ['ring-users'],
    }
    @authorized_keys { 'isarnet':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAyA9qjUkDy6LPyyPjXCeCknjRhQ297XI/jbeI5VH0pnwLOiqKa5l1jXK/CAgVxHjS4kZrsonqVINWk4/1Q54Hu7vdn4dN/J8VxDLER2Pzb6pXd68L72IFjgN1tc9d9Y7YRyHwDrB9Hu9NtFWC4UWrttOg2WmWZc2B6pE7QBuH8r0= stefan@django',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDso/Q3uGVdKn/+k4hlXXqjTnlkS6LpgwY9JkQW7IyIs5pBypReRMebHIjFvpUj5/wh7Suf8dx6JObxhxJRzrS9YIo79L4QB+mhIgV121EB47oIy1H6eNsQOcfph/Q/iDFg7PvJ7TPJIw28Yxsugme6Oo+dbkPu3JmMGquHL1s9jBSeGR4xAHT6jS2B5SOVK6Oiu4puosAk7hHxRKya28km4j8Fuow6iaihCAspDzvrW6JeiF79cIIV1fWer1FrNSR/QA/XjeIReUD1cF7ej+7lbDXSOJEYsW5C5BrlPpDh0BfVnuvxhBj0wwCuL2fuEkLvemj+A4eATNHIMl9VegqZ mkopp@marvin',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQBhY/prHpaDTP/lvtzMJT7Qg+/HSEn3cj7HCoFmqenDGd9OgLi11h5qZcXTJm7CrMevwOOtCJPaaKqrd5Lr9QUHE67eGpk9RuRzK98iP5vxTM6s4M924dxY2Scfjsc5ebeCLip961gUUJFtxZBBE0X6GculEmC1QGTU5yae8dNsT/ZFhvFw8TAAirM1ap1R5fBfYMEQgtrkQky8rn094UWu5G2cqVRDUytamLuYzEopLFieS+uYx+3dqY1x3xyQTZVwsgQurCBBHtvZc2vwH58gHVnovusVf2wWohe6ItN6oni/Pug5G+qZuC4/6zvbWyNdlsLbTap8NXzycGff0ySz RSA Johannes Luther',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAsOCPX2Dl1UObXFFkMN+1WlNsCROjiZvFA2ecGdoAFdRo4deuEAKOGoYmxipgxUtaqtj1k9DHgjpuz1K6eNczOrU5pZf0L82upoqyHBE1niQdcdDRaCenqBUKTJNb5sQyYkJH5eq/f5vMIwu6OKGJ5udntAoXp0rslOw6RIX+fv+8XvQAuJQYm8ET5HC4PcUhq8WzyaeccakK5fVHXx/SDVRY6BR5CdjEHLQMrbVF/y478cmrjRmQpOgYVoBGMxRSC8Ra4YbDBHJG8nUZFqRzH7WdzhwSFCvyP6MLSmczIZaBDmOaTb7PILi9P8tCuFnXXCFwy+j4JFArIvmwJo/0kQ== jochen.siers@isarnet.de',
            ],
    }

##### END isarnet #####

##### BEGIN strato #####

    @add_user { 'strato':
        email => 'noc@strato-rz.de',
        company => 'STRATO AG',
        uid => 5094,
        groups => ['ring-users'],
    }
    @authorized_keys { 'strato':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA3LaVh6UpHC0XEywYGvkk2QiyuThQgGQRzJIhKNTQyMqDkay9BCpB0IlQEhVzmqwVtfRzvOLwsVtl0rmXvqzKXTzhgscmQ2lL++6rznKubDvJzkWF48UM3s2XEUm+oBi4qyECa56WQxC0b8c/hj5Bg4VjriDsEuXEzV97Zvh5ZxBygNQmV5z61BRLJmG/tk9VL8LLhglLr7nEjreGvt+bTda+o0EQ0QGUBBaN9zhstPhJUnzxfx0lzbvj5UwN1drGOfF4loO8FeYQlmPqzUatrpQF8o5XCop0GLZ30C9fNg4Hx6H6WliEFc0CzD/7bmfiuzAInSH7kEFot0TuLcSquQ== chris@gizmo',
            'ssh-dss AAAAB3NzaC1kc3MAAACBALND9ObbpqRdXK4BeKQaZsnbHGBJ8/TZJ8FZ77YIIkwc4EyqkXV7/yQCweVa5svMBWLuoX2M47NIPVvuoU0CzJgwx2XwBh11r3MKmsremUm2m9X9UqfuKu0udvpgZutjgFFmau2ZXRW5Qs0XIYGv1l8ftnOixIsEuGB0Yr81/j0rAAAAFQCshyaOjV5l7jJzbTMCFQ1Vk6BEyQAAAIA8BeqhwvNGmNWLVtKmxT1rtPYC+dyBAvmnkUyGqPM3eeHnShZGvvLPH1w1BQA7qyMU6rP10wTEUMiQwNfpu28/kMcYmxLu2LnV5XE1+26D6ZVHFmOyIF+GM99zGDbODn6ZfZJ4eoDYGxlLOqKVPz3xi32UntllRmTG8VZz/ms/twAAAIBniPjq12jdfYlGbm8ULJjDnWoh3fxB4sA4TWd/cQopjPItuSTbmfpJ24B1iYQIbHyF5I2ltMoEwVem2n+kijwZmD3yBeBL+LLE4JvjG5Bv+tf3Bj6beTFMC8qyxMbb/vZ/oQAwlVE/4E+KiT0rcfSbivMqW+YuBUi53DbD90cxUw== /home/erik/.ssh/id_dsa',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAMOR7fACqL/YWNxoNwJAPpu4RVo8Og3DW4StuP1MLY4CSKJ5xSo1bxvwR1vgxkyAxWEAdCxXT9jpPzJNjhOPuz9Yx4XJGQafWrGGO+F96e8zgki8DBN65j4XLF7fh4d+ig9Q2hTofZ6nmPxgnOosmWM87m0LZ8ADtdEoYhmMmsuDAAAAFQCvTQKhZjREGeAEoPk5M9/etynEpQAAAIAJhsByJ7lQvNst7Ohog0h+EnStL6s2WXDIP/RSnNUkFjuozutddmFcjBWsa64O/bxL+TuY3QM9ydSTGw/JSVbeOJ4F3AJHR2JcmVW+smFYyWOzySzylYGgv9aj7/JOQ/00ms3SCp3yCOLBsUFrz/EsosO40DhJhIkyOUVfD/q6nAAAAIAPdITGB1SN1WkX2Hk1qcPRbBJz4QKVxkJjHneLlTY2QnbGMKtgsVnA8zlTjPaWDjI2WoMAeRJ8KN1YLEtPbR+cTXEoVjkXVZyf4UM0P+mvwHb56axyWkXNSjjDg7OeZG+L94A6PocV54RhZZIkpTWgeoJpaqo04xZQa8f7yo5rIQ== erik@hendrix',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAsovS8EXwGk2kmKrtJnqQq5d9bFcfqJYw7ZS37HqCgrrAyw8pfwa5zqW6hJelBIZgJ2Ac+zn8P8dy3wj44cOIRK+4GqQDHdgpOLHkhv0z19wqYsIBnU4/CmCV/4zrcMRPin7DUWzq+Pvew2CWWAObtZN6R5z3grl0OFMf9u2ru+QMVCUQ2Bth/+w1EvNFjFST5+o9Yi1iFAjY+JqJ9rXsuhGs520uKEDhBrBsnngGRENaZWwZAK7aTHxakkl/0ZNHHVwQ0Gr5hz+CgBE78mGDb/X98wyLtnjGQQ9bGK0Us7L6Bcor5iHUcLVuByBC1soqvb6DZLHuZuCt8RFodIqG2w== willem@willem-rzg',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAgEAgyclFzr/viWTeVwH3BINNwtAPEJEtMa/eVsG4HEsjfr3kbjZYV18Ttz+QJMo/0Q64UhIyuAS+rnL1lOvSZE4sYyzqDd/KKjmmG0onptpp2QsKNfTJBOIdwmxZVWhUyh3ezxZ5DKnz2z6UrbxgaayIjdmiWeUzrFnzIqH6BELDjuBnT7p1vqylDxycTyuT4e8gBrAMvcvth8nFkHNNdo1kM674ZKSd96swcydwpq2/atrDHSyfJttDHDXC0KFULSZp0XdwjFf1zHi7vO3LyMos5IYcAIOqWL3WuDhrj6KlI7s5Rd/dqZIwuzWiwhv38xVQ+eifYi+6784eil1SRkXgOsRB8w6H6hH72aVgedDFy/hb5DpY1nuK5KGpQIcQQFu5+Xhp4B3t0eBYs5KW6N4QeQBJJJpRWp/tPD8t3CG2pYh6Sf5DiGcvnR+0VUdUa1+lLAtktCvId3p/L5X0apuRlbeBsSPDz8RQSGWeFgMdrmZp8bIEu/QLpX8GdCIr/qcBqzUID96YdCJkeGHZO+WbkZYi5AlIpqzjyc8dNYuirCvouq4aFGbhaEWS4ZqKLphgV6tYqXTetRCAvm9jSdNVGazNYr3Z9pR4r7JQXO1cMYred1UN0x72DZEZ6yKv2lQwan6DND/FAFitqp3zKGOPFrRcvhNkKQu58Opbg9VFx8= rsa-key-sebastian',
            ],
    }

##### END strato #####

##### BEGIN edutel #####

    @add_user { 'edutel':
        email => 'noc@edutel.nl',
        company => 'Edutel B.V.',
        uid => 5095,
        groups => ['ring-users'],
    }
    @authorized_keys { 'edutel':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDOPaS0VBK0qRV+OpjS7p8qYRfPtjk6tseNWVx8pWh5m6jXC3m0egSjdtOXKa1pJBSac4wXsNWBh+Va8DwO8OxodR8E3nSyEbNO0PHrIWxEbd4npGAM7cToh48kpsodX2lOebyOU0H7dVoM5j/gHItnJHycKg2IuXslITArFwymMiat95ahUav2RRHCfmVlFaLSCGGg8oN4sIKOQlc25lANPKilX0MeCJkLN2bxnkdFap0CQ3aNjv+ZkVbmrAhvGgZOtrHc4SOeBqhbVpR49I/0D/QAuvRurlKaG2fv66WF6NrX0zcBcksllFKdObFSj6cNaxGq6Y8/xJnW6t7PBckJ adriand',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAhnoCUpccWOJcIvg75rgGJ9c3I29CnykoSK+3fGGPWfWMNhd7CrUwQPJ4AXOmkN/Od4n1VOKjvlWdV04NNFcF6zvGxtF4uaAgtUggVZbCU+EDhKTatx5D5c5iNz/gh4C0Z+/7g/2NC4zzMg4MY8Mpx8S9ll7Zl9EfK8MUpaOdad8= Bas van Koert',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAyvv8t3ZeOmxDGY7gKTJEBuCmoaUB6sAZ789rBwCCDUD1DX8+M/mGLm/VrpzzIg7X3SKFB2pHVCzrdXOn+r820QVYgS24Q8o4YUetnwLFJesHSud1KahhPrkYMf58OeVV1cnyn53pgp+QOt7sORmexl0N+wfJ52t3uMrsKZ0bS1U= Hans Goossens',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAu5sZPDJqRztHlsLpQnr2MvfpOgcorHE5DRpfRTytuh+wQ30dnVpbaYl6+WR0UkN2k3EBWN2AoJghVK4J/O7HqzK2c5gBrA2A6Wwt7qxhM3kzfMD6mxwlHopw2mNtccOOVf2t47fmkOtW+uOoApOI2VTtiJ/aFEByswBpO8cKeNE= Joris Haest',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/jRHty3IEv6J1dMEzBO3Gm//8jbFc7+4vOfecIzWsBi/MxdyfyOn9jyH1+nNTBxdr+DNo3Cv2/7CwfzmuEeo31Gzwpm+xMTCFRvQly76UAuJ8bxEjlymaW+bvb2EZ07E4cw+Nk2ZTq7rlXp34JiPgY7Up4GjBVhyT1Azx6O5cXmBtZNuArv8frk1vZMuf27ESMlQMdhs6rE1C0nAu4zcxf4/ZekCCn9vdLLPS2kmR3xSvmj7UTfSMICd6z+Y8YwOVEZK8eHu24elQZ7wPrUyOVkYgmxzFsxwcxRvlGpza/yzt5icpeeCr3Lsbsi1ZzjyEDu/omkGZXhgCiNFSMeMd m.piscaer',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAs5SqaWAF5MOYVqjsqAv8KOTt3cH397EirAmyrtlZeIw47lrahEhVonDzz5rVPQQ52c0hxzz1IuuoxwzGSrsqQEnyA1/iMGDLe2DWFuDOzGLCJCFu+L9ExLawMVDAE61IjoSKTll0D3JGzPx/CNVc3JsqPuWdpRSAGJBBE56RTxxfJhGnJjU8fQhmTP6Ze13LG4j91AkU1EeMhMGEy8n5BJaD/hjquwhgi2ujp+MdsNDQ5bO18lywf96BTyt8voSdE4jwpLY2RJQX9rZoC7fk5r1NEfiQ2z69f2P0YWHrXmEZY8IzsNX81b+z0OHDdeOSA3+UZm06P1FkHFm8YWVmmQ== Jeroen van Duuren',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAum9Sknoj3gj4OGA0jqmwZ0hYKoSNmFnxM22vdvcFsmVrgHfVRv515U+5+vmQMsKtkyCRf4FgKq4ZxlO7ccPkdKelz5ti0Lieh7oGOUZRZov5805oiRrcOKfghGn73R/Yc3HIMYTTz4nEpYE5djtkqVdq54P1DRA8D2m0v/ulE3iH9nkDsxTHOXTMfnA+C5AtYpCUD9YS4dX/VHXkkjW7qJyWWDiRdmE3lu0QGxNqfS2w2VYHhkv0K6IBmxWBLy8FPfmxAgaSvYln4yZWIUfB1vwkaGKi+W/umVIdnUXvGTLZp8GdBaURIp95HTY3mU3pYsZDIwEhsVeVt6VAvCvuNQ== P. Theunissen',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAqfKiBHoY5gkdSPYXJWlSf7Sb8e9hyay/sfqLAlA+rs8DxP+cGJQcz8JrHNzZJ/7Wo4wbmB16+UeSldh2L7U689qTcrGd218zekp4bdoE7nyaM1xPSmyLFmVjDAZ64LBfZG9NXQDUFZeLT0e3VaX1DzJFkxSTFT5w5QWZE4os8hk= Ronald Cnossen',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAoShUXEKCqiIDzeUDtncgXJ0+dgBIByXxWxilx2SQ72akxGLzTxMmUEZBgpN5K1WDiXudM7w0CQNsXFyeM9x2y8zNF6M4RxLZvCRNLWYGiZYw1KpYCi9gLtGGAIoUuU/sm9qAwCD9cLqMKKUubM090uFilm7bp37+uPTrejFNgMEeyGOAH9wntWcJJBB1Fvb6rE4kPZdZUYyfXXQRhE35OWV+q6nq9YUeA1SO30s4o8a3CHboLXOoX0+2xYnRFtN6Gj/jqqEUKNgdt3li/2h4rPu4BKCzXRyEA6x3rlCAH95kxanqudhPyOt+chCb7RL2YpEqjMgKrloGfPdMOX/J6w== timb',
        ],
    }

##### END edutel #####

##### BEGIN sixdegrees #####

    @add_user { 'sixdegrees':
        email => 'noc@6dg.co.uk',
        company => 'Six Degrees Group',
        uid => 5096,
        groups => ['ring-users'],
    }
    @authorized_keys { 'sixdegrees':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQBQjS8FcxX/ea74STVvPkPOI7xxQ3/6/fPCTzRFnV4IRFndl6HUH3hNcAWWxGovPh9x6dJWDDp+VpfWzKeCeSAcmIFAiCSZ/iY+ZrtNT3Mx84c6cnqP6mIc8ZoPko8uC3ZWm+9LFOIdqwdYNC6LKmobdmomvOmM8B2HL92c2r5QpMnSylKRoCZorPBM2ieRdEFZziObaNGiECTROPV2lkw0yt3IqQJMiKBbgFYwm2Vc7YOGVOrIGJgNz8Us/gYShQ7E1knIhHkEDkxODWAiPx5zHMlgXnL/9T80UyShjHl6nzpDbfqSmiYVa0ghS++HGK2uATwxlO06+mGkfZDhHunT luke@freddo',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5ymVy2mbml5acWpDL0FBnyV0EHXtqgeO23XbzMBz8dQx55INOg9gL7FZp8rjGx0xHRgj3u6vvC91djcdj84SkgUkUuX/q9svtgBRS3bdrdOptAArP/gzAuyDleQt4asL1XsEruryGgMqYgcid35b2IehfiXBnrond535LkB0LBfOasGy2ke2c35bUl9imXyazu6SYDR/2bvTedNdV8tBXuIlNgd4cOzekwwks1JWs9LZHcQ9w5J1LYh5lxLew1JNq7r2wqlZ2KkTEqOsShnJifT5HxUqGQZgLb8cuABU2FhtFVAA4njGmYGi7PPZXeeubDqz34TxFgD10y83ylVOf ben@snarf',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAKkuQmGRCHzJuEeFhv5reF2qMeSnd8QWDg44W9ilQhM0HWuAQV3KbYlb38aKERnHKKKj7oVWtu52kN/xh8lAsgsA4/CBG0NK6l16YMOh9mTMGbAgWD5BVjhWebL4QaHwa28i7oQXEV7CJ7+ofFJm04tzYcE2LL1DCVH20WY7/CllAAAAFQDfxE9w8ORdNGcwZ2lwnKeMM0IIawAAAIAubj7sD2Bhv1SFbs7UZYaojmPhWcDZnJMvZqI3QXm+dGfQy0h4hrNyl0SMuBKFVELIff+arYlS13p9NdptqimsEWukmRZM/rq+GzJVwSBm7AZWJWVYFCW/1lIwwcgfSITANnm/0quxV/lia2gGnXc5TOJ1j2ZP8a+GBikk4GhFYAAAAIBboW2SM892d4uxtO5Mp7E/q2Gg5MO2GAsFVxqoa8HT1xmJLcYQgnthAoW4lu/RaXgH1G1qiL8wcYqy7cVcWw1BSlH0HN1HsgBrXAdCl81hKpt1IArAmgxoqtSy+cGm+fWTvoTA6Qx6vzTVj3lFxi2id3KmO3aF6QNpdqh1rQ5nGQ== Ben Ryall',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAKZUlzCBC6GiEfvfQSfz9oCjF8Yy3CyRQNp0xd8ysV55b47q33ffPYozv0iVCuvJs8k49rV6/NbGH2Ur7weXwlFTn9aBmASUwfb/JRflu8/Z9csE2FhR+OJp/QQU9OkhORnm0jFJb2olpWwCLrdIsTpU1mYtBDnEyH4R9hu0Xi/HAAAAFQD4EbnQh/9f1WC8/KPKYyx/eBM9lwAAAIBY7+EXwRI2etHpI8iHji6nYfQ6we8BfdB3CmGhcOrm+k2HRejHTJM1Twx9U3g5n8IlIH52iaOP54GR0HAxDZ8CX98X+1t5EMS6fGyIvmiVFm9tvu4DglpK0oV7YgXW6T1W6bZPYfNk12uM76RfQblwOUPLLhBgRM0yehsVQBWXGgAAAIAEFHZ9X1vzguDTrokVGrqKoOaoBusRypW+iDn/alAT6CnHB97pRdkxzhDzUWRd9s/VaP3LXUTm2s1eYxTaPf6KNiTq203KyVIRdThNzAEOGwXKfzCpw0CNG9F1nhoSRNrmZTTBezu4+DWW+4lQIPU1Lsz6dYGJ9ixfmBY90ZCzMA== Dan Lowe',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEApUug1Xm7sS1a9tL/P1zcONTNreYOFs1lAqRmXnuRJOhtjRvbOJXJDxrI0+6zDYTBQIL3htH6mbHaLtohkIu/gkWsGp2mSbbW9NNY2hViwiUEo4HF3GAowZRwQBNDXJevtla3J/VSc3iS7coQHC9BhV9HbxUlKldp2Hu68wp0PEqRYxQYZpkSl1X+3z3A4zufaat5t28BQCRPNZ7NtEAAFw/urDeX7+tzivHpMAvty/g4kKvRho7dzm/XdjZOog8DEm/laFQKtJNr6hp0sO7Va1loLEYbX3IZUhdvWw3wFTD9X10wjg7KieuyhkjrBNOHCC/qSf8O1MDzN7PGP+ppDQ== James Anderson',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA60fuWiuMRR99TiJUt/cju+ffvcyxkZrv5iq/JcbMwgPTjb286hRb4x+5WAEwEQWoFdfhZdo3C1mgU53XsjOBacQajv5wg+txQfHQmHjQlHJjBsKa1DDFoOb8nQH+FvOy+x8UYrYZTuBjXfQDOrFeEUjs7YhuAfHS9t5n2jmoQ2a4Xq70A0156ccwr8i3Wck+F6eEePFi5eQlzvYtAzayGJfrw4oPdEXWk2gOy8b7z/EVlJnh+84n1OcDjSnkaRgUmBARIlL4glJZqMEwKuz+yXhbPSILHYxxLldRHxrKfvXUoYPpHoYmw76Wuh3el7djo9+a7XidSx8njWW0V0elbQ== Indy Singh',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEA5TKFVaO3FyhjXaL01BsEw0KLK1ktOf4pbgqF/+d3QrRSnTikBKP/eAvS3sV/WLKOIS3MiMTm6QnCVQ4i/oLW5PDlGxHEE6xMwCQUi1R5lCdaJ1W7UOat6BobX1MzqLAKqKg9vHyfgjR0odKzNwnIUTnRSIn2wgAOn+iwRRH+7gs= Mark Richmond',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIBnAXOfqpdvE/1SakvgJ0KuKP5E/ZZU5qzUiG3fdRtPPILBz9xO71tmZuyes7iyvb2NWft1VjHZeBrG2eLDzrrtdlRnqCafJWd1zOEBiWFCc/orYTpp1aaefwh1w5z7Gh3FMMewB+9TzLuU5xf5ZyPVJViWPk/rvmqWh5sVB4rJ+Q== Ian Prevett',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAL/HXmLji7/1aFqAmn1wapraEzL8cXVamTlXAZ+N/3CF8i1OzP753txgJOLH4iCtGVzrXhKtjNgLlA1QXbAfM8JNTrakQIMfehNrP9PSsrgoHWBNt15de+fkrLp1VH2BzI6SoYLx+t2LCVH6kSfromfHRVubrt32EodeC5PDYjslAAAAFQCQ3VByywVsvaLUGgH+n8SiBImWBwAAAIEAvRmhxjnsOgdgJCsA1hCVo/Mi7Cai6xs1UsT2LmDrr7lMffM6POT03ecvwW+2E3XgCs+wR7Cf39VaJUyAaRNVz70AgiZxKxTqCY214Mqv+AanugPmZX8MqiXD7zC7wPLa5xIfLThrS2vwmdCvN/nwlmWLdEbmcB259XFkNclv8ksAAACAaQJeWqUTVvPKOAc9vFwIpNMc9S5tI/I29Zz6PQ30beb0oSXXg2PB93twmgkCtUaoR/CCuiCX83LENPlHbRvNDCyS0xuSC7ZfDViIES+7zGESW3p24MWhsC92JEwVxErpwAqr6Zh/HZw+3Q4GdJooJBoT/MKdeX84hV7AJToAP9A= Tom Hodgson',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAOaJNoj7of85cN4tRBGx6CsUXPpHyNGQtFzs+06NS6TR2vPaKzCcMMpjB/rF/c4a9K27zwGs/E9l4cyPxf0RcIiJFyuoc6I7vUUzjeyZmsCBquU3m1iWZGDgfUBpH+koMzyge0cq9MOzqXYxszwsyVaRe/JZKjPAETCBDs0OZu6FAAAAFQCiZgZX++vdKE1rPOj+rPA3LqPAJwAAAIByIqS0FKlI6FY3kw0orWY6jftX+EWwOw7mGmwb/k3PgWWyAuivMbzjSEc8DX7yMP2cVWPM856MxtBVKTPxAg2WNIXrnLiDmB9c4w0DyQXo2M7BrmS3DHa3fhXYkESZbZ1u3oPu4iLoo5L18vxpeK4jLM5419lOhRdyHIKTs8cRbgAAAIEAineWk6u65iBPAy0wcMwxqhI/fyrOEtJU7UHnW38TrT75MM9War/E9gwWW7kr5vRcGyPjih3aSxPdbU08pNPq9ev6rf+3XBqxn2LMGEI9tz2J8YzXCVzNNCEWzi+RctVg/sr/a2Od/nlYV5dl/+eU/7VepsxPG8wVn726EJY8nTU= Dan Sargent',
        ],
    }

##### END sixdegrees #####

##### BEGIN spacedump #####

    @add_user { 'spacedump':
        email => 'registry@spacedump.se',
        company => 'SpaceDump IT AB',
        uid => 5097,
        groups => ['ring-users'],
    }
    @authorized_keys { 'spacedump':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAACBAOnVc0/c4FlgoKIfSFY1hGcm/Z5LRBGqJ97VN+6sJNDmAuYLPRSfR5+lhWwETMtzqgSpV7WctfbCa1VzQnMHntxR1BzfGq5w9z2UtIQe4yx8VQ2Fg2rKtSmwfQqDMbWFAA3o/9ivVN8PDPB9Qot0qqq0dpyKvVh1g5ZzEr3F7YA5AAAAFQCI7+B3oxxx6lSR41SBYRZbxxGslQAAAIEAmnHTNeklITq3Yqa0PUg5+etpWWEivTszFkKRLcPNbt7YXEhKU5cAnV7czikDDeRVi63Jyo8elseKxBwV2Z2HK3HhvmWU4hx04Fi0X2LtRrCqsbf+kUXF5hd4Jv46SVs3xg+OsrphOxDNWuWeG+KWHm2Rlh8rFZwc0WR6HJceT7sAAACBAJw3Sm9prEt695IEUQZBl5nqZrPhoeil1roj3wP1RIUYyGVTdgz5Pxb/BOgRvQMcGAsgM/eZZt+RXOHqXENEXvMkMzyYXMWmANVlZ0seLtbnlaMuSIofQkqblvGiwlx5nJhXC+ZwF4+U0CxABcS+sx/11Mwf8i2JWC0+Jc30JbWW spacedmp@tjatt',
        ],
    }

##### END spacedump #####

##### BEGIN rbnetwork #####

    @add_user { 'rbnetwork':
        email => 'noc@rbnetwork.ch',
        company => 'RBNetwork',
        uid => 5098,
        groups => ['ring-users'],
    }
    @authorized_keys { 'rbnetwork':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDPStRZCo/mKCuVNOWuh2LqVQAZuWaUsYsNfnYw3koL12OczQUQTgnXfyN1gkcrjKbZgD1yyDQRYtw5l6ig6lRRfvuFiDr+vMDi0xLGTusmYuYozRsUueeMNvKBvL754F5zqz4yRiJWIRboOSDDEyDd9/G3JwrvRTqBWmOFzgm8St3k1G9QEPpfwKh7iYtX4rwqCWca3LP5XEtA+NYpbMw8HMPVDO4n0HFXXlrMVpE/c8UzVYavlTYpsZ6xiiFBMFSUhbNp5HfszOUN4kdemd252ndQW3I4YfFfz+O8amEHpNKIvoFVIYuCls06L/xLUfzpgBQex4Ix1cZS1+S/VOpf fre',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAuBcwLlZ1Sq2ytj067uVxUW5bW0qi9KIQEsbdjZ4SzszDWO6d2sL30gLCkteUvLYlNuyqZdWTsPhCPLf94ozhb+CkdIJyeqPszMjhsAlD0wwlRrPnuaIp/jvhU7vNtapbzbNnAfIjT/ditOJ9Zs3I1U2HVvYEICn3pNYyFiycz0I0YlowsGQbEECraciU+MdLeEK1CuenpxPrdi+y6R+yqrVkwEvlUWy6jnuONr0vhGazeCY0r+ExODQknF2RvPLB0P8tzlIbXftgixE9+63DEiaOQvF9QTFGOxItwXmZQoOzllEpqdSjpK1A45u7YppHesMWkHOCdJo5wA38lsgcKw== ak@rbnetwork.ch',
        ],
    }

##### END rbnetwork #####

##### BEGIN yourorg #####

    @add_user { 'yourorg':
        email => 'noc@your.org',
        company => 'Your.Org',
        uid => 5099,
        groups => ['ring-users'],
    }
    @authorized_keys { 'yourorg':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDD3RbIiRjR51RXizorCvK1iFVjQkXKV8/G2AKBFu90AqjhR5toc7ivZQpyrUXCeB9uBnQ0Ch5Lm00lHHjWl6YR2ZnsFj5jgKRmk8dxq25GqhGhCpVA19JHkuY3A9RWWlnCEmHkdoAD7AKiTNMavwa/zMO9TCWKcBPbCzY/WjFZQh3rfQsOAUUZRcL+/VxTNBorQrlh8CLvHn+yaeVei10M9Cx1hUQDNzZxYZ7Wxop4bfl9JIUVI85KvmMt9jxRf9yrYYwlESGRx4UOV0XZctitu4lTgFNLBWD8+wGdJEgRYzLxGGtHtgSg2G+wZztrVhPpNGKsLpfbSKPqscmTHFRp toasty@mb4.your.org',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAvgDStZKx5sjsLLYcNaITaUqPkYNXeZBTnNhLdLjqzFmKnCgOc/aKSB5XYLPH9CYcW7enzpHf1mfJqr5giHLsP4DArigv4WEojdOekO//DRAyKWd4LT9VPMSzwOFzx8eJSKS1aGk8SjpG0eeYAChVFH7qKLGwwAlSk76+naBG/bUAgrX1tYl4oBpzaOUw6qDi8JnhuagYCT1Sp3NOK2YPbgxgKOJmwmZ8Pw2VAstTSug7Y/UOtFkIF9i4Ov5pbZc= mloftis@pogue',
        ],
    }

##### END yourorg #####

##### BEGIN occaid #####

    @add_user { 'occaid':
        email => 'noc@occaid.org',
        company => 'OCCAID, Inc',
        uid => 5100,
        groups => ['ring-users'],
    }
    @authorized_keys { 'occaid':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCTZfGsKq33sb1pw9OO/bHAY0MuVZtKuuP84xRE1MdxkRBYxHr5w1A1hu1+O6V1fievcWxyji3yie3AvCO7QFyl3wNZ7ZVcY1iNOEj9le8gTq29WhqalRqdFUN1Dm2Z83JenNhx35uspARZ+VnfeLtVvhXujCUl+o/WEO/wl/rN3xKV8+K+uJsHKq5J6G1Lyg90y3/isIcUCcWYHAhrI6HeKQZyQFNRmv/IrNxtK+NPq6ztlre8LmerglyNn+EdVV5t02do0/LpE8sWx1ib1dAaOCSQSv5nDbtTd29wbff4i4F2nLiEx0VptEH3lb9cAEQL6iEcBvlo7aFiH686srrp lee@towardex',
        ],
    }

##### END occaid #####

##### BEGIN as250net #####

    @add_user { 'as250net':
        email => 'noc@as250.net',
        company => 'AS250.net',
        uid => 5101,
        groups => ['ring-users'],
    }
    @authorized_keys { 'as250net':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDUUZnRJlUCyk04hFmrTzGQM3wbZl2ABfdfOgXN9PrpTZBjwFEwMFxbLRC6Ve7KbLSimwSNqh1aq/bD9qXOaTqGD4g+RZZZ73A4eHwjGBAgMTo4oH/MCIogvxtBNw3CBg6BDxUDLozb+hXPnkfdC2ZIQwp1zKFuvGOIihiWFpuIBYsDCkTlvivwqXbxa97TUPA/BUy1RqxA5zvG6TypfRYxtft8gVBMONy6ReQYo+7StjjUS5nQESKjuFROZWMRVSZxrqrnRFyamokVQi45Q/4OX7UyRG1ElgcTA6N40KyWYfigOXeIEDM/7XDM34RsUO/ugeTfNCieM+DXKpIr87BQLMntTBj25GxXHByDPCpsVvVEpazDARe2u49zrrzZtbMf6lyxAMD/oCXeCI6e8Pv0LJ5FX7ug0vAw22Uck6l7ddsqg6jaVyWjZscL76908M8vsRgW+YZAVMC7LqXAsU9Hu2+oWAr1LBxYd4K01jTL5vbqnvGnPP0WepBf4tA9U/tteVVpMB1M2hg+VmwColcm39BV1QGbb/ba93OuGKTWYzoOAgZIcvaAhgVfh3SXRduyy/CETX9fifxhRyaBfeU/xlfhAoIY3khFwj/k0LD7gXqm5wLCYrgz1EAQob8kws7DHiwXExlxsmhuU5N6Av2m1pfHvk2/WyVe+cb8oMCyLw== nibbler',
        ],
    }

##### END as250net #####

##### BEGIN redpilllinpro #####

    @add_user { 'redpilllinpro':
        email => 'noc@redpill-linpro.com',
        company => 'Redpill Linpro',
        uid => 5102,
        groups => ['ring-users'],
    }
    @authorized_keys { 'redpilllinpro':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCq7g0eZnSZcCnNNeORu2Us4BUwiqr54vtKS0QxhLh24WQJPQUhOUfnXhw+2cTNxMrCt2ryt9vL4qbgaRaH6r3aOZYjs/q907PlKe/1Nfto9xje05DXESnF7oXSzwR2rIa5Y2PZQfWM9XAscedRR9QIPOWgtdrURfZKPSUtHWtZ4hqv83iUqnJZEYDryVUrrxwWYQxrMv4tSTs+QNJVAboPVo8mG63J80kxYnGgdqwYdUIwbcqIQ6la58fu/ySdDHRA3EIT8dOTZtArOw5QCoGR6GhBMaQ2coNrTAXG9UZ6bZ735ldMQLV0c/I0gSgbAmC4Ji2qs2+ZWtSnEuvdjfkD Redpill Linpro Managed Services shared NLNOG RING key',
        ],
    }

##### END redpilllinpro #####

##### BEGIN nine #####

    @add_user { 'nine':
        email => 'noc@nine.ch',
        company => 'Nine Internet Solutions AG',
        uid => 5103,
        groups => ['ring-users'],
    }
    @authorized_keys { 'nine':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDfHI/dJ8kRjp5exSESBtaKpYkKIIazrHPKKkorSfhDDdPtMSCbhPLIBeE9rx/hN3SIaBA2XmH84k3BWfnq8hQvM2x/USeNapzhWnEiwtSlaKsmLWcOxmcoDVHQ3jilMzOlwXaJ26nONVyxJsvjjVeswuNcuBObD9qm30RoNJtL4kfNuCbYYiz4PE457KLFGJI5j5bZ1nk+cj0ToKbKIMjI88z9ZtYjUfYt/0Xy+cSlsEm/niL1Q0E9yiAWnUEsKCFpUfpqT6zt2dUCVGOCybKlooP4dxpfsNnDVn3OGwVCthuwhrz88RR6AjwmAfiVd/LQhzV19yy6LdmYAeuqF5xv',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDD98X1e5GCK1OuOfaAYuiQLwfHXrgAFll82Z1i7c9O3Xr0LvpHFSmRINiyfFg/Jz7tw6mvmXVy59KtGwJYQD+DfMHmJFMKtw0zK2qUn7SKa3jYXTnEB9IrWLZ+GTQIiN0B1eaxXkqNZ5uZxIVgc6OIgcOYYzVIyLf1AUCQRzVNDYmt74h7gbNqsd2hSqTwpra3tBKusIjjFZR3GZukgW/7C8hov2K+5Eb+Y8wnNeJ5B353pveOEraOe6iw1sig6Z1RfKOmlTQZm8G+eDfBCQyX3gSzbZLhYkmBoPcXdx4l2EQ4z/kuIpVJpHvCU7eOGFFuVi9ZVcc2CtTT9h2tgm9/ Nine Ring Node Access',
        ],
    }

##### END nine #####

##### BEGIN oneandone #####

    @add_user { 'oneandone':
        email => 'noc@oneandone.net',
        company => '1&1 Internet AG',
        uid => 5104,
        groups => ['ring-users'],
    }
    @authorized_keys { 'oneandone':
        sshkeys => [
			'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAgVXAzW6rwCHbsXgytBGargQLxnJOsMOf8RKo1x8592aHFW1HLJcRGLjPXdnvlNOa7djpFTQsExRKSbD7+AHeK6jnmHYpQawIQZs7mk0ERpGiyobr70h735o/U+9iih5EYbUybpWbpCWUSGTST4vwayINXq+km51HTHZjc5gVJfk= sandmaier@sandy',
			'ssh-dss AAAAB3NzaC1kc3MAAACBAL93Aw4W3+Q7ucZUpRTMnbi1du2dS6x5u1FOM6lN93YMOSaoi8UeM72Iz7cORqhmlyHdWpbj++h86C8TFM7rBDGiYsWqB94MgqRYa5g4a2HfSI2l+DV3RHoAQNAznwRfxraudUC0xAo6j80MtiqF2yFPDjO0oYYaazgWGvNcgutvAAAAFQDmll4Xfs3oNdAAhhPqz2FvrqkphwAAAIEApUwOSE1tJBRInbTehhUsiUZ+UNgl7lAbxMKyrYnpF5cHAFW3zgxC5nmKl17DHYhxdEZN6TkiaHpv4DL1RQUJgjwOyWOpIMkF7hRG7GVZCNWxG/XRd87ADERQvfNJCdVrzxN25rBMIviesD9bp2osmz6y8eKMTxdrvNen+ScavUcAAACBALO8R00ZjfnxmO7sJad0Zz4oZ78vc2JOaW2jihDgptEF9EBdJHI5oveUsb/itCdJncxZ3sdnwzve1Rw8665NtJHJU29ngIfOUqsL/5ywFRki5/yrCOglsD3LrUvGQYuj5pwgSf87Lz5LLiD/zrboka8x1V6RS5LdCiV5W0st8Fkf pl@pl',
			'ssh-dss AAAAB3NzaC1kc3MAAACBAMh8K+93uFR66pxy7ZGNJ9BYoYGW6prKSaDEasa8ffnCxow6ws7TZsR1ugefvxhdkfS9NRg3FePCRlBkk0RbjVsRCA8ABDathigVmNNrVP3eSYCZYPxeiz6aUuYf+Hid0XqUcvdbgV5N0bRg1MC8vVPnMZ4kT7OupPGVsB6KNf2TAAAAFQCUTLWXPO3ZF/GKpyQLhGrTD9eC7QAAAIB6o68aZW0/XevuGD2ryk/WEoppSuD5Fqcdcis6YnHRjYu06rJIXTj8o/lCejg+2DRJ4XRG4sofJ6+7VNyVfEjqC0Lk1AHtMXQJg7P9NPG3/t94lrbQNC6kjIqqLEYRhYughnLgjLjQYfdQwQbHK4Aw2O/eL6jMsNIQUpOS0KHSqwAAAIA5YrV67lwQj1W/5J4zztFltB5BFiowWdHNATqcrDDeulfCAIU00n7t5tlAOLCTOzyOjerx6GQkeHCIFEWZO/fQ5szIv3FXiRhwEbReTNduXP+GNFhVD3gqc9jGuTMB5xr4lYm5wZmjoJDdwBe9Zm13VsyJLc+Yz3gSuR4zl+6q7Q== pl@xp-lp-pl',
			'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAsRzhv5Q7/mvKIiI+57WKPcs92+NLheb54cdPJzd41WGc2G0QRNI+hhibn5/F8p+vNfXvGXPak+Eh0gaP84lOlO6+y4svnSYacYJnC0pf56VEIt8LLXQ6Sx5Jarhl4e84fL9lHlFRWxsUHMNS4iaCB/PQSwEMnFugwVzrfMiXHrtR4za3TzyRxBK3AS5VrMXdIFMrDIAPC7BgUX0RpZtDKYyp3mY3vyPg2hfpwmvPjbewDsFzi9Kdi21AyGdJ9wk+kLj8ZiXZXn4RhgKI4oBbXnOE6v6ynsxf36jsWR1TjsxviBcGvOZnP3qOqG6O6UNfGbUfI4uOg+gppElPkR3l5w== lucas@lucas-desktop',
			'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQDSeZhkLmsOG8X61EpD6LsmhbOWOzBpymeD1VwJK+uFXa5v9gfLn6DZWMgVC3esfS9t9rabvRelbRmUplaSn8M2WRHTGf+d7WS/tzUdBawQgFPRnHwjyVVml6yuWNDaPOte/dwWstxxL3lB1ybyLq6nC48ZcYw7Q2FiFIboJetz6w== florian@nocfh',
			'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyD0EDZ0GD2Q0m/f4ejNFCGR5QpMXlsxLNYB43arT9GJXZA98TanzDcA9FRj6eHbDSTLczX8SwgtMOabJDBCYms7v2PiurZwDyReO1RUz2SCUN4Ox8Y+YjK0XvOGvWDQ7PtHeR5eDLSCBqerun7SvV5b5xHwmrlfXxCNhvCXOZyFQ28fLD6lM5AUxC3QrGpdghaAXFjJBkWtznuqNJFKQD1QITTP4Br6litl9uvDWEtryZchUAJk+RAvSpK1LXfvuctiVGK6/g3FLe09yv3g24uV8fjqHblB7v8IJCZVmaT0yb/JytPXVJSyJJVVCnOJrrDi5EWRXDtuXCrRmOTQ7l mgreenup@serenity',
			'ssh-dss AAAAB3NzaC1kc3MAAACBAOMj7YJvhOGioV7lven7CxW1YNJu/qdbKhvgcjSPSuxFaYyln55xrxkSyEYxnfGqFJKgFMxbBeg7PRfHjhrrut7r5rxaDFA1WHj7181JysGRUUlFAogFYhQHtPehSa9NcBF05o/ybb3Zl+E+goqcTS00PRSbioslhJZAcZ1ZH56BAAAAFQCrfzFSfzz4EJFJi0DZwMJfExUMjQAAAIBuklo3qPJlg+3sEAvY9DS5B5YyIGM1AqOrM1d3JRLIgfj4BGZxcTm3zvGfxdMRVHHEXBDIGFIWwFYK3omjtoi1v5m+sN4ty7hysat0KebCnaunWGJgtMaShA9idDK2an56TWpP+jWy0SsJIFKpsYqBh/sxQisRFBUocnUUhRV2ygAAAIBxPsGmRQDgeJcKS4MKUhVP0uWA0g+fKlbqIQO97vsSZ+/X8E1Fa+7y96FAhDY32tUZ378WeRKkZsOUp5zNuMWsxhIaj0asiOJw30hYfY7Y9/3H7ooccM3g3XDlIvKdSOBDaNJqipQBD3oqUDXCYL8z0PgoUKAYY67TKQSMJ/5/YQ== mamueller@obrian',
			'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAogRJmPjc+0PRv/hqWNGosR16aKkFhX9W+yGGUEk2JcP3NMSYtAURjC/Uo7MfIdr6uzcTaw/YEg/AFz6YKQgxDdvOo9NcvFhv/e4GyU4On+WQEWVQzBVu9XUEa/kX2m0sLd6SDyoV6Y3rpv8CS+tkCyhXIHIkq7Wx9+gs4sBeHnUhryHfmlUBcu08I5q38Dra5pVqqZbqL6XczvdIgYiVxMhGQ02w0TlE7/YadhdKV5GPfLneaCWZ0qymsQUph9YIKAf79QAEZ6WXd87Iht2Ipdw5K1vN//AymutLLF+EhE9Oo+axdhwQlrkjIac+LKaF7N5nEchiCRL5gl1JXB9RZw== mamueller@obrian',
			'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA0//RPBIQJ5m43cDw8jqROf6Kc9iCy5GonBwJrgRta6ohbY/Ws28ymL+oS+1rZaXG/89+MRbU46g4rcqAqbyCSuFLf1vYi8Ry16lrT6S1kkCOYdVXZm1JWt4QnoxBWVlZl0M4cFCPp2jNRrCRct5S+hRhuCGXoA3Dh54VDc8/QdD55OSxdoJJA0GLuerMm/dCnWGMCo8OoHMt+zM1/ThQUNnqVQWcUn0dDARjfTPjuyEU0vwsZHJi0Q/zshzrHpKT1v0nkodKlkm2z3YM1VENVZSEt0ydXwhYFlb/JTry5QduAFNvk3D0tGsd9WMxAlFoh9+31iqXIjDq5KVT1ukHkw== bernd@bernd',
			'ssh-dss AAAAB3NzaC1kc3MAAACBAMclEDHTeLo4i0HIdTKGscY/eQOY0YtCWXfXgeOh4GyIb7EASmulUIhkcwco7w5Z4bZvsWiG/otjUT8jrM6rd/MNV1sbIT670Pfkj0y/TItOOlrqeEEu7+nxmnMJWtTTxLN4QryTDo/M2h++YaOz9v2Wj5XvpkpuXGMorC2GM3rbAAAAFQCcEX9PwHoEmYLShn+i52wxawwNCwAAAIBRHG8vTgz8x4nW/BEeMn/mbe3UkfDSC5QGpMUbxeSvXLvgGL9ZAF2ndX6WB0X2cjLnxB+L/fHFulyDvqz0xoVumPHh1attR1B21hmkBqTmsQ6Pxmozt2Z4W7cMUTtcnbIqbncM5MxQUPwVxcnO5FE64GGGMJIftS95OTzrALXgQgAAAIBmgfpHT6xlFty3Eo99UGXSQBH3ognZfFz3nU0nqDzV4+U8s0rVkILwzU/vKoDQ6ubw7dAc7S+wF3rb3DTp1/YttRnI1kRW54wcUrinD+7Ppa7jzeVgjf+3HmTGoZCspXuyhkIg7jL1idm8cy1F4tYN3nnkFuNB75Yr3oi80G0Vzw== bernd@bernd.net.schlund.de',
			'ssh-dss AAAAB3NzaC1kc3MAAACBANv69tpXJXskqUaozTRhTIY2NgDazdyJRGvasSkv4yTkYfNX1QIG4ign/rfhr3tRUs/P5VaWfF9DdJTFJWc4szbHsNCYElnnPusnBWYTpRejy6e6nI/2EZcVwyhhen0Bk0fjxtNZf8y427COfjaZLgXCXF/V+Sfn6g8/jphy5U8VAAAAFQCjdjVV6ayAnkRaouC87ybG5AIgaQAAAIEAr4gT+lsyKRnLCHTeM/jD0jLiQCybhzGkYyJdlIdE24WMtOO9uMSGUDTYM4J907K3hfXSB4h4l2EdPHhq2oN1MkDAJd2fjwFj/FaNRZm0pU+sqMLF5jbum44BpQP7t2LoYq1fZg9mxVhg6G4dhM43dqx4a3Uit1Q4btge4ZWNmbwAAACBAMYz6M7/ipfLOgwbXDHb17NoSihWjbNYBGNabcEudIrMfZ3WjRiG7fqI7ZTfaYD/cOinKPR6to7zVdBkJb1hVJP0pnvDqWOoo7vw1qZgPIKFnuXkNFLDDn4PlxuWhvKqf0yaQ4vI2RC+PiK1lfFXTnSJMDfzmtf3prDMKIpUx1GS ray@xray',
			'ssh-dss AAAAB3NzaC1kc3MAAACBAJQigG0eGHA40hL6iP5xoRAO5yLadnJ1rFNmWJgrfpzoYhWqPIZu9CVzG8TgmzHpXvtC0LqPT8sJj4X8affpYvvFLVc5pJbHQDwj343sCf8yuNgQ0CA/TWcj+jcmd7DAcDpnTzrmyIQRO63LZFKjeoqSKrlWdFUTjz+izcGSyhzXAAAAFQDWJLxnCiI32r+AqmvAsgdGzl2dDwAAAIBfFS9KBnQG3uOD8EmLHbV+E/YGvoZ5ayFDBmg7/csCQTxCAq6+P+Ajj3Fd2b41jdYweMA3Dp+DiJn5t7utyOcERD/Eg67PiAcAHgOpQLpIOS2guNTXem8DwYEzqS2li6flXYwcYQyJOpfCl40bSoWlRIA0cS6YMAEQTMoXiv7iTwAAAIBEOBmu2hjZOIx8O7VyeMCh/XCbvsF92G5xwftWekDj/UR9kWEjaKzR0Ah6gT3JH116uUhKzMhyv185VBgCjFd49fK3BzGvxuveGaeGovih1x/l0rEW9z1tZeErM0sTbizbYTonb1YtnsLU50A9yBab+YplqbsW4Ha2sBuMhp7Qzw== uwe@moe',
			'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEArYjvYLwz18SVVhAjqleSAlGwRZh0TZGuFuqplOi9NQF1XAnvFkxJ/3sMH5Bt2EXTsAVRkCMav9kjF/xf+nUblrM0sfwRB+jj4nOhhHmOhSSoMXx0vHlosbF6TRX8h/oKwXN+bk+1L2Df5GPZM7zlGJj/JrfC93kDSqpalsfohEBuVY4EC0XYoPt0fKQQQcA183tJZXb3YiDFr+ubk1oGWfjc+VX+zyOwK08xe0SJuj1rV8rcsheiykvEiIvl3k51sgouXi9UEPodVWyFIqUOg4rJuTH4jsSBlOrCP6FdxUqkab1Cu5aZyoTxbZCJfyQOs2dOSaApzDx3s5eL9sYRrw== uwe@moe',
			'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA9yU9D/K0HKTV4xhc1ynEkY0w93yHCJPPT0XXMfl6xmdrZh2HVWwcE6XI3xYeLaOhtBQ5mhyvRhUjF3O8ydYwdG2691LahxIKY0KXU8yeOyzX39NnRBgbRDsTbhuxKNhKHCePsye/v5N1O4QuPAQcrs6Fqci1HetCwn1ma2r0LY63SLGp6Ref2XsK/Qy2QufLyLwJ89wB5KScVwg4OLfB18iUfZISFGuAjyjKqBkRgeNPxZUvpAdre5dk4n753lzFiDc+cgve8tSPNZet885QZFyn0C0U3HvPf+KAlKin+xPqr7pbHtXem3elBzqOtpKU0kyL8TilNVOn7fRbVeGDhQ== bjoern@mrtr',
			'ssh-dss AAAAB3NzaC1kc3MAAACBAI5ZYVYppCzTC6CK5lvL2qVvvDJYYPpu14b8DYZa9nzH6xqXw7v2dKStchqKQuz+3CMoBUzzNiL/PEx81bSY0oKQ7M803rOv6+K0VjOFyv0Jy3qpwNEPm1mJHxNpXxi4Nf5QP/J8kbsQ25oCuwKMzewEkx+Qf4DEEXrbohzhC8arAAAAFQC0uPH1En6YHHrb3MvGtejJDYp8nQAAAIB+DAn5Vd1gHLj+0dQYXrY9lRwGtXLunG21my84KsbYbQ1te4euDiWbpWGdvMkh+0bY4JADNS0/5/BfqvEmPLOK2CWn/HWeaeWxfmpdelPiutxedsvFoiq9n6wt6mBAQJ5fciKB5PKBWcIGgGD8iBK37wFabq/39C7p2RyU2kRTFQAAAIBjmrLgzysHhvfzvnOKeckuKFozDgTyfvM2HhafoCbOdex2DIexHgAyiY4p3fX/yF2mo9e2+nelrfcs3IpnuaLICFzKdYlRFMyNOPaxU/sjxmthdWTGenHEZ/gNXCQJWxpw33tAvRpiemfSb0p+mP2Rf59b3lD2RhwAFJp/pyzNuQ== bjoern@mrtr',
			'ssh-dss AAAAB3NzaC1kc3MAAACBAIAhjsNRI4zcc5VC0YCybvsbxukAnnaH9yD91AJDs+YIK1SIakNoHsbWnrmU4yyb7mQA5lA3En9XlDuxnWM7SUB4Kxe7d7DfIxxaGKwuFcH5YGG9AZSwTcxzZHchsIxG+cXUbXhJ+J7IdK1NuHT2twPICEf/7e3depPqRdT7DrflAAAAFQD6hXbk8X5q6lnENlneg77JeHGdwwAAAIBiivaWqa3uCtF32ZkGvIpxGFA+jMUKMgEkaKWZEbzokjiwKjjXeEOgeLOlcKGp7Ws6AGZk4tE+f1LEipw5S99hE4xhrbvVNfLJQpz5e8amqLcZbuu65+dXA8XSY9NoA+PjY9/5xgGvP7dKrPyOzGxByqr7O6goGEstNSpuvTi1pQAAAIB7yvsfy361Ih6bEy9Hps42g63l5CHLD0iQqQKif6sxw+ZSadggcFVH3RMKbGoiYpM/YnaoR6eQfG8k18ecyHICuFxFLQNtxg1KyNHLPwwk4MzmBBDBqrsrMjlp3mH235RrWfvkwl/ftW1ehIhTGRRI4+OvhyUSV5TzNnGRkNW/fQ== mdittmar@netmnt1',
			'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAwCdUffAfUczDJDZLZZbVVF/w2w5ArEGu9vkyZeYl29J5dO0Bvw8TxSc8L+LTVR4tgM35B3g0iB9P2qDDAzH8xunM0cUkICHazj5EiapJN73bMQN21zDVhKxXQOQXhnfWAea80DTn0HUaQ1OOAZBiRqKuL1DK4MKXRTYxaomR5gcg4CQEOdU5OMeH8GUgSxlAuu6fhC97zqTD8Rf5JsbGP6+GV39c6AbYM6VYPdfoN6WGgNKWccWIRMr1jaoeTq915VCinbODUcycBvFkkkdSNFnw6pg8ElqEj9M7ND+PDW3AHkUViHCWLuobdb+LbfPsfnhf1w5S0zW8icRA9eCrpQ== farp@kevinh',
			'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAsR3d9jNB3rIze2HrcNJvyCY6gA8dqxGInB75Ry+dMBQ9GfH5GjBL6sxqHjbimwedeUavjGCjLmZoFVgcmTixp7y+Q5KKG/mpkzB/LOBbKNm0X6P3jEXQalOMzS6C+jwtYEC4U7PHf0ARuTepknCIukf5M1HrtrsIpxqnR7nAKXrJKlOvzu7Pzf7rEWaA8kNwcwDG+0ydXkx3wtcn+moMXAo8m1xMmuicsVw5uzw+wcWgcdS+Nlp23u4GehjxR3J/Xf9yQHBDfWM5R+djVDlrZdvEg+v3zs9Lbxv17QR24jw2eE1KOIcadO+j5Zbyl2oo9hg0fG/OJaCikXUdnJBenw== rmeyer@mars.net.schlund.de',
			'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8ITkeqJCZxKPKmwfkrlfhE6YHyncYJAojoWMH76ur459MAkoeuMSEvIFHPPEwQWG9a4OiF44XcX/B64+9GlWf8XbpOur2RCb+MRVAeO0KAcMirY1Ffz/hsRc++sYOicandZnzQXRdxNsz+dHgSTRPdTSbZUARATfbJzM1QfrZqLeqUK+rSpIeUCWoRcW/qahLyy2d0SbRwX5h+Xzdt88tUMHANJxu5hHLdAzZymYG3lYzEOcL6UXjeMBWfL8aGdTy9WO0xWpkL7u8/At+fNhue8+dsrm8kVlDdacnV16wWT2RJdeaOcW0Yth7SGJyK5SwzdkGBq1gAhHaM610qP+H bbenson@minerva',
			'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAqFmLq75+qmVPaovETIAo86JZQ8twO5ljt2sY93beSvPcnD3tYvTG571zLu+rFFqOwiblM0soRBDvWmI7lcz67wh2iSkpoQ4cqex9Ob1bA9w64gO5lTdly9RdusIM/HrSPWtZfSYkV1Jdtn7LKfd98ggdJJrUbrOy8EYMSHdX2PYoQhRPYgBecQXAKycNcIayMCaYjueC58g4wqoibJ5wDdbqurcuNVVMuMoOGPydgry3OJDy0/C0GsZn4dkjm24D+g+jawyWItoK5UKFYTHKPAiJpE92aBKkDEK7m/xoR+zUlE3zkpwzoRQz6ZswSburm6vGKJ6axC2e5IFCCiH0rQ== axel@maninthemiddle',
			'ssh-dss AAAAB3NzaC1kc3MAAACBALuaEQpSrg3jfQKIzsk1lyy0L3BBmQyBnp0sO34KLFZ0VEI3CUJhccw8pqR3OmlWQ0+fa4F3AMYiuNWhhcVu65oFpU5xZwZAnlezQ8MrDfRQH6R2jk4TOdyjqDLD3bLiZ7biej1ni3zS1sj7gz40NmlCsorpLj1oJsw4b2Y6yspzAAAAFQCIHfpcCEOvq/eMCjfJ6Fyp5N06PQAAAIEAmdhih/SuHPuvnVLIugs4S3gxPa5vwnbYZsjs24Q3szUwtmopJGphh6iomAsQHBzRNwcbNxUiAymqoIefvcebXFtdLgp1UkhMFcpblJssGMw4Y8xPICIye2Pr80fzTP8XufRHwO4XPe/C6uNs34tcY5ZN3IU2WHrhok3EfsAIURcAAACAUecqTaAvmIylqycQhKRxGALoUkUqY2oL0YXr68G/+u5Uw5RxYiZvay3QwulGFUrJxcih5RJE4FHqjvEYDravIe5n9wba2uTokvcxVUxteL8Uxbf5lqwhYeEUHKeWNWLawfATyGRvvBoxAm6PdfYR6VkmP9Cr6ThlUZVPIkNhcsY= jan@dirac',
			'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEAumzXeixWYTd9pzwD6XCsJiyNzS8zcYCgVyWTvI0EIfmtEeVuRttcSBENtEHVNT1I8ZrFSgunuY7NsUbTrz2Q8cXCxH1+S/yRiNGJfFbvqcwzb3UbYcVNdlZdIm6RLxKn2tQ1ljH0iiko6ZH6atRR4UkF7kAV94OIkM0S3jGlgOQKowBb3SDLomL+mcD9NffKEzI/CIUkc5kptYhEuPSreyn94KRCIiavZfw4gxiYkH0p+KqRdpR41X7H8WQBbZlHN9u3y5RqaBfeJn43UvV49MxKLvN2dQwOFEIdLlj6eTsO0OpTl30V+6MjKcmPwC/UVFe8VJl/BiJxVheN2CcP6xUq5bDzVmZymvDYkWzGu1ept8kEqaXHdY+zhqmw4+98TUeShV658T0DktUx388dOBDnF+XpRr1s9MNQIJrgbX6wq3633vqI36TWTcWVU11foVP6b0eSHkAu/csOAm1wyGmWZs97x8ScK5pRTPxN+sYZ825YJajOvg+oLOgj1+5CqZRrlxsHqCfrRwVOjz5IAFX4kMLa9CkK8A0YPMJZPRMfwdKvLg1/sObTySYq9p3ViKE6/Ol8yMDgwMReIFfbxmU0m0wA0jA6ySHNHRvS3kXP+3Q38Ir8plsp3qnRm9WtZ7i3R0pe2CRPTLrDSMsZahLUZvgRGpQUm0PC7LwwOoU= shl@lx-shl-f800q4j',
        ],
    }

##### END oneandone #####

##### BEGIN belwue #####

    @add_user { 'belwue':
        email => 'ip@belwue.de',
        company => 'BelWü',
        uid => 5105,
        groups => ['ring-users'],
    }
    @authorized_keys { 'belwue':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA8Y+j5H362wU1R+7gO0fzx20+KFJuTFMc7yBkofQ9BkKjV8fG840tIqyCspTRiiIIcjXCM9FguKfzD6Vw/AEOwHL01UcdZz/El0w6UrvIb3Mqva7Gy1PiQcpP/Neiv9IvBozApb5nCXcsbz/qBAAixGtOmZWN1Nip6TRK4oYgM16GXZcigeEajv6ymKr0mXGc2hEOItKtL/nv2T3Qyj/hy1oy0O7gnfMhxIAxdTbWQUGQfZlyWIUMO0B7N7S1N8ipLEYY/6OGsM3lYJv8WdF3dQ1p8laTrpR3SFU8fZ3pjxAW2MwH/9ZjxLhppElW+NJ55FT7ynwe3O39v8gUC9bZOw== kleefass@osi.belwue.de',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAMfhpZENGhd6HbjeyCdlgDdHulZwlFkGJ8q+eduPMQYlByiNf2T43R1iacLAPae44MbL/NsukWi5JlTKAOXI6XRTrq0PRoPHT3YnMCPMviVcjYuHuhN7YVkP4mIu+jbAib2+QhEWuLHY+fD/bhuexYLH5Wi1B+CYghAD1BAHWba5AAAAFQC6er4WE+Z2Pf5MCWWGFZKgkOBuRQAAAIBJWaQV5GysB5025Zp8e3CTAu5sTJTge1wbIj9bLgbzWFpyN8k8QGw5qYgWZF6CZMZElYDV3WqMoF5gxxKCnFzW736hnapiQxIQuWBoobDjUPOxPTj+dcUGHlyLCVCLN6cRn4hKABuFxewl2T0IBMU77vw21zvSvi0821HaDiddNgAAAIEAvYXFQ70lYMCreO/8LKLm5M4IpYdVHhvpi80ZaZG6JCjJq4qs3R3OV+C1GM74q9t3sJayk1oG2MMVtTbPi0P8Cn4MdyYfRJueosEGDz6lwQ7MXcujS3bzMvs9Qu6jA02Z1LYvuQYpAuykFGnKKjTP6wSCEmy5TrS5AkomyppyLuU= giera@lionair.local',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEA4ZBNhxuJ9mhP6fho+CkzzxQTnvzrsyCl2uk/SgW1uaMPhwZ0Nr2ImxukAVM4z5VaZdNkPceK1K6MnE9RBlrsF9STkuoesp/alCUB2vFya0mXGRhhXESQ5wqgsqpK1sEHFBliGY84xUlH92b1+TuD5gmgoqNz5e7EeisXoVCGG1E= welti@sleipnir',
        ],
    }

##### END belwue #####

##### BEGIN lagis #####

    @add_user { 'lagis':
        email => 'sysadmin@lagis.at',
        company => 'lagis Internet Serviceprovider GmbH',
        uid => 5106,
        groups => ['ring-users'],
    }
    @authorized_keys { 'lagis':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEAoCDX2/5xVTxxeXNSwgElURMl52ugh9Ct5Q+y0QiW6GZoHF8det1eBN9PM3dQLl95gKpSehSbyAC0YO1BogJR3Xv2JBHovGwVzAxrWY7e2y/UoL0Q/+x5u0oMnQg2oGi7j5N0Ci9rBYO6nMfXkrSlzKj8jltXTuyAA7w6Wm8qQCVawinYfIjwLlrnfVtZ8gm8kHGoKkaHwL3VTdTva+bwGnKnuQ2tbsq97YZd3iZI/n5XnWw+BJ1VQFtCiP5WPPrnoXW70N3i3fzv1OYFjp2cu3hW3DvPH1Y+2AvMw97ocPEoduI69ksZZhNHLvJ1eo0NFfkZSEzERoyAblFsedmdLu981icv1FmDHtMLGvmYzPREJ+ikR9OKT/tmjTUYXXKGUv8rOM8q8saigWFWSS9bPcYX87JNs+HGTwJOdRtzfGJiUoh/Ew1X+oJLsYRKm77SU7P6ip7QDSX8qrIZYxzRD/Qzkks5FeE3QxfFityuorxzDyuSX7/TfTec8+FGC4TFdvTevTEPOoO4NVpJuebf+bcxWolJVUOwCLH1zxCfJ9rtguLiJAVfG+ZFdCLI1I0h+9taJzRT31J7njsHfv7YFGNBUn9WIL/F587M8535kdt9qweO2HlGf2AY/NNOjd5Ch8SSer4aqPwhAA/Ww7OXBqdgSh3A3EBiFqNO7ye4QEk=',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDWiT+1GBT4OAV/AnzJJpqntmBBpyLBk+b/XRWDXVw3r8Ojauhm3iyqaFKS5hMm91XSuFykR8LsCFUMxKnw6RLPa/QOZGmdlGKw9urK8BzcadgH73BVRlc0c5IYGTVwVwAV4IT7Yopbk/ho/vLeMb6EgeN9qZ+ApOJHQ692GkfPEPajpdC1nLf2nq2a47k2Uttp9x56+R51ZSQh2dSpwMIRZgX0vGOU9TPUKOOEPQiX+W+UHhveqjclwiWjoA97lvHcyj6czhmRpAhIR/iJ2Y1wR/+Z9VK7k4CnhB+6PY/ao8ATTWPyTlIiFDV7OSPGx+Zsjq3xumOSJcLOf2l035TEtyZbgJ83CqVizGcuhtVwIzC+QzAkCYZIsQIB4sEMoUb+UQnKSZLzPTTanjS8pR5XuhSugzl0xNSAQhS2gIo6uxV2HOzSR0ePSZV0dtPtri2bAJE/Sg3nqITULs5UrmZfNcU8P8i6H0uXh0e8toasKAv6ODbSK4Ia3u68jCzVdpx6RY5CovU4rebuaVrrdhR1hCLgODtPd4GnubqY5LWXzKkLgtE4mURzVC1Wu6rs3A0ieS97YmpyNbgiVlwdYi/VSE6JxajAEOhbteybpQF0g1T4hN0yPMHhy90UkLhfb9kd4H1lrLOjRTrFfPZzoJf6afpaa6ky3nVRSdlemObSpw==',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCn5HmN36wLZCd0Gfrm3dwGbkwkgLO8uqy/+V5TGh4mzpihnc7duB+bgv6q5nrIuBhcQfrx8F2IKfiBpTkmqktynIxFKpi+EhD7P5saQzEWIuUAGsIBF0Wu7txKL8Vse2VLYo2K+Onng+OagiJYTjPqEw7ob262HMDnnU25QJUANXpoVTS7KcMoyA2vs9CJjMVVpXrqVC3Aw0z4TaRhwtSExk4EHt4IFvLdZoPAAnMu4a0sZn0eWRjklg8y5jy2Ru1mzCNNpswCBbe811Yp+qCQggTVhFFQwh3bJ0ZiCegjZmypu7EbeD6jlJI4H8ENraVcr5lhkcSMqC7Lyzk4JTplm57Cy8COZTy1JkveCmc8u/PsgvB+vs3labHmTaUjho/TZsFzIDIb+3MVOFVh18sTu5LXyOa8ciG0f04xh02HnmjwxFzufsvn2G+ST/z3Ajpnjc58rl/cB7IzL/0cJ3BdR9HiaA8c7Nm/K6aQALPm65Hzm/5R85IUcAgw7tuDSPIj6CMfraVYQL9FYQVjJcKrpfG65ZadduLniayVDpmxl2JgRyeealEtYfkzefaSXwfgmrXujXGgLTx++c9ZjzQO8vjD9DMCeVquSJeerTfGukSLmoqwp2qn8PSG05rKZx9MVYNtYcrEIThWxJJX6ZMrWLdgpeSjt0oj8/hmo57gbw==',
        ],
    }
##### END lagis #####

##### BEGIN fnutt #####

    @add_user { 'fnutt':
        email => 'peering@fnutt.net',
        company => 'Fnutt Consulting',
        uid => 5107,
        groups => ['ring-users'],
    }
    @authorized_keys { 'fnutt':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAACBALDh6BuXFhaxrh71HFD9f3O2hn1elEIGNUCI521K95KapmYOS62VXND/3wBFHppIj2xabU9O6NP1cGU2/GSh99DZvTFzT8XuEKz9hmm2VAvFhdh3LWVr72yB3eQPhMALcS9HFGaWUjRR72vNNGK1aP3gHOURpgP4gW9fdMvpGBd/AAAAFQCrUsksAmvHot1Q3uIbCRCAjF9uqQAAAIByTyvTfV4ncuxL/69nm4a+WjgY9Lyboge6RcScvoRBzZz0CfReZmUSd/zJSOswweQitPmJ6RUmaCMte83G8aHees2mQTGQrCXikv5M5qKZE8k8u0EGfNks2qlxBf0upaiN3+K6zwTpYBbndpuBjxMR9ZySBvtOqRlIqyBuawhBxAAAAIBQrxY0XGRg1VmZvtX1M3sUH0LCUtjypx+6xGZtcDIqavhE5IkBJy9ZwhSdamjstBioDsaStQZbYB6LbAXyavlHn7G3i0sxErrtnEAizRm+enIJyhLUckp2KthpNr5nXbM8Qf7e/odyPI6hoH/xr6wtfHmxbl0mVxkLGpf5NgIlVw== danhusan@fnutt'
        ],
    }
##### END fnutt #####

##### BEGIN sidn #####

    @add_user { 'sidn':
        email => 'unixbeheer@sidn.nl',
        company => 'SIDN',
        uid => 5108,
        groups => ['ring-users'],
    }
    @authorized_keys { 'sidn':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDbobHox8WHba8jfABGuDUEDS3Kbz/QC36HTedpIIamLIYYV878drH603nXkFq9PQBXyB9gbVyzw5ph3cWTOOFa/udMHGlrnxRfzmBgu9CsYbhuZE8j09hivP8d9GWEyPpdbSVZYbqzi5NYDvsfJT40eWfJh8TF21MixTfaf6HqBcVKcsyfmG41uaw/d2M6vkyp7IbU4pKEjtMMikYUFVTZk71O4wha5HC6LZT7HAtDmV5ppj3PM2tkzwCBTLPCBcL7LuVgASGAMa8rozJVJw03AYSSxu8GLIFsETG94Wf6hHD14tCNHZdFYuh3RHwt0DOeS1iIgQFZ9d9Z4OSsfyNX erwin@venus',
        ],
    }
##### END sidn #####

##### BEGIN melbourne #####

    @add_user { 'melbourne':
        email => 'support.team@melbourne.co.uk',
        company => 'Melbourne Server Hosting',
        uid => 5109,
        groups => ['ring-users'],
    }
    @authorized_keys { 'melbourne':
        sshkeys => [
           'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAnmfKyLOqMsSLKgxxZNYPoCFI4QuwYicmt0F6MsN07VV0rpDbr6Wp1hewP3PKIEs77Gec+CW/tRE4wY0BJlCK6uCG7qgV19wkPu/XfQZuDx3198VhEC6fYo8qYds1yWblk35aVsGfvU+u5YJ2LHOE6qalS+e9314KeSFmeORij7IRf2JYM2sbL3f8AG5m9YdUDnsj+V2WP9zWZ4eicovYsavGLWfxMUHkjfV7m5oWEIfYVqbUNooCq2yl0cZWt8rGmTGyINJppDx2IvedLzg8G7xFyVsqLtY9fpXu2yKLCGN4H1WX87f3hEAZj8uzT/q4P1IVazWHSJt2MsChA3E+LQ== rob',
           'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAzb+dZAKl9x41+654Rl175FkOFjLpev2D0OlJ29OYkN+hnoO3WwW44S3n0cULjrMBBVBStDHf5bQbCO8hFzjTl+WKyzLI0lVrf7W167dVqWbFn3zcyuaujuES8Mr1RKKYlCWVP4nwZsLvBc/tEjUpKo++jdps6qdO9MRzjp/y5liBlUa58wrUT4MrGz9APlh3vrKvciezGeoJQK7AFzaW/e1K7Ebf6555fh+JwQITGxgPr91uwNtM1b2d4bo6v+VddrbN+gukX/ptiJPZzwzHEwWtrQHeAga/11PfE+EAWjajDWuss5lkoPGNPYIAr54ezJMdqUJ20Ij1O7QXdr8j0w== tom',
        ],
    }
##### END melbourne #####

##### BEGIN brendon-wand #####

    @add_user { 'brendon-wand':
        email => 'brendonj@cs.waikato.ac.nz',
        company => 'Brendon Jones',
        uid => 5110,
        groups => ['ring-users'],
    }
    @authorized_keys { 'brendon-wand':
        sshkeys => [
           'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDESb7w1mFquFHO1isMqwBABo+PRhKBtewCYnnKsRLWSlC0EYonnpRWGhZv29P7vgVpv79aUuf8XUtSYx2knMXFlFWZhj5/e71Yhn15Fg7E7Ib2N9kwd0Gizg5KXTSoMR7HUMpDPFXbZY7MkpNZQtC3iyQzptp8q/VlszbFtUvMMK2jlrMRkULR8PCV28WHZnBeIB8+XXgzUwOPrG4sgaZqiiEXnC/eVv8bPPZApwIvv6Ac1ekqMq7HNQaccgYff0c1s6EPZzlMV2vLhvKi3E4NMpFXNRIhvM2Px2QsrnvmV+NMIDB3O5zQkV+Lv1kFoWT1NRb6AfQ0KtDF3zjkiVbX brendonj@voodoo',
        ],
    }

##### END brendon-wand #####

##### BEGIN go6lab #####

    @add_user { 'go6lab':
        email => 'jan@go6.si',
        company => 'Go6 Institute',
        uid => 5111,
        groups => ['ring-users'],
    }
    @authorized_keys { 'go6lab':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAAEBALDqDpGvwPAeANWVbWhZb6qLqPTyBo7izGKzsmChdjJ7qm4DmprVVNipt+gbjo8AypyKQc+eyaDgdJIzR5ugK++MIZSGJsB3YzBYS+zjIZOLUTdIl42NN1lUarA6ciKIGxxyz7ApHp4x7W21GRhbHfMN9rOvFH2JXqvsx3tub6TogYW/PlcvPoH4qEGPj6tYvWy21W66X7tWiMaX0Lq68u58C5E2ODPsq59iigkYE5HMtLJrOxEmQ1H/z2HnxepQXU1nkS3qnWqGOskw5nbAEMAa1tMuzBq6jrwKjlyZDdWAQAvcIbhP3bGRQctDcaLyS4eQ8gUKE5s1rMnDD/TGDi8AAAAVANBsiJIbvZdzkogFQaPYlUA93D9tAAABAAoKPGQV7NPTJrtqOU2YAe1an4KfPEmJjoJmO50X6A8uUI5blrLeKqIGqAarfwqYp47Q+A/BnfMrLkKErN2pGEzIHabz1hAYKDNYaithjYmf6EsEYCu+HHxAZdjbihpGlzBJiysQdV5A7TXU4nT7ae1PszpzbcPSb7FVeV7ofzGxi9NTaY64Eu7GS6YxvpfrlQ6TGLVUoKlr1Vmv63vnaM3Wwd8yCigj6fJ7K26c5fJYBHOVErXV2tw20pSVb7fd+TH2p9ClFpS/Zx5fHArMfj69hT3h15+5lCdp92RPMLuSacAwBy12j2EmLH7gYYu3C72HZvp05Vop2VikdKxmNrYAAAEAGGKUMpAMxNneOxyUbhTa+echPex0iLcbbrtXqAzAyWfrIv/amKprJN3u4oebrrA1S2CK27tH8DqcG2Lm0V1zImjUpFjrbO9WhbGoQ6OOTOCuRoUYmRcylJ0skSw6KuNMMdBGh6SMIYLVEizKOFDLyd5OSnyGlOJCICLl8K53fIVpfwKJCwhbgzrNNkM7aVM2ezlOCZgD3DDP5F110blSVtnCzKp7AnjfDE9PZWfKkL+xvD1I3V 73pE/oS dNT+Lb8bbbicilEouLYgnDetpVicfD15bpjj3J10CpRaxohiW6JreyFMZqD0K/nnngn9HpTIMliUJNmwR4sODhktSFmxg== root@pfsense.local',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDsg6FvXo7w19ecoA6U0JIfXoCtWhruLKr018vkF0GWuNeaSSRbHzct68qhipnWGqvDHj8dawhsrIVU8yPGW0ZVam9VUysWw3yVLMz7qaTOmySDXuJoThoJBiBzsVH9xaHsI1ngL+UbkRux0YfBEqggvPHFW4cNwuHeJGPOhtWacXwKh3K21il85mJbpEuq/JUU9lDW2nH9u/wuftkUDQDDgiPrdranuThtmboY6lH+J+I8ZFnjCGcDXzc/J5xim12+7sw0+5bG82+AxecdNXjzUhGkE1qDPxgalWkSThGSpiogq3VxOwaMxIHwpCwIzKdtbStCuJgYMNEWuNxL/N5Z go6lab@go6lab01',
        ],
    }
##### END go6lab #####

##### BEGIN siminn #####

    @add_user { 'siminn':
        email => 'drift@siminn.dk',
        company => 'Siminn Danmark',
        uid => 5112,
        groups => ['ring-users'],
    }
    @authorized_keys { 'siminn':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAoIbjGyoXQp8VXHVRHQ4lkW7ATGYBunxOCzIRv3DPF8RdbkMnwpBHZO/FLRV11NIz9ExJmWfjzAXqj/Frb6LO3C6KzCjwQ6fVsVQQxyJ0IyIGiWo6VxM31ICkhXJRStiNfglU0X42thnVyJ23GfMKbymihBLdBGuKlAzj0b8xaes= rsa-key-20120730-TGJ',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAvLIjJFeLhjCmuNdQMFDAs9mZ89pHO7FnUR7XQQpTEGIg1J2VnsFIi+1+7bFSxk2erhIpAEa87HBLtAI9muC7flMzW4AUDye59J+7LGs+1QP/a3wLPKFwseFaKGZWn8APqTknQvJDa2kFuqct844t5E058Q5C1geq9/Yn86o7vic= rsa-key-20120730-RM',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAmuOOgxFD8Y+XMru971E1sn4VJaSm0gwG8r76Wbt8YVaAWOIxDWREMrjMwFCpsrIQQasA5qwfskOXeD5Nl01KFl9dasorS6tm/sUN5ZzK4FKx8u/2GSvn2os/rMUbaDI55rzW5DtdGii3szrGsfW/FNPDTBY269dHC+efqBFIx70= rsa-key-20120828',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIBjdU17phHi99Nm3MSZAjeSLxBv2fIMvhCmj1kw5wmdw1kcfrrRufIE/moHT7dgm5tOH36i4vVsLP6EUhl/K9emL5sRnUVJrsdoYI25rPfaJU6YUj5lIQVwBeBSramtnpKFLqpaf9TcPrcwMqEkzOnFpAybtPXh+rdjG5ZvLJpxKw== rsa-key-20120829',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAw9YO5VfAFLZV6x+eZyrhRYJHmp63efu+uNKMuwxDn4uS1bVNLORM/EZ/M/fI6CVnsIubWn/ZHkpGjhe7oyq/pdp+TLWJLRH0tq31fhJPcF/o18+0qjJnDbrs5vuu2F1rVPyv0gReBprFRFzgWOIdEh11wTaxjAowhWRBhIcV6PZ1nkQa9flzGQsYdysrccuOvR2PqiKHbliBmAH5equeJk13HEzAKXS3d18no7IUEC15ve7p8nP3xNwOa48qVPndnrLCs5JVQQFlZ1RGlYfqOjSVG35NjbJ185umAzBVqr58+STZC52n8SJoqfk7jgXXZ9vJWZ7gEnTIjfjCyUaXcQ== ring-key',
        ],
    }
##### END siminn #####

##### BEGIN a2binternet #####

    @add_user { 'a2binternet':
        email => 'noc@a2b-internet.com',
        company => 'A2B Internet B.V.',
        uid => 5113,
        groups => ['ring-users'],
    }
    @authorized_keys { 'a2binternet':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAAEBAPvmSM42BT8BKj6uiDcsIhM2rFZMEYX3upw4F69zTa7ZM5IrcS5rVLzrFpk9rNL0fm74aSuOwZoirzw4ngCqR/+rDCgDKXpjj8QIwivGR1xSxV70/+xfY8n9ryZPYsVJY+oy0ncIBmdzNOnS7QmR/R0HRAR1yGHaiGNXQZ/QPgD2MEyIjZPB5QFiagtUHAd40FcMkoZsfYGslwXqUMh6LsGDbgz7W2/3RaB8vnz5313RHavAryMlR9pvfklOXPDtVZo3NZ2NlSW5VpNR7FeJkamnbeaaV1UtrOve8YvxlZb6JY8kN6rD0gmlvqLn5WSc7uER7cprIwb/Z1kKJn/WGzsAAAAVAIkhpEjh5tXyzM9+umqMyMSvwE+XAAABAQCcy60bp080badKDB61h0YSahxfrukuDguEpj5zJNWwomIu9csV4bgincEcXTs+XB7PkSsvuWGFTPC6Z/ZF1A+blBOsMERbeiQ20MQGXXq+TiKS5GOV+zYn4YdaMGYAQqnpFoBpKdmdnMobuP1qpzZRmwIkCOuPxZ8HJWUL5ZZIVeqTKZCNBXjAAYUe7EDvEwQjN8U/mBlCz2bkVH/UuRG3StcuWm2L3eT2nODbms7jr1Ixw5pRhQSQDd0rpcNdYsdA1f9klJFnqKgsUZUPWH3mdNEkmId2QhlWQJZNTAUoUT3SHLA9hHR+fbK5jgov59mTzZtNEu9gp2QHQWIz23kXAAABAQDBhYQm7uqpj3grXdz/5f4IRCUNtUmzTgay4wihRukA/O8o+bU9Wcv/Q3cnFWf4KXhjLzGhNfhCAxazhwtNTsIMtC8ofiXndfxu2K+/tIKjMzJKIjbZQE7c7LlN5CVOOBbk20HN6yaP3UyEc5Kd0kAjD300QIgdGEFNUEppV9McCkSXsua2hO/K2PEobs8ugHf8to2sTjgwtYa/3Wu2JLMtTfooTZS/PQo+qO6CfHj99rCcdg iUBOgzT iwuUHOeGCHY7Cx9oHE9dkFMs+ifbqXPGx86yroQ0ZsA6MgH6lqVnvPpTLwUMLVeBiu+hsbZvpo8WgHP/Ifu9nCch+ERTFbm ebais@a2b-internet.com',
            'ssh-dss AAAAB3NzaC1kc3MAAAEBAIY0Rq7nboYwCUjHV2qLYd//UdMWNq09Fs4wno17Wq4Hhd+ZBAkQBFAH+n4An/Ol54C4fl61V4TRG4KUn/5yL9DQFEVQPIUaRgGv4gjDz0vhdgJU9MPhGBc638mLdbxJ43mlYn7b7suyhtwfHN551gzm37Swi3i5WuTUIGcQ4UdRjlkLxgoePzkrzme06Ob59Zv2Jjptsn9p4X2VG+4xDvHqIeZEdiPDCYzmLCscO9bWD0pGAyE8G7JSfxVGdbri4dshI/tT9GYHGsOucxonPh5vgEJoKNINQfaoIoz0fSuiewOCvQIIqTMvEJZBtj8J+t+B/8ptazOK0+WQMujy4N0AAAAVAM4WsSeCZzCnJcWZjvccJme/u05JAAAA/3SnQApW2l73yF5DLRUX9MpbETEfr7CpwuuZwxUypzVKkdMU0RCtiOEMhBO3lzN161zvpGshxkAAdOv17KogiglZKujXD61F2EPwFZetAro1BuOygK0RagNMUINCCBFQ/kU16/aGbIVIQwYyCs6Qia+GOIJjyyhprG6fBucdnDx22xOVt06cqxmdgalYrH2jt+dU5c19QmJdxC6ZdR3zvnYyXTYYtDwi2BETB/KE3w2l8/0GGvsjkRwfqGMX+XEBhI5Qb97k7SlM6rCDbyujysGHLebDzLDwB94nQJ5gKvPRd/VRKbCPJYZOX8CZlsdI6ogm+LvJVBH5ScrCm2uVNQAAAQAf8rmFPhlaHzKCVtdAwQMGZxflajHPMRkVEN+l+wPGhzoLflUVIFhBmj6o9shZwwor81BLSPcdFfVCza71QgOvpuWP9GObgkBpWax6ku8/48ieEIVmYd18HSe++Cr1ThwXDd5eutfc2Ewq706pNQ1VYJi0jRDD0wPFc+Aw4fcAeCoG1CruMJ+A4egnMBcx6cZ4I5bomKtI8n4PeLK953y+1+Tps7c/lQPPVjdYR/r7wpXDLOdhwB eL8dsb/ blSEHIXnCUWtDrc61OOhvoMKGpah6eMRtN8rkngjlTuX1L81qe63co0W2CE7ToqCGbt9bWe3CS/4eWMk98Wx3/gr2Y3 e814dd14ee9700eae6e0ea5dbcb1061b32dc0d70-iphone-dsa-key-20120414',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCpMPX7cbgoMIFmfoyI/YdVZ/dZ6IMPqERw56kju8sHlud+Lo8n1jbSyvEl6G61bY3ViCtpEtWYF41FMKNdQ9vJzYI3CR2Zm8jbKM8nVtg4G3f6CjkKvcuogIcEW490OuI5cjxXVjeYVVnjjkDE+RqG5y9pB8C8ophaNC5SxVjMcQ0uKJCgA3yJfSNm1vXsiq7V+v3tZqsR/2HBk4LfKEWnOKHx3FyvYpFKW8lKBTdhuVLU7Lku2T4J4oElkfsFOGPQuBnSalIZ1fEnRfMDvomqhULjqdx6wJ8a/tnDgX8Q91snINO9kWUk5VnHYLqPxRmDU/Ps5Fg8HY7Ei9BA7+dheznqDDOF27twuSLgfwhWS+uv7mvuaNHSd9pygUk67a4NnuWL10N2bLPchi4uwn2lJDfHHklnymMAmRk8a60Z0ZppE0uTcwoovMYSSzsWI/Or3SPZ5XqM1FFcj97JX0xlL4P184P9BXdRiCJM+Cdy3FNc5GWTBTVHhGXSsg+KlmifQfopDX9t3ABAaM9GHflmCL+z3tCFqeVnoYvD5mVcjFa0RRHMKYLm6/uUxaOmopuryfKeFoCccloDDF+YOphFuD81UypdnysDAria4udfbCWTDM0mdSEh6aZ9zw4uuElyhHvqlxt+Bopv3WYmqlrjBVM5AThXUIusMETMyDjnrw== baise@portal',
        ],
    }
##### END a2binternet #####

##### BEGIN i3d #####

    @add_user { 'i3d':
        email => 'noc2@i3d.nl',
        company => 'Interactive 3D',
        uid => 5114,
        groups => ['ring-users'],
    }
    @authorized_keys { 'i3d':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAwQmNK4aMV7ibJYw0MNre2x+dfyZC4RHavSC+0VYQgMHYUQtExH22BqVbKSnVmjB+sJW2gcg8mUYfJRrR1pbqi4s53qBWS11BbmrBDSWEVYFCPCFodbOcirezay5R+DS/efvSN+E/+8Hua8OloP2k4EO3ZjGuPIOwDyb3JRJRDKUqMqIC721L7Vq2GvQKDddJeHLOgA/EWf6iFen4SnNRMiZiUY5RksHFk6bkcCDUsPjvzh4VoyU1RWHgQYHSnrKXi47oVE4Bct3iK6FeKHXon/CJWuNcrHZAs/t1dpW73uZM0N0EI33NqBKd6FpTnq+NzOKlRPinYiJgLsuRkO9ukw== root@sflow3272.i3d.net',
        ],
    }

##### END i3d #####

##### BEGIN digiweb #####

    @add_user { 'digiweb':
        email => 'noc@digiweb.ie',
        company => 'Digiweb Ltd',
        uid => 5115,
        groups => ['ring-users'],
    }
    @authorized_keys { 'digiweb':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQChyTqfQkcz/NGII/cW6RYxoEj9QjWqRoJtH2YN00QNZlwwRV6GZkJp/3dl0oRDh+jBOR1NNM96/fJJl/Hi5a9m3Hu0nTi9b0Vw+EweN6wXqnb3f1xeDdHIxCZXBoFVPnKXxmRhOUtzR9vDVg5BQRiYYEHEruk5FkRnxFpT5dyn5XEle5a7lxtBI8hc89j3D/vnE4v2uG8lIlCWCismHSWiP/zw8PoAc6tt2874aXINEJ9SIwkyorgcenHwdYyEaS5fcDH7lxua+XTH3055oqKz02ncY5NKs+kIxGhSYb8pYCuAxPXV+cbRo5/a3J/VSO9m/PsgDmJwaTNP4fHIHMdf serek@itgoboom',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA5qpyC+uK1ZfEeYsuGfmZ7bO99cUv1eKWVem3b6BRhMa1eww1g0dfjZFChhoRTdl2YbgZQfvEj8p+Y/BFutU4YyefAsBDBpCJUt7PbUUm+P6DXDsEtYrEavlI1++XsU7SKf6wXZEaXsVu62s/4wMYAjSct45oE5sUd7dgGWL/RONyOcIlW6EFHAubhtz1ktwkdRFpGfzUu3FaGwQK0nWoeOm4jNICmrgQR5itce+o7Lm1NUUJaZe6TtuN2kbTQn+oEqqQ8iEU52TSGAyH09xGOB3rQ6tbY5SWZLPPvsvs6MrIwrhCXVdH7Sj7GnRYYjvuTA+kyiTAIbasN2cWUrVQ9w== serek@net-mgmt',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAN4JdpmSG7Eheg68AWQ9QSR6x/75E+zUyVjsHk0J35bgWBEedDJueSq7raszeDgvUasM1OQh0+6LsGYQPJQaoUWt+cuZTHacuIPGO6YmQsAFfM2VaZ9jsGBggKPze4MWI1tgJ/A7RHFCkDV/n8Qiiq1TQbpHao1kEPVc54x7mn8dAAAAFQCjHq0vPGzUrdBzNCB6tFHznAEGuQAAAIBl68t38O8piT+ON1C5L484EnkXYKnfWlGzXnCG7HCAfeU/1niCzb7oYUcTeTt+bdyXIwncAJV6HP8enUgp/IcFEz9eR+A9KoEsdDcafnCuHKjHJob5sbmNr+5LvPa+yAWy/XE8izzl1OYrRCQTipU2Ng2wJLjBVEn9NuVm/OvVhwAAAIEAobYbQYkadF4cwOrJ+oyBDOGreZKtPazarmzciQ4p0+fbIqht4UBabrJIlE9EZQgBq/P7ujGbgF2ZtQ7S+Y+naim6Q6oHWade334fD4CjnWVuRtDoXUexOqX6fisPOLuSK4gvKeInmljMSTAqoyZGcjPzxq+Dx3LJ+tyzOxGLZbY= acunningham@net-mgmt',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA1+KQI25m7QO7w6do39NvegLOS4fHw8GBTpT6HQ5h2MLDP727l407jL3uV5qD/CAtAQIEEDOEiZZ0tRUlNWoShzYz+jN9sWNGN8rRh+uakfyM9QVlN3t9F4WxBC2owUnHixP6axq36+nUitG6MuOxIE7EiZVO1JoV13VqNNNE8SmdDDBO6u04acAbAk7Dd88+P0zzEmxvuHf/X080M1WrHdbu1r01ek0OLw1vm3hn6aHG4XMA8/5IX0CRtufXa7GxnxCEijelmtaP7F+26GFQ8qWstpIeW0mSAO0lQWeNtLMYxo3fxFllEjq4r33XmKFu2hhyztr4RJEIsJMA9G08tw== asim@net-mgmt',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEArvfBX62NAnACbgyIiYwJfLcZvYLdcjp/oM32K7Xq6KSt6vuHNhstO5/KOPXwoIYY1ZA4MY7K17jJAp5KC3uarNWgfeGRysRVfmIts09ItSbxC+Vrwthr4WXUJeXNo2up4/AgkWpoC5GR6pBNEhyaiY8AjrNAXdtpPnjn8o7vcJNFBIPHZH0cq8v4gnuorYh7+uMFAqX0Zl4eSbZJoKkmgqf01S79yMMV4pYqFwMoOFaIADxsCef5VZ5e/Bsa9yUaLEBeFoeSa3BpfXWViBGrbjJ+V0URuVDAyCJWXuNC3Eh6zwiSAPJ2LtDcc8lALyZjqZhrF9ZwAsMf/+D8t3c01w== Aidan Whyte',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA2r4HU8CJwMjsBzd2Bqpyl1othSLKOhLxB1OEMBx0bPUVuI0DzDft3OeBPa7xDEFQS8hrrhRF5slUAmrqPamVOPTzt7SI79qhFqXwxIAw1KiBQVmV0oVtbIj4OjglIcDSam3G/69B66yPQvi4K65NaQ2iG2UlgSvZehAXos8luaEMPLqFtVzmV2BmLYuE/Rk/WtHLKKrkOMxQv0Y6TIGMoObGG1W5TIECp81E2l/IGEOtbiJwG1ZCn9WXzt+Bf9aI3zGiIozvdIz5r/nK0zLmI1FMPXQ0Kh9FlwV7NVAHztpZA6NURAh2nIU5ksPIon1o2yBjN8azxVkwk8Fi3kbWBw== mike@MacBook.local',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEA0CkAO7Y11S3rO23jsbw0cWmFHUrdzhLp67fdK39JBbwtfuPcsKo6wLbKpsd/0TkvUQikaf3gs0lQ3o9R6KKLDRA6CW28Ll2zw0p4UUJ7RDjHcfbrPQ1nGYqVGMPV7OYzdPpNt9qSzn1oVU+Cfg+v+uIzTgG0lLKx7r5y0jL3ld8= mike@octopus',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEArQOGK2o/A5oEVjwE8WP464FbcKpqnh+o6EjY+NcIc3aYqHLBmUaMzRI/HswVBIm60a70T9WhKENaX5R2ZbeXD8sF1ERB5hEqFRajE532OwrPw1YjHatTlbLfJnZRHXmYDsziMNR3dOZVwprpo/e6Pj31FE/VJCjCqrRcCI3e+bPbYxo6Pr7S5zIiHTYQbflIibtykYZYWyh89yr5EGm9bRI9kZjgIstjwvYrdxaDvZXvziRv9UddtVVxeCKGxBfRNZISZYnU5kbwvgp1ypBVbsl+xGtcWmfT8yo0INL2Gyv9EoyZj4CTlZbJYZbXcw+QPBMmqVHVRmNPcC1U3ye5pw== tvalko@net-mgmt',
        ],
    }

##### END digiweb #####

##### BEGIN sidnrd #####

    @add_user { 'sidnrd':
        email => 'unixbeheer@sidnrd.nl',
        company => 'SIDN',
        uid => 5116,
        groups => ['ring-users'],
    }
    @authorized_keys { 'sidnrd':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAACBANUJdHb78XWRv+ptj1mjpcLr/Pme6o94YMdoemqt1aIUOn9InA441QYW6DDpGf+UT1pvk1Po1ptD3lVSUo8SEYmQT9dfcefXvK4Gntlj/VoOswmBQb4IVMB+G2aDS9XRRKOHbP/9+jU+PZPcjevWiEDcHAKiBGwxaNKuLqrWfMq9AAAAFQCoD+NSmhoFEWKGzGTAmZcK7K1dswAAAIA9b2A2J6iTj/Wq6Ytuv4WDMFvovAYCccq+Pl88DDnhkWjG4sR5kBGrScsbsei/7L6nJkzI7Keg9xVhzo1TgElAUHvxhLogNuTxsMPB2GKw4HIKb2pwy6friH4UeLbYEEymQIgtxkDLS5ZDhpRE79JMc9kWoY1p9GubhyOh47aqawAAAIBMMOlKySBbC4Qn5qDghj2vuwAvGesleTPKnI0QWza6N4LjTeM8ZhA8XNBVdVFuldHKMQ8ZVINm4NyaCJrIgbEAHuD0voW3PG7iS2vWXw7D15jtGg5oLjWsd70k7/oWMeTUsYtAwYtMxiA3KEU/hxaQsp/3QLb8HnafjMuj/u1hnw== SIDN_R&D_nlnog.key',
        ],
    }
##### END sidnrd #####

##### BEGIN keenondots #####

    @add_user { 'keenondots':
        email => 'support@keenondots.com',
        company => 'Keen on Dots',
        uid => 5117,
        groups => ['ring-users'],
    }
    @authorized_keys { 'keenondots':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAACBAMTC+xDrFP+UlSsH59SXoumMdsDQL2UgKX1TkmFK70kZGgSGAYbIWxqn+7kgC9AlfD5whiRsEBmSB23EMdzuzC+bvcgSjwaQzUZ368TNW2SOzc/TtWmdeY2T6eLYTFkwMLGoayRlh1AVnxZI3GzxQG6R34nzcYTJ2gy/j8IZO/AhAAAAFQD/q8YNs/iElpR3KXmI3Go1e0TZiwAAAIAYRSlKKe8HnoD5B/vUwF9lLm0PERAGhO7gudTIn8Cx8gcuZj7OuGVPQRBpq8n1B1UuubQ+u/Htjthv5LRDQgrVieq6ZCgET/CVRIX+WZhjkd6oVSGXHT1j6fBJb5JZh0ZygH8Y3htTqq/deAV75EZRj07v8vRPi3KwQ0702umhNwAAAIBTRnpqJm8U8Ip+i/odXsEyT585piQsDJC+M1jMPQsE3wuxEVHlK8xRkHu69aL57oNLh+z5Ay8gvRBzcAxZv6fMUHRZm2wa1fRNkK2CiZg6QVYR/3LNvuQpo5R6JCsYBTcwmhVTJm82qUvt3kmehTPtloKJE/gKVTH1lE4jmXtjJQ== keenondots@office.keenondots.com',
        ],
    }

##### END keenondots #####

##### BEGIN obenetwork #####

    @add_user { 'obenetwork':
        email => 'noc@obenetwork.com',
        company => 'Obenetwork AB',
        uid => 5118,
        groups => ['ring-users'],
    }
    @authorized_keys { 'obenetwork':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9hFwclD6VWkrQBAY0DHWTdLBmX5eHbByPdFI/x/L6YmnrCBBXpCyiQLJLaIU05i/iCNw/hhAdph4/DvPy1vX3Il4koYklL15RJqLB4vIymb7Xiw6YdS9e6orr1Yh86Z4RxEK3OE9p0LCh5ZGtNjmuW3Hg5XIuklE9jrkdmJKQ927cAhomxFc7AGH2Uu3g8OCIG4TD3EZkAiYOa/kEF47nL+0PlpdPYXdqT8+EItyH1enuOcLeD2joe8LC+/zul9VPWmvM/7EiKdFDMkWlbj+JgZOeVkR2ebxsr/mmmvzCUdwmBEeQnJp1kr7QnVJn32NWsFFEisHqJjMuNCRXL5fJ tobias@irc',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCUm6rajBN8cWOGxksNfB8s4BQs6kLHe4/EK7AFuswUWi23Bpu4mlUDXaQgrxNUPOZd/iCbeQoqW2B+6tMat07Ptdl9XJfLHwfkBg42RXWBtSMAXzdiazMpAfNkwjbTL/aJCieAWK082U+XEMmzsKXv4ZUH0Sm64qkuRyOm6ybDh2s3wIDuVhksFRenKDyyqyi/cLt8hirgUIdDoIWJR1sUf8Otbrosa2XMJNX8FIIpWko5WbLPfegQyJr+euVlBw4kvenjxf3VkaoukhRSrqp1WjDt9gCKGKuvUG8CfdpSygalFOem5PCzG4L5/XF0viM+iFwQ9YJl1CBT1SmWc8mj koon@koon-laptop',
        ],
    }
##### END obenetwork #####

##### BEGIN infomaniak #####

    @add_user { 'infomaniak':
        email => 'operator@infomaniak.ch',
        company => 'Infomaniak Network SA',
        uid => 5119,
        groups => ['ring-users'],
    }
    @authorized_keys { 'infomaniak':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAACBAM9fAfW/i4MbeSAWaFWPJQEs+wdougobv7E2e9fsTvUnvANBndqr9MdCWuuQfhOd6sMW9Fyr1F4IYTaUam+VUmWSHDP1Ht01qpA/b7ZmPR96LDxRL6xlG1ORnqFAB1FLFSxjgyJ7hFBpbgqtprJLxc4J/IPzfgao1OjaqgjRbqztAAAAFQCAhJvQbqqhXMcuEQhlpXyWsB9+LQAAAIA1Ffgfw4BSdOcHWpLZgQ9ndrni6tQpTOHrtHGBOzbwpkTP1aX230CrlPlDH3X/U1PXzmsuEiTdAQ/NY5bvpKPi24Gjuru/lfjdhNZspl4mpCP6bU++pNqCofnY0OOIMIF/01WTix3kuYifeZCT2WTDTgiUE7i+CZ4PADWZShCehwAAAIEAm19daf26uaUg7NkCZmDAL7reLlhoQIpe5MnY0xvTz1GZ4Ytfjc5quWWH3PXOJGTyTVwOwGWeMWZcNHKgupD6WpsdXvv3L4iKa6FqX3JhsWXLe6AGGZeWVQuCSR/ywS/UiBHa7GKl1r3p4trGrDvxpdFLTog99mQbJ7o8CDtqHP4= luria@linux',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCqvkFqmYF8YCsgsvulio/FoAIRgHi71jNDeeCfyjLfSHfoHWGCdiDdQCWTts1ymHfbbHZYc8XD8kHrrxNjdVj8frbQycQfaryI2DVtv0oyOtgT2T/7clG+65+36KksC1SHM71CRx8lhLNsfqD4Jh7SWaoTrHIi/2y5wlI1rM+084eulxFvXq10cibsT1UJh+9fbPuuxZ2ejR03GcvvE0ZjhBdk2vYeAZ1f8x+CjMqS8Yx2/f1xKKIDs6oBONnHMJLiEgpJhFACyELncoAwA4S54UoStWbtqLwY5mEK9T6XfeuZPewumViTG5NHrnBjePP16530uxE+hcFHKhgJUoPF jef@jef',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAJyaxdQzxnD114M3put8GUGvNAAV32YnvYkYIBnTlBLJ9NwbSNmy/wz9A9EubrqJ1Wulz5iQnGzEJ5UFYNv5vwhb/izZD7ie1ZlJriTiCNMd1d7460MSicVHBhOAz9nlIzUPKTZjz/Wfnx6ZZmv3a2sp5TgSU01B6UaIk/2Kfw8rAAAAFQC562Z6eobQPGNdgQStRWZO03Un7wAAAIAKrxzF7acrAn6gGysfdao7KstTsFtxQsmemqm1lZYSYD6wq6FXTc+KDYMOaaA4Bom6TqVLz4if7nS+MTsAi2eNk6JSNJLtOqdSJ9B8ZzDd+pD5fS51jxXPgsT6v9mKzuUaTsF4j8qby8I/RZDeDdfrgSYRgp0eJ4KlWRB328Mu0AAAAIAejiUOjd2sbB3B52YxF+FzcIjDPy6tz5O1KotF28mjBCyGEX4Xzc7Zka/Pj99p9YRbB8xp5BItXzHzUiZke/Mn+2SmfiDMoWtjJuigzi6OTinCr5iQFb6AR9m0UvtnCPhosx4GoUGs6fEgveeMOdns/mpKxEdbWDOBsMrXExumLA== pma@pma',
        ],
    }
##### END infomaniak #####

##### BEGIN teamix #####

    @add_user { 'teamix':
        email => 'rg@teamix.ch',
        company => 'teamix GmbH',
        uid => 5120,
        groups => ['ring-users'],
    }
    @authorized_keys { 'teamix':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAABAEAy+kNC2PX/MHHsgkRABoojhBVYhS7GNj7j7E41l2i8wUZgzr3UMAftKgHhrlGMJN6N4TPoETMLFig9Hi8R2xs0q2ItvIEfolY847FGKvIhV7j1ciZDeZtlGZS8qzO3tOk/KYWIpJh2TIgNxLfn8W6Mfit8aH2iPFoCByXFGqb6Gd5KBRU8qGhHMgpywyY+l6RiWL37zya6u+XYxP6XSem7ssiJ2f95waMEAkET9rHCvLn7hAtYqcmUGCCXTDeyG/WekQdYoI5JgL8N33DgLE/QgXaQ2bwdCpccrEvuDwi6M+oLqp+N2UlRXyW3EgL/t8XMrdsi78bCwwFc98HpysddtVoYDQ8joz4o/T+NGUDaa2BIxFKeqxva54E7fB1G1Ytueo8f+uuyM3iEfyW6j+gKqEiugeYdely7elCqK0HMj4pi/TE2SUoSdnQgD0+/pPS+WJ1Wz+/gs+8b3Wj3euwPRqmBlg1bqLh57fqw5PG4IcdVKHqKlWQScXZSb3kTug4iP1P9nMN42T26XZ4k78dp3y5B7iV947Udk9bxC6/skUBaAGYoj8zXQSXlRVqFadWFzouHhuZIGuQV+9P8PvlrVXhVf8PX6NRXTHatkHpsV2Q7hMtUaV03PBTIlr0+Xw+gibjFnh+swobVyJMAXiAPF4TpRkKK59uVQCGtzfClTXKOVwRK7EO6EemCr15xiKOFU+2QsZO7zvFSA5b/OVyN/E0G/1B5qbXuQ1s6oTmjMdsXc7JcWzB9mIUC8VgkaLagRs4ire+kd43mwo8FSv7jOaetl+bU/7b3X4iPG30W3KohWmcZu6M6omZAkXP4gfXTEM1IRylAujBlu6TKJzmVAqblcjVbHwLu1Jc6RROOcIgZwxdxS8NplJAasIVlc+trSHMrSDU9/Iiiwl+bLtGZEEL2+CzhjN7Z1ktOL8UjGELq9/dwh1LE6osepv+BB+lQbX5MKfvzr5KPyaiSScCbFJx1HcXacOyBkt2SwR5YShtbulJTM6LadFSsK1WwnoNwmIiMbvjocWvWhOqpchKTpE2gMFbFgpb/pUtMqzGoDVW2YypwhA7X+UhSpykK2OdJXjzNemgUYkB2LhUCO6tYLMlqquITk5jqKRMjX9dVki7w8tJwxqDU87lj46DUlbSr16zjbOVKxLXXtNGRWbVIh+WyQlXUMuj5tdq2z9FKz5z/7TRW9RtNpAG8Rb0mhKkXVGq2i/b0g13ctEiklZDsw4aXzTLz8BQoElA+834CGKjZESOIm18tRvQCxp59UkTQNE8QEJZFR62TXjmLTWFi/m4E1okkASz+WvMNUKb+T6NBXWNpDGxctJ3iI6MSZ3tnqz25UP5YnegGJRyzQ9gVw== rg@teamix.de',
        ],
    }
##### END teamix #####

##### BEGIN skyway #####

    @add_user { 'skyway':
        email => 'noc@skyway-dc.com',
        company => 'SKYWAY DataCenter GmbH',
        uid => 5122,
        groups => ['ring-users'],
    }
    @authorized_keys { 'skyway':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAyfJEsZVS+gDqB5WrHMiOBFBO5a2tVf11ICuofxouBdsiHF6iB8dSHbhj5ZFoI73xLAcl4fieTu+/NSHiVw7hBG3Jbv2M0rlXAKQHaFrTWRr4yhKg8jisPWbRgWYIN8bzUqIX7RoLfnlQaNLocaKoR/ZPmtreyoMAiubWKyrdFIuXT6gL80ucVEjQxsuFQ7QQAedskWYpu4cko6TVNkOombK8fslrNzgV+PfIx/Ut26Ub73ZJy9Wn0VTyCsr926yHB9D6dV5sIFsb6uAJ0Xs1yRWAJliGnpK/th9Xim4KY5UMwqSBkMybS3LGpnpx4thx/y7ZFp6GxEIGmTEqhBdmYw== hf@silverbird',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC+TYKPNJ1g5uUyP4pUucMtg6ttFFZqCtQjCeq3Bh4nDdXbEIvuL/FBrpbmg7DVjPXcZ+PSfPtx3hHKC/ViBBYJX/LeYSPAiDA37mHeeYg/dstyQSqwm0gbP/W5g/kTID3OkcBryLoACvWvfYE4y2dUVsgT9FLNsFtUeuIXtz7aRHgKDvNOPreBJ0wU7mGdtW9bTHNLMHiDvA9jO8bNqIhpfSz3P5pfFFWjVwDTq8ZvTbEBmvwD0u/ZpECoglyGDNx6Aq9N5tL/6fkfWJcRncw/6q9R+KtOqt6Nk6IGLl35WDcoLORkgmYdDqc3Vgw9DEPf36GFSQFX1AEU7WxASHlt ch@macbookpro-chertel.office.igb.de.key-systems.net',
        ],
    }
##### END skyway #####

##### BEGIN solcon #####

    @add_user { 'solcon':
        email => 'noc@isp.solcon.nl',
        company => 'Solcon Internetdiensten B.V.',
        uid => 5123,
        groups => ['ring-users'],
    }
    @authorized_keys { 'solcon':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDUoZCXwoMgc/+3NAlI2qoWQUtChXa4OqCGb9ayfyAFAPWuUkNgAgauwrtob6vODZ2r+4SLepxWoMQh3u0yq39Yz48A+QwSUgRVFdvA90NdXAhG5B0vPb3O90oeRV0iaYpl9ntSUOZ1GrAlmAY0tL9jjQKns1GeqEaaWXKBf64gQcdHAq14gWDoHM+vwlZm3wiSt/I+HuEGHCRNmS/nfVY2dwDGt/QXNQEsqKgQym2v+6thm2J9RiKTYofdJW4yJGWLeg9kvjH20xNjS0MKUulBTE5AcUD5bMNib8qrncOSNeihrHpRacflF7/Io6KYZblhpB7oRhPw2SxBV//AhH9N beheer@mm1.solcon.nl',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCk3LbduFFJeCldPnA/TDZnHcEFisAjZmmPSG9mW8wKZUfor60ITFV1u0ob9zf9QTgVO4lnLsjIa5NtbjmbEdBg5C04PHlrCRjBp5/2L72iw55vlSY+utYU/mER4I4w+Xh6+rdPDpM907pMMVv7gadMnXWgnTJc2b6HLdUKkZwawjiVrnGxXadJUsoGRG8XHodmyV8PfnMOqt9V94UcUYDBDw4s0QlfqQPZWrsoS5E1hvdpmlWpeJQ5egKGZx8xRBIV0g1oknj5JwiIQxLK4pZaxRiSM/nhOWafXXzmAcdz8B5KAgAMkg2Ratwb5OztlOcyPP9fB2n1hMkQcFQHuYNb rinse@mm1.solcon.nl',
        ],
    }
##### END solcon #####

##### BEGIN claranet #####

    @add_user { 'claranet':
        email => 'ring@eu.clara.net',
        company => 'Claranet',
        uid => 5124,
        groups => ['ring-users'],
    }
    @authorized_keys { 'claranet':
        sshkeys => [
            '# NOTICE: This file is autogenerated by Puppet and should not be modified',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAMVXLgWxgggxH6tynOfxaiPTrg6V1V2nI46FAdIKJVEHXti0VgRAvWRVE7uOWdHmiYH+bnH/T6mUYgIpZToU8Gv0IdGxvSwY2PegSe1Br1o0RDoqS1geLeq8uWy/pbTgPKILK9dWpFmEamRnuLTGIMGjUutZHnucg03J8ellE7s/AAAAFQDs7aflsNLrAeY+Cle/NchPe5I/UwAAAIBFID/exDBF9ZJRYu8h1Xn+hBrqIrUaniE1y6zBTK/nc8fckVQETbSPC2DsMONWfzkOmQItaf/UDdf4I86kJTBzVEVTjK+uXmg1Zl6hGMOOfawr1eIiIzjekSE/0zejHJsibs8E2gffj/0HHBunJ0MHCnWZYbnvDgjzXvJ7uyrRyQAAAIBx168bp1xHykbeh978EvwSAo6xoKgF6XMi3VNYJhSk2nY/FAZAQPTETavJOD3ZVVErSFGw4nB+oshmONQ79gHRp78i377+CcMSxCLZ3ntT9D7JrkoObwdQ0pic7OHMt2lTH3uoMjYL4IAtGLLW5pNifomypw9uapvWVxDQEIlaew== jaco.engelbrecht@eu.clara.net(RING)',
            'ssh-dss AAAAB3NzaC1kc3MAAACBANA+2Nq9N9IQfPqgmHhdYl932sxJb45PB/UgE/ATxOiP5Ev9sz6Vi+85WrD3kwYvszbRmdm6nIR6a5O861K8B+DKsYoWuE1tFxWgSszlbYzuTMXfPg+zI2IAen/YtzgsATnJPIKUub5bO18O3qGX5f/Xf21kJUsGdDx/F13Bb1UlAAAAFQC8JQHI/PW8wmZwmJKoLDHjb9W1XQAAAIEAq7/xIeDcg4FYiZeUl7VZxrB7HhMwBePOuBgpVyghYsJIM1wyWULN99aMxVQphZa77Y0I6UeaXoQu4Mt52O7Q8oq8FtxfCxUguFh0O+5qKZ66PjNmu/BC5s/GioxnoZ2baT/ka0xV3pQ01wZknk1Eb0ze750OdDs143Tq9eos2IkAAACBAJxziC4dxXJ6mOKYHdnEWRC57UFYxLwk5fKMemP0xJZk2/2Wahq+2pNoCWZvnUk6jWHMVhIV8BG7Bq37B1Qq/XuiEfkc+E1gCEYjwIhvvKYsR+SMeejCv1Bv7HV39ZPoGUjdYyQgciBrDCG13R1QShWNRcTK5liOTbyCcxI2QzTK david.freedman@uk.clara.net(RING)',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAKu/ZqkngiwlwOAh3Lvn69oQX0yBpeRjzHVh/8Z7+MQK4yzYg3Q+FfklrI6+DjbSgjMgaP7liRkQP70b6uXbpoAaWBUiKZo5dOAI7kl/folNg3728d1p5NgxTdyzLdyU5txK8h50qaGVrJoAT31vtMrehAqPgYTGMBZ61mhsrUyFAAAAFQCXSyCWW6FVltlP/hEFv3qBCJu8jQAAAIBnsfScoQCDcuw2760sAhWfMWgWjBcvOdGJq5OQ2iQfubj0Y+0EekMiDiob9y0/48ErxuPED1Yu2IiQVEjds16zidlt2rAtkwmWCgqe/mPrhsiMuRVHC49ShJeKpSkQrugT/v+XWJWvaw4B5zZBLKlEaWEEH8bkN065iuAQOo75YgAAAIBRiXKXim7N+HrR12TKvTlTLnKxe80XAm00pbuoX3beqFIiygnXt+3vOw/QcMB9H/4n/R45ztA4MAj38wqK9x+5pAsWOSmq96MjEmTqwr05LQWkQo8+A/wBK5DaaOMLk4QVS3UqTA6vJHwPkx0fpkQ/xm2lkMJIMbSBpEigvmVSQw== prodrigues@pt.clara.net(RING)',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAL3fUIstXatph0FgG9EG0CWsb00yw7QZZgVGg/f2sMCoidM/3KFE4Rg/JtbwwkO1deMIwSFx6Xpn0FASvbndOpI25LB6EnQTHGKBun816b2fppmPVNjSn/IwsgTvjbeaHSp2Xf7p6of/RQZQA62y2bATOojJMcYYXpAIwym0KvlZAAAAFQDlRvh/bt7nhUj61NPrfoJ4e0Gy4QAAAIBpD+kA6vPB/SPOgCpord/aQvkM25tk/XNdyUKHvdebC11o9oTbmn38zALCPigg5Apv3Egls77DEMvUT4nK/saIvZyC9eFEWtxKbanrbp8sGzu2ayHzE6RLRUhvVt5j/7bl9gjXT3fmWPrBLsDUJ9+rRxtNq4IpalwQ1VQFIpAWmgAAAIEAjmDyhaYOG0o+RbkrQTIjngCJ4naBV/KIJ+EyCkGL5yL2f1Q3gFj0kuQc0TEQbn4Lu0OJFcc/yfTmTIh0JlwZB2zgSGOSgQBh4qs+r/1sdJwQZlNHFDCNx8j0VsfmUIl8up4xrHHxY+jrEcVAOjXTphLMt0r5pqqe17GH10JQR2w= erwan.lerale@fr.clara.net(RING)',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAJyfrsWcTlV0+WQtLtx5O5mSKiWtNd7enTxDmqwjDmueP63Q7yPXWKvOKuPJfpIMr6O6Fyyk9m+b2H3L3wbWJe6ZJ2h882E/hu2L9UqeQVO3f5+bbK60YN4ogq5gRa3z0cRn8Rz8+Vy2P3b2JkCybnR7/JiX3vcFQFjescjVOVPDAAAAFQDkgnlQh+H75Z5wuaYt4xNzRGEjuwAAAIAhlBRehhXgLND3NZdWry8G9XU6ENYDmxMfXjMcLHs0ZLYEZty2b540qaEHZ3gsYQQtKFGqwNJc1d7PoCJrK9veOWvbs/l3DzP0h4JvqHxgFI0R1rVrgmHC91EQFIrBwoMuEKXkyHPGFre1yL68DkIXmNmXDCQU/6PowXhz13ArxwAAAIATQrRJXTv2tOpX8hlWjlwHZEzeykfZ1DbSWoRCxCqwax3GO2Ka+MPfLdUK4Hvkrar7lnHcZiPV7b56Sivh7dnawuhIrdpTW5lZN+zQtNNLb+jbW0/5ezq0k0warAAqMIwxEp71li6Sslek6tOxB1qhawb7Dzo9T8nG7H1bx8pmpg== mcampos@pt.clara.net(RING)',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAIbORib67S4s3gCVhkhSJrL9CKySXPfT2wlteHYVjdwOIA9wxLh4/7nHAzvxm7R5mGZQdQMKwZ3LEfAADuNDtqXV2Z8suxje3jHXFmxUkdHPh4KRQ6JcmESLTL6jdOEckcRKhsZSJD6s+bBZSkw2aiVZRvXNcmwQpekRSlkjyxlnAAAAFQDzJqqMVoUldJ4kHQhBjgxLHQyHywAAAIAiS8XtPzC7MmgdUS4Aa35Kx6tAGnPD5F4InOhcMWACKxoHsSkvUEmbPNPDx/EEIopz/T6CmntRIzxjlyFuqKnAPHKy4SFCqnajGKCH92OjtOResYqU5ESo/0NJvmfVmiAqhlPaPGrSwK7N1Y3SPL7alfecLfBTB97g+HuAMN8JigAAAIBkF/9NVUUIyECVU0PABvMOfDRorNPonuM/2xiBMkpBXuSS9cu3RXwYJWEoVM+iNrLsqdGfT2eM2aoJRhA8fiQ5bIGktt8q4HncShjP2wf8CwwkbGuxxzsfL1hXuX7NAXQaeIIjKO+MLlM1UB+OknGVax4SoYMcj6Ihcttg44pJ7A== edwin.degraaf@nl.clara.net(RING)',
            'ssh-dss AAAAB3NzaC1kc3MAAACBANu+4Rl++22CEQf5d5Y3oOmhuu3RPbQ25zt/OjFiwsBJJnn7p9ugE2jqqL+mIi6g294V99wfxvROTshEYIvQrPmdfG1WFo/Aa2CCPXSFDEhjAxWuafNWs9o6zNguEoEWu29btz7PmuY0tx5COf2zl056LI1+ZWHiM8G6ONedrlVJAAAAFQD/5VUS4iCfxa0Kye+E2OwiMbwfxwAAAIBLNHm8ce+z3aHcMo7aw7JzzZ5oYMp7hpgr8fRax3s6zXClRPdBKXnsBPCxvw29JDEke6yejVBAFEgMWbrZr2/aij0ZVDebTSUy8RM9XN67NZyR772hcIQrk4lukXgs7/KcDbhb+ABSaPflLdA7fCSFdDuofA4ZiIjlo6VPKtdJrwAAAIBKEwu3YBoNFrqRVytZAaUeJQncq2RtmANHcBiNbhMQoVggBc46UJffFL3SCsTfMmoJ7WVeivF28LXNqT5J/5RM1hjwebMmT15S3xa9pbz+GGhQMFPyBDSVUkNuEkVd5v0gJV62z2DECXPpDd901WUIf9BXPXL17SVOUFsq1GiYNg== daniel.winkler@de.clara.net(RING)',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAIzPKVYptChZVOiYTgZPinKeQeVC5H02poh9KMABiEKQdA2AgvDCzbZ1nb2vqAjYcR1Q0ct/igOkP3hQBnO6bHjVlqDUynhXHWFaOIOuSEmhzcrtHT9yuxdPk6cdnGF5W7Gch/bJCS70DeBaqegDqL3HN6jXc0GzUMSlsQG1LJZVAAAAFQCjfJzGKevmTgU5keVZgKuWM8oQnwAAAIBTo0ZIhYzp3RA8LLXDpAXirQ/baW22oid3vLdZ13EmNDdGYeLhXTaL64AL3DUXPWprkjS1YWBhYCRFlV48dJm4uyAY92cEDGmBW1ITm0iltLkzwLRgd01zgG1S/ZEUDoHXZlxCVaBmYtKSy3YmIiFTG/n6FmIaBqxbyJJ0EinnyAAAAIB04fdlqZVjciQTsKINxOHkliKkrDS7wGPHLEDafediu1aMlBUTZy11VKePxlCZ5cpTX501eJ11oF4e29bzVWxY4xmnwrBRJKMZx/S+dH9d99agmLJbAyis8DVjbdbcDgMQgsblPwJX2o5OTvDzR2AcvnG+lopgnSfyrw3c5WdQtg== kaska@uk.clara.net(RING)',
            'ssh-dss AAAAB3NzaC1kc3MAAACBANNUb0vBTcCU4HBBjmBg5gHb+0F2xbO7I9Xt6ENgXtzsjPnOtx4OuFWzwwDPfK/QXnoqjKpV56wEZxV2xl+F4z9YAHq8TVoUJYMeDIBD7eKpif9S9pocLzPU3pxtwFH2yqCARf4qnrOLaEf2LQ2CAnp8zsfUIvPXHCkjjzlF8ZOlAAAAFQDIOOaxkW4j6nv97cv1Dn2H70yvmwAAAIAe5l0YltX8lSTu8+6TqYGLKf2//LuzE8F9YqKbP2YevUhYr/Sw4GpMh+9alj8pL1B1zOxAOmexsOYHf+Lv0s9TsQ+0prJumsQirbY43cV/EsJP+RypkqTvcLRyyrChYCc9xExbYAar2RkUseOm0wkwewFL7IbmLm0A1PRYfHBgogAAAIEArDq8SkGXgeW2BzTShaX/ygshqvMbCVWPbLUFU9Dj5mHjUSgX1QKMRPvKo2KHH72f3f/jc0YgqaQO+wLcw6R0yjwggKVlk13e211iYIBIRo2O/YDdfDW56t1JkgydRguKdOCUfTMVkGJAE59TqR5AK2m6sN+xVDyM7K23n0Twu8A= sandy.breeze@uk.clara.net(RING)',
            'ssh-dss AAAAB3NzaC1kc3MAAAEBAL25e/xGfrsjMmX8aJP30U5JHkED2KEVWmT8TNxV2YxmI43mlI7/pzz+qWBBaaokSpBTm3DJQBaoL420ywfHDtjovN8e7jRO5a5yPZn/OVF0oEmhPbUNXQxH4pNgwTjVFMOEjrCi89JhFeuGtYwH/JxOWNuFTd3FkQA2nls5hiPc9D6rnhKMMt303wk1JWnINM7l1bQ3mRzc4/EcNrBZQXqGD18Bzun6fwFvTa72X+zg5JaPTP7I28DvtgD7iOWxjAwET4aXQUhuq2kE9WGhX4gvI2KniHA1otb4fWkTRCoEEuZIjufoBO3xC04uWzpH3pXM4L5WrC6aGoJKB+3EhHcAAAAVAOvfD5Yh7Z4yfjMDthsK6obP6uEJAAABABFMwVldvXZE2zaxNXsLtKBtiTvlpebIeYmfXBySHs7Pj7+874NmwQBymu+KW1sfjyN+uqGp5rnox0o3n13A1Yz8LGTuZ5w9Vo3TRYUspSG4EAanysYGU+aBs8B4uYbCGLzcyMRfqh7ErWJsSAGeS5+OOMIhrKC1BovBcWm0wE0++4yOJ8A3z3x5IzDXTvxG8IFzBlO0SusDafS7engDSfxsYt7iu1C6/nf/oKmxNQIK9ni2RX17eTGRVzgs8YVqf6Zg2svDOiLJa8k9iqGr7e9vTcnaao9cRAg6zQDg3RJDWnCVHZ+OIoEMMlnJKB+n2/ImqG2PpxII9e0KlYorYv0AAAEANOdST3DeRfpa1DeItAhA7oTfdih4wyE2u00DlZl8FfhhlaqAmg7tGSEC4Zz+nLidA3J3qpcAldTvRP5DxrEuGktxm4zYPyjYHm2cXKvrbKAHWT+MkWDcps5kwKZ1DFaC/X06ftIDWqGalXc3Ov0PLs6INdtkzO9qX+Wy4eG/5bV/N29wiTnSAyLhL0POUfiQtN9YNt13zjfi2lr3CKJKxMPdWyWlkmpUEB7Bj8d03AHt2QdnslA2VPCnHjdqsoRY8V/MHG4/UbiBOYKSHdRFDPlG9QWejEXDivAUCk8qVm2vBfG2uyeh+CyAm5mJb+YrYasdnyPOdHUVDq/eCDBd2w== thijs.wijbenga@nl.clara.net(RING)',
        ],
    }

##### END claranet #####

##### BEGIN arpnetworks #####

    @add_user { 'arpnetworks':
        email => 'noc@arpnetworks.com',
        company => 'ARP Networks, Inc.',
        uid => 5125,
        groups => ['ring-users'],
    }
    @authorized_keys { 'arpnetworks':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA5m6Dgvvm6sGMrzQ2/3qnal95WtX7SGf6NJ5PX4GJWgLwX3z2whFWv+DNDCas3ZR6aPrA+GXzIXgaJhkP4XDjkizQDQP9ZDuNGrMaVeKMuGkZZlydMTrbPN5AFjvdRqiIsIp5tSQASUoGEQUoWG76p9epc3pACPR9KXQzPiDhGAJuJFYsOkGRAN7uSdqC6F5Afr1UythBXY/sjW19OQkJ4yGVRMkDCWlJKxzbVdD0w/iCcOuScGpZZkTCO/cnVCrucrnV1jd5f85zh7vH88YO2nMBSpooRzUiIULJkA+IQfSJhRYned9sk2/FLO9qha+thO4l52BkHgmczJLoLlb3yw== nlnog-ring',
        ],
    }
##### END arpnetworks #####

##### BEGIN iabg #####

    @add_user { 'iabg':
        email => 'ip@teleport-iabg.de',
        company => 'IABG mbH - Teleport',
        uid => 5126,
        groups => ['ring-users'],
    }
    @authorized_keys { 'iabg':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDBXddKMlL9Wp/bzB0+9bl+vtf7TNM0HCtHpfSnaPRrNFHuJ3ER79r1mGJBBgbAGAbdt5phBFUvI0FofGb0hiySYCNdAlqbaWrf/limTJo5udJ/sm9eORY94+sGdJfS5TXPXRX1HgCFLhLkid9WrjmlGYmOz+a9W4J+mGRIYN7Jk5Im9kdId4z/9QXuQNePEOB1ErUprgy9Opo6ntNoLmfQ1hB6YfLoj3Hlx2riSOd6+4oO7HeXySzVSlCqf8UbNJLE2X5ypnCQWyrgJy9BRXs2MULVab/NTUU94e62R3FYCPgLv2QXtTwgjSO8K9bvNggzztngG0KjD7wDiHiN9zV/ bschmidt@ops01',
        ],
    }
##### END iabg #####

##### BEGIN initseven #####

    @add_user { 'initseven':
        email => 'noc@init7.net',
        company => 'INIT7',
        uid => 5127,
        groups => ['ring-users'],
    }
    @authorized_keys { 'initseven':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDY6hor4dw1/ilt9/YoGQqU4tIUz8/9cUM0s26TWvql4sdawINEPcu1IDVKdiTY3bXH0vv7Vq61k6aDUVmTp+cfkUeLUOCTTxsE4YZ6JBGsUND+RD91sqih1eovvNWXGEzFQJlB2kx5f7njhbu1v6umaZF35J2eXfqYRWyKCGHNl9PslskGGne2ewqSchugIhRs/KOzvIqwlGTB0hKSpmrQ40Due9ELKqP/GUE1hmxkogq6Y9B9elirnSAF8/Nqk9KFKR5kXVsQ0X7mcMBV4Y4HHsLd4gECLnoRO838wopmu6qICw3Q1NMb9sRj8VlbMYWwLoDsKox6d+XlZMyTTeWx waller@init7.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCkNngg/7tWDYKQDdw6ULUTfhL5tNTLBTY6Uz/JEXxqOiFlUe4hY9LMReuB8sAwdmWGEe4dvSb8sXRAY7qKmayAntKGK6PaqtsD1jQfP6/XmEgiGdJBkUBeF1amCB9yUnuBldse7tT1kv/HtLTHSsy+OToll1aSi5jLrrJgOx6ct1DeNoRuGA2QKMfqaAG3R/fSK7Y9kOs91CrrFDLxobEslPXRtKXgGmd8aCOiAV6jLi7J3bFEC2iUuT1PkpPVtTdlu3KshNWsWWA2sXZ2neYGAzNRBIP1Fz3yalVh1WUGpNufBFZt2Hf6ZbDxwdPPdggiF6yNZ7G47+1XDtC1eORz markus@nb-mw-t61',
        ],
    }
##### END initseven #####

##### BEGIN hosting90systems #####

    @add_user { 'hosting90systems':
        email => 'admin@hosting90.cz',
        company => 'HOSTING90 systems s.r.o.',
        uid => 5128,
        groups => ['ring-users'],
    }
    @authorized_keys { 'hosting90systems':
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAEAQDYLG0OvWdqUeNjPWE5Df7LjTDVHcyhzCQ9Ieg/cSp+5+A6nH9wLf+zLFmy9ZshpAjg2KbY+5TU+ClqF+e+yzTKbh1JVu9AMWGH4elG8s+i0BQnDQ5PCmFACLqcjw4hH0vpNXQCwDQqzonahGhgnbGkpFIvNbwip9zvzYqgFzVTA92EUhpf6U+tAcjeIMy+8IMXgbJWAYZ62rJrHnyJHrG+davBtJrLBtgCZFGDcGHMlRG9fRdQH09ZqnzoYgoLbNoh8ZYvTcC8qHV7cDJreeYRKphDccqlDeTrSLvGomZAOhZuDV3uV2R6ZGk/OR7ME2iq9PoR0fs4XgHmlaoi6CxNeWUnspfsntY3wSUHMnMJ3wvbnzf1igt4Q6CDcnEksajLK2mEEdUF1o/R+kXjM1TEBHWu+Euc+WzPQJOS2ZgZByoYJfoGbTBal4L2DPUTbIf2Yerds0Ca9YbsEJ1bSNCL1DPYKmz39BOduUwZfnm1vpG9QxcoMMBhsLqgC9yUSqj7U+iPWFhBqYb7gpqTDXiKjH3mOoBGE558M9Cj1SFZ0d7HrCb5hIEE97ZaM7OnXB7gYRdr+9q5KjNWjlw4z8m9MHGx8inEZliYuJVmkkSSLUgoi03Ne1OP6t6nXiAsati9qQovTbf5IrNGkq0aEOihyQxC05ixSDhO2cpayTSsJyoIAjOHStPWecjWXThJAI7IhGZS4miMN1jm6txk+fKeEEuKeVfw0Qf8H67CgNjSGtyQB39Pf+KUzKkXdbBoIqllZ5DVreLv3EZMhLI9G60evqenNbQ95MgDdCHH88kAqfAvB3ygjCL0WL826kyHdAKMAcUh3PHKjJpIfSt81Qy0j1LjgTOucl9twYaX6LsKJ0MhYYa2jA3SDH7WfChIYKu/wYJkgT2vopGomYP5Smnv9Or/iiHHDZPfAd8tCcjQiH1CDbEfGUlb6CTC54PJGnQRBG5r+fLEmQlL5fxLqCVfGUSmzHeB5oH9zkS3oeQpH0RmbMArSZInGhToviELFxtt6mst/v15WKQeh3yt/mOno+M09M72G8AuF7NZi/TuhWljIThlwfkPzQXaFNINXAE+rE/msTyDHVKE55QfefvimPmBt5Y4lVuLSM6BP0ml+O1ImO5oHr2m8zYVXm3igdgFHZwo8ZbJ7wnHx1V3XDybVgzn6nKYT0JbohjBSKw0Jk4iJHUH6FlojmRk6hYyqjaQg1tboTGiVuxxap3SOsKkjUiGjkL8mqdbwV9pi5LWsZrcAp53LETjYnKL5sPng5N7cHSojuo1c8+p5DAOvDyITrqK5IT/WolszvsdVEdXdVDg2VEkOuKQBL8qUKiMK6xAMMEl2M8ND3lXaCPslOFX glux@glux.org",
         "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA1SKGpRsAw2iYbm913hNJBRXk630OZycSQwWKqAZXU7ZuG2SgQ6YhNO9mNdQESzSA9s70WgqaIP47+7LvpkFN4lSP/m0Q5jHA7oPo0g5t0w5poGPWP4bu2d4el6sIcLcHMRIK9LSDd41ZyWKmw+RTqegTmFIYNOJXkrpD5Ltn2f8P4H5dr2dG0Qn+9G29WZpmKMBj86WPqJIzG1QEkwHYPlG5iE4Gr1vl2XBRHav54RO7CBbo16zz3u0685i1M0ne1AJEyfao/8Hn+Qe4p1bR6mVoVcFQ1VoVzNHM/pnQkd4CsQdVJYeVnwXK5qN5CgceXe/8J/xAY+qLStNHoIUX8Q== jiri.lunacek@hosting90.cz",
        ],
    }
##### END hosting90systems #####

##### BEGIN kordia #####

    @add_user { 'kordia':
        email => 'smc@kordia.co.nz',
        company => 'Kordia',
        uid => 5129,
        groups => ['ring-users'],
    }
    @authorized_keys { 'kordia':
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAlG62nbZ13cGLbpMprpj3QlzD9xzu/UMwHJpWG+PdoFajEJRK1YdxXUiuwCthXF5p5mYqVzjh6aGp3ky47uuG/zmkIa37KM7rRf41Edn3EWR/j6+qxdPkAnI1fxJsgkEob0THjCNP8Xm2IKP9grXAvFCLSjwK6nNXCDcHiF8NHJ8=",
        ],
    }
##### END kordia #####

##### BEGIN isc #####

    @add_user { 'isc':
        email => 'ops@safdef.isc.org',
        company => 'Internet Systems Consortium, Inc.',
        uid => 5130,
        groups => ['ring-users'],
    }
    @authorized_keys { 'isc':
        sshkeys => [
            "ssh-dss AAAAB3NzaC1kc3MAAACBAII2sqb3kNCfWcfbXEuRsDt9n53ziQkZTHglhMT2EQUvCUeQk5/Jv0sm0FjjLFzcoF5tvIg9g9b2hFzbyPVtL47CG4TtfTs811/jMirhjrKUG+tfpQW+sibo6N0KGVEk5sB0gUanXhswm3m+dVn5j6P6Syz6cvaTsJ8tmjHyJ7SdAAAAFQDdTajtJKTOuQvAXolBVLbCnci+uwAAAIBD2H3d8ma6d54rpxo/66XHs2heOZifb2gE+JbJz5rxn5QAaVoWTiL1UdG38h/cEZDrTxz37Vr9RVZyUC2a7lmpdzvXCMxhK9r3FVnKEdlOkWzdzA5YfIRFxgvDqik8YOB2VSuLEZweHuuMqLusVbNAzyOx0dX3m2/KK7OEfAj46wAAAIAi75q26kBPwQUQqPhHHo0o7Mtv7IISLeXjJFH0ILZiY5Cn0CVKA2wnJEO3a+NwoexuGZo2JUEAj68RxFk5hY9CfhU02IEV9WtPLI2tgvkidwjkoL4F+QTYkWsNPfbTJ9ZzQmE1aSmE+BsskzGvt761b7mItPHQAFiUcgUtlcfZZw== jeroen@yomi.ch.unfix.org",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAICcb6pURF3OhJ1OipTQVd4XM0sM1SG1GX1NxfUdxJfhRfxiLMNSziFOt9Uk/s3QFJogT9/ghFWg+m415+RjObL7dyjqTky1B5PP+W/xaoeqYK82UU6ZASMCLXsqYa+B715vh88ZXQ4SpkUA4ggA0Gyz0SBvGMt8vfg5aTrWRbjVAAAAFQDBINeYuN52vrKM1F+IXMJcDYxMdQAAAIA3E4NmfoeJh4O8LcVE7etoSLMXHZDp7Nv6Lt6avLt566moo6ImOOELIKkIXtflgSUGNs6b/+p2ooEER1AI33udg4zZCzey01vpen5AgmXgd+kveHpkmZI8uFrEFVjZT6m0zYk6OpfGb933eog6XcpFwfObCS+mUGBR9TCkwIFFAQAAAIB3gE2srLt521b2l9/uMYxL+FXGOU/ZfGtin8Iey8/sL8+myXB2bRua66PUc4qtg3JdgxFJrGnREkC4MwvYlhpQRAG/Qyp2Nlblw2evzNvolNT7LObXLenSkcmJib9HiWWm/sc2+zbg0z0GqBaqr3iiLzhuGL92gWAH77/0SbjEqw== jeroen@safdef.isc.org",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAL6D0F12sN4N3SrZhmYpP4kdCcjOeMH+0MohfwrbiYAIAhWwPyABlColPFgE97MSvDtkFahMdJgf1WQJyTxxRp1WNcXRVovxCWcya3sxNBuoFv4mmEr1jt03OFaQKjene3mMPUQDcTbX38Wha2CFnzYL88fanGkvTsGIvNcVViqxAAAAFQCUUUIAYs4vTTZnUuD9aA/mPLQAiwAAAIEAiG118h0ekZ5T2iZz8NEyBLtUd2jW8K0upSalpGWIOXsqSDaf9kosKKlnvHWciZfFAvczkVJjchbGZ80h5sYHsVVRb/4Hc+/ZrdFxP51lGLu9vOWjM6DssIg017rcomMfjWo5Nyjx+IchKQrd1AyZRSsX1pT4Moyg4QtP6jye4eYAAACBALqkEaXJFTIp4FzldlIuf1HraCnUhzBPWFFvyFJS3QVigl4nmApjxjRzQSSO9MluvQf739KyefyGEQ4Xkf+zLK3sDcMDyR1Nz92q09zhQvmUYlhgsRjJ5HSfyxe75cZKvGGYXUf9BSfwjivDtzpPLdhP/emm0pui2peNGVOhyacJ jeroen@kami.ch.unfix.org",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEA1PZK1iixZ/P7/MYquyOIP3OpBG6Zw0YY6oZa6GAbdLLQxPBCf4GNZjJbW2AWSV87Y5jcba2zwNqNEKo60GCOTmHYtp6C0KrRQMG+UZvtC1goPSAh9c1gwQ7bNbPIwDAHPWfyPrVvHbg2J2ukXNzqjrQcXIyhFt6fS3nwtKtU3+ri7+ML3w9AoFXDDoSBsBDe9sN6MauGcshHJIlDpd45xgUqZwQ4TQb6wXRWX8GpbMOMekPsGA9Ek6+uLMCd463I9Yaf3aI7CJFbFIv+e7fK1nia/NBrp/TB6OPqkPqbM5HKoaoosEt6f014vN6P4zx9pzxtcYtE5Pgc/ZbKIbs+AviXMEsJqgaJhl5z/7wHubqXHt5j1WWOtroU88luAw68zJqHA5AYMI9oRyD77584Y7Audqs9UgQ/Ad3gIMNBEV3tNuHiPJcJKZAXT/zU2GpZ1m6QcnsQDzlKD4M20SDotEyL38YQckrUf3Xp1webNRYB/NQWm87Nyd7LsjEQkM7efpM4j+1XneD2tfCqL44VVOSecP0jA0snv49uIHLHYVwXl5tChoxr/pblV5A4ws6WZz95E08PBrP8cCUscKU4Xf4HyspIDDdzx1BdoCgJzAXMiBMMF0Sw2VTeiKgvdiDwvfhTLfq2N7zJTl/i3SvVULhGb8HfV6BHq918yUFSgw8= vixie@ww",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAJOiPKd3zaV3JQ3T8OY/MHZLGNr73X2urXRAvFtHzlNMtC1+PUcZoFt4Sg+6p6g7rDyqWL3R7onesi2/RLtum6f+J4683rSjhFBIkjNoni9Qvn/5EurykkkTEyLGvdUdSmPPRN8BZYNaICjdkoKqIks1JkudGsuH/STMm3x7nSg3AAAAFQDTTHBNWpvWQO6PZ1Gq4Bi8zhOYlwAAAIBQnyOyhw7dzt1Enluvrq5D1iqdWpMGU4vonyXcWA8olLEh4aqUSEm3sdjlhlgO+i1W4TBnLwzfqFL7/oEoOtZZPLdPvZZb1Um8dvIHtd6dK2C6cChDRBBfRjBnu+rZrjIqqFYvdGokxD8gN1mI8xHkOMzsVkmVHn86G1kRFmQOKwAAAIB/aop74mefxK4UjW5KnrojriqKzFisAQMM8dm8YgbiGzGAFivsAjZXz05VxJTSKmNWc+peB1as0syv+z3/0OJf95xlwspdIa9Nn9yFV0kFgHEy1Q7nc6K7BP27BcUwFpH3Vv+UiUQxGLii6Z8rFDIFG9fUjTHPFOGU3LKo6LyjzQ== joao@core.c-l-i.net",
        ],
    }
##### END isc #####

##### BEGIN backbone #####

    @add_user { 'backbone':
        email => 'afink@backbone.is',
        company => 'Backbone ehf',
        uid => 5131,
        groups => ['ring-users'],
    }
    @authorized_keys { 'backbone':
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEArD7tltJpwvXUGYGycPwJJRhm7TxaRt1yU66OzhaM0DH1ErwReeCgyIstDiM/cHQyTyHcbvYBeBI6yqEpiTGuRsdOolAQKLy8bOqrxtB1rgrP8iyslv0kziONdmHIQlIEtV6zBD8EmFFLP7VSoe+PDalIDSbRvFtTgkHzAmQ9umR0EFNelE0fpkMkmh4Kns2sJppOzenPZu6MhYGs2Hs2Cq0qqfNfA+VDpFagOpgdM/NU/9uegIwndjcByioMQinNkhrzL/unw0oRMZ4fJCZ6CYNcGq3hF3nE4tJ9Y2N2cT8ihLD7OMHRHwdJ2qARDn2IxfEOZ7XAKgT9Mq7rV3Ks8zHX8CP8KHjUH8JcwORlTuJ+hJCHXYd02OpgjLJWvY1TBYQLOpoQdDx11c0Jeam55N3u3tgen25v9T5lX70GVdy7eP4nWHX0BAfTDau4N8sY5K25Qp4uV9J2bG2bthpTttefdqrR3KMMXhtI25YMmgv2U4l4xQ9+PCC0ugmMxUhwmGIVzH9xEe+DFuGOaVG1vIrkS6MwJzdpGEEWGC9IvmJzNtu4iP8E5Y4ppf6YsuIGOnWkFsknAqg/GTpwW/yvFX1yH0QUTxH7shxv1I6XYySx7ESVWf1mjKhJGRVobA7hYZWdk5A5EPilopQ8Q5WMzrhjdi/QZIDLq1tVSbENerE= afink@intelix.gni.ch",
            "ssh-dss AAAAB3NzaC1kc3MAAAEBAKOXQ2M2sQg5ByxK5x+Up6na5mYv6FdplJLMbPs0+jOf1qyjkz0S2klqyQFHCnq+3vXp7MmfnUe+0GZ9+XmpzblhmGSq1ZaZh+LmatXvKXpSZWRNKp/JXNiR4bn5kq7Iao+Y8EPPu0LAYf6vMQZGtq1Rn0dD+JRHTAvWo/l0nP5Z/4cKEwExOs55wKvl8hLg0uN99LXdcWGH6oxEA8lZRhQM438T4Ab+gCP+fuPkHiD16oNhnp0V2/CgsUpfslc0BVEQ54jblByZNXf43iXipC1a9ZsuuD/9oaWKJLFG45efOx4fEnZp2K4jOEAnp+wqeayTjTbYqBMPGND/jhe3nGcAAAAVAMm+LyulfSy00lH3YnHbJ4N0Pef1AAABACFkbg1JIei2jf1VhUxMyFbMCDXwPdNUCMZ067ZA2UEopjwStOHY55mxypj675qpkUrzYqRjJVNlqI60ZjcIztKTun+oYC1/7ByPEDvd4RJasur+ezPfIozCCVacZMhkw4OGdEdNB/kPzGtb2Anjd6jtUAZvcMBqFlAS6x07iq7kYGkvFkALHn/1/LE6gDLJauI0hoWCR69zlEj0Jg0ghjfPO1p/OO1pRBcdzM+kEahJ15t+JDnUwhw2JBpF/0jZXlTTginnDzrDg/ln5ZQVBmqA1jVyENSYWJHRiphwwxCRLCyqYdZHIi/ovKM6j8On9JR0D0WqYSymQAI7MAJbuJMAAAEAQkAtelpCpi0OtO4gwn8GktwDsRZ9U6JUhGWkHv2gJ7D5qxaQ0wnncFYEZP9fMVt2oNVznt5JORd3j/wHMYAotKZV0GIC36z34WutCy0sRoPJ1beiMCHct9HiYLFcGcj9eoSUmS84lBSeGPUBd04SWnY2+hg3SlY87bjX/sE1olDd2Qo+KGG8sViMYM8lY8Y4m7Px8x/mJPPvVAHRYuOLvCQSABru0AfgJJjGl+HbgzYm2Rn8ILSuft5msh1MeBRCsloloYeadw3Kj+ASPSZvWSBCti/f9AxKsJBHCpYzadBlghJ3MeAfSUD3sBzO3PAVmhFsKtINd2DiEAlP8msPPw== 95dbb9cf1ec3f5284dce94f45327a3674b9d1cff-iphone-dsa-key-20081123",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAn9HvKwkL4rrG2UYnAALZjwphwIJr7bM+rcfEQyq9uAHgn0L38Nd86N8PeXPIzvCS8bh8YFpOB2yLFgt2hiXbnoQX/+Q+Vx9xsPYluAEGAEjkkM13CXoBTrJYKW57mtF7McNsE1XSC215zkqntvJK2xdgVTopMCQl+UIc4Q7g7MdwSWoUbu3gc7ih6KmaF0B7VHR6KCTUYkWVUY0KRWCCtEo2Wo1w5swlDZJl72VFBOPjzFTjAUCmy06yATLZbd+SrncDECMsKcN3XzeOIksc7p+gaCTKoXF2612vKT0ClYDw1u2AYQPd420YaLEYb7TkVUHLlKdHoNSsbk6zJBVjBQ== 95dbb9cf1ec3f5284dce94f45327a3674b9d1cff-iphone-rsa-key-20081123",
        ],
    }
##### END backbone #####

##### BEGIN nexellent #####

    @add_user { 'nexellent':
        email => 'noc@nexellent.net',
        company => 'nexellent AG',
        uid => 5132,
        groups => ['ring-users'],
    }
    @authorized_keys { 'nexellent':
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCtYOl7osjX6+VWOm31Uz83MfKlsiAJIi4lv2jzuUv2LssvBSyqjKAQQC+5qSvTcSpbqs/D7RWtbXCCe8vMjKlOcSB7bweAf9GhztfcRXb/nmIHu5fuFndCffcKAgOAB8fp6+h9aarOhmZ1g0GftKcv3PMwnFh81L556sngHWYJgF+gwlL0r13ZupjReLyrTX5H/+mnCWwe5Au2BcspJORA97yIT4zcUqAxLcEaAe9fkxYwXwg95JXX+m9WJzOPcPFarnYEpfPrNQ5zPUGHQncwGE9HQzd49I5au+rRmksLbQeRcRFJ51ASRJmi1tY5cvJMjofweg6t4JfndlP3ZTEt roots@belana-2.local",
            ],
    }

##### END nexellent #####

##### BEGIN afilias #####

    @add_user { 'afilias':
        email => 'cpr@afilias.info',
        company => 'Afilias',
        uid => 5133,
        groups => ['ring-users'],
    }
    @authorized_keys { 'afilias':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDV+2tMRpXfYs23EQ1xgF8wIGCLVSOCkf0wZjyrPtQ6fID6iP8okOyvYQxmLTyNMlDX8DNrS9lGdM69LNaE5r+gEPFcRKQRPasHBbL6qfUkT0Ug66AtkfmOn9uriOo9CL7TXB4rWnFYs/4yLMUgOqLEB4997mmOIB4KjXmmMSvJM8jxPkdVll+kQbkE85bm/pLZDbcqBok7+EFel555hi5fez1LJ0Vx206irhMz1JwQjb2EfYn93p6AbXOsm0IOkjUe+QSgb94+yW+jcQW+4M1MKosa4kQMbZAqUje0JkVEXITwJrfH9YZyq9vRD2ARFvVYQEY9hLirzz27UPIY+Tu7JXBGuJiF+bxphOvCuj5OTIGViGoNrcZmbMCzxzvWxbyVqUu34gytVcKzw0Pbx5bl8R4E+d52CsV7kpA1eMChfsrMcuHc2r0KvBig4obQ9eghkcJNIu1miBOKDt/ehbP+4YOvqrid+O4SODBFXfOLk88BoJgdCerK4j77tWw7ghXyjuSSVQshbnUV/42zht0WYDVksPj/SX5/f3hvnbKaBU2m+XzphumU+qmDOx/C4aSbyYGatiRuWSe/NHDz7P0Rl5zexowemogweHiZ0ZsqSfMbLpP9cAm/qrp9IXaJlblSU0h9UvDXNaoQn0kfN4GgtdSZbu+Ll6B/atBFBvtaPw== paul@flow.neep.net',
            ],
    }

##### END afilias #####

##### BEGIN grnet #####

    @add_user { 'grnet':
        email => 'noc@noc.grnet.gr',
        company => 'GRNET',
        uid => 5134,
        groups => ['ring-users'],
    }
    @authorized_keys { 'grnet':
        sshkeys => [
                "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAuA3g3X7l6yZOUfhF0q5oFGMJ2ayKuvpvrsancNt6Rfjxq7XLmwYi4cSS0UGaNS4/G0MSpgVW7AkUJa+95MXsCThZ/jg9is5jYePiYPnNgaThvo2iynOSvCD1GnvCIi/ftycTq99Te7gA0TSsmtGJwnLZHEGQ6gZ6JOuPpv/+dsytvNASiLwutBK+ru40p336NnJB+g8PdWkP1EBhDGTHi8GzCpqNLHhF1HPiSFjLkVCZ3iZ43cCuOUtVrEoqQyxnjiq4LjO+XysfS5EemVmqwkSsahOGf4ILqiHZ3RkKsRdwQgq2cp+vGgMcVKlsQ8vdDtO39TeThCK827r6AMg9CQ== alex",
                "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDZK0HsWPRsJeCJ9WnOIXNGd1T+sthDIsfY9jFwYfenX9H86Uo8gpSKJqIi+Qx1Tojvxeh8x4rgpPF2oiagjrlNo8fgq1wkWJJBAsBTaFGNZnWzbcHWljIuhHSczQ1bbdcgcL35X+OqUGiy3bFz6M40WFjx99/fTZwOjoPqA8sXhrFhbVdPxGPz4iX+wXoJZUkIaqwKJNdBY83v8SIJmU/QLWMs+SPmiPVca5aQnwo5d1PRWNKAJkPlSc1TWR6LeVQa/dhj5rNVvPsGUCJV3AiclomdPJeU4tvh8vc7dMvYg1aR0Xaao8EyoPMWCLlGn75Eu6vQMQ1+L8oU7m3H9l6X alioumis",
                "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAqfYe/fGPUQdt6QPMw2XXu5n1J0giRmksJVfU4zHlf+KXJJ2n9dlgKXXcfVBCfXsoAvFdN9Wd1a7Ukid5SgxeO485zp1ojepxtzLz/m9ZyVMz+SWT/IgZTy6913rnd8xCvioPXzfWr9CVoZCzPAhcfFz4ZIvQHORkn/TZmeld++/CjkdQX5ZgiVLHOknnyAYjWojgj7HhZfnIjnCLZuwzvSgj7eY/4Qs5WQ6dhArznGMXpux07NaM2ygEN65h5WaR+VdwYtP0ecsVzUMO1k/CI7+SdGL8La5z5sPm6bJ9ka8wuLS75ZCMDQDOPyrvjPz4LlQv0MBRqJ7NjovK91eg/Q== apollon",
                "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAxDC64Zmtx+PE509oMhx4xa6Y00129xnIjL23lWZm8UyxAj3akQoGU+QHv7RllXgu1n+KjeZmrQQH/4MbsLX4oJn7Okzp74sA0OVwO9vLTEzXGBRsrk6eA2OeqTXoVNczmqYDhWlr+kmnsjkhZTTZSwFEer59O5gAt6aD37+ruI0GZJNAMiNDaT72jmfS6ncSkhFcprj4stV2xgSK2Jc/YqKpoRH0bsRe6HCCxprYl61UJGf2MstorlAZ8tTCB2EE+9BrY2/d4jL2ylIZ3dLovfUi2LNU3M6xl+/C27DiMTMDeU11Qwc74M4JIS6F+ddhkuT61P0wSW2uRYZ3jmsz8Q== apolyr",
                "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwCLsQL5TImdodYP2+gYNfWiPJvek3Nvsfimo6fNTnWMkWpiaH9I4LjLqyv+eU1Rb1IjCIv1M4v/Ek6H4u9OHRSE3/acengc/tq7t7y4YXAmNCNQJcdL4jCY+PNRWgkx8MS4J5sPZopUGLol4mu5UpAXOwae/RjvTHBbGPZMfLxG+IdWCDnzJW3Ra4veQ/nUSWPkOcuJNyPpF7lBoJT3GjQkc9NqmWXvgX7zuuwtV765YSCnXJoHYxM9IJUMTGKFpEFWnAhp8XBbc8ar44wzy20BTEQAH0ttuB/lmiJACbYiaDHmYyaGOubU83Fe4cP7sjuTHHVUPT2xpmserFSY5R costasd",
                "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAjhWJO7a/pfjnF5afGX1HMJwKHXU5QhQ5m4d+1v1eL3cEd5zYarWy/Rf2NXgQg0FhUZjkhX8XK1s4QOdR5KqISJKfJHHaZCuR4ijwmFfmjRuS3oAaej6pH2fzwe+wjomSfkuPPWf2/EHjZOOA3PVw+CYDSdBULasl5UEJDXj/mzU= faidon",
                "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5tm+Fk7Ywyo1tCah+XlKNkD8rE4IOf8WP78kxKkIaGBZKeKa4LSe4VhvSAdUE+IrhU0sU7aDUGur6DTUjR8PJnJDxwAsOQaArtR87d+yP5naSnU7+vRYjNOb+h/vx6FoFB4PLJGRGf7Lhr2VcJIdy/BpSqdSBZDmwYc8pVfCjakvXseIWMPXJko8wncV8k2BWmGihbhKqu6reAcJpxB6j8sReXH7mSmP0MgGCQI0Nc6vHdG0dXQf/VNOx5SoXda0TM1ntPLOHT+D/DSnSAeNiOZVpcukpKZbmUzWg69jUPI02T7sbPcc6j7M+UxyeT6nJkgv0vzr/d6HorXqHQWHV karaliot",
                "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDN/qA9pQlqkRSKIw9xYk6YsxTJqV+F+zv1IlWrAwvU97d59GxrG9bnd8TQpIJLlGp+9UijiWnCq1Ssl7l7uJ4hTmKLf83ZGU5Wfl5eHC5xLlp6uWJfePcJuVRSci+pjqisFSFP35Wh/NDLbDmtQiw98WXVUn/RoBn7XoyTGNFCiBKYO92DG33GLrHRFI64n3TGQJO618RU5CokVu8nyauzeZyhHkSSpU5InEu9L7oxH6zoAlQGrd/TrRRkBcV+ASr3z8gATRzXMsgkkakYi23tQvBNmPqqQ1LNCm8G1mpZtDQ8JNX3SVF+dlkZxgJkJOqjwPCcr+ZqQbf5EU0n7z+P kargig",
                "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCmR2rZkMiUFi5SVex2zrmVlg7EkqtGH0G6UAcN/DenTe0oOcjKYPpZX0xmI/t99eMUN4rsO3t9gbw1JijFf2sAFjKXZz1BD3RPLlRw43hXJ5WOLMpW9gVu8Bbt/Ionk5U4AaZE6mZ2256iKM08eV5eT8XNCICZefJVcWr/Yo9iT6Vrk26y0qk1ZMwGBmYesokkMCqMiR7xAt0ftPu4TmeXe+ztyCP6P/z8PL7Xjg5KmaXtOOCkNtaSDc6myJnzpq5dv+E66AfcVPBWKpqfy9xBIEMvXW3ALHTtF86YtqpfOTLUAClJZNZNI5RwS7Gf5eHnaqZSBMKoP24DHIJO7s53 mmamalis",
                "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCYF80zcm8h5GJp5v3BsWez05n+kdZI4xXArgk23lQh13aMlAN+7SaXYpjKllLmj2sKzU+vjroaBopOiGXy3MYegt1fTO5itZHse0YQqMbejHRXIpRJYg+chEx/cpbBCT1j09JbeteMRYUdBYdJE+foX16BgKWQNCmb6Q/TpAJ1xRF2Z81ML/hrkESngVlMAM0fv+zdfulbVA+LSEGW4soDEFxVSesvaxVJzP0VWe11W8wqwrvc6qKP9jg0r4wbmNGU5W60t8q1YXSekKIjSW3zbiya/CO8C8BVS8WEznYZCVIYHplAJOD8OmvueCjiRb8QbgfgAOiYTNMEW2NM2hwx stella",
                "ssh-dss AAAAB3NzaC1kc3MAAACBAL8QKcb1/93E/cAvAGOH1JHID5gxx8K6mxRdqp4XGs1VU2y8i0XY3J2tJE/nGdERJgTBOoIdOD+0l97NFSv6Iufjw0wce2NiCkwpevYwO/3ESDTvdPgi/lfRne3KFkOTO9Zg/sVTfgxXmz/SUyOCeGHOb64vRlMZdyre3KeDJVirAAAAFQDa+z5A64Fof18Qvs/A2NgkRuqq1wAAAIA3iolwYkdmctYD97Qb1BfCiAyQllY7FbOclvyYZmm+ZhYUnEaCZS3y/LpZmlWY5O+IodHX7Ym8Y4lwC3Egos/mTFdOwANskfIZojM2bhAIXVg1YOs9ZG+erByNqSJOoZIOdMYTD/mQZzcgf57JuAERX5/Rhq2c2p0qZeyg9mEFWgAAAIA9CiPncWUdbU/xiUXHiqjE93def1h+fuUx5coPPrMH9NRbtM2D1iDWV7HhBK7CGmoEOyu9C57IdHOTtebiBQJniKGJ4sOx/LR3WNJbsoqAIrHqrd+wvzsy+r/d9a3xyfcUwulvG0fDsbjjk8l1yKQUlzUEH+w2WvbaIWzCBat1qQ== zmousm",
                "ssh-dss AAAAB3NzaC1kc3MAAAEBAKYE9Pgv/B6X24juXwFxpMWqCu2aVnaNnILrD9cYJ0brs0J1948SCiQetnvDofExaFDZyoqt5GcyGaxsYw2V/XCu3uivasv1CAZIZ3fOLsLCQ/YW787PWEW6hQLYu+eOezcMSbEXZWsNDJiUcEKn0/Vslh8UpYr/QDajKRxRme5oDNWI1ZUl9q8ctme6Tgu/NE74TALb3XoesE24tn1ivtt19n7ym6me3N2ibuTNix6SDSkAyB+eAuYHo0XNaZ8pXF7pG1eqUNHH4CyOWW6SS6tWZ0KlWqfJ9pGc6veDZ2iv5rSFX7okurgnN7Ms44z4rU+ndX+f+2C1+uNUWiiwMpMAAAAVAPRTdMQytIzQ9EjwH+MgUPp+2eA/AAABAE/xxHPg5FnFiscdyHOfWooebyn8tD2t5Z66c7Pde0unkyhZHYaoEEjUBSag4qKFku0qPkK3Q2WDC4giS0OMqUwD0R2WQkZS3HF5X42hURlQPqyPGuWxCoC/tRjJOL1i28TAHoGTZ+QtOs8m23wZMSNW+EYpu/o+HaEXAa4y+n/nYzz9VAJxrFqVBOpO7NhOiII9iaaqF2+j5BAAoTi0yTEYZApQtmtkTStluK+YJiNTYz7yzQHDF6Tn0SWlMV2oD63MhUjWjB9p276x8LK7kiG6Ss1BtmPEjcNJ3IseNPLCrlGU+oWxxjjLGYCG0X/FeArnfTG7yOF094bPJjbXKUsAAAEAU4pZ5iDL27tHa9UJw4yPukTWy5aKiVLP7yR1VhFAbroCZkF9rer/OC42y2wg0W7uBfMpCakdo4VR5FtjMz8lyieI5+F/iBw2HkcbCkp9wlpHCrO1rixmtKVaaUFi+w/aeue7sg0Ptib4UmhC+k76MxMLNZiCIpuqyphiOnRO2JztfeGPkSvcACkm/G7DEdEkodIwjCGDtnN/mUNb4z+GOMxlMzzFMXRD3Cx8m3qwox6/L+kzs0v2EeI+qH5SxzBhF8rj+ytgY9MDsu+M8WvmlYBZOlsrUZ1b6WYks/fh9ckDUEn1IboRXTmvxxkBMypHXV1QxNCzlBwNE/ehCv2akw== ymitsos",
            ],
    }

##### END grnet #####

##### BEGIN netflix #####

    @add_user { 'netflix':
        email => 'cdnetops@netflix.com',
        company => 'Netflix',
        uid => 5135,
        groups => ['ring-users'],
    }
    @authorized_keys { 'netflix':
        sshkeys => [
                "ssh-dss AAAAB3NzaC1kc3MAAACBAJEINtGXx45paq4AdV+vw1YZDuebh5u+6SBqzgvZw6Oz4ysjUl/Esu1N+voELx6+eoVc11ZTmmnqNoYOsO5MCFGsr3AZHjyBmEXPF+IlEWKZoMYT3a5johcEEFkEjb5ZolOqXINlhSk8Hijn791hbuQmkiw546cbx7TaxAGYUAYXAAAAFQCg2oGXWb4+lddVRlZsB9ecSKn92QAAAIAyHx1+ezy1wVlEVqmHTGZo9Ni7KNGGBM6NvH5V37qIvq1g1mb3uFWoOgCNRmImYLq8O+1E53ut2LPf7nioUVSaWSC22BtJW0ngEQdyu5y8LKPPHb0p2WjlDV80oAriBAZrkhmYyXvLZ/6uLcsTfZY77jVyRZ5QaT4pfevrSiz/YgAAAIEAkGoJztLQfVXt5qmpN/7WlIjbiUiLK6IWpmBKUHFr7UKktyw2akpxU9xTF37xYUgtt9sU7I9XpvUg7PIlWjSKjCyofPzWBLPvig4cFRKiV/DGul8zf5mlx9HZ401OimcVsH9T1deApr1HvjeNRCu0BPj63gdE1QspM0eWizuIDyo=",
                "ssh-dss AAAAB3NzaC1kc3MAAACBAIxRxB9EXpLfoGUsafhlApCQFXQtMEZvx3Zq3E0TZB4Qy7aUaH9FrK5rkkgTDXU+ATb8oz3g9x7y5ETeoxEwtdKSVeGWxpwlL1vtFH0yRItEGrZRrKCq5HT6dWxjTSxdesECns8cKP3hJmkdXDIEsEtnu3dAQb/1jyy5xNpj/EUvAAAAFQCiXY0B3SQfvZ9KAXld8BrnVdsqAwAAAIEAhs7XUr0lIHJ69A7/Ot8eohofyUj5QZdDEKjReVA4ibA2HJr/pe7/oKZi0AaiNyHO4kJaGnhzUT6BejmlDFXI23A/Bqr7p6E6f/SDSf7oM46+lus3wSuftM5yLAZNR1xoNZXKwRw1qYU9ofXDe4XoE3EKlS2IHbnG5uS6EgSF+1sAAACAGcyE8LktO4SpsscQ5ly19E6fYr2zfpvansX+esJ92XSYnk3lZjYNA1tRfbF4xfs1UCR4fbpx3OGN7R6bOvwmxOIcyVHh4f2YVp2osHVpsCin264eFAlI/+VcC6p2K0NInlcu0EKkm5c41O10TTPmQ00r3oW+BQtyryLk6CijkQo= nhickson@mook",
            ],
    }

##### END netflix #####

##### BEGIN ipmax #####

    @add_user { 'ipmax':
        email => 'noc@ip-max.net',
        company => 'IP-Max',
        uid => 5136,
        groups => ['ring-users'],
    }
    @authorized_keys { 'ipmax':
        sshkeys => [
                "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAy4dVTsFhgbROGFzXH9SIuISuSu6GZ/mHHYu3J0IPKQYZSwj8dFS0MtgO3OCNK95Fbd4kfEaz1DmvEVDP6tlD4ZgWhKCad4aZ3FHG4eqQXJn/kdhgMlEYp8SAc7Jwv0SgoUHgmj33dLMMoodSrWL1lHstQlSO56TfmPQoyTp3dod+qJ3+e7qNGBkPYQN5mQxuUTG+yVSpEe5tAc8EN+DFkeLOeKy/OKewhjFZQwksuXYkz7xRzM6H9fDeuQ4AVAG4FF2Wqazd1mbg4dPWpxZkVBny+pKj5ruwoBQ4yPsTigCRwR2UqCuNbuYistrG1UnfkuIwBmkDrTvV5DNLBxLVzw== fred@warhol.local",
                "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCkmxacT0X3LiTctl6dbfGTpTkKzkOKzTL4Wj48nF81hJUbnHaOe7B4DHDP+bZZKwVFtpI/hmBi5sLSEHTFn6gGA/ZDrbxbSoc8iZXvDK2nB+VrcbEfSdXK0cakMCHFpJEtHdwp1LvyiMCdacUA+unLttc4qbuDfh0vQgD6UGaf7IidkhpUk5b1BqWpMgmZeEoXQKMiSVbpeWo/DNM9YpUQtv1AT/aqgfbOxcCA5f4vqlOV5Tdb2TCujbPQpx1GAGF9GNA2oMbSHZbpZQowW/0ipo2tvCmi67CJx3HyIz9qEjGFAAZvi8/kGvX6iEJmWnmUFmM3Z3StvwqoqzcdgFSj greg@noc1.gva252.ip-max.net",
                "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDmaxHicGiG13DKlF/RnQ4RvI8MNDAX9fcDmgvpvNW1yunbspaL5Dh26bImpXWXdwsjgFr3vjPRhyzCqw45/LynuSCypvRv186GKUgI49Xq+b9Jxxx/pfg9ZMynYUr+9dF0DVaNqsmAsDx01XIv9EkP+rhbSiQfgd0P0gdQNxKrSejwYvyl54yKPeOjfWyvAwxKydLJpfbCznuN4RTIy2PIWUL0lcs7x24f4K/uiUtMDuf01SqqxK+ZMClWVzRuSUNJey3vVq5wTzcLLsN0elNWfGlkVWlJ5FfNy+M5alyvoALKyCqm8x9kura6XeFHsoIEw+bIGlSzQAoJ/Phmbkpn porcus@noc1.gva252.ip-max.net",
                "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAwgTofMX2p9LEpO7qfVfOFp8DfVCcqB9tLjRsf3utaHn8kPYIX6Ms1fsjT8F2+SdDHP40RDdB5vdRnI9aF/Fr5iOZtYUQVO7x1MO+kUnLMandxWrir5qm/eSS7M/ZA28z1ti5olrD++nmLpw943V1B6mAwpm6XZef8A5huhc6AcY6lQqf3xAvwa9LFd3X8Fut/Q8DMBQt3gnhwlo57oT3FHtZye0r2X/wySMoGabtwgCNv977H/CG1zilf7Ol7fR/grH3OZJC75hp5CEvtLTneAQ6f7WW2kV6TNi+HxnJZxDKn4m0CeqVKL0+kk8vMCDSnvNQdZ0B7ZwD66OIWbTxow== porcus@PorCus-MB.local",
            ],
    }

##### END ipmax #####

##### BEGIN merit #####

    @add_user { 'merit':
        email => 'msc@merit.edu',
        company => 'Merit Network, Inc',
        uid => 5137,
        groups => ['ring-users'],
    }
    @authorized_keys { 'merit':
        sshkeys => [
                "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCql5nngCFAD3Ke7MrlECNrbmJVMGTW4e8fNoCGfAlQFrdT2vQ7Az1KoGisGv3vX5gZ5E1MpyBSTaODTrgwrG6vJ4kP6k1/Xv4L3TVSL0qn0O5AByTI+AnZ7vAqAu+FTWnvauyHAfnCnsjAijmcgA41GLPXUlxyl/x/DqMOvIw5qb6s5Ec+/SKZ3XxeWDN/7z2wACXCZjRms4T2lXOjlZaxagWT/IVBzt447YB8Qc7jMN3PiDL1OzLvSHNa8V82xZ9Er25n2fcyAwS5Y2nj643gQF3DgF0Xzbmbo6aAZ28wVSdA96vX+hFms6D2NsuxfEcLwDED8KAi3QT1R0zksYcRThvFNz/Y9AwJmVn5UM4c5ioKOsOiNOyNSPb7Zl6sbqAFP9NVph9YbpRh+TAb+7UrbbingZ3GvjnlcKP7c0LIaafHXiMNSBEnrdJH3OMKlXJZDJRxf74gAmVLSDmpzB0Zb5Qj6ohwncAHO2vZFd49aQXRM0qAzXfESRzYp1zBjY3RN3Eos5MNiCQTVmdZBvdZVVOMa/ozyd16nWP3ko6ODdhYmGJP2Id+uUHv7Gnr+O9v4Ti3nRXqiISQyg1pzwMHtGjgey6IgFrhsI0YGBHIAJ9OcrFQoYIAoTeYMQeXFoy3gpbg2n+ml7AwpYHnpW+bPkkI4JQEFgPb1bbf/WuNPw== nlnog-ring@merit.edu",
            ],
    }

##### END merit #####

##### BEGIN poznan #####

    @add_user { 'poznan':
        email => 'ipv6-support@man.poznan.pl',
        company => 'Poznan Supercomputing and Networking Center',
        uid => 5138,
        groups => ['ring-users'],
    }
    @authorized_keys { 'poznan':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9iDzrLnGZ0qxXemACbjmnDsGU5Oz/OtE90fpU1mWR3m3CoKSZ7w2k8p3tTrKPi6j+igYg0/W43HE8/ywUQV02tAksgTLyAxUDtuRgBrl7G3Z0/dhHXkccpwoU2j3GZcGK8N2t66n4r9iHGAhvgrX6WVJjTsDBK9I6sG8QCEVWO9Qgmesyzs8B2JM06t2bc/zyf2eBVuuRHSrkSBISmBtvCczaC6fyprFkoPmJjhDbkSOHTlwbx4LZOngeTYS6D6HRtPgfrr2sV2vINBpBgsxpkTE0xAnvsqIgONfd3VfvFIoiPSD9mLa988QEixJ0Ot5bd/DHLWIfGYEF5tTqtbD5',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAsbijLZHHvKGjGovyF/rM946ak5uQtkE4IZZxHbAiYihdt4WifPzIYhSOMr1fvCwkjScBrKlmtfvVVmRXjZ9w97j7/uLenDSAZsOE8mtnhNYI/sn2KfManuB1mcKrCOxsrnf7Kbfaw6BAZlEMrkRebJOmjOtcUoHVSdfAtByGNhXxO//JZNSTWX0Bg0ZOavFSeUyZwSjl6pLQtNACwj+9gH2FLo68W7ZVnXNMqe/7qw16/TObCcO/+K5jBd5IrZNEuULcupT+MiEO5Y3/pzM5e/G6wwDfkjnJToZXRSuGbR8kDsEmrNi0YYPeFgERbXbSJNyNOx1fafK3oj0Lbiq2FQ== lhx@caraway-m',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQBv3nOtmtLAu20uhb32YhDIO6v3djzwGpnFTTDJOuGJSRuRp9y7tvGUSHJiPzAgFiuvHhsGW/G+zYyTIXfnn7RO+o9k4dlp52CnI6cx46P1ayxNfR7Qiwjk5O6u8H0FvWqBwkjMLIsUwE1Yt9/Pw0CjfeFqlBsLzhTBzai7VFUWcETic+u5gHjPWJJkK59XvOJLu+r0PvpgXbrSUiCSTVorsMVq4VNWWEVMNh1bQN9tCIe8hoROEKrHiyIEXbqI80mY1bwRxkOkj1rCnSNQ+28Joi0pwzlTcxhM5u5y6+Lo14MnUYpUTPaCLblx6J8F+LXLdNe/OgxrslrDYPLEVt9x rsa-key-20070221',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAtIcyGqYkhNk03Oj9FpBtzXP2Bz2T6fgmMwHhGFnqsq7MOuhmkO5m/x7CcniQDNWo1ovnirpHRxRuv+mE00ff0wajrKN0098ma2i1r7x0kFwDz9gymRLkyQvBlGa+A5gc+4tOTMiRl9iSREFR5dufUea1I+Nz/IRacE2N4MBj1MHm0BLv439R57Bwvf2WlD31NYM50jfCqkU2I31K60p8jvwatHmkVfFkSHivPkUh0/VwFHSGHixuA/AqwPHrj2Nhv1SEw42cgstnvdmVJmk5OX7WkDYv4Q266s8wny6Vw6n9nncWvgZfe9tTas4voakk8f7MFDGt1JQUP0G+L2PaCw== operator@rose',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDXJX9qIqFGU8yqEaO/FKZt2dqxuU8oyEIIdAPhciNvqRunMZE3YwhSgho1U2j09jZ3jd2Wv0kn2LiOOmDrBoujrUimUOwFUEwpYKtVItrwofEFMAsI4A3JxOFdAkIqr3fvzhyLFO6p9H0IUKBkQ9ogyJHEjm0iyorQGmJnqTZ52IKGPTe6dwLJXDHJanbhaqTZrHr3Wx30Ct+PIxqly3zMfoKqkrYsgYu8DDm447+rg3zU5KJyoZd9PpodIq3gZh5tqu8wJyf62he5A17YnelmriiBO/SL0y3nQ5dqjAjIUOyP+2tLx/dpYPLKjKGlLXm1QncZip6brtEVNfE4pN4d',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAxt46I0vG6XfcXtPYLeTA8H3XMBBNaoDXDeSc4C76WkT4qIcoEnkMs32M04ivRdxThxM0pjvz0cc3q5X8B6DAxomDG2uhmVs7tLNKwfXk32UosU4YJk6Oawcb532AHux5yf3ofdNPbUEJsqhxbMupX5RVhFIqtX95u9cNtBZnrW9VwWXl+LLDMJUSRJ8a3eAx0Ofd+CwyPq7gc2AWfvdqXfh/J87wfzdrSnQEjL4jZR6J+fZDCc1koLiBYSeZGFAEnPF/cQg9sv2DM+VKgiMyhd1uGDmwzE5TfoW4homJePS5UZWMeHvUWlpB/KqNYyU540hLTdSebSbdZBrm4UnDhQ== wiku@wiku-laptop'
            ],
    }

##### END poznan #####

##### BEGIN nuqe #####

    @add_user { 'nuqe':
        email => 'nat@nuqe.net',
        company => 'AS30746',
        uid => 5139,
        groups => ['ring-users'],
    }
    @authorized_keys { 'nuqe':
        sshkeys => [
                'ssh-dss AAAAB3NzaC1kc3MAAAIBAKXuMOlWOT5VjSezxR1Id0qT/CEABXn4SzmRFdAVEC9BFUtG1Vj5s1fFpfez/+ZyG+kSQxavE8n7VffoAiKM5fHCD7gVn+P/7eH3MIvnW1MQnSL2Ut5xqujwmGXDctYEL9EcQcwRjV3NqD5aMjswpU2iXgwNjfQ9AoLva2BUV6xjnJ4QeLFVUfWcUUN5E6CTCNPBWRHYsHYSP0qaUtut4oE6jOKnYm0AQ5tEkt2ujBeU3CrWGfAaRk0vHxNN/AE60fmbY08QrxJH6uohTHszB7La+zfJnee6NRh77w6JArTHlSzfz58QVWcC1xbA3gX3UXhJBHUF8IWhm8A4xbULLLyZKr54i34WPSlvDYehQ+/RtNtPxPY4c08dP2owF/A9BcSrIHQOVMMawiIq90uKqylN1U7uLjEIRHEDR9GVgTlzF+6yIJfw8JmorgbYop97iSQV5dhZbsPmwKrk4a9lHatDPEv0OfQNZOnfQOfsVWFhhuIlXzz+OAZmrF9QyHXWgMeTiR768WRgrworGv4WCBfcjBdoGW1isDCkDnadVhtPxod7AqfwMETOjHjHvx/LQntCjZ1Rw7PDeQgi/zD42ofMg4bl4lTk20Yw+uLIifE3QDchOl5xbDRu0JqlBOyTxUX+GcjZrYo87jwvo5V2/AKGzal0sS+ngzN7YIBJ4vmLAAAAFQDTOlOclc8AeFH+qDwZEenVPxyGMwAAAgEAnDsb1E3NuQEuFoSpeAENcMlC0u6LQnLg5EhYkEbS57hkPpbfJOBFPulyhseMExMstqaBMtMghdqs+rCJbsnNykY23GHBIrw27Ug2IqkWHxWyxbVcP8jpVmKASiKxLifjI9ofngnJzsMn88XXJpJb8UWjRMJdnWJxaThDvXrOigAN/8TLgs3XD3aU4daWW8ZNd1DgxEBmm5hzugTb3468zOvdhtltob6+9uUjO5jTZ4u8QKWZb1SWfAaOUi8ORwUyP5ahMVLLvcpLpZ4sycUULhEVbj+8YD6CzfzvEpPaRbPrCzTusfTEMEJD++sOkkInLK/syiaMxokSLV/EpUQyUR6XUUlb0hYYYCoM5osMV5KJkWLEoXv0HoCqVzwyHChjeTDD5d/eFE4IgB+RBrsy8yQRiAwgtEdQaqGer8D2w8M6WyHUzQWkJSmdvU33gEQh6c6eZ3OLAjTeChbJ/KhJJtC+EgPxvsamW5uUonRzFHehrJBZVzbvQ0c6ZhEM1tfYdlUVDf7JCfszffiFIdBF2nt82e5/USmCu9AGqU8CzqeyeF9kz35ThE+JQuyJvAuv8HdeZaH2Rk6D7VP7A1RzG1opoUf9G/EFkAMpoqqorUPcocdtlSxGb5gxAUXdW9q6xxg8Uc+K/iN+S/XaXvZwhKe1d9I+nOjC7sO+5OpAryMAAAIADUkbcXkoVDN9CSjIMh9Ca/bFCOkHrpAXoiM8elj/nbpxnor4W22dYZI8ItUYLj53y0VHWntEW2W4lfEd6rFpGiK4OpQMnRUU4HwJe00fntrFUYf6dW6bPr95OjMr4oG3I5q2iSzwMahzVv+zD8jXc/LuNa3yGKeW+fzUIGNecKgbwJgoDg/YtUqBSGOO+cJASLCg9cOaGFawdMPYSzNYrhhPDOb28H2bUyCLHk4UmzHu7s1OIcpn5jvLrqiokkGLMuhTW75jtnLrqz37EQBdaAv9kUfe6H5fNNSSOGKoV93CAzFG3wMak9YY7iT2hTX7uDQXFFPClIdbPOZXWCfnaPDO2MBO5dPbcjsOZ/tH9PKLQJ1iaeQV5qdaeukVKBD2SBKPeC7tSM8Oj0tKpOChLKpt6ISKw2w+FRdHlC+G2dN93NIRGVY/2fGkFyjQxvke8MpWfCZqHYWe38jpXvfMWPgTFIM4ouottu8AMyOw7sNwW42vWBdnIQJkRvU6fKwHRp673sNes7BhMkBKOARUZ5AIwQF06v/sKQCifHvGlT0+zJZAep4m8yzXzxPLRdGGt8GM//EIHpsQasEsuAU7VN1lzlVvgEMsXYvViPYBrhHZwBarf9UHxt2VMpsiRYoxlEu7yjiwLmaXIoh+4Dc6uyJKZkPp1fZ2IgLWX9AH1fQ= nat-key-20091209',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAtmairACvJxC4dMNc7Os80205bU5UmnExxaZ0qnbdC+cJ8Aqgai7lnq8ge0vVc2yUZRhM7ke3sjwxVpDs1956dNxLv2EUQLb3qcgOLW9zOs/68eOOh952d65AOklnPEMpGPA8g/+7EsxUPnXXJAohPdjY/+cTiTc6DwKaayR29BtUBf2q3egM+7SXoHrR9DpTteMInK9N5nWOjQWw+/b2QEa5NfQzyRq3mmJP0fBX9gjphgbo/7xVp8KM0W3AgFZ2qs9i0jp4kx+YrwnEVIqZiC278BQHzBiVf9uTKZTij0qFVh/7sEZcfnh59g6QokxIwpRnoTyYpalSTZE/dr+SAw== will@newsshkey.harg.net',
            ],
    }

##### END nuqe #####

##### BEGIN bluezonejordan #####

    @add_user { 'bluezonejordan':
        email => 'noc@bluezonejordan.com',
        company => 'Bluezone Jordan',
        uid => 5140,
        groups => ['ring-users'],
    }
    @authorized_keys { 'bluezonejordan':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAACBAKue35G4yIf2uXIPBIPEy2mwSVQmIpkw4AIptXChgXCreHsaQuerawradqUxXqaDNO0o5CtVv7RPXrx3YU0qw9q5uh34UyHNLE2gxc+jyBWx/BkQ2ZLuWnPQ5mDb5xo7N1nZ03+XSx/J22unJm//jIgTljUm9qfIDkYBbfAcTDAFAAAAFQC2AEpUNAfvH8MSGfmRWvSJxUonvwAAAIBczFjsYGHe3JvUimWj1bdfxkhYEI5cAAFKiBnyT8Gw8nPUN0L4jx2kHsMglE/xCCPqyX38+iNl7kObVXJgZ/FBKFZ4aqtvHB+yg3drlTGWNA43PIC5SGhowxwMYPro4AmEQa4RcoBnkpeP10gUAzMPjx96r18rodfo+FcLl9U3UwAAAIBY5+QbYGLZr8u90hzFsn33oXUsL8BFF7s31iVOA0QVnFWhomBEXBCr4lD20UokBTAgXbhqvAlOF7NVEOsAkdGfGPhkbq91FYoJ8CMgQ0V/KPEmB9vLr+A9rLz3QjgiqfSV6Os0jkmUkxSzcQ59w9OpaRMMearAPKaoGol7PALChA== bzjuser@BZJ-DEBUG',
            ],
    }

##### END bluezonejordan #####

##### BEGIN zeronet #####

    @add_user { 'zeronet':
        email => 'noc@zero.net.uk',
        company => 'zero.net.uk',
        uid => 5141,
        groups => ['ring-users'],
    }
    @authorized_keys { 'zeronet':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQBQjS8FcxX/ea74STVvPkPOI7xxQ3/6/fPCTzRFnV4IRFndl6HUH3hNcAWWxGovPh9x6dJWDDp+VpfWzKeCeSAcmIFAiCSZ/iY+ZrtNT3Mx84c6cnqP6mIc8ZoPko8uC3ZWm+9LFOIdqwdYNC6LKmobdmomvOmM8B2HL92c2r5QpMnSylKRoCZorPBM2ieRdEFZziObaNGiECTROPV2lkw0yt3IqQJMiKBbgFYwm2Vc7YOGVOrIGJgNz8Us/gYShQ7E1knIhHkEDkxODWAiPx5zHMlgXnL/9T80UyShjHl6nzpDbfqSmiYVa0ghS++HGK2uATwxlO06+mGkfZDhHunT luke@zero.net.uk',
            ],
    }

##### END zeronet #####

##### BEGIN rgnet #####

    @add_user { 'rgnet':
        email => 'noc@rg.net',
        company => 'RGnet LLC / psg.com',
        uid => 5142,
        groups => ['ring-users'],
    }
    @authorized_keys { 'rgnet':
        sshkeys => [
                'ssh-dss AAAAB3NzaC1kc3MAAACBAMcyFrmcI06jwD2IEA5lvqNM84mr05eMIARy+JQ9f++tix9eMk5Y7b9Dmau3iYNG7WAEUtzEhj+ZO1QSMNqDX+TARAkesWHhRtNp5aTSpTrnyb7W74x7Wdjd0Zw6iQyYjzv8qYdcg3siN/POE6traHqzratuSrN9euEjXSq6lmutAAAAFQCo1RS1pRSCgmkTogCNHEqCnHDOOwAAAIEAg0XcJyRT3Er5oanfdQQT69mXfrGkcqGaahJchbIkVX9MDlFLmrAw8Av/77Plesq6uOgQuP1/tgJKN3gjW+n25S4Ly5L6P+vo8JH22+gSDWKdfjbf44xDRdorG19vbOrjynrZ/qZIS9UAdjT0aWiCkyRjhcqFpv3EvqXaqP/wpewAAACBAIu6JsMU53WWWDDVGtFVTKPkx1S0MF69xIOrVVbka88DzHsRg9qLqHlH/7TjVYv8Dzp4SBp1sf70JQhFgA0cPbQB7VcGX9rlJdvSqE2d695iSkJY8X08UrcSasjHbThtbjy1dsVXxiUV0Vt7rFYKaxlk4GJz83p8e7KorTiJMTu/ randy@psg.com',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCszH4KNFFW8N7LEbCB/Cv6O47zKUpOJpW9HQCFKjNNUendAp1dv/cwiH+DvRbgGyghshkZ4ZHYNULEkAOyPmZREXT19iYnG6QJxMh2WjKhOG0c3GypHyHKCmfo2D6Ljdf+xZxKkOeBV57RCPb+1Uk5rp87juts2Gc+4qG6RX0uFAFQX6CQEGOU0Uvkje2wKfj1Rjdi9AKA8FqTe8/gDfeapQAR32GG+Rs01NIrkM1XaOKM7shRjDhLrtMTtzFvMrsEXn9bvrHaZpJUDWmYCbF809CL7p32uZ7hNXpmQ7f//vWX33UKr/8uhkIVRORhDh2INen5DR43z8ofN5yZtUJd jayb@oz',
            ],
    }

##### END rgnet #####

##### BEGIN ehsab #####

    @add_user { 'ehsab':
        email => 'teknik@excellent-hosting.se',
        company => 'Excellent Hosting Sweden AB',
        uid => 5143,
        groups => ['ring-users'],
    }
    @authorized_keys { 'ehsab':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAkPjq+nif0SjaHEUyXfWH7MoGE9grIXr5BN4XpYOCWLvfdE0cg1Pzn9DJcy9es4KsAduC8xB/08ku2O70mI4Tgn5JoPg1rjf5n1KD09FNJGmP50yzRcAjzcyvwSF9qImXD2b/n+VSvx1+WK37fT2iV19b5HGx9T9ZHKEyAyaq0qc= rsa-key-20081123',
            ],
    }

##### END ehsab #####

##### BEGIN yellowfiber #####

    @add_user { 'yellowfiber':
        email => 'support@yellowfiber.net',
        company => 'Yellow Fiber Networks',
        uid => 5144,
        groups => ['ring-users'],
    }
    @authorized_keys { 'yellowfiber':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAzxUnB8XCN0GsUUuTol8wOLahxS0NDBNXxTWir16JM836g8lJq5aOcGhmFmoTrD5gXbdweC1PA80NiIn/FbrDMxT5xNRlpagR5fSV4iV0pDi7pRIonP63JO9NjIz4sqrcuTHeTgqL9rByMyWMr+P7wLw6XQHX44Tdowio4CkdASeDVDQZJgquu7kUrXpSk+vK1uqz5naa+tFrBSLNYST0TC4VdC3LEcP3cy7K7y7apeRMGBCkpkzD//fLPCSeR0nfGviJTBHVWF/yqW9LkGIIp8Zj6wZ1sWOJP50LaMKU84uzCqkqxuiLCFuWAC1lgzRyeTZYfg9Ql3zdUYIUbu+scQ== nlnog@yf-vega.yellowfiber.net',
            ],
    }

##### END yellowfiber #####

##### BEGIN bahnhof #####

    @add_user { 'bahnhof':
        email => 'ncc@bahnhof.net',
        company => 'Bahnhof',
        uid => 5145,
        groups => ['ring-users'],
    }
    @authorized_keys { 'bahnhof':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDo4U5zHPbBEAYRBlQfn6qwdV85T+zZGIDhMjWU6c04O478/HIsG3D5dBglrZ93H4YoaFrsS2OEGuF58ZWqWHbYb+Q3FWGhx7U6Jm9hWbWO2+pU7mmJhYEpAwNFAp1rrHPRzoalJK49zPPKvBI+ciK3SGNEY1sHJnPOYwdOMAP69ai8DX/XlLrO9G5dGlFFIrKvarHQIWVJh0OO26v8yoWYA4dNQDyu7IcQv8HTHB+zqSdX+xIeRXMDcBRRCPJTWl4IegHCYCmI2su+LJYvk4Wo9NtDhtUq3dHhK1bp7LBIhiXoqhgy3NzFoh3YzVjQsgnQYOUi03cdJZLafgJbRyBHDA/fm8Wk5gQ8UvAfIVpULMnwq8viMVjNgBpdfqVGWO/tZf0vagUNHZBIGCYA1yuakVkhk6gUESAcvjkfFbnMuZRef8iNbxc3ad0chSv3D7JnyvLqlND8oT42p5oLvqKtw2kcH2cBbyECrETkx2/gG418yI5ZLD1YdwSQPgWXMkfDkoxywYNQdbWnOsOzrrNm8WbeFUYCSG1GqVLEwZ44zn44hvQulvXAIrQVZIGcY47a+xpe1wV0YE0J8FgTBR1pSI7GMFeuKfbCVPdP5SXK4sR6NKYlh/CLFntCvNJJ9M/nw1yuXAwBJWBYw1wwxGd0kQ1uFvGpCOQGYp8XMHqt2w== david@maclol.bahnhof.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEA36JIR98AoZ4S4swRXad9zfH0AtE4YfHqMdX4bEtuchFWxLEFXhROvd66ur4SRL03MqUiSbvVNR9bK7uTxj8L2+MW0xPcml9z6v/A6KMEIPrP94E5qdmBU1Cb7QINih8TAnHk2uGWHDhQ7Sqzy3QQwAIXRxcx3e95qi6stHo7sxM= rsa-key-20071105',
            'ssh-dss AAAAB3NzaC1kc3MAAACBANbv9r485Ov00cJKYedog5TOXoisRsRJHnWR29t46uwSIO0QVECOaMG3ufPGCu65IKEzpQCJ9XJ+vqI/teLsz2RkDl4IIZy9ObRatMocAGL/3MYqA710lP4XyJfZDYvfWloqIbmuWf21TuUBthgJx4bg44L+vVmRxaXaYGbnC7jDAAAAFQCGoJeddm59GmcLud/owbtynQ5f6QAAAIB6WX1N/7A4GLqGD8fF8d9C09dU/QWElxPKKygxA2S2VEgMIzmNiIj8g/YuJJ0uqU4qswwrUeYCPjEVGPuogeaDf1WHHTK13GwxjmM9DvXOO9bJrRtqk3I0jJLrn/SZegbfJ+0G1g1xvFBWxpuzkMKX9O2gX/84ZaLdmaggjYwENwAAAIEA0Jb64uqbk/tLdcx5Mfz6mz/aY2Elxigmnz2GDX/AL7/QSJ9A6rhGwYgJQMNZCKXIFMpYesrLOBlivJ+gNEguNYdjiaaYo1r5caaUuHcfksjT2c0N+jy0rNPvuxn2Vyp1XbkXRIjlTA4pERLCtChzlxtu7yrkPcPFC2KA2JRkKWo= lind@spetzia',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAxJ8eR1Xy1cmFRccmyN0+A5HSpgWDL/Uu+cOLouUGZdhkCXG4HWB+jw/mD5CJYmOXiEsRgEEsDu78fj8HQ2+JYUQtK8mUor5jTmO4WGEO7wedoW06pXVBAVZSfBFGNnZRsCt4cSOCf11AUdcZbK0dBePQw3Ju/Ol8cgIthNEwSlZsyJ/2naSxlgeJtq9QpLw3ApYN2yUFUhGXwBdopHWnZu6780zvbJ4S1TI9UzBA12MsxgD0hF4VnorqVb5qox/G8cGzBdYs7wXXruNrz9C/o15BB3XkkdDWY/Vu4nMV92/GNfNsJ4LaS32yY/8Ogn6uDN+3fjf6OapUHV9vXPLJXQ== rickard@bahnhof.net',
            ],
    }

##### END bahnhof #####

##### BEGIN nicchile #####

    @add_user { 'nicchile':
        email => 'noc@nic.cl',
        company => 'Universidad de Chile - NIC Chile',
        uid => 5146,
        groups => ['ring-users'],
    }
    @authorized_keys { 'nicchile':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDss/jlgm1miiRQdqSqEONGL9Tf+vaC9cqwiHj83pUy5PH5cd/mvv/J2aVEpucIb7GGauNzJA2BCTgOjDYiJTCs4uBvYtc4GVg87GB7amuHww4V2JWbpz1G7i8g8Hg5zsfTDw2rC2h5rYWxZkugkMBNPzWhf4l/pOswemtl56+lwI/LhviFSR1szr6a3uh+1mahd25IFvRTe/5LuifChrz5LRfqF3h5LhjnmkkCpAXwhtQnwIxVqzsFfPsQwBUhZT25oZKh/1GQmGZnep0Ca+FPb06eP27Y5iEjL4YURPFQxpQ1SNteiCT4wjQtfcraYkmddw+qhDYgnfYa81UX9xjd noc@ring.nic.cl',
                'ssh-dss AAAAB3NzaC1kc3MAAACBAMFCajt2n0R6MnRIpya8QQ1aOxqWnS1fn+xxOJA3/pt74OGp+rIMT3StZpjwF59j5o16UpYlWFld/PQJ/lK5CL6eo5Q8scee6CTi2cfXNaozlJtUY7ISH9RqjaMkn+qtggfVPf2PghzeA/dnmsmHPXJM1HvoKdH9AtGBtH6IdttRAAAAFQCxGwNBf3kp3mBjY9LCmwhXDq8KWwAAAIEAjbRZ5JvxzuEedKv+qYVpEl4i2E1K1pzj8Aa7XbMOilIPW/+yqYwjre2m5SGfbE1mQ5NJnjISI1o7Jn/eQdv4IM6EQIi0yAlye/vU0Oln1Q1IOcGsJKlZouheL9Xbat5ReOamX0b5/j+C9srLrX0m38DKF1ihU+FLIat9REedWGkAAACAQ0Aq/5Ag0jEc5uEjq3t8igFZGhhS+fzjPxqxMS7P2679zWJn2O/aOL+0Rug4up9QoyKaQ6J0vzySxE5LzzKuZHEI8vAcnVwAxAQnVjpVi0DOf0hTV8+4rC22AChtZhapAwfXE4RuMdOlYwSbmyIze8SsR2Fon5TjM+AXKRRTksA= emercade@nic.cl',
            ],
    }

##### END nicchile #####

##### BEGIN glesys #####

    @add_user { 'glesys':
        email => 'noc@glesys.se',
        company => 'GleSYS Internet Services AB',
        uid => 5147,
        groups => ['ring-users'],
    }
    @authorized_keys { 'glesys':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA1wus7DNOja21lhrdHSXOm1zAHtNYHQ4R0bmeJ227nCWPn6zfimGcCAhlUreEHUi6PnrFQsNBrjxg2uzvbdIPnMf+txwv2f/7C35G2DRNY5vxfy+gm4Y+3Xdo/+WvZPSZ3Q919IMrMsr7GZ9hWfYTf9ToCq951JkV/o9QykrP6HsSOkqJ6tvuoXzAu45HxytDiOyZf8BM/IFhg1l5sq1RCl6MxjTgri8tD5RPhRrvhfly3TLaMJpfiKSVez9GbYTZLUVKBLK3g5IitfdNLIDrWmK2X8g8eF1TnGtILLw+8wk39fE9Xy50r7GXNYKtE53t8rdQmi7tfQFGgC24aOz/rQ== jb@gatorhole',
            ],
    }

##### END glesys #####

##### BEGIN rcsrds #####

    @add_user { 'rcsrds':
        email => 'noc@ploiesti.rdsnet.ro',
        company => 'S.C. RCS RDS S.A.',
        uid => 5148,
        groups => ['ring-users'],
    }
    @authorized_keys { 'rcsrds':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIB9JrWly3hlUvHTu5npMitGIskOtf/vcISQ0DbHnE7hpV61dbT6zX6wtPu01VAxIGO0BJA7i3h4fvkMVAgFHzUSPKKcbffvLh4j1aZrXMi3R3enJxw6Kmz3euaI4lDGScTSK6uJx8gI7LTaBXoCamXgfPrxCZx2WD0ikOVwU8TLyw== rsa-key-20121210',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIBctL7MEVlixzw/jZ8GaM/Tyhnwo5MvoTv6lfxgYowxY8URdjIKB60AicluZ+A/1DjRSgKZfbI54dIjY1MHoPomX+tne94ApJeqAjzemgeov7C4vBfN98uSwRBh3kBibLBxJYF50m6S7GGNY+9lOm2vpLhca+fZofrQbRnd207rcQ== szabo@rcs-rds',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDLUdN2YRlJHhJpizTEqdzfDUhNxnmavSWMFhMcI93pS6Amk9kFv5d/ahOY6MT2088hRR7vhRgzQRWtEr4vUk9h/sP+Vfui0sq5Jp/vCWaQvAusJQ6GJIu7TvPSEXDR9hBO9wcrjaRnX/hcZelWJ3FmH3v2TvrDwFWTdVdfUU4Z91HEYivETqPCOPVqLUtfK2XiWQL+WCFFJjYxR1ZJ4n/R83PmfFwXEQcBCnNBJQ/ok17Ky9tcZXUeyjROrDNdGbg1DoMhDp1GhpOfSkE4jGiYoMNPFzi+Y5iHZbsiI4kk7fbzTeDyjiCLlpeVZRWhDNskpSsplamHaTD3FipW4UKN mihai@rcs-rds',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCzLhZmCZzC01DFNDDwWnyEhb7GBJBWIE9ooHz3VPgl0xTaHp/ROQu02LvZ7zVeUQtVQ89zfP0SvQWp7nOM38qtMOMnqhDSdoi/MTK1iWVr4NLraNlfZlVytfy+Ww9TLKATX9AVezN+6fM3PvqlNMsDxAJAIQbYVrRxEbUSugUptVZuWiJNtpEyVraqZE4vQcf9it9XfdQ+N2XpyCaHCxE38ayG6LxZrnw4kCVW31xal1CoUMgNJYyaYoLxCzVBurmcnGv1noz8ivEK9+672iOe67n/pIyIVM6VxEx4GFEk2qlmKUyYj0rmVtrwl5wBOUDUZPV0f82gJ8t32WB9JR2J',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9HbL8aC3fKnw+b/mA2rbV93ltrKv6VERyH+qJWCtxqKwYPC6iXR/VVxTH376pLtpudIbuKIBBokmgYvEC65j72x/WrLyYdvNuKNyftLsVCrp7vNmhEB4ohgRfFN3V0crKN/pQaCncmJ36bknH/lgmPTIB2DCV4i4y+ZOWukTehJLk8AX7pg59kDtSBqVAQNWwy81Vj6M/pplTPupzkwrvkpFGIFCXdUiWK3Oef2V2q9wy7N/+Ct/lM7DOwI9UNNzxJhqwqkRSH/D6ga1pxRMUiQiEuu5BQGwz8G0Ok2zfPA6pqqQXFXfkSUDTWVtTVRQiaxMJfWmV1d1UcvO6fShp liviu@leev',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAyZi4dvIxNhc979x56oWRmH4nY9rnBZw8acHRdqg9STG9ZwfVbeKpMs9UlIcoFKccLFDy7T+7rSu396lZk4fLgdF3rMn4jHXniCrw19cG3cS2q+u3+da+sOEDvaSUsrEBRrSxt/XpnPBz1izXwDctmTA7rOQOAHtoyCotRoJV/mEZABCj9OZy+DDWkWaNZUSneFvmKe/RmDw0jkF4+g8V90Fa+L0N/aYqpdNrzP84SJD0G25d6fpILrNiWn0uD+u1OvWKLKhiOccdQozL2ybfRI1iFqTd1ppMlmsGWWb+HOKfzJnhJfTYtgzTQJEDI1WvZ091o96wv1jXppL6vns6Bw== marius@vinci.rdsnet.ro',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDp/Jr8yPdcGAGt/p6NNI1aNoiYQPLFDtrwKjEfxzHTYpk+hXf4ZdRx4buSQQ1GBwOatWw/E5RcWa+tu8JmlHIJ/iszOIYLbknJnUYZ+Wfk0pGHgSb/2uQ9dKVORJxhrTwFbkgF2YyVeV3dRgV79v8RU8cpJYB5YdPhve3lvkN2TiK5uXdqDOKu0siRW2Oumm6zZr/M76y3XtNxQQ8Mk3RtZAVXrwm4g7LkJrpNo3+Lhocu4pswmUnAgxKPehZ56soSME2Iuo5PRHj8qxDHJmX6Eu2x3MwQ3NVXdb8WfozZFmkmV+6S0XMVnP4KimaFmZIj0nbhAVSxfdQOgIpKfQd kroko@kroko-desktop',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDajpa41L6XeEks/SkC86hX+AhGWmiKd1w5VQOZptPCDs7i5PJB5CFa0CvovS+MVIT5HtavcADfrhLshV/Bzsry/MDQ6bbSTGP/KP1ACNYOK6PsMW5Tq8P87Bea0Gx2HCh649jTRlxfXsYpXXGgmNyEdtkbDeARQqTwDSH2/y5N2yaRT80Eq5wA5Wvxvo301sQvqZ/8B7ijNPt29HRaTjDenzN1lEzQEUpWQKn4N/ZVYUecWFfv+oCNaJfR0VF8Ub4zUx9I3YMSA/OiNLkDCjQZdthLd9LxuW6jPFVHwr4xjzss7IoQ+A4FEy++ZeHBo3m0AYwvn52SjxV+gq9NoxJP',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDsbCTp5S2bOP+RnfMZKFHNdLN1xQ1CZXUOWvgAF0Nks6hGuwmJ2/IYKJmpYS6JgX7wWfKDPLcp/U5uB5Jdhi4Kl28KURZf4QFtrq3hOY+KW9E09Z87OsC3xBjjly9A6shRjHhi1q3AvcRUHUuNPRYbVBmk57OIcKRgTlbmztBhk2con249LPGiCCV5PdCxEbMysJFDgwlXF4s8MqIlqC25JfXcEXbTSV43PZsVPCzCORer8X+OlM6jIdzW2oQk5Js0AsLG5t7OWNMxxPw4JAvGwip8bC9s9v8ae9hQqG4ZVLD1HAE/8omCXpPnL3WhS2Iz35qkG9oZkbDxT5Ctu0aKQaj0PwNgEHTB9gzvtbWOPEZcMt1ezXX42tZq4pogHJmz6Eh1B1YK/pKELGZnhVVxi3n8PV691Wj47uuCuxfM9NjjdwwpkGGmFV/qf5QsrIyAWXg7BjxPDQqDp2RiEc1pU82euG4LksvDHiWN6lwZrDHJiEAtAd2jBlwAhi7etsBwclxgr/dqaf8/P8O1E26SdJf6pEKaAFahxmtPX8YgpoGaDaYAUwCQsDhH//Kjyrw7bQKDt15XysMhhmHBfQX0Hkg7soVLtm/jbaeHQrWcf6N5trP1Qqn8zsGbYUu2+zo655Nyx/5WxoryJyFLjH15lUy6C4rP2+egh06ccINCWQ==',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEDVQepAgUZyETzXlpo4CYZOWEYkoXoot2+ZVwNPA+vITkc01O30Xcny1DKE4khuW/dvf3sJz7ib59P+9Qw56h8bc7LjJve4d39u/aZo+SEG1CxGxo5BoxpRhSYX02X0G3bhjgaqUdhtezt0mR81ui+spPI/mccmdfio7GIAoENhW9o+NFnCKhSfloLyjezsYJwq+kIXvhe0vmp9jcnlQIZUPeXHGgpE8mpyKsodJcEtfNnfDzhxqjvLvyKD5RpvUeUo5o8A6Vb66xsNKp8xS+l/SZEysYf24QVfpl4U8lHUK/ouAalRgr8nnVs5ZPxDvoCN0v3ji15+9jbIkn3qiz',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDuF+AZXxQa2uXsbXT4iruwDQNWIgGCv6eqdO0ngC0xCNKYxre4wI7CJgW44S7uGvbHefCMz7SFm3Y9Y/kI0peMPzWLqPNv9crd44aNXgj4oPZxRfKM0nuIhjCs6Ebsa35+kpnISh7kaQqx2FrW5WOI9MolO99Ne+g2BreeqPdbmOrsaLE3CkfRzeKGOboH1WB4648qiXcnOwCrFamtFeUjef1eJRHmwlFciTT6k24QnIeBa5E0OF2ukwtyLmXLD+fQxuKKFc8RaHZkVVm1N0vQS1UfPX7j341Fobn64wEKxaDoP9qlcrcjmiuNe/rsMuz9i1rL7oHsW3CKPfFCiwn9',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDPuBbw+Ip8WugoHjjozWmVmd52g4ERZ7REtD+ghvu5b9oZm6OuvFSKSdFxJbpX8CQVerEbYeJEZ38iiddiJqN2uASDwVzbshdsMVrH42pJaRoWN3TFOcA65iXBcqMyw0dUrVTBiIIADlEEPuN+l2bpxKs9x9tf2AGjY+aaFQzy5eY9lyfY8ucFJFYtj5DPA90O4Z/0RlX5hWVNjXAN3Tsig9v739KrJgCJDZrawM2ECt8hia3RicTvQAPik+IruO1EM8HxEL/s8dD8r163xW9C2DrH3wY9O3d2T8I/2+wnZJgQVlWQR4Agg4/av7L0Mh+UTXc5QcmZNgZL9LqjDqH7 alecs@alecs-laptop',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAzio4BZsGSeXiQqtVpuDrftm7UzpqQ0VUFEEY9qXEag0D/+uU+Q2ekxTdxAGkn7TW3zavAgiPrr5W4Wrzq7nDKoEuyauBdT0LoIE7mA2khBrkqA0inpXg6cvxvwvNWAWjNwuNQPrj1YsQ/T+wQxMI4fLdoU0zG4u0/RsOUexgi7rkYoo8h3xlbh5W+1ivithPCDCjqtrY4iBgHwKRmvVNqsmIm8Nv1HGUlGVeoJodZ5UyMyeIX53DmSWPCvVphavvdvwtX7cS4fX5yfNJDnyWZJwuolk6NGDqHuRFehlriiHaH+/qiSj22cDttWbFrfcXZwhdpzRm4lTwiRjtgpx0qQ== mooney@ring',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEA8AUF3zkiEEHYWHujnbrk21ClymStH10VmHk14BoHGqyd5346CLcpFpRG2IQyZx6aFW+2vY+AFLxQP/ohvHt+RuYenMEcyn0tjz5/MhsRaSNdQLRXP/EcJHk5GGq8rYjDFmSnaW0uXq9S8+rXV5dDqDaxn0s+JjC2tEhYpmggyAW1rHDDlNpgTXV9JU/Jg7X1aIyaKphWBTgab1ROt4yHrzIwyJWbV0HixZN04TEtsZ5WUdolgjKuyAyd5EbKGGcY6sJk6kgDNDcKupVyFOchfrkKzWCMBssRc2kSEXAKcFhrzhyg8b5YzRrLWfp3K6xxXPDCZmGw0mc1v4RNNBjNMUpv6MmrkhmsvJZGLyW5WCnGpau28rjnnlsvemQqhrCusO1+2b0clh/b00VXf4ChncU7juBE2qIqMmVLGWLDC6TtDJENWePXRMQwzsntGRrIWBO58BPfo6oc69U0bm7cVn1/H/8yyg1DC2nyW6pqx2OYCYVSg/TQmSNZp9XyqhIj8c4uv0aOIdsKnfwmbVMOMoinzwx2jn+1zfS006q+Sc1dnHrdEyRvzCDtvVc4Q/mR0JGGksDJO/J9hRMnA/7C0fX9ancT0RjpNgc4QE2Rx40ViuZzCrXz/cflBZlgn5GOmzQMYngKWdeQHhSD9J9sQ+jzsGcCQbQdUGYGDRpIDIc= gepu@vinci',
            ],
    }

##### END rcsrds #####

##### BEGIN indit #####

    @add_user { 'indit':
        email => 'noc@indithosting.se',
        company => 'Indit Hosting AB',
        uid => 5149,
        groups => ['ring-users'],
    }
    @authorized_keys { 'indit':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDUlBgBNG1FVxKmvXtwoYKhMkONI4hmahgHEAOYZQ9iDjbdnPwjwOtm6m13yY3dlg68ZgpDAT2sBfCqB+531VtcQ/eP7jaRYKATwQJ3C7CpbsQN6ymR/UWcSq+NM5USPVxFfFV//jdZEsJP1pKu5L7eFO9Yas9l8XJcgQ7SA3GPBDYXUf4gEnEoRAfVt+xnwsXqIDGTVqPiVxeq7KVVm+9iAjgDOaB84FDBtqLzRAXNvopaDyPMPQb2cfYE4Wr+F/5zFaL8Q2afTCCj5+mhpcMJjjBxsRNEgMGK9uh+DwT7YCUI+8idjEZKbxqy8hf8ND6iWIcSAoQHx0q4p6fXWWh9 indit@indit01.ring.nlnog.net',
                'ssh-dss AAAAB3NzaC1kc3MAAACBAM2v1IZE/voVQTJGjnRtVWb6y0QekYDt4LtWz5PG2+Vh9MOkQU0T1OTW6kedp2iPzMtPFmd37KyFF1Jh9Aey4elquTRMMHmaS9LqLM6mKKU+KaaZEP95/6OPkwAZJ0q20ef63eXyQy/2WBishy8K/EKmFedesL+NSJtS4aX2kCm5AAAAFQDv9ggurJeiGTgTGVCmeAfGWOsJLwAAAIAok0FJiiev6t9fJ+uzTF7vWGMif2l5gITVMQD8loyWpbIM9EcOLZkbzY5vkt5yqAoK6YUVhdq3l3qcwNy0P/rBnA29MrycPzKNUCzAT6n/1kVzXWWxi9gSfeZB4JzXGTyhRcnz5/mHDivyRXBxAdQU9yw7bJ7f5UI42D8uHo0VnwAAAIB1vRQelI9XPNJwtgP3u2wVGtX/o5isSeopdnWfHWInfsN5r3uUL/xMK7EvcbQmHVy9HYLQ2fy/M5muWzbzlqlli3r4eG97TuhSnLQgTVx12LkGD88hKjDOzLzoT0BulmYdbvNbARhaJ+sZfzV57Q6Hl2EyEwxRRjASX3kHcDogYg== mikael@laptop',
                'ssh-dss AAAAB3NzaC1kc3MAAACBAPgKs+KiPB+YllCQizOHmE7VD0d+JlVHWInpFddimgFSFjm1Hfc3ZTUlzHETVHF4ON2a8be3T6rpXCBvfvqiO89NAUn6UPsOIsoLf86WNWe6NdM6Bli//eQssHmcRBbLXmcI9jF7h7QBDRtL3jtTz6Gi2mFGbjJHI73RnLfu2PbjAAAAFQCYbnQ6z2z3GdVAghPuWZdwD+kxVwAAAIB3Y7h1nSYgovRTCRhfHKXXCoqj9/lojyo8n9dbFzZOmbatsiUMEI9EiikS8YG127Zvn6i96QpP3wqbO1yxGZlrNu7+gu9/onk6VPslTDCKchbrsrYhbFlz5ldOS372+CWBQLk9ygZE9gkyLv9QCt5fca1AUF5KBGcG//IaLRapjgAAAIEA2jo7g07ti5MKjF2HxcPMCalwfHgHxsSbkrF30pv+Bdtvc/mboGdh83jqp2Kpb73FNfetEv9LtKiom8FgZVzg7ijF0UMNZU2U1XHCDZZ3K9ywvltUeMsyusSsU4V4ejzd5ZcnE+OeHwWodGVGUe+jAsExFbOoQQaFcZuM13165b8= mikael@admin',
                'ssh-dss AAAAB3NzaC1kc3MAAACBANGq9NYrdmCshV0ByJWuVu1nwBQshxm9AchmpUZiBxIeQCEp5UcPkOitcmvLudm50hfWn2A3RBfLtF94WPdnBPk6Q8j/aIRw/5p2PxtDz9iBQvtJrHBcvf2vaiLZSNrGxXtYOQiTDeK6ye3uxZH9xhjYvGwOqb3sf9YHMRJJnXV3AAAAFQC8ezlxxdLCZQPdspj+auzCpME8DwAAAIBWsK04Zbd3hHLOu1nwVPwmJOJ36kF5nEWz6Hfx8AugttqvFkzFCeObrLBh67yDVsZ2zmxScqMaLGXherwbdUiF5SHJQFRXa+/hX0sglF3rwVXZ5MxOzS9rSj0qC/4PwKWr27jSCX5vmtxHG47Dne/A59QJLuar',
            ],
    }

##### END indit #####

##### BEGIN itmastaren #####

    @add_user { 'itmastaren':
        email => ' registry@itmastaren.se',
        company => 'IT-mästaren Mitt AB',
        uid => 5150,
        groups => ['ring-users'],
    }
    @authorized_keys { 'itmastaren':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDIELQA4QctUeQqOu2mqZ2TsvlhmvaFdKxxguWbL22Mcz4wzNNcHXsLuX5Ksl7RVYJQtAYaMrIdPAgWj0INcrMFfCaMKuOHO7Go6WNqcTW2ZJugXMVJ0ZPlbAtaK0cM6xcTi++0oeUbFTbZwa2zcPxu3xmDBE3J0c2YOtRlpqH8Y6EGBbffwsR/tmzMcunqPdSV5uQ6ZaLjxFW2Ba+y6OdURA1/jUHGcX/b5yVl6V6tDpXMyVbLSYy5bhWzGjk46Msk7Wnqd88bz095wu7bR+i3CanNBP8JakJjDg41cp6zQodTtobzkGczey/8ggzuRsFsqHt1PbVs12p1qwSDepU1 itm@nlnog.itmastaren.net',
            ],
    }

##### END itmastaren #####

##### BEGIN openminds #####

    @add_user { 'openminds':
        email => 'tech@openminds.be',
        company => 'Openminds bvba',
        uid => 5151,
        groups => ['ring-users'],
    }
    @authorized_keys { 'openminds':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA+3/UxYdsWmOyO6Ozlo4hTvOiNr8UTkH9YO/jDRtRzsv+ytE+KmI4HOdxxZZvSt3vHXCuIfLgHq+GglQzsfHnL4+Ec9cK8m2qRoovpYAx+MVPIlGCSTddMP3Vt7AKy2o0YFlwsj4cW7B2Pcx9ct/wS1eQJM5rCswdkuMZpDuMvU7zZtoBWmjqL+7jFzd1zxKJ4nh5iI55qdxryQD80TR996w+aszYdKO/ypgkSfzAy2iatNVT37Lp2DUpVZ6yGvLStml2j4tyVDNEtcJ/cEh83blKotHfXd+r9IkyCvhYRsd+mCwd0Jg0600wgfP26vSKwXJZv8CJcq9/+msuPnx9TQ==',
                'ssh-dsa AAAAB3NzaC1kc3MAAACBAIZjYwPsNQewxb0l9fCOq/9yvHxdswDBNe+n10qFfRSlTDIiJhBkzlgX0bO6F5UDvZav9RXuLL/0U1s59hqPHdaOoXfQRrLBUiyjyy5oyQUHqN+FBaAkywBbjhDZVAxMCC9sZdzX5To6W022hkUS6b5wIsn+8RS7yCf5GaQ6RabvAAAAFQDd1gLANwISYMEebqWoCYmRAi/mqwAAAIBY9sS71739+3a9NIDM3YR7KFLuy3HiOTvuFR8fiTInZWT3/NV9wnqml8xtz0CjI5txDx7RNoPaK+yja87rflMyCu4WF5xT9TIvN3Sd/qAbDEZZr8nAvu945pRoSByITT4d2dwT9sRrh2g44BFCISMGQXJsGQ/vZ4ehSS7OirfB9wAAAIBH8tSGYColc0E2mXopWS0jv5kx7NoyaLmMaINuZiOHADuJSCwiZie6oQFwrPlpJv2CdlGdagfovnzrjK/ZJsaXBN71RVcQC1EAvZQ4YKZpeCEFqkG/oQdblgzcU+yZSB7Jltau7OGr40+fBB79hJXU3mXMY0z7j3YePirS/dqv5A== bernardgrymonpon@dhcp106.om',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA3EItOq3wlQg6RuSif50f5hI7ljiqS7YBiZCg8xmAL+TEYXo61u2xBceyajExhE0tNhv7VDY9csgOoe1PZtmAXf2vn1E1CnuDKWPxH9jVuWOaHcidSJu6Y5f9z3gEM//KXYyWYDsoEv0k9hOlvFJw/TACcoo5IIavFWeJLqaUDVIUsSd2eHfSciNlcHSFMcc48wGqI7hzkaq9Xu0Q/Zdn97FohOprjI1web+nkECGL4LW968xY/K6w1F91vI6ia8FWv1EO9ReKcITFaOuVIJXbon/PLaaHDtGDl9gRMXnAQIGtgm2/lhpNltuY/0kbhzr9Yl3ET+vyRnrBrIxFebldw== bram@bram-laptop',
                'ssh-dss AAAAB3NzaC1kc3MAAACBAO0unJBSVGhmOAiTqTothJofYyVWwi/CF8lCQzlt+lk7rJUkGDGC1ovmmHDaJPC1K1e5mmoj6X4TcWta7p77Lufhu9DxfrUMSqngOd7TZFSFu5jEVmMR8Gm31n+iBEz/6fCbF35h2JTqyq5ccV1rCSXV1jxdeA8VrBVjw5GVnCg9AAAAFQDbET4YAiJq+nrC5hxmfI+vohmYdQAAAIABM7fWiTjNPB3GQB7EXORKpUSR0WkG8Sqdc3vculuPOaQqRgtD1Mfb1kWJxuKzUAzxXa64T1oc5aSp6BsVuL3Mfh1lx/XEsBLb5HJiIpJYZ8YZVunCBddkuLKJ3QCc7/c/SS5yS80krVReVNYU34qkXAv3zGhno4oEQCHMvarF+QAAAIBxHXM8AK06Tmejx/opTySWoDIFubmeMs3y8dRI1OXefjxmHo3c6DvOu2lkHsAyO5uMuYNHjgK+0KTSdz6eCx0QkLzAeKj6Z/v0d+8puJ6OffIBgg+nO+QVYfTCEc4IU6f+RsDc4xxZY+2hl0mFejtwWNAhj7eBQy/wpQpcsDFIRw== frank@tembo.frank.be',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAgfP+NEFaqTEcNbRO8U1DBRTVKzmSobxjy56WRIGZn/0mKzaR7O+OooWYe2nuz4z9bWn8u9DpJTO+f5v59f3wnoHMA3EyogmPsQyUQrZygHiqi0KpCz7QdYQcyZcGfcV/01qWjJR+QoFbWn7be7Q6fVViv91Asw0wXicfGNoiB98= rsa-key-20101006-robbe',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA5jLR2PRDwgelTm9HOc78Ky8ixkHzIl2TfUdYoYGnJ7JkqP4oOo0/EXf1DSDbFTKzDvUmUF7WfEs4QONSvyO/15rIurG+lz6qF28++Bh+8s0E267YmizqIGpLF4rrdQORTARAbkOklKoOh63dFgayXXVOOj0Xw7G0tuh6Nc8jvAHDevI++gZZc/MDdfZSmy7+HoVXPEa20ns5FVY3P+cNcljoLBE11rVy1gEwy7twN51re0ipD81h1/8P75L6XkAmjd6IYjRV8hIBDKV1PrkZkEqF8bTZdjarYgyYI7Gmva1ngGWwVdu0HLQRcYmyrxEHepFXgCWbScDDSQX3+FPt/w== steven@openminds.be',
            ],
    }

##### END openminds #####

##### BEGIN one #####

    @add_user { 'one':
        email => 'network@one.com',
        company => 'One.com',
        uid => 5152,
        groups => ['ring-users'],
    }
    @authorized_keys { 'one':
        sshkeys => [
            'ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBIKxLYOvbSvV5fF9jWYH3lGziE2Rt/E54pYN5WGWU2E0Aogo1gWHVWCqhSq1wqTdUCciPeH28odmkTr3YVTGTL4= mph@one.com (ring)',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJEGIHKyF/NrZszbWq+fc7jZITYdGvcz6EoQs77+4ZPbjUTLbDoPXx2sDij0XyPi91jQw3aAYxhT4toVbeF5KodD9HqZEaK7jkVkwDvjMg/6Fa4FVlhbiGZMAO8/UiiaWPxiK8Ayv9ukN13pzpbHFi5PzuvQ8gBNjM2wAHVdXVsJ18KIut1MzXFq3w35wPsIHwZ7xU/Z4hdjw67ZS3wdHeMxuMcC15yquT79Y0QnPnrb12nen8l7xgjJgIncIst4cXBgeBLNe3vgz7MAZXNczj22fZVmQBTHbmclHY/xFu55tFVR2S//IAd7pXSV5mi2ALy9Pb12X3TkVeP31Gnrlv mmk@one.com (ring)',
        ],
    }

##### END one #####

##### BEGIN networking4all #####

    @add_user { 'networking4all':
        email => 'noc@networking4all.com',
        company => 'Networking4all',
        uid => 5153,
        groups => ['ring-users'],
    }
    @authorized_keys { 'networking4all':
        sshkeys => [
                'ssh-dss AAAAB3NzaC1kc3MAAACBAMg580Z4SL2KWtPNeicc/Zhiwqrd3iNAeAIl3mXosTEI+CvinILL7+e7VasJhhxi+6gPPu4QPdROeRHwVESMFCjYYU0c9kfU8Da2RnZpZGnzRicGw8QD5jxNTUw7SVLN0zzpFwufHLMW8OM0Yv8fScGjwcepRvmRITyxKNv98mM1AAAAFQCDh0IVU9ta32oQu0d99IH96AeXLQAAAIEAtqGVhCHqezk+aPfW1wYLZzv0OgND6hFjeO73hC09oxBRlgFBxEAyjz//pV4afFBjuXXd7M6HrWdBMs/toTnWpYugHE8fMl156fVw0sjWW2Qsdwtv646Axauo+LPAxBXg6Eb3614015FwMQz3MoKdgphCJXHGNZXW+xtar96GJ3YAAACBALteS4ciNfuvHAN8qIEkvX6fNVgcQVkpfpfX4Ywt70o5m1Wd/6gb855dXw4A/Zy8m0oYadbE0KyGJVZ+XMWxyTVwjrwge3wPJ/M8aKkLI038Hl7TTzzYbJoZ5L1KZmeR6Vzy0u3bw/YpAXSG3f+Zfir3J+KZpFSUIih0K5MrpeBM evharten@evertje.net',
            ],
    }

##### END networking4all #####

##### BEGIN heanet #####

    @add_user { 'heanet':
        email => 'noc@heanet.ie',
        company => 'HEAnet',
        uid => 5155,
        groups => ['ring-users'],
    }
    @authorized_keys { 'heanet':
        sshkeys => [
                'ssh-dss AAAAB3NzaC1kc3MAAACBALJLo1icdSCoW8J7G29pnHL8ZEFMs+Q50yr08KW8rCW8zgIh46BRjhz4CfkDw+UKR9zNIylct1Xc3hYv2Hc18QRq5g28IT5mp7Ln+dzqjq/MpmPxPorDs2fanoQmqsH0CI62QMhOygqEiul9BHZzQr9CdHnGRnLpf1oycDbNfWifAAAAFQCEUTpaTeJfYnkgb/lzId18iIFK2QAAAIBTdsCBei/nf4vxxzsx4TMglj2E59XiHh6eExa9Q3rsjph7VMTQTIA3kSZ2e5BRUptkLvH9F4KWicJWnBAdp8/Lm4Is2moSjRUf2Zmdb7UIgtXMPcNW/7FIjWZlYvtc3x2J9tTNINZ3RUAQ29rX3N5YR2ojlJ9GYBWiHXUHKUekBQAAAIAMi6PyeDpgD7TO8e/0c6WTDz5ERVWdb48J07DeQhRvUSetTlWauNN3Ggb1bgfOCFC4V8z4PTXY3fvKDy+bFqHi4xrw/yqzsX3LNMr1X3aOCf1KK/1mFMoQiUxZ5d+6yY1U42oO6vfKTfMDVkudwVcm9x6sHrKwB+YKtxJXpfQKTA== ring@heanet.ie',
            ],
    }

##### END heanet #####

##### BEGIN algar #####

    @add_user { 'algar':
        email => 'cordados@ctbc.com.br',
        company => 'Algar Telecom',
        uid => 5156,
        groups => ['ring-users'],
    }
    @authorized_keys { 'algar':
        sshkeys => [
                "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEArxFGcCzoXyuq8WORzt079BY0G/Nr4g7GRdQxHsVjqk8ulDs9hJJA0MiX/W60Lo2EH8h4BZrgSiIYwqT2jbR8hJ4vqlN58ZEHVDzMWGOzsPDOGl/cFWxaN2t6WM2IaeIu9Pg4vKQff+s0p5kImbI66c0dej7ZneCirai0Kra15wk= rsa-key-20121118",
            ],
    }

##### END algar #####

##### BEGIN qbranch #####

    @add_user { 'qbranch':
        email => 'networking@qbranch.se',
        company => 'Qbranch Services AB',
        uid => 5157,
        groups => ['ring-users'],
    }
    @authorized_keys { 'qbranch':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCu8jMiR/OCtNmLoGC+ajidg8/xYI3eCzvVMx7yUFfRmBtN73KpqLUWtZDzcfQmq0VOQT0jmzE/surOtmWg1xZ6K6ycuz2MUyOyeZsysywD28qMxV6lnIy7zNE5XYhTihveCUmMYuzF30H1y0FHsuEvCOKaYEP1319EyPly3ZGlV8HxCQ4/DOJ5AWiLYVlBAUBuSLnVGXefTIpgFvYYDnrzerOJcPVdkNQBf6Da8EPFXeY0+CntUTLRDbEIuRKQVSEm+xCB5ebONamK9fWy2AQ4dQp574xRyziiN1jCTBF9bKsrIRiLctdgHvRsxycA0XxmZ+ypXBicuH8ggGfiaZUqezR78uwFInquRBgGl8tcKRP+BgPiAdPsz8O/bKhPdBR6vErtLsVXPqbhC72+mdPIe7p76h4MjLUsTAT2Yb0Oc2zACo/xIJ/GZHtxIlwRRBRx5B8mlEbyjblzPuzj353+DEDbTJQNUQpar3+CaThDMREbql8raxvivwx8bPI34wq/eFisnVTnkFy3yLGOahGXYZTA6BeqTpvxC5qTO+GZOf03Qlfz69YWGFK9q9k87X1JSYvicN+GD50A2WsxOzxK5G1r3AWkF8zaQCclTVRLOzXAA1skAj6NK/bdBigqmYsQ9i8FmNOrpUsii2dXQ6bYkeVRTcGBN1IUA+4o2Utg1w== qbranch@qbranch01.ring.nlnog.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCiuGD32DAq1JJNNkrY4WWQ/HpnVOv5806u8jwLhXnw/Np5sO2wvvx/oQWHjCmrgGSKTbfk0F3xIWf6s+6vsiByL20xVJOZVIUpY7uzOdzeGha1dA24RNCpTmpMZO++b3+Hm0IJe7WrMvwymzA84bR4FMUu+SVkhNwmvSwn/lvYc4+j5UDFkaNiJikDs+MAxz4IFCR+C2BLVikA8W4O6oic9G4BlLLFxDMQm1EmQB+RCrcwYpGAfVZFla0BAu3pAECC70g86wAuHY+mICsG5FivNuy1T4fROuqrU9loE1igvUReI7P1bZJiYlNN693tT8groPWjS2c7Vp3AVDc0zpFx mavi01@qbranch',
            'ssh-dss AAAAB3NzaC1kc3MAAACBAMOWSFBPkql4zT+xddh/XJun6BBpBu8GOkF0ypPh15WRi2I4I91oGwdcFugAMzhcQfnyfP/tXXxKVm1jT2q4R5OghOBqHZ5W7fvKEr1IvqRhwEylvIANS8yrJOLTBagDbuQgqfi6oCFVYrzM3JcjU21UkhWtCRBYYOnemna46OQPAAAAFQD7xcFHwCpfcPgns6RVEUQbcrBJKQAAAIA5+TLTyjoEcazsUGCJjZ7LnDWwdT0zwyG7qZIV+tBBwIKVECptGf6qZIngW2iupeopTVhiGntZiPFWyjxj+YMd6JmWvowjdsS0XKvf2yOzeHDiJ6I2o/DFGoXHXetHOfSXSShy5ln83qxLPVyxBJt6HSwXYhCbc0AMHWVhifXmZQAAAIBUG5HzsondvdqzzWoT6KgrYpguIMpVjqntAqVVMY1FVKSph3GMTVX0aSRa+OftS2RC0iMa3wH8v2BBqH6z6pbvg82AhnY6BZ7d2zkQhAVQ1laqC9QoSo5GOfmOK3pPJo18QmaqaQON3fmBrvjO/T+mnSBsYy9YwFVehqsqLK6MOQ== niwa01@qbranch',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCUxkdH3B5jnoh533fST6IyoI419dfQ4JbUwVY3EWz9/WlTVo+ZT5j60Fcowkr6n+dqyIg4BTQAB7LMRdc/6fpYmlZ65yQ0zNLKtOVw9mdPvFm6LX6+klMi1knoqSoMA0rXehlcM4FytrjbyPDui9vbgJUqYAfRWfpzN6DQnaNmdw3alxCbK4WZKz59dvYvCjeagLrutuz9iRNb4/vFbKKYJzxgzsoqQTIIKukioT/9z0lmd8Wu20KJZEKisV9qD7KpYqt2IZxdpfFK7ivpClybsP2ThIzdB5XwkLcup+E/hinnPoLuf9l1kJr3oWZTrWBgMhob8qxeDad9GaLezesX joma03@qbranch',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAuB9gOTLS/3ln+R/LXUFW9Rogokw59mbCfUCCQGJynYhwwpCz1bTq6AfW52ECvHlhh/4fX2PuLp39TgsNOt/4I3ZahHVyhTYS+7ZH+uWeY+PTSxRs7D444YliaIKIKM9uTtpMNPMR3+XuJZ2bE7nMZjfnpEvZB5kd1deYXDp/TE1S33atFLBocYG0h4X5r4tUwf63K8So7vqDje5Q3WdFnIenxLqkACG4u+lXtVpxB6imyXljJWaL6c25U4BOZCCSIzfRtz6HosNg9psG0Y8nM2cnvreWo7fs8q5oqQiJeJeS/6BNxuXrnbC+9QyPsBRG1NJVdVWsRghAz52b+E4miQ== ropo01@qbranch',
            ],
    }

##### END qbranch #####

##### BEGIN nlnetlabs #####

    @add_user { 'nlnetlabs':
        email => 'tech-admin@nlnetlabs.nl',
        company => 'NLnet Labs',
        uid => 5158,
        groups => ['ring-users'],
    }
    @authorized_keys { 'nlnetlabs':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3kccqWtnb/IqOFZdc8o7YIvODgB8oybaj12DY4oMBTvbmtZI/Mz6EsjFvN8dV5kUkpAn+vdPsHlp/KOU9bBdZB3T8uww+jMsikY8zyIwqvkhCuaB3JpKakXiYpukqIp07s7R/k98F6TO1lWEkcWwEjmYFcIT+qE+FO0XFw3wisT/i9CCcT6WIqD0y3xqZW3lzcKhgZmwV3hwvpFSBCDhThZHGBRmpYLbnquOLLZ9YGcZ/4qSTZk2NO9GSmc2yr69yZXhmJYkN352vscirJLbfdNlov24OMKQWORfwzOXxuMqGex+6CaWSouGEI6hfnx7zYyt/dkjp6pqAtuvE32+L willem@mirre.nlnetlabs.nl',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAtSfTaVfBMMkcO6AoXi9OQ7HW7pXg/feztkJ6O3Go+VEf02coAurp1M9+SvyS47yYixEWKgrBWq9qX9vJTp03CTGukg4F+8s2yt1Do+oa8ed+dCA1JcljmGVgvT98vMYCz4fly5us/OEVqLP3vBsGQ22Qq00DuNqzbQutqJ4PNbvncmxMUS3Xy/zwqXEEses9XKPCIJzMRHfA2Uvi2qid45GopP6ndDcUY11ziO4jI9q5EbRnMU3lPNw/hv8Fjn+6eAto5EXSZSWV/FLpQMJ9Qa50PzMdRcgv6j8UyRqS1q3AW/3B9+cCWQM3GM8K8qwTjNRzDDfK8JLvM5i/++UIIw== bjo@tinkerbell.nlnetlabs.nl',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCtxhIRtm700TRCHx1iSvNSSSVuN3JjhPp4wy1TVwNMpTNe/LSHY4Ar2GgiRD3z6GEpn5Y+it6/paCad8qArWFa75LaWWibeRu/4V6kOHtejRuin2oCbO7s+k5qggSCpu5nRcl0fm9UbLabtIFty5T5BCY5RqrnwLi9bK80ElBPFeyJJnPJnjKXGPXyPjW299qQe+zd0QXdUvcAQWWG0J0rXhw5IZkcfRDfrQKsX57yqimIsB7RrXMF1JizAN21JjW6VPbtU/3odVziRx9YjXflw2QU8MnaZDyadJGYy6VANs38vNPMlaRvHOyGLYj3WV7xblpMmUwa/VgGnghNntqZ hanieh@gorilla',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9cnoH1/4jRlBPYuAgwwtTcolbJuZ3j/sBYVczGOwMkYBGakMdAs44XTaESVyfhRldInM4O0jRgsPa297VbxSIjx/x96AoCxyS8Nz+zXFp2tPt/G0kXK8vS6Qr1fHsKUclrbg9QFbdd3woMvI6pORcjhhwIm0jV/gaYJKhmpa3Ys5KsCvZygoP0nmrtZvaRFYpbOpW8QvvQLXckxaG0S3bkQTxZOFSj0yE8kqaNBEkNRqdgabyW4MPc13l2lRCE83h84BGSicZbwqQTsGW8muAtiB3yLB7qCGiAc5OkjBJ0Ae2M+NXWMJM5lmmXKSWb2Y9Onsjd2wTJwEyy4rb5qFP victor@gorilla',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCvHgkltD0F29ZzmBqUuydSvuF4zFj1qcxP2y9lEmsR64Ml4IPVk6DfQ8VUQSSLRQmzopd7jcgJjS6g1OyWpBLUqlcNTRqj0LDF7Y5bExXj453tKJojpmK7M1+ybao17Fstpc9j4TNjqpePQEICf+DtcsDK2MarD8y7Gr7R1LatgqNeEN95LMibvO2EF66PxM6k4fv3Rjh3o+VUfuhLjYXwryqfdHurMNRbZ8OcJJfJuGyrL0hwhAkKS3NEe5nqPK5TzlToAiouusa4z8HVknBtp+p/mXPlr9/W76AN5wLUOMeTC1eVEVSzWcN3oNaATpx6ImZcrDdc1At9afae5L69 willem@gorilla',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCnIMVY5XXgMKXMTYoF7FWeOb0jxUxHRw79NmLCMCrX+B2leO5+cI0XV/3URRygW/WVveKPHyP8U3aOfSNQ2jhSZbCkFgSwZ84RrBdaJELpxxzGOb0B9g/OWAn6hKAwfKxI5jMjVOkxebvZKqoQ0USqJejLtPjyj+ziJHH5Q+xRHBQ1V25kcY8eYvk0fFOCetp/wZhDy8GulYnA+ClGD2Xc+WiqIeafDF/rwfTqom+4RqLWwRC3sGu+DU/05b5rLBslKbpecDIwOwjYY2gdG31PP7y2Yj6JZZOyu7jtisTCu9a944NtpWg66pgBLNb/EdQoL9HYYou+A4HIiPPaByV5 bjo@gorilla',
            ],
    }

##### END nlnetlabs #####

##### BEGIN entanet #####

    @add_user { 'entanet':
        email => 'noc@enta.net',
        company => 'Entanet',
        uid => 5159,
        groups => ['ring-users'],
    }
    @authorized_keys { 'entanet':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDVG4XGEGBv4rIzHx1YkBuIbw+Lj1pdIZWftespzbtPufU7r7RwuqJQ1JkjTxOaJ5D3AzD2xni9Zq5lZN0cNogc4kYgqs3D2vQ7ksQUQ5zZ55uzDbptV9lphTDlBulZhuDPXYJZS9i6xiHS+cjoZ9Pe1C+Y93rnLd8tJxhpS8enxQ+kdMiRPPkdcj3q7/Uf2EvfXS3MP3QyKCa9LcuL5bYJWd18Z018C3qHWfhR0GmFhVUblEoBGv3eKRbf8LgrlIl6R7Gw+OE2C5418pyoIP32li8iHqgevi8Vf86X+QvgGPydUXGV0yrf8lKSZnuEZHOSAzVAKNEREF9F+tcO2cl1 steve',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC61OihTzz/PVFzE1m3eu8eqQBwBH6rG8jYRUJRtb/lcxdC7dv8eLVusCgtDkEwTyFc3UjymTOnrsBfTxN7wDotiZtq44d1b7SPcW7b3ZGrosj0DHA8/OHf2l2GS3jYGd1nDB2dvn10Abkg6PgAnDERpNLMskao+Win7P7wR2zAXVQgESMN0lrFUiu67NmiQOV+ECUEfXD7IPgJZUWAs8PnZC2/KC6aziVp683lyEE+8m/dHm8E5v3nWfo8TqFZRuKyLXqCHpy7Uw+U73zcS+WTbZtXH56Kai1gj8VlfJ9w9nMxw7atP9lcX/cXqFBTIwxH3NNP+13wPlRpBCOPuAn1 jake',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCrYBd4UUfWqa8oa6OsnmXAnt53ACNijv7dDZCQFiNAsqeQQbw2bY+P3dWw7+EoJzrnLiXZeCyfez21leDZNvzXw1nFChZwT3zvE4lkqoW/NaktzdJAYKu7Br/hVqH6Lub7hfbtVU/BlUUKYV6PctHCljHupI4sekisAKJitSERuxD15U4r1QHl8Vkq9tkjrAdBqepWSEi47flVA/pnrFOdVEPqXOBQ7FzLFGeHMvr7ksVxPu1R/iziXBg82MO6hHd+cEGHCSRPMOfGCrxy2D4yXAp5khKQU7vFvAkYhonUToq+9N368zr3owF1lkAd2IKDKw0YUFBBrsRqT/GWhZ3V phil',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCbI7FJTVN85yS7TGrxr19Xr+6FFwREUHE1sZMspytWDyRYAohIbChEtaWkpRHmjqbanVeEZG6bqRCnAOO8Wqt0rBBlHDBkRmZpoHPi00ST2d0yElm4E0N6n+p6HuICnGBBZnp6zyG4qETpAQJ+AyrsUFfGjlKDlgGkUj5pD6tQ0aFyx+Kj1FvrUiFwgoANnJwFRCzd1t3joWfiZScZtcDl7ZQyT6v2bP+0poQDOi77oLk5Z/bmFB5ffMs+F2L1vH7FkTGATaH5ADu/sLH1PO/+TEFNFrwzmDFaCPLKjSmVsokX3h4Jt6KxiAo6TX+fpHJASPedLpD4//XcMGBcD449 ming',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDVYIFie2yOfi2qpwJ0vE9ih6iJkaYeVzQ3bMk0tNpjnabiSC76PUxSLVk+TSUdOccn5zBZkT+8QPqPQqhmGgsg5OMVstZhu8ZTGsCFx4cTXZ6WyADexRyHSmNDdvaWGHB1v2w/U50KShIxPfU7uG/6O3V7z+R965HAAeOnXMjQkd6sJlmoHsVQQd8YssFb67Q1yGFUmeks7/+L/O4HvzZNIUJmbras8mPcwHJok5u81UuhtOkNH0BOyrDD49CNUwKlf5KerBHZeBW9bfhAb+h2QQJYgQdZG/AQLO5MrkGEZXfVv3tXIUqqb8/p1awvYxURULZ3M4Suoc1N4HloEOXN dave',
            ],
    }

##### END entanet #####

##### BEGIN ripe #####

    @add_user { 'ripe':
        email => 'netops@ripe.net',
        company => 'RIPE NCC',
        uid => 5160,
        groups => ['ring-users'],
    }
    @authorized_keys { 'ripe':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAu85Jo/Bxv38OffE+0bVK/GXlxGxyrhieQfNRDwN590bqVc/yyuvsb7TxBMkl5IkoqszcM+SISxweM7iq5K5lcEwWmlB27Tzam3I/OdzejUSbNvqpCtQEQXoice7o+FoTf9jnONyQCSd7iRBagEGePjvi3eXIfxw95+dtG1494U0= mschepers@office',
                'ssh-dss AAAAB3NzaC1kc3MAAACBAN3VwbbERRTpRIg0J61InJhMrh3FZCfM85Y/YGosFvJF/UpMNYZq6ravVDlqVjQQJELQ5yHBEj8mzvxthl88c9OIt/4PX7RUUQc++FPBWjvZxDCvaCKLtrDo1DbrkxhgeU4AU2AHx3zQRlGpIfLSiZCmNLo7iXv3jhDszqRo5/HxAAAAFQCEq6EARESfEwJImCRotMaqXvwhPQAAAIAwERtM5FTIbd9KcoJkM2hkp/YlS+hyrlDmQJLq29T92Mmk+Kuju5V3F4vIdD7iZ8Se8TpKNr8/D/xtudcMD3Pf08XxEHOHAdc5udPsvpEVwWsBJWMXm16lY7GPtjtoRn7+v0UALSFtbxUoNoomcg46HdxpPE7zQngc/o6W5Nlk8wAAAIBsgFMUSA/T8ADSmDmNe2PRb42ioTKZYlBhvA17qJmCsRYaSlI6HZHI/7IdpPlkvJFQOBATSdIFLO8qkHXXTsY4l7wBZDPiWas8DCqvNgf/4gx+iUvGoAlg4WXDlmgNI9pjuwdA+P72l+//pzPTfg3tu0ln4v8TDfMOwSvya9kiTQ== emile@a.local',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2ux1R+ilDEkRfFnucoF2UYFFUr2fNRZGZucRHK+4KbDwxQZ1gXqlIqQntxNPVuT0p6s44Qd5fs0XP7ILCD6rtmdNyRSuvpDJfg53H3sPTxr693CThzDxI/VY1beHdtP3zfVy7gUHxjK5BKsoNsxjkAlDs1V52R6v1FJr7uvxpJihDigrm4YoFt4rEsFUdD0JJGaQ3h3UtIId8TpcSSTwx06+dN2tcuUU3ooJ5DR6iiXaWqupA5CQ2cCn3z4sMGbDmpglrKLDBG7JW09L+rZoOfEvhYHW1gg52hAVltUQxMsOYu4vUo1xyywdXhDnsRa0HKJbl/F5Vg1uzK7523tCp john@guest10.guestnet.ripe.net',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQClUOyxII/4ihZ3hE2ktTLrsFtkvPrPuypnIB8ADwpCP5jKEF05YzmW5UoRLTQzMpXvzx3pTByWHZQBat7wNrDcAym5Esd9o6OvXxYIVcp1XmjmxEuwf3RYnHUkv2yG3ezztnzAHI4yTOgxCnVyheb7yAls3Nfu4rz3uqfbxQuHpvOTmQybjuXun3qeHdjj0U1ROtA0HyhqcLbGWaXM1onY7k8EUw5ifehlJRDXy+TPrB7F8aWDGgSqKm0hI/1Czq+LImRn5qyo2l9QXQGeyRt03eHDVapBJvYP9/06yS85cwX7FI3IY5qHuOrILUbBQ0pVeJfH0ybHVxN+5NRgeLwfTncsCMntoInEm1fNpDjwjXS03CLdlyJUTFwk+yRk/vJNX48VHHs3UZaKTVf2KBmSadiuUqEvWn4DtEYmRU+HvKktsqhnjiekWs9DJE9P047LZJ8H5rn+2CwKQdzP1HgO0RTO2ovPUgYl/FBx1xiXmSVj9LwcBnF2u9f4xNkyAQ+U89acpkQprIpY26JbQLaaE3qxlmGUlIYOFH+I60+8sxKO9tbLT/t7fDZ5FmPle/vMQ5po7sRFg4l+K+9eZHDHM+n8TJ3HVJWb8AuEfQtcuxuy0FmKX408y9IKw2meEoBVVdV4LCNfCjprJxmNpyob/xUnFXSY31cBOePWeq8kdw== "Anand Buddhdev"',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAxr1n1un8agM+7OpaFgOhUkrC9qsNpcE9keFRIez8mTcSz3Wpr+SBqqsbfeuHSl1EzHpG/7Q/tMz7JHrWwZ3KVqN42yMJ3jrdtr4AR19cyhgKiZuTxwe+rH5XF7m75p/BMNfA6ZvIWp7+Ajz5DNGIqXwman+FpQ9b+/eIJqLHej8= dbayer@tiger.ripe.net',
                'ssh-dss AAAAB3NzaC1kc3MAAACBAItY4qMB0ycoaWOA9fDcCKqGFgwsRdSN5nkvGXI8MygpRhjpTa3PqqyGwRQQLyOiIpNsx1i+uKwW1pIVMk+JeViOdU/3OyBoBau5FbJvsme0WUJ4/IKl+mtyi0dR0EvjAaGQIKL2SQZHCAO7alMh1XrtiMGevnhHApTxSXv10aNtAAAAFQCgJcoKfV2Zyg9dbxHhlrBYC2qfjwAAAIAc4w8KeUC5Mnj/gcjWRpQZYBRuZPSMxS7PihzcTK52O/mrPxneMMb0JJbBpFX1JMpYWB4jhofQTf0T07WjKNNbUWJ9EuYU+Daom1JtjlBiC6KTuzZ/h/kOYD5Ou7nrem6TOzEz4qQd5QpRQxvibDylinE65aJ6//XlAI6NGUTyxAAAAIBCICqU5l9BR2XcgWm1wuaXy1Qrj280lWUKOcoWZ3NCPqp2Bh1uMch5PtM2TaPrbzVQ4pEFbGsTjVATn/1BCrCjjNZ1uDFObLeilojXNiCLaSifTdNe/Oe0hrFGGCcDRBMpszpUD1vxP3qSUVgsSBv5JUrQOBv3v/OuOpqPSQ/AwQ== smcavoy@guest10.guestnet.ripe.net',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAwGick//KmUU6irvk/dTEufmpx3xXZZuUFtMWZ1vtVueQnyOhipAbhCTIuABkCs9MLLMwAdUJNkdOZgEUmONr4ujsC4NfgljjbC5wMkzGJt3f068cVK08k1MH3+t5ExSTfI4ND2v/t0WHXIc17elanpGiKMuvuKkICHDipgSeO2s= phomburg@dog',
            ],
    }

##### END ripe #####

##### BEGIN hosteurope #####

    @add_user { 'hosteurope':
        email => 'noc@hosteurope.de',
        company => 'Host Europe GmbH',
        uid => 5161,
        groups => ['ring-users'],
    }
    @authorized_keys { 'hosteurope':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAA23WgZiLlulZWdWrkCtPKDszB+6jv1dhL1MwEL/+KgCSJrI8bxQw+iKnFbRzNXAQ9yhXK5WpDSiIu9ctm+gwJjmYppJsYu+Oe5TF2szCK5IanRHCY1ZSxwC5Tc7NWVQiFzU9jqcYzaYsA3IqLQzjInQ/kij1iwkuP5HK3CywotWR4KblxXKDNvg2ShJTn9tJtMUBslMRAiaEtE1ZbARlNVpSnMQFmnGrVAcfAkA8SiUgtmH7CpBjFZ6YgfWSx648AD5Sqsppl/Ot6/GoUusUBaMz6RkOVl+/LLOtBqtanQHNhLLOuSVBJsDvL47i9MCeOhQwNNO+INfMZtxjipUr98v4AYh5GorU88hmDESZtmgDAHanRJk01eFpzmX2e6KCMQAgaUPutq9R1Y2dw7w/mX2LF35HSV9Vl6TuCsN/6gwfgupdJPqX3cXuM2ERF+PMg/U+15y+jLW9W9JIG4HCpE4M3TVYTlUH5HGJefGPq1LVNLHWEx0GjMDtYUH3VTSQ86iPEGEeTmE6zTZfWD69xTepvv9dyPkzp0bkLwidOFpE7bZz5Sl1CHUinhWMLvqaIa/zVH1RALuWKhsO7n9lFRorEiY6vxHBwF3WDA7+ku9DcLGfnyTcQUGdmdUcNOf923CcFQg1z9reMeC3j+lN+YJdF1gDCO2nZzzMyM0nNet "jg@hosteurope.de nlnog ring"',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCy8cpvoi51IcT/eyB5Db1PiE/gZaWEx/lCsp1Mf76ZLcpyOo1imY9Jb8izaGXLGxQU553MpxGDE3a33ZaV8qE266wMs+3pKN2a6o9YPMgINOA6pdEaPMjWOXb3harvq3VXSWDqEg862ynK6EEYGZHB3euO0BI9V3E7VqoYwiH2UDHVpLjgBGU0KDbdOgfbPWPXvYxa44YWZL4qI0Itp8TWu0bodcagPv2Skp6aydIq4yY/M6/6oKeS4Kketsdxj3CX51hzlt8TNQKqoTKJ/pSXCR0mWAcee4MlfRjsElKT+USET/7maApMPq74cNtEEVkGOFsjyn7lx1/YvvZwji0v "to@hosteurope.de nlnog ring"',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAgBZt66sSFH1mtE13jrmMOg1rq2Y2ZjYN0nAtQcNPexN7WWCnXb2q/RO09MLCrycM/T37czglYXp1pgeTK6OBOdMbpBBA+ZMyRzfpldaT7+y508nBL7KFBvCUxHYMpZ5L41yU5nluVaU+sg1SFrqp0aN3mg1t/MP/x8PVvHJXV3BMQhBqh4h9D290yiGim1y2O3wynNT+Cqw9TClUEMdAPwOTUh8DUOFD/8iF25SJl5r6TQv4FtW87MV/KR6Rni11jvHvshhzFHAx7s5oUt4isqpgSFX/2OLVzbZd83usJVaIq757Ey+mbHWODzTJwmMFGUBBpxYp6TAGYfIPPPJCKc8ia3cM5Z00SKBE8R0uIW5JsDvfjgAdxI8W9nLYf0Qd1x8YqmZgjN7Q+7AYbLReCe/eoRDiK9gEykrRMImnTXI3uIsnzie6NFUK1pvgKtixFJECSyIFMqEy9B1/zQDUgAwp8NP7F0pIjqfGzdVxETJX8LzcNzz51ODTEdD9PSCcv8t8VEzUj689a2i2Ud7bbqDcEUwwQmYT4GLvTGMUxXdYe5tNnJg4sQL41khpbGHXWVRjYk2ljFIBIjBvAFBbW+xE8iCdB64nzALCLVaLVf0XyIa3sekg5oEHpvVoTmFm1oeasGsFjcRM+0iZsq7RvYU7G524JLbF3zG5VBL9Ci+Bw== th@hosteurope.de',
            ],
    }

##### END hosteurope #####

##### BEGIN wirehive #####

    @add_user { 'wirehive':
        email => 'support@wirehive.net',
        company => 'Wirehive Ltd',
        uid => 5162,
        groups => ['ring-users'],
    }
    @authorized_keys { 'wirehive':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEArXaaM5wglsopsMgnmeSBPIryw+3F4CbqPtPbDANF1VxR4BN9QV0KCCtXXtXe8Yy4IlBA7y8+H298Rv+WDPaJzs2XPjHfoo4PhL4pQQFqxbZWKb+Km3KEHX6ooD3P8Ezq9mGygP3Xifwkp+0LEy0CFjb/uPZXjhDS8Tc7UWNKeT0= simon-green-rsa-key-20120214',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA3gjLUQPwPRevgCtNArhH3yrCkGfgoVO/TQ17thGmf5n/McIF+hIu1bJMOYASnVwZBz6E1n1qCzD8T/p7KB7MBXA59ifLBUpsRwJY+tMI4ZscmIH8QTLAm7kKDBPLu/8uEmh41lVAbr1sS+27kUsqkNmTQB/uUHuhUzoq0+9np6moJlV7bLvWMfpUzQywdL/IWnlsUDPdB9sTclg9B2QDG12EFValYZzXgS7PX/F25Ou4o25I2NMTLkSM4mCvESospPmIoC1T6XhpuQ+b/ZMXHtvRM+/elEvjPQNGoVh6HmLeqVlnDKfPiGKh9DJhs8FnW2zLiuhY36GqBROOGPg+tQ== wh-JonTotham-RSA-201212',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDcQ4kmefHE0QLlp8s/GYVvKJMhVhhUPkkrn7ivtK9v/9LtHNWwCT7RbEUZpsz5dCJMv2aqDwH5LlYHiXaiqm7sS/6WPkcQ3vn5FX/Oxd1bFWuR4EslIBJ4vgQO9AXxejqHLEjsxKLsPPAXeVi85cjBS5cQwEaxAHrl9h9upuZ2yoHAzCKReZ1hpKKjquF343EZjjkzT25pLv8829QYevEMx4HiVpLwn4+iQnUfxKVQts9WB51g8f+Uiw71phu6t17/E13YjXtBHbC5l/kUWepK0inJK/grVD36nb1fWMXPfT1BYQw0RBnPFO7NyiSpuSqzHApW26vo7Y73YvhrUEPx wh-TimFreeborn-RSA-201211',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEA294E0mpn1QQ4UL+v05HUbN+xhm+Q827vaJ2wMo9rRJSpQiEbmJt0jGe2Vmz2NF/mo2SPu5XfiuDmjLNjLvN43DpbIJIFDSW1EgS9nP5s/cyz5SSk0wvd2eNCI+0Q/T2Yva9Sr0gLKD6uW8eTdBd8iI6GIMa9gu1EL2/62E7XS58= maxfrimond-rsa-key-20121220',
                'ssh-dss AAAAB3NzaC1kc3MAAACBAKLFkcRQdvJ1ZeorRNQ95rG68DHRfAdHZacpqbCZuRbfCPPuosN1J+RKje6MVsZHPyqYwMBLZYMW+YTVmR9Ld0Py7zj19eocypi07YbOZJPKUiAk/2o+unqtlW4VaRZXQ6L0+65nlY2QjlknM/1APoR358a/ymZWf8LdCQAbQOqfAAAAFQDeb0V0t14MZ3QYdWkYxofhFjg0hQAAAIALEBjWjLnGE4EXhx9TzFq1rSwQGPd5M2HcaHtHN1SDXAj6BaUhaModnH1X66hq6OYGdfmf7nfEx9RlGvi0mCFTNI0LbqrqU5hnWDXBvlSFhYBX/j0SM6r5v406EqepoUxY7BHcLcDPZ7BZgbDalreXU8XBJYrzQ/1q2kUQmFtJOAAAAIBVLRztj2xcJHmQxE84oob6No7JpmQdLHyDtK6b0fbPQY6wxxT4/6xpFT8CEn1pn8pC1dOteN3GbOu/w/eajm8CtpY4O4RFtnE6T9ss5eMlntbP4VmqAbKnDIAnohKbVTmx/wU3PikoSyFwfOU88OECYiNKl/cKuJZsHKItbzNoLA== nagios@monitoring',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAh2PVm69m2yv0Q2XQhT1NClTuZUubE+LhSifLSZzArhrpprp5xYdfXtv3HB5Tw5upY5nJGbixwW+qmrqV/RDDxA4KmWhmDrvC074z0GLfegS0pf9Iuxiy3LGm3DZI8WiRAf2XMtk4XtQQLlJdQbq/eragcck8zRj8hktxaeYmp88= "James Rossell - Wirehive SSH Key"',
            ],
    }

##### END wirehive #####

##### BEGIN superonline #####

    @add_user { 'superonline':
        email => 'TEAM-IPMPLS@superonline.net',
        company => 'Turkcell Superonline',
        uid => 5163,
        groups => ['ring-users'],
    }
    @authorized_keys { 'superonline':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIB0oX/hqFiSBj3gwktZfQXxq2qL532//HCnRqos0Rx50BO6jalsvda8aRaZzX7uyo+/yWXHAANsPCPaQksTrVfuyHxnODUq3t4WkXRKGqEM0JYswcY+8HqCM7QRwVdOeLuwERc2EEx+fMlQDP9QnSD78U6ofYdgao3WWjdSCAFqyw==',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAzfD1juT1D2oXVBX9h5LgKxnV90RSqa01K9BCpd8VIfVYE4laq/8O1r+N7gkHhQGUPM77swheML2KtqU9/dMJufYB7+x1DVU2V75TkcznXscr32zueUdRBfR18H5q8pgtTtOZlkdXtgd5ryEB+DUByFBwdEUCqAZwnQIX39BQEn8=',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAmecCstl9isOjMKv9rrIrrjDsMDfSLuX8RMz7sAe+8/PGvTh+0CD0IxMKytwDzLVH4/J2qu5sykiTDwD/n5BvOAHt1XqO0mJuV+ruk1hAXha07qF645M18H7ChkNloQDytvZioSdI91gFHzU7kIhvvDb/L800TZg4hXl8v88HymE= KTD_KEY',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIB9L4aSJYpRpvxCshxrxT78IWWXpa0fdv+LxAU38T9jThQP8iheKO7Uybe2BlIGd8Ty7YW/Wt4gnl7z1aFWqjLgSbJ9K+V6GbcsjuqxcH6ZiM6eWnFtHl0gou0ucpCKs/0Ld6HjtBcUztT0olCpwrob84udrC0olvsd5N0nhz1tGw== VOG_KEY',
            ],
    }

##### END superonline #####

##### BEGIN nforce #####

    @add_user { 'nforce':
        email => 'noc@nforce.com',
        company => 'NFOrce Entertainment B.V.',
        uid => 5164,
        groups => ['ring-users'],
    }
    @authorized_keys { 'nforce':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAgxNIz/KbwCElWeO2UKLzb/Mj4LBcNDTg1d+pKhzFDH2XFkkbNaQVN3ManAECGqvNjOGJlogEbFKEQ7nLjL2ULDG2rpXv0lwO6t6HmmmwcHXNh4xjr8TqiwclMuDopigXxroLUVOgPVWOxolTdLmyudj+8lbVixO0l8gjAQeEZydsckO9pYRLqpl17bcOYJB5TUynFnyNBjmKNFkvArDXWKftmPa4wyGVlOkI/Wkvga/vbgwxfoDX2CdDtZZqicuVQZd4rwYYHDKMs4ivcDyzDLPTwKBDFb8CyOqlX2UuMWMngyXgJBQ2HPI/w38VNkgDSpTyCfPJDlU9RxMCBbcY0w== y.koolen@nforce.com',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEt7exBf21sJ9mvstoHz98SMj18IVE3is4Pb00cAbyOaJuM5OLAqCrOsOVXccwggRgML+2jB5q+W3UIIyfZtayvqZ9JIah0KmQGIJ04Agu3ykoNwq3+4RsFA+Vt8ytnvYgtuKBSbG5LI0bLcKF19Fj+Dv9rtSemLsjE/HIscVEzqpFR13+lsvN5V1x3XQkdLXyOrwpt7imSXNIa+bpmXS5cmAOiblOEzBdMS5NVNncppwNeFJtuYVt64XPseOF5cTNC/z7YIrOefC8vOx3uYygVdsds6iN4AE9DSNaUdST9nJReBrls7UMnFGnc1+CiCaceXLWQJ+3cnNA+pMF9yL7 p.taks@nforce.com',
            ],
    }

##### END nforce #####

##### BEGIN xing #####

    @add_user { 'xing':
        email => 'xing-nog@lists.xing.com',
        company => 'XING AG',
        uid => 5165,
        groups => ['ring-users'],
    }
    @authorized_keys { 'xing':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAxCcE9GSYgp+apklOLSTtlYjp81Zy2h7qcvavdqhS8DQ2GbgxD5WG/Ig6aNCd0aRoB/w2Lg9apTCCMf5i+3JUTFJW1EtalK0NKwMTzJapPohZmFu//PEMM3H0hNVj/vDMrrPNc3FYsstjecvDz/pfZu1rli4uUxqfFFkVWWxSM5o3b+4z0tXcsWQIn0lbSgqtZ7j2szJnCUAnB2bfplZNtKOdqtGKW73RCZgl9p//1UTNymOAnK4JYp3Cjf2EB707o3Oew3iRA/L33owR6Abgv33oAoGq8fZvB0IzCzY4HYLfegATQmGfvgS+M4aHZbIzE9DPtS3UA3S6Z3tybvbSmw== cneukirch@xing.com',
                'ssh-dss AAAAB3NzaC1kc3MAAAEAbEbHWL7yhCff0UwAYo3r+dO/+LeEXn/wmji77RRW2ImTfdbsBpdVWUiYF8cJd24oFzKZcPUvaNvnSk0KKF9hi5JFMbMDstEFmeZlLv9nxe+H4Qj2lvOMZN+iultNIm/qmzR9dpTXvDIlOpvZ32kDc2v1DM9wNrkm0VWCySOUfuS6PyYBrobnT6MBsZ2lJ6vOWFSJMrd82BOewtzyEMa7dDgMAuVIgL+bh00xiD1s4+U0epD1uEkA94jviPYFm/9eyGYV3meoLmT4wOxSwYvO32d7qrSE4ZtRj1yljTFCR4Xp3tMhp/T/1SWkMe9ZDYZWKwytd8ecVxVGO/Vz4CD6zwAAABUApCX/1iQTwzOGTpqXNo46ccxLO5cAAAEAASdgxiVV7HrlX6XM5u4fdK6CB5ZaGS7yGcS4/1BDZP+mH4Qn6zhwR5L81SkBvaiO5qbYNwS2XgaCu0DXiZn7GtYqnxore2UOqO8AuhMBBotKRjoeiIz1y9O8wVE94panQpGxN2SbAZaPFqHLJcdrrtsaCzg8V8Uoc4AC3gSubodsLrW8BeysUGVYUMfOgcqKkqbT9dbT/nRICLj38i6V3/BUP5STxzqASevQFLrqMH0YIkslzkQVhcGRdwzVLgmNJS4MfvUbxuOouAif2I+oLsX07lX0xFDB4JZ+R7f9EIznv1+0FwVxojhVwbnA4sX+oaqAQBp739Ge6ANBjHy4PQAAAQA9UI02YBD8eNza5cTlqBeIsgKpDhzIj9aBm+dwwxadWf3icn7Oh1DkARE+7gIiO9IyOFgB3N7roaUGN4xWLdnfbot9uxHc3v79LPs2dKshJf/3AoiBd+xUXa54xV9jZQW+vGXz/6oRM9RUuQmofHeQHLZoSW/EcVyDdcuyyIIipuTqgzF+XwUOW3CyHNg0I2YnraouH7B6oumNjUaT5aNvMTuy2xC/NCP8djaxh159LG1s2UsFNUL+YzQRRx4C/LdvPak9Lue0IksGg9z6ejRrbIosNMzQG6t3V505IjJpz2NonQJmxZp2P9sgiNjZ8kvew7vpZQ1DOdjGRWm5Sh7A dneubacher@xing.com',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEA0kxJ1mDVB5Ef+kIHu5N9pas0G8ZTGDYT0qczq1hMePQXpXPkvhzBQ5uJmuRK1GOwqfEnL5NE3cAipYtntd9BoomFuWogvnvj3tPXizfZV5xGH2qCV5uJd38D511Jk72eIxHUoHz81PYPXkFo2gNdhS7z0QBJaF26ILgAL3nZ0sk= julferts@xing.com',
                'ssh-dss AAAAB3NzaC1kc3MAAACBAKeUslA7eBPdmWzqvRD5yycCs0jbCIEjv2Q9fk9A3U4M/aS5bbvTAcqlcAGfSiWXTmp0om61PnW3aGk4dJvsHOLLwTGERwoEUcUAaRXjghl9GLxH444saEDx43YUTOB5gGV26dKccQKnhk1XJTAz9blcD9boIDunCBfJ0o6Uyyg9AAAAFQCzTU+pOZ2WNA3ZILw++M/5vCYN7QAAAIEAmmirA3gugAw9NQk5lHZaB4NEehrvTt1pyExyncZjYGYTRHcREx8s8YMdGj5G2x94j11byfhHgGXRFTsoNtcPRIeTpiiA806ssHKDtET1czGMskpDFD8FEjplVixEWO6NX76vaZkbqYBaxzxVjaKGOSTCAD89P35YEdqrFl0UPkgAAACAZ4IkI0Q7HnVMww9ZXBCETdlmh+N38jMEGB469GiCM07W7yxxOygxtysGpFK3RgZsfye8PO3m38WkeGdut3Ei49adZHv8YuIhZhEiyVR2DWIhcfR4Zp9ixPa3hNFCrL2Q1fZJp5zaDKv5sZ+p4Rxe3GjEmrYeiu3p0WviYpKZX8o= fstern@xing.com',
            ],
    }

##### END xing #####

##### BEGIN serverchoice #####

    @add_user { 'serverchoice':
        email => 'noc@serverchoice.com',
        company => 'ServerChoice Ltd',
        uid => 5166,
        groups => ['ring-users'],
    }
    @authorized_keys { 'serverchoice':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/owNfBcrydliU5hBy9onIBSOCqN+6VeQuEJghHylRuEDjwTjMaWwYDpFbyk2DgOpyrZKRjvpiY74jE3v3gSTjDaygy/j5Ex5rrk8A++0xASn+lsRNoIevdyNodjJ42T6k/FE+BZLc3C90va21mVC0jGyCe5LykopzCXTsuA5TB4Z2Mwke0m2OYRaYaarL47qiR0kb2U1AqV9d3tyNoxTRJLnFHvzcr57Qu8QAL2RaycDCr1jQyB/Rrtz86EtrtEA1ghgQYpf1TpuqcL+DGO+ZAg1KmIUmiV6bBcHZAQQv39cIPHrwTfAMyuqmd98B3wyyL0ecl1J7P4BLH3zHTlxb henry@maitai',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAZe7c1hOXket+PL78ResUe5iRU5iexuZD1gwQTYB5vWd98wxG7AicVFOTUjoIsDJKwYNTeZDaV7JbiIMheqTHSogQTxUr20OpYt0kaMBphEP6c9yen4GnlbE/lCrbsfMlT7ewGmYQfMakXxwMIFCKk6uaE6eq//KK+GvoNzMXSZ4BYCqpMLzMJkboLUmfrfWSSxAhSE5vHHCiBZVOG5I73yW+4Ip+DneQO1BuInpJMB+AL2j/bsIWKD+V7Gy/FQBtR8YUO+o+Vg330st6uFOe8jsSyHgKFGgspY29qq2/9KQLOq7DJ3BzCIHZyrMxSgo5m7dT56OsR3hv2riRHALX henry@superted.local',
                'ssh-dss AAAAB3NzaC1kc3MAAACBAP+axVXzKjtIb8yv3uY0dVlwcRg261C6aEJtQ3UJtHmIOS4Xcai7/Nub/F1OkJ9h+RmhkRQ1iA7JcnT8pbnvL+gizsi48tYQnJ5IXWmqe+YIGUN41/WUtrw1P3MWbR17wBSNfK0TOeNBijuO2Mf77V3l1SRBh/XH5RuxSu0wkjb/AAAAFQCW4nwYWqggdlG/7Ib1mgAyn/RYxwAAAIEA14TJrHxwsm3w7eZWoXygP0+C0DSvDYMyFStFdT/q4+lWfsCJgDv+/oT2gU/xLBim+1eFbp0P1mVCVOq3ux5sCjTyrGK8NwjE/3ksfptZYaF2n0rp0ibheXvB2LOPkv6u3L8oR7Fomb08ECFlqXtW2qu9pZbUQISG1CQAhQ76hnEAAACABbMBnZLCTvKKaJ9h+YRBnw/zoHth3HyEd9rjhSuyJAyHrzIsUoZ+RPLyUs+oeILQQKDM++CtcuqicYJQk8l3epwRA3U0gPHgppANEXvOeVMbbFUgsx4D5eycXGWWArcsB26Um65a9JhsvkusJbrWzzy0x7wOWZ2V2D5+8T+pozg= robert@robert-desktop',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEA4XabQ2FhDhuc5+LGmHIfHL4mOkM2Mp9RQVVQauEChDu9MMWvCbhilEvlmSUgldYliHiiA5/IlTHAX20wmSKd4URsuryNrlbedMcAmQeHWk4Um9nBPqFv4PFaZX/fWONXZcuwTKwVPrhy69mpEMPyJgSkmp539g5BqYGsFIZGA0s= rc@kitten',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAutVSlChOGXmeCEUrDWui3hT0ODLtkS7BZ/GDRS3bpyTUVqRdJNhr8iuQ3UfKPXMwsH9wTvX8YlQQ/IrP+zW9qPqqwOpKa5Yg/+H1CbS2hxou26CtfZpZAtnsP0v1m0FQINYq2Ubwnim+wnf1FjKrE+W1n/HPimLCknoPFhUVJ/6xbD28ydeyATbeqcieeQGTIFtd/cIhQSrBF3hc9TjjAEOJHVaE8ckFOKAZBhvIdb6lrGRP4d+sqo1JzhtykXKKar0V6KiKH2Aot/bNzNuHhtq7yLTFxbBExcLYklyGD0CqBDTW3fdrA7k6846lzLp+4qasFbzKPlNvCjNHqhc+tw== rc@operations.ai270.net',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyMtPIv3r55XozKPSVTxL/nEQb0LuvjFydqITkPjMLHyDOBiC+PtjAlcHGhgRDWP9XXRu9pXPFAkhRgNDbJdSK864CnnxixFEHh+JUNObJFoUYIwi46OFjvjWqGdbLCMG1Im0yH/Ya34xb4HzpBtcmV3u/dk137h64qX/6K4ONR72SxytneSeHiT8Hl4VEr52W6XwhtzgSbBQXcGPPDoF6sGyANzGDA12iJapMSfUhjsIChEitRMRgsXEYl/NCxPFlF+t7wZiAFZY8vS4FVE1MqsjRSYPkWrXLBxrNKK7lhVLs0HtkivrST+gRwWV/mUtFxbLs7otkdj+buzJBvuGD rsmith@netsumo',
            ],
    }

##### END serverchoice #####

##### BEGIN bredband2 #####

    @add_user { 'bredband2':
        email => 'noc@bredband2.se',
        company => 'Bredband2 AB',
        uid => 5167,
        groups => ['ring-users'],
    }
    @authorized_keys { 'bredband2':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC0r17gch41t9KokSoyG4eFP4Ce9VOAfKLfFbxQcfQC/vU3PFOBFCTZe04GK00w9JnearSHuK4LzaZw92/cHlKEzHuFnAr3lXt23OppYzmFdBRMythyAkcCOY6fXbylcRs+Ked4AlJ+Y4AjKXaW0NA65sEwtBt/bhyni6lM1lFhvZnQBsczTYpzqavbVkfvnQwjcN44VPDRhpSl2YFtLPD1EU59WFkNgxQAS9tvFGgphYyAfrxMcj7Ta7jL/Lpo1+5dwXgKeYmeDyr0oT11eT7GExyMux8r3IonVXR0T/qgfx29EQXvF62HKEslUvoSK6grm4vMAVFoz+6jcRwGX9Qx petper@netmanager',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA5O3wUTz8xQhZt7VwRTu8B7oWKE/cx8jM3CL4lw+/W0BAkeDvgYd83BO3TxraMvcle2Cu/lEHu7tUsG/L7mwn1iUun1QA53LvAc22DThSSwj9I11OWrQOHwVM7xqWpAbf5jSrKvxPe2sj+kHZkdym+cV28/ljFPm2vuv+Ru9NShyi7HrdxIu9OCoqAB2xlEeepIhUK5WemfO4i4wlT2KgcHpnp+n21Ew/OG5ee1P21+AaTRRaGo6wKyMC5uCnYBFn2up8HvDSBIlhMjc/1+s3Jzrzi3hG4JvpO2QcRoo0mAY2SMlXoQH0sV+Mm/JmQOUqOCeEfshOzPrtMBxz4+tF9w== frevoc@netmanager',
            ],
    }

##### END bredband2 #####

##### BEGIN cdw #####

    @add_user { 'cdw':
        email => 'manshelp@cdw.com',
        company => 'CDW',
        uid => 5168,
        groups => ['ring-users'],
    }
    @authorized_keys { 'cdw':
        sshkeys => [
                'ssh-dss AAAAB3NzaC1kc3MAAAEBAOtL+lcUr0Ikbc4rcmCKC/zF7K0t+b1rqZ15y4bLXgGisy0i3SBwkt+iJg73AdVtTXIScrK01KrFAIM7fCp3VYi6C45Fe6moz4ZU981FHOVpn3aIpulOOgvy1uG59bwdOTwGKiWYh8i9PXXSaY3sJ4qX2yKAtWE8wNl2opRb0igoXzNihHve0IxKXcBCE1ogy22u/4IpIGgoCehMjbMjWCZtOwvzjwzpVqSjrXEouQtCF6ESIDHvF35OTa17dlFEKQ43eiA4HTXgTktWV+enDmu3mj5Tj7lGwDF8QSFO8DT9V8B9ktPRma8eFo24KtKVbi0SFdubmJxoy0HI366zxvEAAAAVAKIDlEQ0T6JJ9LU75Abl1YZOfd+NAAABAQCNhTh0ZrkTwvvTJ5sXBkUlHi5KCEPOdcd0R2osy6bwKxmuulk5hxorkkQba/so8Z2Sbcg0Dzgej+4ZAkDYameLhDik7aL5MFN8ao79WnZWhubXi7hFVOQjfAwCIDaSvEliFAKNf+rkkjvIKPnvq6gculhC/Jo3xq+XQU88ZuQ/mdH5Qkzx9TbJg7VUkcBasv7uiYqp9y9rXjUTi5xbyCI4CP2hBoCnO0E3RTWUVZpUCkquNWpbeOpaCyaSS0HCxvG37v53JtK2VM52qD5CBevtD1NdCp0xCTYab6wX4vMjkx7H0ojNK/G86tHKjjm8NfatIWSj38jQtgipyizE78RdAAABAQCttqM0i3EQItqesBlMxzXWBlJzKZ1xM/MFzkAegBWRsLB0Q429BGeJvkCt/EDjS5vO5IrHHi4xnCG8/pMzC5JRHBEHeaDMW6APp2X6zTy1Ixkl3eSesGfsTULJ3APamSbsFCRdpZR5M1DWjxeq7+2p6RQ8gYoZR/CbOOLtQmjkj0ZdOMXNLGFKv+3NiCtxiXAEz9AwEluRnFIyYTh7xLLR8pd1L078F1ROmA+Un0j/zTBD/C6bIBehdCBhgmiiCmhkoeGKCxpeEbU/8WBvD3bhrHsHokSFA9q9s7mO1IRHbTk192UHWnbwaw80XvIpxuR4DjH7a1hvHJjQTRLm15UH nlnog-ringroot@cdw-msn01',
            ],
    }

##### END cdw #####

##### BEGIN linxtelecom #####

    @add_user { 'linxtelecom':
        email => 'noc@linxtelecom.com',
        company => 'Linxtelecom',
        uid => 5169,
        groups => ['ring-users'],
    }
    @authorized_keys { 'linxtelecom':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD8ovJ9bQLXHMzq8HGK2Ez/MlJiYxLGdD2IFih/xHxIkWdl3fs4XAuki7z4+NhC8hiZ43ApRqYZzTR26bMKkAPQMiL97VSPM5GGM9cPFp6yGfEMAamQ2zyqSnj/ems4X0hDBCfetTrkMTWkGwN7FgIvbyaAoQQPuoRmP4kMZUsRYSEDAVd4C9zxAYFKPOUM3c/+lixARdbK3IvBxXDhrAFZG55PZnXrnqqg3/LUlloeqOfhHEEe4kiMnTE9kIhg+f3DKa1nyf2bmg8xW24VobimU8EIsYiaXMpzrZu+HukyiRC+RWBizn2mwFUXZ37xeR+ukgvJ4PPXS1PYSwnXq7P/ "Daniel Verlouw <daniel.verlouw@linxtelecom.com>"',
            ],
    }

##### END linxtelecom #####

##### BEGIN underworld #####
    
    @add_user { 'underworld':
        email => 'noc@underworld.no',
        company => 'Underworld',
        uid => 5170,
        groups => ['ring-users'],
    }
    @authorized_keys { 'underworld':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC9RNVl1p8lctr1t+3Hcj8sfOCM2NheGs+H2UOfRzLJRMbEgWTkf073++Z6BPjl32v38kNYJaOh9WCHkXwWiCH2uaYXANUpDmQABw/398QLk2kfEavGa7u2GPx1kPz2QONwFr41ERiDG7c+zpozwxxCbKASSkPJWm8EzhihFfNouCvqyiS+kF5MS61G+p0DPWfnJhlhUfjrWM3ZBagsq5f/C7kDcs3dGDx31IiLVJ4RdFWT77rPZHt7TpD0E0NpTvTbClnubYSfXuYdxL3kclalQU3Q6X6boOTzofa9ivmDJfu/DJyLAAUZtCJWHw1WN2sukEbQPJXDSZCSOCLJHIt28owPzOdhEAx6jp1u0kvrl9Ns6PW8DdSyPsRwh12rTaBYRtx7BqMvkbeQhByJpAfWkiNCmQhBit/fbFv1sW5OxpUAYowDmvMY+tbnV0YW7s8ynSiMPTYoz050PeCaRMKXSip1YUMpNMa/pH7I7dHZnz9vQsbOrM/DCbwU06VhGAntXh3fbPYmJlY2zXZnZ95GXwYcL5NFKwTCBouQn6x6o5iOjRAD4Bsa3AYXGQTxeu0QtQnu4AkKOOJGjd8DMxrMacGfqfvbkbQalYT4pIchq7y0MTL6xZz3Ampw86pstO80YwSMqDrWVWckaVAYAHT9y8tkWRDkdJy2gcbJD5L9ZQ== suom1@IRC',
            ],
    }

##### END underworld #####

##### BEGIN adminor #####

    @add_user { 'adminor':
        email => 'noc@adminor.net',
        company => 'Adminor AB',
        uid => 5171,
        groups => ['ring-users'],
    }
    @authorized_keys { 'adminor':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAzUw6Og0T8Si6Peb/uPGEmZNAK7T86iwFtOeaRBYpQifAb12ntgigX5hVCw3JtQe4eBHC0jHxe8hLcd/qA7vHJfDRNRSEDUz4myFlHfFsewPMbWL2Vm36VkNjTjIJ3mXuzJjX1OlR4u8m/t4pZ3GF/yc0oxBjTd8wx1KTLGzqmKcU68oCTFatsDEaQxTVIXT8hXOho8f9HLDDFRMLXv9xOhI1VumCF7MyrSf2yipwj3Q9WfdawoJJLddPrBLunxRs5JLp4vUKReIGGMWhZKVFLPrZItefOkEUy0XSP7fy+2DXtvmrkjJ2z1zGC4PwZQr0ZHK9t1Bdf1oajzyM+a2zjw==',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCvltzLiDssivK7TWFb+lvEEPC5Ey0fK7ktK/sEO6xyEQoiqAknm1Dcv3WY+17DwpKLZU/k2gdqPSpoUCD6nepZr2r2ScWsTjgFBv/NnBr6aElAZ2m4lS4V9S5JkEkHQTcjAQ/vfFk+yDSwVV4jsAz0EnthpsOKQ1JUUXHtNlKb8leIKaaUTlHkk1h5A/EagoXuJsiN7DgR0+fgcbRquVtoCUWMoQU2GuiTibW5XGesfsQA6Llyr0vkmWfccoMVfh3t+e9IVoGvXSDHV39FNie8exytJ1pwzwU7KQzIcQCBAHC4EirbE5bO3bWS3MzvL6dvuYxeckwBIqetPQv43Xt1 adminor',
            ],
    }

##### END adminor #####

##### BEGIN videoplaza #####

    @add_user { 'videoplaza':
        email => 'noc@videoplaza.com',
        company => 'Videoplaza AB',
        uid => 5172,
        groups => ['ring-users'],
    }
    @authorized_keys { 'videoplaza':
        sshkeys => [
                "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA14rTMkjcMsOUndXM49kreBwAgZBn4VmjmdQ6FA1tg9FHsjtmHyT5YU6Gm6cKbkzsPaXLcgVF7CT88AUo2p8S/o3voOP3/q5uHTtOJsb7R8tWiQbZEkBXvqKTLYQn5mlxoycOLbPJmyFyTFvpXh5uyPFLfYSdqscKpIuHdFd/S4xfDg15nCnUnz2aPDSNvbk51GEEjiGe11bEAyoTJbzjrFmbbWDbxJwRrkWjHbHcv3riYLoUj6avX+rpoUxi3XbDJpX/9DoocKl67bARAyzYUksWC3mnjQABDky9aYc3aWyZHTNK1LeB+N0321WiI9ILx9p4ZoGEGV3vSEDlMfI2IQ==",
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCvwqYrwDuZtj9lPhf6OB9gNfmARd3wxtBAStDiUYfVpkeD5BjA4EKR8TVeYHJXujI8W5r6qlyaWWe3M+KgIkkHFAZ97fszsOhInt1xwFMSRVq2P/S1UbmbTBgs3m5VK92Wy+5GuVfwnb+5itQlkaxU6WxCBt98SviLi93+0G9Dy8Ed5ROz51o0OUFCoUtLw/mbo8KjXUy9eOLP0nfPJ2Pp/6mBUPxUDPadUP8pJp3WT352m7l0qxPmlbP9FHc3Ln3UUG4CN1L8S4vmiabe7GxPQXOZoTa/D2XpsqL50rxLhM8XrpvgKsYVvDso9B0V+XEtUuqs2gQfx34zUxtdeanZ',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDO3YRQoJc5cvDxd7zgWi42NCqyni1QZxVcvHoPCWO9FHczWMyXXhMrsHYzwpE0Ghyw9CIiabzuCcKDiyvePinxkG1ru3rUvZ9niFG86x7uAE1h8qo/yF2WUm1JcG16Y7C55PNXgf6M+RvtFhx1IoMzbpt0UKhnRFPit7WaOS4VntnpFrL7zs8MD/+5py7RnTiOjpQIjhtS31wuhsA8GffuYwlLXmojul8T9aSnfvk5eHpsHeVtT/g7lbgR8v/Pp4l6IW+6uHmhVD7Jhdh8my1aOVaVaFLfozI4ZDbfTEv5Nuphd2aEyG1Ol5PDmKRWhAZD2KiVDaizTd/qBv5AMO45',
            ],
    }

##### END videoplaza #####

##### BEGIN rnp #####

    @add_user { 'rnp':
        email => 'noc@rnp.br',
        company => 'RNP',
        uid => 5173,
        groups => ['ring-users'],
    }
    @authorized_keys { 'rnp':
        sshkeys => [
                'ssh-dss AAAAB3NzaC1kc3MAAACBAPJvn/K0RLRq+BFd4hBkTJkfX374bTX7zxSVF2BejnSV6fQ41vkcJQNF5cpZAEd03Se6nWb0x40bvrmWxnvUqEutVse/9uBbN5JBQm0Y0ZRJQbGx0szJPaNyEjs8NlTWcruI0pANPcqbTM6YF0kgor1tQ0BgoXFrXyNF0AnAen8VAAAAFQCCQp4UX0QuZKR1NPIxTcuvF8S2vwAAAIEA8IyrpqfoMSmLn5r+2tLKCU8MOLk4T2FVAWpZAjAWAPljmuwwjO0GaO1Bbb3GuulWERxyDDvBdffZ05tum+0Nlqd4WwMO0GneJrI1MWsOnC66HAD3xwUMZVpRFt9AwiLS9KGnPPZZDoxAT415P8hT6oEpe+5KQ0phxjjb57bTM0UAAACADH8uAJfCQY5RRDkswXTrH2Q6zmlAHLMTQlBGL/gLIjZOQqw3IXA6tAC3+fr7fbvM96aO2CKIESVc3oRknTDvgaT3fDXtl5miacfhe2ZW24jjJTMjnc1S7kVlu+6Zujp48Oi65iTf5tBlF+BX4lZIhWwEIR1sH8iyvepEgKa8cSw= root@nlnog-pop-sp',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCzMUZXNnzPCS0carTW/asR5+96ml95/OYKIWEFmqYJfyItNLt6+Z2Hc2u14TL3ludw7GF+L4bPuRKiPc4vUoL35UaFhlkGki8f7w8aoD3sA+E14VMEFWKacMncWcG/c2Fmrgb3Zuz/7ckuV12IcI8VRMHQfUBPSnROzlzv4GynQM8kNyBZYL7+rqpBpIzWlI5/aUY7R8wgu9094YPuVEwppg+59TmjBmJ6kY7hSqp8nxnYtfDc/2dtKcVE1CE2wd1vwxMSwRZsSuC0BeEuHsBFVoHND0Nzdhpv8VW+QB/Bl0zSwZ2i6AyYLdtQMoOuKQ9ydZdvQMhX4UBrjmTLZOdf root@nlnog-pop-sp',
            ],
    }

##### END rnp #####

##### BEGIN iij #####

    @add_user { 'iij':
        email => 'noc@iij.ad.jp',
        company => 'IIJ',
        uid => 5174,
        groups => ['ring-users'],
    }
    @authorized_keys { 'iij':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA4w3kDdUSWdpjKzzk+eB5RMqtSM1GY5kT1VeQReaAL1dsVCsNzKhdq66XvVrenxesx0H08NQ93kGxT/MoW4xTmmJTNyGtV9HZpIAVbz6A2288HgkFbI7mezJ2eTRK4m6U3aZ89JfAq2IWaxpgGMdFDNbg0kdNztXVvRukYE+bxqiTt0/cm22sdsube2Av0UXITYZfxEgshEMNsHoIjWlvlGTLo5VT+QuRrNYoXPUGx2I4Qgl2ryoMXiiipLUIvqKUvhR+87anVdfuWMz+811jiquO1D96p/XBEsJgp/+qSnADYKVlwKl0w2DZaDv7hM5g9aBEimo5XU2t1L/xQzNPXQ== maz@dogan.iij.ad.jp',
            ],
    }

##### END iij #####

##### BEGIN beanfield #####

    @add_user { 'beanfield':
        email => 'noc@beanfield.com',
        company => 'Beanfield Technologies',
        uid => 5175,
        groups => ['ring-users'],
    }
    @authorized_keys { 'beanfield':
        sshkeys => [
                'ssh-dss AAAAB3NzaC1kc3MAAACBAPdRbdELGn0uGBLteSkkD/71WzvY/7Skk1D8ElwKLEszx7boTzkMYrr4/sJInztuxMURKn2WgJGPaVMMjTboa+YcE4MGQrSiLCJOF+q5CFDZFJl8qHHjZ3x6U3HlmV5AVRPEevNUMkQoEuNtEZfBVtmtyFn32Ea87fNPxINxhlb1AAAAFQCpiWX1GyNRK5wI5GcsShHInMA1kwAAAIEAlhJ3Mew6Ql8OKyi6xejOnifLJ6zqC/pvKpyvdnOUDZU1DgYfpggfOfU/Y20o6BD/FnyHWfj5UhfT/2L5m7UdRVO5+Z8ATEQnzWmyHKR/F5nAsXwNYmXoqZoOZtA7RUrDP2jP+0S2Z91jJf6OuRv2tdEgY+TyJzGmdHAzrjuvDxsAAACBAPTTGSP1vXjZkpESlN/qNwlSt24RBWi8yb8jTbNU4dUYEtFHhewCCOJYCxGbgFMHt5eCmPdKDHZfC6cb7UVCEn0nnFy2sTWYihnCPiBTVgquEWR4kQm7BNlGaB6fbFy+x6Q0l9Q7eR8shWhDQ8AnF1sakNPbMD3bYaEUJ/H3ahSX jlixfeld@BlackBox.local',
            ],
    }

##### END beanfield #####

##### BEGIN serioustubes #####

    @add_user { 'serioustubes':
        email => 'noc@serioustubes.se',
        company => 'Serious Tubes Networks',
        uid => 5176,
        groups => ['ring-users'],
    }
    @authorized_keys { 'serioustubes':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA0aLrV7GHuzTJTHTQYmrwAFW9RjWZtRQSYSl3GbvuuYeTiGzU2Alz1xmFraJoIshN+EMMBW4i2CEUoX+OJTEBUgqIazvME74gQYBuPsjD5VQ+BEYriYy/KrdMX9n0tgbb9nTPTM3CoJfgp38+cNJUd8zRAuVbWj7o3+weoqwtbthle/GQJOEqIKnkg6jPEzzexCfHoc9ocWoN5hH9qcR7+GOjWwr8riHKbH+aCNrYs9YTqxrGDuUQcpemQcoernDF+Ux7VnZ9sBn8jGEuNAGo2vztAykkdmTh5aeVHQ6xyUlB4i0tCZ+rAXH0AlSWTpKx0HQIcgP7cVCD6tFdfyUqIw== magma@sasori.talismoon.net',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDG6tekZivgfWIaZx5QAzPVMvdFOLB/metklHISMHZnJQqGfN8m6ur0HLxzitIn2LWb8egD8eLS1mziTOLYxxYHcQHNOQ3RvKqN+U+LCHxypUE/pqvpsO5y//R/b6SUD2ztg6wHP9aV5imIzboT3CGjNTjiSfWFZlpanp4rer+D+pgcnVMauax3cci0qiq4lZjO6vr3z2NVQg1nXJV2K54jhzliZi49NXWELP0nWfPCHO6Ge4qPkVb4PcNPJOvJ4Dgu1w3iDlv7+0/MC602wFvC5dE5JgV0pwUmwpsM6T9m9sr2O8kfZWfQugRb0dbHNJNMKfeybtzE68Cbu/vKHq9n magma@trolol',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvmyt1yuy1o+gf/6+KcoE41sU7pd9P+tRBMzrGeCr9WvlcJK6qO+ktKgwTIxb+DEZzxTkpKl1YYfIxPIdEiDSLvhX+LFeZUep5ogsdLwAFUh+oED/ZOyMKhODaHQu1PVyLr4izpVThxXGWXxAve5LEkDCvhsWxUJzrG662Q1UupGkJbLv9ukhLj3L38/CN7szKD+M3cHUWdRXmqJ2mkLttzBc5r3XLGq8k1FH97HjrU6cVYb4RjGsbZt9ibDg6PcsQRidKnRqMCi6a3FIykoUFCnWzNuOPryr68lpFCxq8sMHfiA6mLGRCKx4JnUC0Sx/cvqvLmT61RagRODvUecKHw== magma@gai',
            ],
    }

##### END serioustubes #####

##### BEGIN direcpath #####

    @add_user { 'direcpath':
        email => 'engr@direcpath.com',
        company => 'Direcpath, LLC',
        uid => 5177,
        groups => ['ring-users'],
    }
    @authorized_keys { 'direcpath':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDdDGk1/kFeeISQXiWvmc5lZl3TFvv81SAJUvTKWqmcxCjGqcM6doiqmkJmmz7G1FdTlKkOLYxckML6b1QAkpSKvvV7pY2WLwC56XaKvfaQroDe2IrTG9RQBV886K80C9Wyoj6RM+dxCfmTckYn8+zXbs3g/14xbYYr95eCf5GNtbDHbAgeu7p1hwTjB0/ULtSiy6o9RpAQqlEXox3epAW5awpCn0zHt3uiqS+WCPZDWlFCxcIvKCRoQ8FboFofLAcWhGv8ob3iMTGS7AxmPAzgBnvXGUXY+/kbxquTdl/siIfk++WvtDBdlDAnUruNGCoFQhS2ntQufNT0VjQeZMH7 "nlnog-ring rdrake 29-Dec-2010"',
            ],
    }

##### END direcpath #####

##### BEGIN dcsone #####

    @add_user { 'dcsone':
        email => 'noc@dcs1.biz',
        company => 'DCS1 Pte Ltd',
        uid => 5178,
        groups => ['ring-users'],
    }
    @authorized_keys { 'dcsone':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIB4mmAlv7+PdCL97FxqDbRoJGOQfgZQVhkgmmDLrVI0AAOQWkbqy2wDadJOPlqWrZkyCNfAcPWebq5VZJwrM/LEZKno6pxCx3GSubF0P6fb5rNU/e110AfvpkCI+jNC37N1tzQTkCA0x1C6lqFWVQXjHfpEvrsNl7NM4qL/MlymLQ== sanjeev@dcs1.biz',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIBZUXh2sv4wkmdWzFUio70ShPWDMNCA3OKpN7F5U3jhN3n2KU8H7aF+UMgXoxJ7RSfynox90m8CzURbv0cgGri+STUGyy6Ao5n1yRuRCxP6QW+gd6v8tSOycDRpW63wG2yrURb9M0oXxnRWIfz39J8lEWb6juZsO3upRxcs8tYuOw== daniel@dcs1.biz',
            ],
    }

##### END dcsone #####

##### BEGIN berkeley #####

    @add_user { 'berkeley':
        email => 'noc@nak.berkeley.edu',
        company => 'University of California at Berkeley',
        uid => 5179,
        groups => ['ring-users'],
    }
    @authorized_keys { 'berkeley':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCfRLQ5p8KUNqH0bUpc5z4sBHdiTbZ422mBypTKzUn2GxXj0XyYNYQdS5Xqfz/x3CNSFt3sMDvzNcWuB5GnUhN+9HV3oMQnpdu+2WdB9ttzGWr6Bb0HWTEqsPs5scdAIWiffZfwGny1pBVHjciQ2EGWG6gGP4uMumQB5rNh3fLHvjse88e3f8shtWwrAreWu5fPJ4EEEAnrctUmjn/nAPEMnxyof5j592MopQ0dYDeaFUaS78mKPAADE4IcLWmD+0sgSKhsbZSPSoR+vw38Rl17WJTZQ2LVDBsqsu3ZK+KIX4HYeMfFJ/pWLSp81vmbAo847hQNdhn+GjDUzT4H1b9Z erikmc',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6ZpB3/E/hXQUPyTfO5xWfMvl7//wxb9YsRQg7waFNAuDdInhg1EAJcFrYZ0pc2Eucxm5PTc9LB70pfj97fCfrL9CaY/+uDbj8AfdCooLo5FC5xP0u/Ql+5NAG559lyZlMVhl8XdcQ5p4SbwPhoVeFTVx4YAs7VZyK9W52tLuXDmdztn35xKsf5ssOM1yAILJwV7YL7iPWwN8jSkMF0Jb70ruNNZHd0dAfQ0fz4Fs9Re9ig14hUx/Rcwejpws1up/BgQ687NkTHMKtdhiDzajydkcw5L/dbNcxPdbLGhzqk2pAnQWY4SMvrtI9lsfQB80BO+WjrRTllvwpEfRByMEzw== kwong@ack2.berkeley.edu',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAwtQ0p9cHHVNx+M43zGtOoCmf15PHT3K94WBBdaYhEmgztUDtkzPHaUD21aPVsilsJL1N4jsGmx0/axbIxZHLJoktLLngHPHs/3rfofyLH4ACUVc8XG1BKnO0K82UeJKmN/RWoCim/uGa2ZPQYjX1pG61HhZ1A/NLJn1dLF7xtN/KZSQqFdSf0qVrAsjE1MJewNx8cVF46U/p9RHwNd2bgiFp3P0+xWfRnMA38bKS7javETwRhjG+6MQXhEwfXMD+2x0Xtira8LWMgBx1IZqJ32sssQB2kPXjGaRSExSqiAhR8pZVn4+vGitpp7AIF/KF+pyfbuJHANtXm/E6g6r7gw== der@ack2.berkeley.edu',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAxGtrcCvoxB+hMw9bc5zakij7B+6Q0nLCpDPkoI7t49Exo2iha8iwzHs9MB4sSB6NIeloXLUlfv6uznzQaqOTUmIQA35VZoWWaYT3m8Zqow1XGhGHVGjYBbr8YhC4D1+omSNqPvY0TGg8M3JchUVSCTTbTJLymVZGRtZyNFTTiUrED7FQYtfjwDBzPM3JZmqTMs94WVf5prfEglIRWwja8nbygquJktKwIsVScpOldW3CIdqRYwcS+ejgwigLsMwy6c7AmNHCuuu9f7vZBvHhAp71fEDvuGyxHrFm9JYKPZCVgbF7BXWqFA/aaeeEroWiTAEfNUoIJopqZ40FUm5/Gw== siegrid@ack2.berkeley.edu',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEA+u88/r23be8El8DpX8RehjiBUA6JbcV1Owu2fWpsNHJG4TC/nLhgBXGvKzjL+yRPb32wx7/P0oM3FvRg8SDDl2+pjtt0PaisH9/BTaNBvmDCD1lRg5ax5T3NeKnOcXK7EbOGak105iFLLX7Hb6kvk0qa2wNjqKa88QH2uEQ3DHbJKeA8MrahZQBferqlfmHfYN3zfiaO/kIkKD2lCPX7xA0gzlqVC2p1BzIDwIjD5QbqMn+E8U5MJaQm7FBkoFIrf0iEFxb7noWLCbwg9JPD3pjDhRcmrp0C6UeaT2mEFVvcKYh/LpI+w3iA1Z/FvhyyEIvq8wcRaYx6qnOKnxHyPa3UHppRCK57PPyed3DFUpiBlx0qPlcolceaD57V31cEyc7CSE9AA9yyu/ZT3fty2i33Zk4A5HkoZeMWusFc3YE1yRRm0wm5ifUC4Fm8zyk5p4borOscHUQeM8+3ErIlWKKCwOgf6vm6L/GQmMTVu4RcRlwlqWrGjqqr0NpM96pLTpSCZhR5gnSqiBiGd5bc89VFo15sJj352jKh9fktv7ZP5moKUSj53Ie7/QMFnW0gxGXHlvGDdcYy40ud62uWqS61nLOI90PEOaEdj09Lv83OtkWohouZQT96JneywgcTsxfbtM2CekhWcNCKr+NIYL20ok30mDDud6/jFUIkuWk= "runes@ack.berkeley.edu for nlnog"',
            ],
    }

##### END berkeley #####

##### BEGIN ispservices #####

    @add_user { 'ispservices':
        email => 'noc@isp-services.nl',
        company => 'ISP Services',
        uid => 5180,
        groups => ['ring-users'],
    }
    @authorized_keys { 'ispservices':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2V6/ZDCOrJiniPoBnf5XTUSMua+nlHVVD6yUgZfYn3iZsEVv2XhXkKDMwth9tsw1H61OmkMdw+3g1iPsZWCpf06I3LuFTApk9eU6rpwv5l5QHpffRukNWZFr6R3Kl+ePzPLTusMY5ARqkBFvSsPDv/nX3DsAKekTg0tuVJ/45xFQmHOSF8D9jZUm52f99CAa+hbRSE+5mzD1hIljWb+ty7F8iiq71j3PdWgXSjQbKLpWIpagyopTPf60Ft11Ad1lb9907RRA+v2Je/xe3i/GNdKGQwyqxgQZLBWUABTT8/jiroyF7vf3stRSP1ZjA5EFXx7VnzG9npLwommoKKfTL dennis@Denniss-MacBook-Pro.local',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAuvzp91Z6MJhmXEftKu1/42xn9INx78DKf99piw6BHD6Sz3S0l3LCGl3AgdxYcBbOY4JJbasAQ8zPTUP28DAiDCyNTP5CBUwAAqPoEJRXK2Uiiumeq5hNyBufDX7boeL+20dKNAnB1E5WmH6oSDRb4DzQ6QDUmuJnM8Ns3WocAvVCaqlVAUbvQY6moOPkAd0eiu63ZdxIsfG114KLXMpRNaqfsVhppNNduwQU9Mbfa+TtYXDgZMawojgEy/ZcsuAfZQ6QlI/qUunY8MtztN+Xdk9lR2rd1jkd4CGimgOODYH0jdwYivw5GuFgJRBEq6fpXOjO8rd8d3FY9wHbpIqbcw== master11@isp-services.nl',
            ],
    }

##### END ispservices #####

##### BEGIN ausregistry #####

    @add_user { 'ausregistry':
        email => 'netadmin@ausregistry.com.au',
        company => 'AusRegistry',
        uid => 5181,
        groups => ['ring-users'],
    }
    @authorized_keys { 'ausregistry':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAuOP5DZOrW93zCuY9qwtpn45PnhobvciaRg9FeGjsH6kDPHfkjohH6y0uWInlchQ6QUNwqw86eMgr7vMpzPwepYJiurqkj65aMFkt6w3+dgfg3HoHOhf08OnTTZLm2kQoiCez/hYqfZnidfzYXY1ba2WyiY1fDggAOeuFlS/50IBYH6ypWAq/jSlOn2+xdT35DYTF9xnHwsjfeOBwbF1ajyQAEy9swoSZuwf1Ed5NTXSFG/gzJ5va+11lhYpg5r8LOw6BBg+FSO+7GGiVw3SJbF2dVCFo3csrgpqNIJsTUcCuVw2WwBBi6s7MZZe3dTjrV8iU2nvKli+Nau7d+q0YtQ== wolfgang.nagele@ausregistry.com.au',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAwJpuDB2+B3QgWgizQLAMGUtmQgvptIwNjghN1/KcnnyW6+h87arE0wXopHW+oTY+qBOiPbweCkknpohXc91OOuaqpisECooUMXLFZOp0N+f83dx2KEdBgEtYBLJzE/pP8NsSoIsQzHp+5d1UETh9FaBVKHUfow4mMU/CUOkUmyOhLShTzqhP8WRvxHa0fKZH7eIZmCBRIcVRZ1jGIKtpKrplTkscGzY+4fIqiXiOfw4fkJ2F8+x2DlYwPwy54T3UsyBsT06HuThZ+wl1HdpzsKJgst2mQTGG+KMoN2EHOy2N9t4R93yRHONURn3evIKNNNKyZG+bhaG2ABGEeFXwdw== zoe@ausregistry.com.au',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA86xd/47dq0OPWtV1giH4VJgoKLmiQ5ldRZ9lZ0WPbiMLKIQRDw1JeM1hI1BN9ZIIqqt2fb418SF4C25CR6dUx6kewUdN+dX46eIR6fTAVEv2V/tA+fuo4sGoEBV3ANSX+JauZDXjvsX6BxF2mO6EyhKzK6aRAfFuJhkiisa3NDQ3fuiRFOXTgW4R8EBDLGuaiF6e8SeBIJb4066KjrMnUImHYLg1kpawFWdBHKZNXJQLfWL5QMuqMuMNDhRTezYzqA3ahcWmnIG8+JeFueSObgGcYrWZCnNo1YxrYqRaeM/j+tvnsb2pcwSMZFNSOxgpkRFElDMX0kEA4P3fuHXrvQ== anthony.moore@ausregistry.com.au',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAwYx+csE2RxWEqp91yhKQXTs3hY85PFbkDOGoQWBWKHDf4HO1AAh0eaKWnGXPcNOsyAB8/pUxO6Zzy42beKXg8qmOFdDfBcFiLPBtXKEh4Vg0va1iFWePFf4T7xMRcayK8YsTC/0Vtfu6H/80hZ9bcXdebZ82WpWH9dtg/lOyBd6JFDDOOFS8FqlXXW+v1eR9YKlJuw+MItGrUP7I0lWUuwite/VOuG8lm58MbQyhqFDflBLqaDrZtGZuJABXm4RRg6ln5NhsUGP5tMX1zXDoC0NhZkGeBX2UNKIX7P1J9gkUsilOy4o5baL1rWLi6UZGFLty63yP/PqCMbWymj83Pw== stuart.browne@ausregistry.com.au',
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDG4imanrakjASYaEIFPzkhW3PP1jU4d5A8H7+JwjAtI5wkwqqlOSJBQEoyoCOZjtHTtnqmUV4BDAvAuXYoBMrN+1Q4R8nGLRrfWxG+WolzimnE+wbBNvlToF8L8Q+ZhTWmQ/H6WE5nhHsj0sQFvMAO0LQBoYONdATt76zE/IpQwYmAWgJKCNugnj5Agn4eYV5GO28AQfBpEMLoO+zeJ8XUKQh9VTOqnm3cx/0xOFc3heOUkAqQL8gk3zwJ8XwiNE/3mOY+obOz7mQyIoF0yEQqTDtkzru9K4fPx7CPm8eRcJH2JA0oLaHX6rBtg2LRRISTRGpE1B/4+PHeZq4bUgAX sla-mon',
            ],
    }

##### END ausregistry #####

##### BEGIN switch #####

    @add_user { 'switch':
        email => 'noc@switch.ch',
        company => 'SWITCH',
        uid => 5182,
        groups => ['ring-users'],
    }
    @authorized_keys { 'switch':
        sshkeys => [
                'ssh-dss AAAAB3NzaC1kc3MAAACBAOuCMNqMbu5cCTXbHFI40mBDsao9wkGHYVUV/bmCs1w4vap+pj2kY8TXZUi/O45rN90ZhWTa9HL+ptNOi5n02zN6SH3UyIRO5uQ58dJN0fPC9dn9uRe/wEdVwaQZOXnmuryDOPq0198hmimMWhUhPDL0hyCv31VB2D+rnVPHUTIHAAAAFQCC6BVJTwJV6k+icBy5PPqtvD2iQQAAAIA84QAgpuDRp6RbC47qOFQqGugLISgovvraJbKQB8z/bVlzsWzuRCl2YfG2MOnh26JusRLm9shDUHSzxGkXsWSPHWMhibC0NoeKG4sWoy/rPGsZLFltBEZiLBCnLXR/NKnUHNF/gg9Wx+VPWNz+KZMik00CrZmAVYrV3gcKtUFG+wAAAIEArYXur6MRnIUZ1vk9BOHcD3PN8JS4Ks592n7xUNbG837WFKMWm3MwsIsCkO7B2m1Qkkuvse9449UNMogMM3yaJM8KoRtX+AlFiG8DkzW0QjQ2DmGS1UPminZq2GzQRkFMANsOk0ketq9nokoRLjT3AVfI/kBIIh51sY1UKU5JEe8= gall@enigma',
                'ssh-dss AAAAB3NzaC1kc3MAAACBAOdBYbSESR7Q5BbzWv9C9MuKE4JxeCT93YZFvASBe0v+G+ET4RqnCXiaLp6KLwILTsguw2mMG0Kl/IMU8pQ0Fg5B5j3HhcwLyyzQCqfrA5D4zmgDCMc1L4p5vv4rrJCie8GVBEiCdTWkp3dE232WqvbjMOWW+DFB4Lf+TLZBbElNAAAAFQCmTtjQTv2SHKGP5lyBQ9Z4NU42nQAAAIEAo1uYKo4LWheT+5NzH8NdxQKwy9zEEfvROH6xZdsghQl1c+LIL17pPEbd/xLyUwgEvVXQ5ggq/oPhGVxjNmFZoNlRZ/tmlFtvnw9TDJda5hbXU93EZEZ0QtK9MVRyxZSp0jkjtGusm9JFcRsJloimyYabg1wqmR5AwIN2zrdkfpEAAACARJLSxRaxcm2YysgL7A9rAyELiPsARzD0zfsJXOzaN5MkNUmVChFpSMiEo2boh5nBO45EQq1OhVae/9OdgLpw4iDdM8sHmxz4tMWgZa90cjTKfCza2MfTxnH3HN+UrmyU5qb1GIaSaVL4qkPJT27Q6rqamvhSbBIqh/9JXSNSLjQ= leinen@babar',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAuvOdeczIUrE2RaXBUgom0ZC9a+u4B3gEYeoNeC3Dl5FvE4YtGvwj5qd5hos6yYA3VAH9bgbifgHIW96NKXmeHSl5NSjzn51Pggp7iXZBIGivdTl9Gl86bAkLBBKKsLK0en5r82r7D4HdzqramitQKt1yztpWMA0jJuH73YWiIut7k+Dxia7J6NMgb38YZT+EpPrecAalJACnG8OF1cCtw1BwL+hxKPJmnkWwoDwr0X561/EG16QCwelsiNm5FQMP3wxCGMePHlDgwPbPYR1V57RQCs0hl6HgKaHUydMyFz4GBjLyxtuVr7T1C5UXZzMbgB98joS65EJ9Urtyh7ScKw== "Alessandra Scicchitano"',
                'ssh-dss AAAAB3NzaC1kc3MAAACBAL//rcirAE7i/vLc8BQJSyuwNJ8NmCgato2M4JP2b1RaDFd3mO9A7cALsPSmMU2F1cHEhgiNiuohIHpHqPpXSWMR8d3yDTJphqthJwGCXuB7T3+vgNICFAYEXANvfvQJq74Rz0nygtsO35AS8YD1nw8CrpnZoWEK2hULWq55fPHBAAAAFQDwd+y+FGwDpGQQZGt5Z4EJcVl72wAAAIBz15O67jnBKPKoucUC51w48DmH7DykEueiOAITyouuo/s1BdVICfoMZ2kZW4ziKf6vu8r0Yc3tQwdSWXu0iWm8LrV4gM7zeqcVcDwB306NEWBAfjyu5yfkrK5UlzEgNMvn3ABWRtUxdWbzNd28O0Jk7SM5z7xyjFRVNYN7rFiLmgAAAIAa3I/OoSvqKrSmqyvgEiIt/q09UOkr+kOgXioj4RTqskY7NZZf6h4juD8aAyThGh4oLmacXZfleKZOXuLwTmMDRtgfkrXPF5fBsFKKsJlHiECFakkB5rlDbF7bHjlD0ax8UlkI1uVm73f/PWXy2t6EWEtFJEEOYveVNnHgv+Bpjg== schmid@shabaka',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEA4ZBNhxuJ9mhP6fho+CkzzxQTnvzrsyCl2uk/SgW1uaMPhwZ0Nr2ImxukAVM4z5VaZdNkPceK1K6MnE9RBlrsF9STkuoesp/alCUB2vFya0mXGRhhXESQ5wqgsqpK1sEHFBliGY84xUlH92b1+TuD5gmgoqNz5e7EeisXoVCGG1E= welti@sleipnir',
                'ssh-dss AAAAB3NzaC1kc3MAAACBANraatQ21H0PCV7c0PXOCX5EionqOtL+2Bqzk+LgkfBJsiuQSdXu+DfmAC1GsxTn0fm7ud+2l5xxW6TRVi5Esa9xyysIzfffl7gElGDVBIbcN8QOHBn1NNFJrMYm4f7fSooh9n0xr6E1gDa46pcthAX5ibf9eilEcL9znfMyONsXAAAAFQDgwGCb54Zr+8ZMbQkUOk+Bp3W4GQAAAIEAu3dvotYiH0KJs+1G3mIROPWj7WHwC9H/ZMtG9vzUAdA3IT8/Nv5CgnNqEG7808/d7qIJrbL5hVCafQdT6eg/PQ5EaliSb+hoyipqj3gt9O8h5RmObjYcb43C9L6a50kHxr2FRl7rkc4tEep+EyRSIH4KUpD0lo8OK0i3VpMEF3UAAACBAIguPLxK97C4UWaQhTS82dM8shIYduWXE+EIEmCPAo9MWr7Yub5F1T/BS1NWAB8MoMy8HQTUm06UZym6PXBtRft3/32y/m37ylskbiVz3Tf5HJ/WUO0FmFwv28/YbQyTinIzAQf+57PxSNUPYm9LXNWIPeyoEemChhH1Rzh1KFav welti@sleipnir',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAzUOK5yWEGMSzJpcFxw0SjnvwnbKrX3lcPWMZ7XYUSZuSjp70PtAfdag5/B+9E86gFVO5uG6eLDNvwqC/1jSLmLzJjTm7DSuM8l9ZG5R9l6VMdrkS3/s19dXJi0/x2lRUUWojsFa8z6q9wchLcFY3GNVTvJaQqHNcmwPdlkAjkG8pjZs28dlHcYMFPw1oKc7b3IFvP2oYywBodANtA8cw9QBClE+yTpKEkTDtpx088nZOtRep2l9Al8C3qAz3WET3tCPzWxOnSQPyYZMcDbwImH1wd8c2hM08ijquKKVI/weeGcXPGJMvtuJT4QxRgBfkdoY+xpWJj68Cd4p/U4O9/w== heiri@mache',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAwipT/72gnXcPUXr/CE6XdRXvVZnGNoRixOiFvcH/5raqOvKr96Q4u64PsLassHB9tuK1SXYi2SSMjRcPBMEYRMacaaX8fSFSDnX+N93920VHKSU4MSOYJ7YGIgR/T39njTR8DNoRh5Vg5VvvxGBj3S9dOdL6CGznknL6SCIl0aU= tognola@central',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAp8b3fRzfiWAH6T0R22XUmu62JYkJHLIqvWPjT9CxPBpKiF76ElZZjL4ZCoLGAUtk3+DUadwsYZh8Qz9uhWp3FFYKbDQk9MM3Sca6PocwH8L2YGOO3S0EVbkDZf3GoFgf8E3qvHW3A8CdzK/0/A6UNO7ASfM+AGRjW/3+6iklPGbCSpGYdqePtfNHGVp0hruDVHBPMcOvH6MuOO8Vto9S58Z9FjG5ini2OYNOgxg8Bymg55RS9PVHsucp6dCS/tfRf5x52LVkfOH2UutwFD/AhWV+I481e4kCnuzzcqlPBuLb3tcptoRzWfcv5IHs9IgrZ8RSvdW8cbAPrS6yNAwcKw== mauchle@macfma.switch.ch',
                'ssh-dss AAAAB3NzaC1kc3MAAACBALWYqLk8P9ByevB++UGGjgX+/OqAjM/Z8Wjyjjim8u8se7lQCMgm15j1pumxhw0p5TimPjPdDVS3TdJm8OqfFgez/UMFEZ+i1rxxOTJoGqIOtVs1XYo1upOyHRUM4f+F4eq1m1Vy+pnLZhPSzDoH/9mKra3Px8oM1WZfo9Bfui3NAAAAFQCDovY/J8DR/eoD9Lm8idmrvmiGlwAAAIEAkMpsgqi21zj1jTVOfCzpEaameGr3SLswgk0y/4i2vH7ggq/hHIWZ7eXwZQ8y8nyAeOzYffZAl1IOMuYN5KdDzGuxAJdEuO4H+lnnci4G0/Eu9rX30AWXqvf1mpFCrua87Oy87j4IJ6I0gLp5Q6SIkSvzf53pBiFcBAm2PNEHThcAAACBAJ0fDYiLoW8gaKLW0Yhrzu9+b7+Gy1pBWPwuBIwWdbn1TH8edNA2kSDKsb5D6Qr5WUVjmEppL9AQ7o0m8xXwhJAFEK5L8McY10Fe5J+I1NEMz6cpHQPkDweyHbZ3Wdd8DO+ADWeVKaOa4UQkCMEUDpdbGJNmPEXCQFpbqv+G6EJQ racine@macsr.switch.ch',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAt4kgmJ3giHJ/MX17S+USdg+PgWincV95ZXkJw1/o3o7fPm0wbBQ+KZtZY4j73ZuXt3rLuRkP/8K54miCLEb0fC8L1kW2AdTMaolUE7ds5t+/OicrLwjguwSBjnOhvrgF00i4Tj7fz1vQ4Y9O8VduRXLzIK8unLFwVJ92VcbOWpU= kugler@imbabura.switch.ch',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAt0ZyH7sf8NJtwZdoGYctZybJq0vIhe8hazfLz2R5XKmGPf5+8PGwz403yyYH9pfEVbBr1u6KfC4E8fOXgraKyrWrgq9epdWZWRkiYFyAHna5y2vED2E2HvktRAytBEZenRPW0LyoFI9/QL2V0DJcMKrMH5Wf2j+vQbsAT48LR1zQGbrWzEVfXEAkBsp2o+3n7ovhYMnccpUsAu2wLDa7Ktkphl4nLWQPooc83E7BoJbONwZPW2eW9xKSRwE45GD/rN88sond57NropvXz8MizDUMeqoIBzqK0dTxYX+2j91/g+DNjO8SbglMQ8vNFFaAcI025A2XBgc+AFIn5fZOzQ==',
                'ssh-dss AAAAB3NzaC1kc3MAAACBAIqG/3NiB5kMFRbb7lSuhSGP3VUwaPIxclIFC1dwPCOhJ3Z62jcwJ5fX0sZkq5OAP3cI2Zs6/+lGpjdB+uUN5FUo5mTd8wBgcc4l5udXZEVAxzutHhO4H0o7nhPzW5WT3CM/hYyY/BsLEmSC3OEOeDXqvBzQ+74NZ48mviPQZZOPAAAAFQCDcXt0mUEUk9brmUICrku1oGdo7QAAAIBfz6Acfg35iKbDDeCcG9MGK4nhqut/L66FgPRn8aY/G/r1M5NXmNhFbKHokQkQ08ncDa1gpzoUYXOlWu00YrofSRNxPgIDNOR4lJix4XvgEVpEZkbR3uDywqA3M83eRlcDZV6zt6Vd1o/sXwL2i1mgExUx5NqXXbe6hUuZiCiBBAAAAIAVL7UhzJsvqD1CvW3EKFv7kHKjLkZwKebuEGW1FeUI7mwG4c4Oe4NX1xPb0Fwu0APLleryrS7WJl0geG8De9MHHyVeOATkI4I24IGq7xgl8j3uGFpK3k4GOMxpBj10ujQMcoHgmwonR9EEIh+Lhg5lIq0OaRxky89f1UNPhYjc3Q== huber@macWH.switch.ch',
            ],
    }

##### END switch #####

##### BEGIN hurricane #####

    @add_user { 'hurricane':
        email => 'noc@he.net',
        company => 'Hurricane Electric',
        uid => 5183,
        groups => ['ring-users'],
    }
    @authorized_keys { 'hurricane':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEAwQeXw5daZY1x/HyChcwjF0GL0yjCnFcwpaIHgoyF5f245olZ2upMlAHyUchpFWh++AhUSTo5rCzl+oifn48pZ0NswF/vLabJmwtKsObA7PPuQYVqveOZrGziDmgmfEbGRfAth0Vu5hcYu/iRwYFWqrkatReh57RHQEM6U1OZj77hyEm7xz6eNiWFprFDgcfAekDcP6NNLFzfiib84SCnd6hTrOv5fj2aZWyVOjPDjgysp3L1hmiGZDMm0E4rWLpeUCllkUbYDJ1IwweF0vwNy4hQki6T2q2Y0mleJ2YcwjuhESQyWJoXpvbjyRU/wMvANTfGbEfWs5Zy9/zk+DGxaQR4XUcEJxHqjMoiL/eoRWDmgLcWg1tBd3RDQDTzSAsxptWnXSb+Wd43tLXjO5Kz0yKB8n7x6eU9RXhWnC/GGXzA7dGUudAzPiWAAOFPCbHeVn767CdfS/SCl/lp0qbjYSu/bqkgERPb8hNNHSpUX68WsKmbeF2sZ6RNsPppNFSx/mqUGGIuycka/FzO0lbTbCjEn36l2G+VUIcQD9OcnDR7XFK8ySOIp+ppBMtwLcODWfzuivzDDbVw8HKZcgagfIuWHk/zJCNxX5RMkw2TUfCmvvHjGgCsYI5ikXItDuy7gANmn78PQM3IFPxZXQ5VqpYTr6gSc6gnxij+9eLHsrc= james@james-desktop',
            ],
    }

##### END hurricane #####

##### BEGIN proserve #####

    @add_user { 'proserve':
        email => 'noc@proserve.nl',
        company => 'Proserve B.V.',
        uid => 5184,
        groups => ['ring-users'],
    }
    @authorized_keys { 'proserve':
        sshkeys => [
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCjEt4xTSr8KDiCLJRRJXtQTFh/oH+BBzcmFZ0ftuWxxwtsUeFRDbT/chK1IMfyl5HHTJBvJVJ3jiy1EP+u82Ovxgpte5q/wXQKjPqcBi5NVUmZii2qaRVMKbjmyXbgfbSDduPVKRpKktpCN8lXOEyAQ6dMMd5RIAQ+tIdFhO2Zfo1IJehPLjW4Tew/B5VZ64WsMLD86cFIWCfkvMF7SlWIjkoX9j2O7QBxOdSdwZ4R1uBjqvv3rTJaMT0GvXxa/9nyW5slC1hXnXAqMjKzNuTgBkNgBAcqXCv/iJ8zy+IujKr5t2ceIUYRNmN+QRne40v6tEi9OsunBrqma/qHdYtd michiel@kraan.proserve.nl',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC04f9VNXDWWyY+7UvLdD7eQcuDyQmTsyKkPgiIbNWtdvgIfx9VjGF9FnG59ZENXHBgzzwwYF7+7JGc2zUTZRtbiTztTwxSHyComcXAqOEJWSghHH9+jTRPfVj94bejgjUKB7Zqbio1SNnytdsgFVLNlFOf+3N9l+3QVuuWcPZOsWAlTCQE//nWSN70mpQM+3/hNGA7FBSemZDypLWG1UKv4w7ck7QrJ8S0Uxu8lY0VgmZ5kqnFwyL/L42Zx8YqGTkZvJQaTSqZpKgIjvI9YrIBztGr1in903xC4QyCfkseUMyLyBm3ngCTHvpfecZF76A+6CL+2FJ5oAep391XKOER edwin@kalle.org',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAwXB1oOoQ9T3+LmOoS6ghuy2C9qzJhqS+CDHfMefFecdaFwNznzudHbnotAsecpyXZnO4rdt3d63uEQ6h2vvhcSxz5WaVEpbcJNYSnCZqiZuZOQBYbBOAaGIuDsiF9li+ce+1GuSaSysPX7A0JpHexmxSJUl7Z7FoTeLWZ6F2X3QQBy4B4fmce056B3SmUMwwI4My9nUbBRkt2X1n8uu+xIAiSshgntP43qIxzFqKIamcBDnnIWo9RjKjO9phmWvmp7BhaN83nOpPnqW3jcUMUrLNaZrZTboWNXSKYcK9pjDv8Nab9XLqkBvJ1CUEEtm6UhlFj/c18ho+6EcyufryMQ== bvelburg@proserve.nl',
            'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDE3CB2RYVNs8p+ByUzJwsC8w/q0t+TMTuhcntVsIH4rWNU+ys8KnhSmbeKZaUvtqjxSbOH8vq+teNEnSxuHYCWIkNg8Iy3yrqdYKQKxJ/QhpbkvEWsDARKud4cDiMCnpnQom/3uRISScV4wSBW+fOOuudIlsU/JpN4HMZgxnBXi5Z8/OaXJF4iFAzAfYfcVfi1mvCvpfZRdZf7z0knQp1VnXi4WyD3BKYP71KdZNNyWX9ULMLvheHsLgo0W18RDhPXhn5ryBpZRik3pE6x9TDXcoKB7itSGkdwG9AwZjGdUmWZXrB8kYe8Ox5wa7HJhG52tuLxn8TGWLUBHw140Za/ proserve@proserve01.ring.nlnog.net',
            ],
    }

##### END proserve #####

##### BEGIN teletalk #####

    @add_user { 'teletalk':
        email => 'noc@teletalk.com.br',
        company => 'Teletalk Telecomunications Ltda',
        uid => 5185,
        groups => ['ring-users'],
    }
    @authorized_keys { 'teletalk':
        sshkeys => [
            ],
    }

##### END teletalk #####

##### BEGIN poppr #####

    @add_user { 'poppr':
        email => 'admnet@pop-pr.rnp.br',
        company => 'PoP-PR',
        uid => 5186,
        groups => ['ring-users'],
    }
    @authorized_keys { 'poppr':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC07kPx5ekP6+6aJ/tyCSjMufy80Ma276zbLFO11Y3eGU5eS9FGi7qnFUEJl2DcGZQaFvCOtjhmdQZljg8WVP2MqhWpV8KJtGrge0Qn0lQEASjDoNt4siCVIusLastoaP1pOjAscJsMpVa/ckHFrXT4Uu3eobeeUAS/vNW+Lnx9lfv7HRqBu6C5NRPSU8X0mQlI6U5XNcW7WWVNyDMYBNN2JaoW0qJv/T9htcFyQptI3HjYnR4ujY01KOxP4p4hPdUpVBQOOJVJCRrkoA0NNn5UrjzE4LD2lrT0NLpQRYKrGfVPkhT1deLNCoVpCyzdmMllWfOnuEkrrTIriSADr4fh popuser@skyline',
            ],
    }

##### END poppr #####

##### BEGIN kaiaglobal #####

    @add_user { 'kaiaglobal':
        email => 'cust.noc@nmc.kaiaglobal.com',
        company => 'Kaia Global Networks Ltd.',
        uid => 5187,
        groups => ['ring-users'],
    }
    @authorized_keys { 'kaiaglobal':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEAtizDeHq3l13pp8K9udaQVJmgFfoy3/ErDBxDndmHTClueMdqr6Cw2qzeeoAPgVBRCv7ZDpYNcK+uhWGaiYcTOt7Td2XW0VI2Y5lgis5cJ/sotIIz/zkouH6K/n4VZPzIYCwoJIHSfnKH1BdWjPfkYiu9pqM7X4azgLwx4Xjw7FSCyy4WqLkqsskSs8f5f8k1OUc6mJn7mFZvDKcRZTO2oMiFXCgne6dpZrhTra1vTTIy/3BrTjoUn7dMz5JE5F9/Wh9FCoVt6uO3LZ8v/kqNd/klEf7zFVoXrIwcYCiHPJEEDijHkLrv43YYkMRiRduHjErtU0fautX5EGLL22AZjsY7tKQe8z117D5POXidyvijCVy1hUqCMD+SZL40RuxyJkFcLIM94qcmKfph9wEF8n1OTXkxg8pAdtAIJAGsNhgRVMBVLlm+/b953dNq4Y9+F71EieYQwIi9jnC4eCN8XOTUPUcBb/SsADmGK3G0Pstq61CbFC2hhyNTBG6SU+xuALp1ha6zZEfJKrwOaL4ZJEoz5ooU7u2GYkTq62Wo0cNjlQuhEyeANqUYC32ZT8tMOqt3GdVxUpgP6eEoujcOHeu7/I1fopYcatNcwiY19x7bV1UrEsUIdUkI0HQ9UXN81vkK9zG8Sog3XESyQxsGvUDQ+Gu7jfqZu6BZez6PDI0= fhibler',
            ],
    }

##### END kaiaglobal #####

##### BEGIN enestdata #####

    @add_user { 'enestdata':
        email => 'noc@e-nestdata.ch',
        company => 'e-nestdata SA',
        uid => 5188,
        groups => ['ring-users'],
    }
    @authorized_keys { 'enestdata':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDCR/ZgtdNgW/sTzRN5HuBW/61jcV2GDB8O0z/MLjUBNlc6eDq2jK3id0x9y1m8Nnwe+DCPDRekhiTAnn2GFueHztjZ982prwcd7go+6YmtmmlaBsuUCyNPDZuKzUCeR4l/uIneD+VEwijGmQpVBJStlyUcN4qY1uym9bgBFd+9vkFs63IJaUJaNOM+phdbnpGTSMoMNxlWIP9Xf8qSR+j8K+nlcqUjcHfVCPZwVul3PZ/dOyVHCljYs700MzAP6XieRvBPNiOZhBAEeRlwarAO4JBFdPZbVzUTVPoPLpjpwN0c0DAvAaZEGWdrvm+HPQ4Jh8fUktFDcbKl0DsfOvJ5',
            ],
    }

##### END enestdata #####

##### BEGIN ualbany #####

    @add_user { 'ualbany':
        email => 'noc@albany.edu',
        company => 'University at Albany',
        uid => 5190,
        groups => ['ring-users'],
    }
    @authorized_keys { 'ualbany':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDPbFi5hjmjNCY8dFZx5YWaxppFRGCgoV7f6JxfTH7qevRZWeSZh+40LIV8EnJjA6n7PfDxtjpXm7TnYWI6/IsocGjfc7dQOyH+LIM8uMtNS7MhR0K4Nu2kImorftwSWp2piOhp0MWU9SnVDPZthkwh/vgAF2gzeEJAYuVqeNKxJgHYRbOqO0N82G8vNud7og9u2l6NEapVGYWminlP8Uy3OBUgx1v9JM3jzJ/AAKi45drwP0tr0YcKtd9gIhMG7sq3s40qMi4KW/N3eHsDMwl8lxrLSrYyapij9ZUIk0i8FiXPghiexJfSSi16BT/UzM1Yvf4O/tetCiWHSCPri+Sd justin@bert',
            ],
    }

##### END ualbany #####

##### BEGIN masterinternet #####

    @add_user { 'masterinternet':
        email => 'support@master.cz',
        company => 'Master Internet s.r.o.',
        uid => 5191,
        groups => ['ring-users'],
    }
    @authorized_keys { 'masterinternet':
        sshkeys => [
                'ssh-dss AAAAB3NzaC1kc3MAAACBALpw8Abhc0ZhggCFXvOoMLXmRTVc8/CBTtErqo2ZdQZKYB9sYKZjwzlincLJyTzyiAQa8DnHZiULg1ytVgWGwhfmFLWqZY+3g/uOKOtYPiQVX1FTXsIv0vVKK/oqzD969STLWMA3DxkbKQyhHSlsVQjhh0OihMIhcl8aImvUCPCNAAAAFQDyVpNjZJooKED9NmA4oHTXorF+CQAAAIEAqXAtxl4OoRO+uDNsK3EWCR9BUtGbG/h/0xf+rfcAv5N8jp+NDZEAvVlinl1JRZzc55Fn4aMpqHz2F0W+932L7ZXX/m0QsDt0aWLXRkCZBfdZF23i+4XpmNXds7yVcu7+yolgTVG4MpRInGg0z1wJCpU1QVW+WcSWCvh68AS+I9EAAACAdkP67TWRxLwnxLEwZdrRrduyqxaMICB67X5J2hjNqt7ddjzyUjKhF/7cso+czpxDt5+6XCwyw7av1OrxEa8xsRiPPVSIjxqKQkaY5zXdGZobVuouV/6MYPfxYhbkuhiRfyqImz9w+EmXg+wrjCV/1zxI/Xvo3Y1oc5YyGxgLBhM= mzi@devnull',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAteGaszjpg8cXi8ikD8nUjNDGq7dfNaGr0eVysrI1dtRQYnWNm5HjVPyc1xMdXES1iwh2S8OJQg80ED1Yov9Xb3CTAAJzygxUgRMDKnGHqo8F90+uC3RB8XTg8kFDF2j8+wV6p+TTHgnv87sOq+dhF71Xg9845gepJW7JcmrvJ8QNJW01CmEO5S1pcwAelJZ5fCC2KfaXXuxPIaedHlHOIv0Jmh6rbU3I+6s0hO6iyDRhahM6DZ/2SVRcMwO4VGcbzdZBQvH1HlC6R/0DgZY2LTD0318Qdsw/PrYBK/xuD/LlFHlA59Q5wUfN5wdhwA+E7gQrjbnwj8VnOGuLKDMJSQ== masterinternet@o.master.cz',
                'ssh-dss AAAAB3NzaC1kc3MAAACBAKm3giMJWLBxJqOwZKuSIaG62/p1ZrGnt/4kk7qNY7AIegfCxFIvIQbpRvh170WPqB5DhxoQCmZfJvW/fzbqCS9G+y+cA7z24d3JJAMvODZnmFam6q+E2s0CDvB2XLvE511DnhYw4DBmwHxuQcDSW9T3eZtXpA6QG4Iu4f0+7UrrAAAAFQDkFMWKdU+lHBIKb+GmRrnHkI0YowAAAIEAn0xkKhBAAi+lvHoujx7Y1+eYbw2BbjWqzR7hwSAb0Zf4bmdz84a8AFmGbg6paD/go2ojPmjFVZYx+nOIjgYNuRqZXDg6jbgf2EoStlJ2XdrttAzN3PnCnCVlbq4VQkan5CQS7/WRuhTpyx13Dqv42AjUSpljcldJdZdjMh8Htz8AAACAP4YEp4qHza/TduTDOxYFByf6jHm8RWCK/QfSmR2m3OE4rkdjq4qFn1aW+NyWoiWIyMOMGIgD0JYuMUiBb6c/BP1WiG6T0HW+8SE17wPeJz9SEB0hqShL8Zvjd4o9Y4r0cVdad7XKLkIGDUlM85VjvDbjMtQAxNVlAmdgLj/69dE= kuba@apu',
                'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIBlJbrPVt5/aDCwQwXQj21xNnNyZKNSFKJj87WkeOfuHgtXD7ShjWwcxNr2hrL21JWtjrvXXnDfO4txJuswOA/5C76FYqDg5Im4RZpx/t6nX/hqmr0yjPAZ1zyeuvdW7QkpMVM622FlPI58u+VjQRnQNgfQqVD3IWx6SF51rjdJWQ== pavelz@work',
            ],
    }

##### END masterinternet #####

##### BEGIN icanndns #####

    @add_user { 'icanndns':
        email => 'noc@dns.icann.org',
        company => 'ICANN DNS Operations',
        uid => 5192,
        groups => ['ring-users'],
    }
    @authorized_keys { 'icanndns':
        sshkeys => [
            'ssh-dss AAAAB3NzaC1kc3MAAACBAMr3j8+IyxYo/fRNlcRWP1MvpgjAvBVxLzJvcHLurAzKi+leZ0OSyfCS/vxlulfUmgxTtHaMTev0/7pLoCLCGuyjBqdS98Iw/OYGXetmbB+1+/szsjIPxLzbgTwfNEh6WuSBtW2X3bFa7GU1reoT0ndiBSCRY5YDlD1lmZG77ZQVAAAAFQD+MH68+0+dhygDtg3FnXGjaAdRWwAAAIEAgnUD10GzB5HDuUPx7IvHVRIcWplx8Cuy6jLqbAO4uLwwcbAS2nD/JH2/umlAeIJnsmq4Hgp+KLTdstyhUjJHuLKcWtqvanN6aVBQ7sVuzh2oZe0SdcWG6wITh6pZ43PLZxtf3lTy+KIbKbNbVrGQCltPbqIRC4gmPHrGd1JI3VMAAACBALB9AfqkR0PwdgwCcdTxnG58xP2MLwdr/gqyYwRSlAF9Ew5/qzlUlSsnE8Oy9oruquxljEZ+OZrM+ZqkGCGGpD73QOrdXrpDgxJDWzl6EXxHabXgDOWNXs01B0BxRZIySFrX8KUvEcotMs90ElyMsPdFaxfiM0xrjvA79EBpUh5c jabley@Joe-Ableys-MacBook-Air',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvEzaTZuCTHAJRKdPUoOOBtRie8pUa5oK8oEZUwENgGkwzUbxCtF8aPMI3Xia73tx/DlWomaIAQKETSvlG4wBmuoSkWKzAubJ98JIsyFt2kWea731Hp5E7xuwHwLBMNjJ7S4grqJuHT/tti/XgSDaCWMb4pB0aHqc7IT4M3yuxi/EnWg+V5c0mH2FZ8m+xgKcqtWvDh6/zxtACRhqJyHyqLSlsAnbvZaVxIqUA+e92pyM4jmu4ftfJPzXkBZuiBkS4+U8co0KltLo/MpT7T3SZFi9/XW9f9cdlpgZp1GX7rD/yX4qMUywRNFuJCfB/5U6cKBVqzC6cJaB7w4UnSIQDQ== mehmet',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA1WEEcDQfLE8rTK612lcqDC+wqilZKHmhI/pmNMhPziMs9Eh7oJfQ8APvRLc/S5c1MpgC/wFDJkzLs35ncCmfGbt8xiZtV6iGsQsvaf96W+Qko2QipB3NGDSC8N/Ml7+XvEVTZ1kJGX/2kRHywJRA1fjkMXVmFZGejZ8z10w4OVbCWpGCRLH37KU3Zv56/itEUfBPZ552CSJjKeh5Z8knNEJrtWwxtxqA5qU80RGRjrnn+Gw65QlHIt9y0Q9x6OkPjDP2fo3/GjHCXkkT49xH7GlCDjhuLqtbvHbIJez2mSNP+BaEl3XjYnVPkMxFWIpTEQx0ivyIMAQF4de1Kh78SQ== terry@terrym.net',
            'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAt/AS/vHN1cos8YE2khREXgghesIBPv/I0moCcI5vynyAXZ9sGSUCk6/geXEJwd/dzSOVzdL6AR1hD838VvuJlRi28zlZApqmOxkCmA5Tk5t8GHMdjqxbMZFq3igMF7lmr6XozrOgC00bYNCRllwqGzWCWonMmZmefX65Qy4TNJcevYkAbTKYT0vI9IGPMTJx/42yb69TiO4AQGDYYSOHTR28+xmV/yGCu0HfwHZjOPfNHx3iFw/Mf6T7h52T01+/rkVVUnUJhz2JtC1Hk92yZ6RJXvu0bQ2uEJB3Q1YnsJks9gqd14ZJ+6piysqFYi19vq5bYrFFY7qESkervgtK8Q==kim.davies@icann.org',
        ],
    }

##### END icanndns #####

##### BEGIN intellit #####

    @add_user { 'intellit':
        email => 'noc@intellit.no',
        company => 'INTELLIT AS',
        uid => 5193,
        groups => ['ring-users'],
    }
    @authorized_keys { 'intellit':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCp16riICcFtA/rq3WvBKhbd+O7G2RqbI1ZQi5O5955lEs/ZUkjANeh3Ur2Joz/SgYTJL46zZusKXC/gOkqp7cH9hy/vF2iXFTML+5YqWcp0KRCUxGbtwrk06lmZQU71k0NPG2o/IYfAIwJ7qCoPRT/2I+fcLXQ2OQusWwzu1wvjHuHzW3vrU4y1F7+zkkrz4zUYLjnFQSrGkewa3O3eOTBDI00Bven+Ofr42R5IWJZ3f48HyNGw0fLO9907IEBae1O1W3sIVsS7KgETVokJarVkvB2iGgX60kyKYaWQi9BhSUW3T7S0Vf3s4ewSWOA6Vjo6ixoxKlWHgujQKjg5ohf',
            ],
    }

##### END intellit #####

##### BEGIN onet #####

    @add_user { 'onet':
        email => 'noc@onet.pl',
        company => 'Grupa Onet.pl S.A.',
        uid => 5194,
        groups => ['ring-users'],
    }
    @authorized_keys { 'onet':
        sshkeys => [
                'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA1ZTETLWSdZh39n/r3lYPzhm7NL3r5lAD/cBJivCEJ+9fsqIKtq5/SjX7Uqv/UVqhdisqSY23vBfJsOHw0y+6MA+mtPyXy+uPtZ0VXrEQ46dyLPSiv+eFCXMTcr+fgBjk/NYVys/17xTMpViGbjp7orrF/pE9OXMqgTUbq3JVSNMAQbHGPSXBwhT8qEjlTXuZYCfmT+jyYani9s0TPj9pnMfUhX7iviHo7XP5RWpvE8VnjyekjHrFGvZOGeCQbC9bq5ySDOLeaUjbHl4uNeZY2T3ro3pUvouSTLeX6yXK7lEKfRzsI3l/mOgIWJxzHPyokeQM7CFikuOH6h2e+NVmyQ== root@maya.onet',
            ],
    }

##### END onet #####


}
