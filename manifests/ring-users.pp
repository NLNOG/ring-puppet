# Class: ring_users
#
# This class creates all normal users on all ring nodes and adds their ssh_keys to the authorized_keys file
# This is the file that manages all users and sshkeys
# if you want to remove a user add 'ensure => absent' to the add_user block
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
class ring_users {


##### BEGIN intouch #####

    add_user { intouch:
        email    => "tech@intouch.eu",
        company => "InTouch NV",
        uid      => 5001,
        groups  => ['ring-users'],
    }
    authorized_keys { "intouch":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAxr0qjSn+2nhibydQhc/Ry4KiChKv9OJBja69s0ScyNTwWhvWvEItgXQlbLp0RW5XeZ7aBvehHa3pYLPZUshhz5roRMhZHZhKe9Cu12ZSS7qIXk1DRL8vTDP2K9f+yyH04yDlIr2O9uyh/B3KCcK1TdGVDsj/KiXgDQSClfQnFdqByYqFftEnjAq86eoADhIWnEbH06HE2ndEtnggtOJcy0D7SC1O0Y3MxqpJy8oEHMsrVoFi+Do+bc6iqW39Yi20t92I/qKz08wHrOEqNSsL0OMi302GJ9ZozhJXHIUCdvMMgUlufI41lbhXpeq8Kau/eZAdgC3CcqE1nsL19mOSfw== tt@intouch.eu",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAtKkm8CZww0PWJHSQ0CifRxmfpRmow1N5ExDRU+O2TB0loaENFsmrbtfh8e5lJZu8YISA5mNXU1bgb3+B5H1CqAItNaIYWoM+t8MUMj52Nfe8u75NnK30tGX6ebIc2lJcF2sORx4oIxDJcjCJMeBQANl6t9Zeuq5Xn9xSd6f1gF2osbReQCSnX+f6iSxHMIjv+crqkrui+ELzZEmKnIfJE6nDXl3yA9LhtUy7JKi6YYBzPNRCFyHuqBntTschC4gIOEncaudxe3SZB2CIKSinovBK4wYOUx06h46m8l/9e0pVCU/HiJUdfsZUDrlKbgDwlMyyqYi8mHvJOCnnRWWg3w== kevin@intouch.eu",
        ],
    }
##### END intouch ##### 

##### BEGIN bit #####

    add_user { bit:
        email    => "teun@teun.tv",
        company => "BIT",
        uid      => 5002,
        groups   => ['ring-users']
    }
    authorized_keys { "bit":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvPciyWewoUEGow3cSWVjOmFQEAlcsleDn4ZxIz3iPhjwzA5E4g06Dz9ODIO02Nj/Tgv4NzTswMPdVwA0Qep/BS2HLrpspyDiIcZo/xt2uWcKha4+xaplq34IjWh8HYqhaoM7hFHnZd8Z75v/JLH+BhOIKIveffQpHbfJQW7De4rEeZsDWDLixuP/I5M29TEbKVbQyRM0ZZJMsI4BTmIGI1sAf6CKX3gwXNCer+cl9+PE4gJhGBcMZfVpy5MpnpT7sT/P7lFBGqta9/+wtbiK0EwFQhHL7IlDGbzNlruPwKeEZUGaL0H3nB+on58U4H+/H5OnVNtfEVcL1kq/9dirSw== bart@bart-desktop_2",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAw49gy56iQ33B5X0KxKfMA+Q5+RMgJCbGTu0dGKUGNhBz4gYHiYrmjd/XHtTivMAWkHYOg5xYwRHxfyb/XQwhHcwFHmMAtFMANBN2JuYH5MdcaeoocCNyyQFMS/m7oBLaPk0qzdidU21K5rNH1DjRspfKcqKKDlr03V3Q8gYS4lJUfRZuxxrEkjkD2ZeHjm/iW0wCrF6czC+0mLTuD9DwQ4xfFDUsWp5wRgtcQoVt6rJz+JFyrf1KfUz+G2rTxTwwees4K6O+vG5teEy8FcHjEzULZzAX+uzfVEJ0xpTXw9zL518dahfd4Pnu5GkoTSqw9VHRoQt8sLA4xVT6t/a9KQ== jeroen@jeroen-desktop_11",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC49E7SOlQyUmlNEBz1aLibYvjOOJusYZDSXKzh5YsbbN4nlvExuPGYgVPyIrodwVqqFd6A3JbZItinEXhbW29D4JKg384zXgI+88ARYgsQSpZSwFsi7CMqT0fCDyPhkA4w3kV7sOR7HJGnCOsS5lKQsxELOdvX3HfI0Gzz8lcflsjyHw3JP6JuVLGwdkd8wMRn1GOEqcGZk7o17RIpbnsKcUfPdLC61coeyriC8tGubZhgi5sMXp2A640EVGRqVeiZAJeVTnho5J7HMPE0/PhvI5TWaqbhb/9xKvacoiEd/4Bal/18YQW5DGPYN1tX9mZBDiiv7V7gvL83d9T5AxGbp0im63l1UzoYF0ShySiRpGkYkJKpLwVq5D8CWt8v3ixP1IMDO8NhvcmFdZwGMdRP1X7HtbZPqs70ktXyrBTeIuswEgOjSkBM2vycF9zp85E0A6O6iCILWyOKU2bojeVPJdveE2NPm/9BK8GAp9fiiVUed/Rd7FtZy4r5WIRG+/WpXXSsoinrTCMqTmQyXK9IS1XTRuWtxJuaVdRIrUSvYY8EW8Ca80w7r/ewB9s9FWpeLds3C/tAxnoqejglKhulKj/86MsGkQBOjd7qwnERGiPb6XbFn21PDAqnkDQiF5RWcioykJmZL7rrttcC0CCwju4XkLJoedvZ4482kotaTw== sanders@sanders-desktop_8",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDER7oRSO1CTPBSOxf3wd8tefy0U8Bo/dihibd5vfnU8DIFeuXOrhG2sJPJ4sHTk/X4fIKmqyMFn+3xeyjX7mdyuUBdo6Iubx7yNJ26wci3mxiLFQCBUSSF+PMYZNO9722vwLSFepQryg9a4R8IQGM7GcXPiO4pPrGNXSLyH7yW0L+YwN83zYXqTh2zkvoFVNK/Nz1a/PtJ0hIGZ8ex91WEag+4sGWR/J78TrPVRgB4FNriHoAe35CtxKMJyXh3QN/IgG1rvNGtEdqhn30HFL9qN8vwlkOgl4S/eiZVMSEmPUzCoYn+KNri5rYfhq4BB0q3FOAAc+nnohGKBAprkd3R henkjan@henkjan-desktop_5",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDOFT2YQioHB+ddpeSxD047IPHmuNwkPEqf5m7lyKxN57ufjczOaraX1EkBNQaOUafKufnCdRu3Oy51EhB94byD21+a3alGvclGFHvyWeAV2b7njMr1udEfeLMcnp7hc+E4a7bqaGHkeHFiV4Ew8JsWhTJ57csVEeJwcqpAnQKpNp1Pfkw6hayTbpgIgYSCpt0NhxZlXMJCGK+dSyh2egC09gE27ECG/sGzW53EXRUakAj0iSD//UXoPlxoNIcnuPf5Fyv5mLIT6Ro8n8Rd6rZQwUUEkBW351aQnExOxq4yJhh/swTXf3Jh0tB/lUoQMafueosGhPy7kCjeqtHGWyzd emil@barabas_4",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDHb8X3MsA1cih97yYhgpvMcROsuoTSemTWkuROeP+7RnByq3gf1d3z3QdEAmRDBizxdxNEqlAmKwIoKUuKYNho0ZYPHhRee1NzlzX3eQlQUyUvGi5IEDojIqXYgwPlqlsbrZjljeikgWvCh0lJYJFofT4VaDvyRiMQ9ps454Fxnd27ZC0lFDYfkHzRMm2OgDk5hBbJvHbK7WWe+zg5mJSr4b3+u1SF43d3r5wVS/c0Wp3zsLm09CfD334dP7HWJRX/YwGud5qUkSQ9mNd1fqxU5YR0DqkGL/Sf16oXRnkWbnkaF6gdPTylZx0/oistOs5KmZIxveIjS+6GU97ttSKkjEde4hui/rzYLqp7XDlVuBKufmIwRLhTGv44Nhcb6XywVeejt55mbT4FP94ESL1q+8vF+QIJEl6c7H4ky+CtjzXmUUPhm428SX/WhD1L1eiA+zWqEX0ojHXLRf2odOLQl/xUGOlr4VYqLAyjDOPfJJ59nQvLbc/jXwUnDx6DR9+NFcc/ts6MHPjAk+QY2anrkhxL8SCrwJ8pmYIbZxgniydUJSVSB/Q74JR3gsUVBH3oFqdeRqa7CdZRL3bib+wyoyKoWa9VU5gnP2OtbuE7oi0h0ljgF/yBO5I50sdCI4L42IEDa8Wgond7Z0GrWJY0TxPUQLvDy0rUFc4ZOQ9AMQ== juul@juul-desktop_6",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQD/B7hN9IjjWrIwpxzm9j/1ukC9CNk42b2Bki/Og2C2W67B7aQ2ZHcjuzfzm6lswJYOEub6lhwXr2KMeN/BBWQvAsUgW4V3dO6Ps696SLmNVWcMNByOEOTB8NmOMYibvHvadBaxwxkfC0VUxuiYflkH6ZGe9W5q1x3jAP/X3N7g1eyb6ux/QaPZpVESt/EeLHArXgqRWPei4RHHzpMYekleRzA42hEvz/g6a2uwDriayWrKY4+cwFEbDgSu985R7b2vnCYWvgAJxhEW2UhRiJ85KkxBaGqCA2xWH9Ur4njVSt3qU4x1pQnRxo9OVU2G0d9GQZkJnCfXc5qRHQxcAZOK6KuwfQdiEcgAfVyboEitwNp85QZ1z0rItNZBEEs6SJm5a/XXQMRlm04QRqxpCDxHv5EW4dpXT+pAk6mJaFFBNVPafU0G93JpksIb7JZkgneZEJfz0W0urvLeAnKTzAS1zKvIQG//LpxIqM3KYn3bJ96XgRuKCi8dYJn558+ilAZM94LWyGAOVwkJG1p1m5zSPUUMvezGCX0z74IEkVShooti1mubDqjTS8v8cb6sz2BbJr5wZpfwbfbSra5zK6S6JjYMR5M0Lzc+B4/u3azFeV/2mF0h3tvN8WiwJklPZbhjzh5IYyiEfoKSGTd3n0il56g3nCMMLnFoBLVVGxsq9Q== teun@moridin_10",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDoM+7T5UcLV5WMJkSPabmBo22KqTyEC5/Sl5C4sW3ILLxDqBHGwnbaRGsWR96lr5Hj8kgS3eWFJrezLWVOedMWlrZo/VBfE8Yp6XgeaNkOy8zQcZfl/vJhvgAOJo/XFaUtjNk5CaVCOB+xIySJaW3J9jAp4xlYNcLYr3/zfUDg6BRZQWdQ5ugfVOr8NavlSjfvrP55eLIQG+lOZ6oyJF65Xbr+D6Y+JFE0TrMhceRLvgvej2FoERI5is/IHxjziCarbRhbWVXjtIzbZSMPFOsPeVgUydlmW9ydSbZMC9xL1UIB9eP/HP/UsEvzq39e7qVbmqJcRB+UNYxNhpVAeP7V stefan@toaster_9",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7CGyitVWr65+iEhd81EIkodA1gac2MiymTvcXTYkxINrn6NgkTI/lxn1zGzar7dpFvzhXV5KSvd2JBvYEef9cyZ8qXiu4NrM8gq4QC5PbMvXxywnOV7iV5e3WsyD6iyaRaFuKmPs3cKqNcbCDjZWsYQZFhKfM2nSOe5+ULUU3IGx5GNhRwFVEhfTrjOdE1bBRIkrSRQBS4Em9PFERNEgvasu41i8cD9w0Gb0UY0jqc1pNRHSH8fLku+z/BldXHrh8mud15aRQkzSoPBsTDeGJmRDKu7UgYVW4vPm9wPdm3XoaLrI7eCLj5nYH4Yo+6ekv9lIuJczbdgYEyWG1bShv martijn@martijn-desktop_7",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAPSRFg5L56QJeAIrpikLx/aL1KqVYzjJFv5ohCRoP+4dyumENiD5cLEFnaFAGUtDuh6jbrO/WdB5mEubzvflJ33THy84Q51X6k8G24cW0OUq3uaQoBA/Gk6im2DnR73mXMshHNNSNBNDNN59d2R+4WZXTwyeZ6ySILhPADAVFj+nAAAAFQCTVhSYvyEISXFuTM42Fx5fUR5bSwAAAIEA8fMMfZLr24x6yiVsSvqWYkbi5Ok+Y99g5CweDHqJnMmbAZpAemeGFhEJ0qevtuqUBfvi+iTKNgeFzynIRpWwHdqPReQkufX0XjU2nzRIxqIIff2Saw7fi9BH+MMtexcNHyBKWz9EKuZtnx+evx5sywRTN6AooN0VhVchlpwEqKcAAACBALjUeTrkQL0gyl3yILJVDlD9s/z2kF7Y7MQWmDSrhUbcM1Mu2x8CHKefVQj/ESruPs2OuvuCjQhnKPht4EWG6MBKgnZGYBo6mz055DFoaFmyMUdqlWHJXMXFCF49v8RZsYuLp0J6c+AsLY+uWXV2Ci8EaP90zDCiybX+i9xa0AzI bastiaan@bastiaan-desktop_3",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsYQIwIqJkv/6zKIwpRtR+shc0PlQRvKc7HGbYqczIfJsPkQfK7piU5ImZe4Lii4eEb16d5cTPubIELbUL1AmYntYxapRAVowk67bEw2uEFuovWby+pBVvLQ+gYQrCjbEsWx+FlMVJlhpicLweA5TSB7+lKZLE1Bp82wEwZnyo5qMR8pAMeOShnRxqE9MLI/rBbaDLcNPkgyWkS/Kl5WfJx0mq3bXx9ViRvpVKLx0k7Kd9AKNVKtIPvn8tGjI7fIxh98cIBGaBd0qUcT0SuXrOT+A0QE1VuyPWhSNwgkevAyb1ZYFOFQ+Id6nbM+6TgLZJnDyQIkz4Dh5w8rf6HseZ alex@vali_1",
        ],
    }
##### END bit #####

##### BEGIN coloclue #####

    add_user { coloclue:
        email   => "routers@coloclue.net",
        company => "Netwerkvereniging Coloclue",
        uid     => 5003,
        groups  => ['ring-users']
    }
    authorized_keys { "coloclue":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA3gqVHURqyVTzzjUjgMXeCJfUi1VtLnUqIr166az2wNUTgnuxLLLsa1evPz7mfDJwY36UKi5IcUuC9pf1B9q2vD6o1fLrrd4sviGQZsvSrGuJkMEvIhXM8JtKxpwbEgg/3vCPPUV4cfjBqeNJeo2r6vru6oOHOdFuGJO5vDtDG/EmuQVgMirTWvjlONKWqEGxz/5BTnDX8PGZ5dEryAdtXrhvf1wYqWcQCkh+ZSgBqq7Vv4Chfzeo7P2iIPi4SAoz6j3pDRNQDzPu2r1cMDPqZCPeTVR0+P6+NpIVo5xlxops6NsJPEwxYhhMYc9OsNvR58JII6G5Z2T2/0LZFeVmEQ== weerd@weirdnet.nl",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEArwx5A1fV4Exd1uAWMXo/TC0tmMqhexSjpiUwJS9iI1+DsVU5MarlvPp12JTc9V7cYGwsIqRCWtXmxiS9yB0Ro70pTMMckyjRtFeyoxhVD9wjEX8o5UHAZ8xWSHShMQKm8TZzDmisCb1KwfrCbRZgBA+Km6TgMeUhTUSuhyELu6h2OBhwvpDAhWmPXOVKD4RnSU+z3hqgEe6R57idvNOQJRVVks05a4gM49gX/JYRzbNPWveb8OkyAvxNjYy15PHDa/5L3fMILxy2AQBo5GaNJUE1obxXhCACiDSYUpI01XfCVBnUELaYepp0++VuZKJp16Yd0sAZ6olpjZhEAcrrkw== niels@alphix.local",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAwcJ6MwiRbbWDvydgiuNJRSiI41AE15Mccp31zPEcHv5yfm6aotJZ9XyhLOCRwkA0uUICfjQt+WXkwllO1K/c8HVHDlxYsPnxyu0l3SLB9XmJs29/onx/vSOWgST8olRvoBoMp5kgkoN4blSIvlq6LAF4rZZAbuqyh5BmE6M98ZznnV18x+5YwAhQgazfEWBMs70hO25OcnIqgEHbSoW1wOoZQSnJkaQPODKbnVJlG7W9WT4iW2gauJMG0J/KFG3uiQ69EqCnxMVQQGQoBnQ7fo/GUvQdbYxFKoUZ3pAIBd7sizP8UqijhLCDoSQE6/AwxX5BzxVDx7MWzc4JZjx2WQ== job@instituut.net",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAMg580Z4SL2KWtPNeicc/Zhiwqrd3iNAeAIl3mXosTEI+CvinILL7+e7VasJhhxi+6gPPu4QPdROeRHwVESMFCjYYU0c9kfU8Da2RnZpZGnzRicGw8QD5jxNTUw7SVLN0zzpFwufHLMW8OM0Yv8fScGjwcepRvmRITyxKNv98mM1AAAAFQCDh0IVU9ta32oQu0d99IH96AeXLQAAAIEAtqGVhCHqezk+aPfW1wYLZzv0OgND6hFjeO73hC09oxBRlgFBxEAyjz//pV4afFBjuXXd7M6HrWdBMs/toTnWpYugHE8fMl156fVw0sjWW2Qsdwtv646Axauo+LPAxBXg6Eb3614015FwMQz3MoKdgphCJXHGNZXW+xtar96GJ3YAAACBALteS4ciNfuvHAN8qIEkvX6fNVgcQVkpfpfX4Ywt70o5m1Wd/6gb855dXw4A/Zy8m0oYadbE0KyGJVZ+XMWxyTVwjrwge3wPJ/M8aKkLI038Hl7TTzzYbJoZ5L1KZmeR6Vzy0u3bw/YpAXSG3f+Zfir3J+KZpFSUIih0K5MrpeBM evharten@macbook-pro-van-evert-van-harten.local_1",
        ],
    }
##### END coloclue #####

##### BEGIN widexs #####

    add_user { widexs:
        email    => "noc@widexs.nl",
        company => "WideXS",
        uid      => 5004,
        groups   => ['ring-users']
    }
    authorized_keys { "widexs":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEAk8OfxbPvTG5y9tFuhVOHcjomRewB92D8zN67mpX2/Nh4t0wyJINuu4oHDuJE+FVsULDR4NpwifyxaYaNE8uNPrIiqmjrYcnmhMxDcNk5S6PLJ/0klslzbnJ/KZO6aXGVvZF3/JtiKFktkBqBKtrOrYAFDuFEZUTMO8a5xpHp1W03R7sYw954fLiZaWLf4tYYzmVAwqP0EuBxw6qLgMZNEymlqCCIDdQRx3gxGpHWh3owY5H6OwBq3OGZuKYMMpD2GRC1+SQZcQpycTPF3HsSWHYwEmLmmy/HSRBF1/svt7dYnwqZg0c86yHk2mcVf/jSZ7lAo5pgXMFEQcAs+8uLlK2Ru9aOYzxeqtnee8uDhFyfnjjwCXWXb6d8eICNsO3CPrYyIcm33Zs2ez2VF13EaT9ZbmlFBcn6D6fThUj0Ea7iP74hCgLd4W5s8z5wX+Zx8nVmKiKtMmJU5YQaXL/z9XQ4SzRnB0yuMjl4F9/z3hnWzavj5sSrMdoxK/S6t/WmETUSJf8Oq4TyLBd6GFggn7drrUr0EAREk/tXwakOG+zLfZuZOIxu/7fU2uOdgYJ5/U6UBHqHhjVp6DdrMCnXYn+vvvnpAhiJNm9pY8QTpNj54Nkki9ET6CWv3ZPMS1QEq1z3vgZxFMQm9+OIbhqcQF1r9t6ZMT325GfWe/m2zHU= wouter@widexs",
        ],
    }
##### END widexs #####

##### BEGIN xlshosting #####

    add_user { xlshosting:
        email    => "noc@xlshosting.nl",
        company => "XLSHostin BV",
        uid      => 5005,
        groups   => ['ring-users']
    }
    authorized_keys { "xlshosting":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEAzZcxnNSBqocQVE830nX4k8Mx3LNDFvOsDWezhon5zy8LKu09nACOnQYPTqGAADqDr5lrq8X9Hme0RKrThltMrihugR4yw8kTVl7C/ISazdlzn0EnaZpQ+H3bgbvzp9Ba5WmpPGx7b/YKROEZeADfga3TEARhj5ZsFutuerQE4LVpVc8iXQwjTVziHCPH/ezKyGa4CmH707qQTRMTFQW/bEcvlUqk+0KJTGKBaiPXZ9vVODDTjmgStiDkc3Rn4il6ifGlWBakm4ky6Md26cGzQWli8ABWOGswpunPNboNEgmQsuI7ifVA/OO73UNucho1g1FNT+33AfhCK9o6Vpztx3seun7rbGMNrv7y4ROe63yh8PeUbF3Sf0GdyB1KmCL+qFMaVOAuKnSzxpsBMUFycXdncrUmVXzdrzb1aXRhE9+FascA5KG6dGirhxgl7Jxk1P9TWtav/swAkJN54JwLM99a8T8EOC7N651y1sNZ32gDrOsXVIIxDArRoj084ZCnLxYScoXUw9qqZStTL/a90O5CTkl4jV6T+OwftHAnqmtrgHlc7vkOFbkGfB0QPu+Wzl0+mTZus9csrvzGAeSpUJXgDniL7Bebd3fWpEaYnB2UViAV7D2U259mMHmrmcAh3BZiZQBMoeDSo2l7Kwi4To0dKa8T/bq4XJwBRgpODGE= root@jumphost.xlshosting.nl",
        ],
    }
##### END xlshosting #####

##### BEGIN interconnect #####

    add_user { interconnect:
        email    => "noc@interconnect.nl",
        company => "Interconnect",
        uid      => 5006,
        groups   => ['ring-users']
    }
    authorized_keys { "interconnect":
        sshkeys => [
            "ssh-dss AAAAB3NzaC1kc3MAAACBAL/dFf7qvalf0XqAm8bAB7/VtQEbMxzMHyQV9682MXiin3/k0XWwFplg0+Eem7cyFNyLW8N3I8xsLFgrBzaH0W8OtfeW3/Vp6tVsBkSL/11mZWdon4ZQSl8gBqFcaiprqD1LaQhYvRdCQA0hvzRIOe9MxHK1rmUQPHYS1RCmWzcPAAAAFQDo38eE3Vhd2+ZFDui8AN8o1pZw7wAAAIEAk7bh+NAU0TN+ktgnLl5oDTcGcoxdm7pjlfcY0FQoYfLNLk3fWU0SMqdAjkp3Mdg4b68slJxG6usjqvbFydVTRYbBXIQBkrseG73DQA63LNmrQIA1kz3DdqUi8vqZtX+QVLrNb8pt/0NVmSvUc3EAAx7N7BgKdTGOJNoATsrPdEkAAACAYLLpo4BH4Huf3QmFC6D91nkQh1m3EwgyDxHx2mD+NoeQUlnl4/rzhhTqQ3wFtgd9ia+86bFr4wIN4f0TFjgXd6Mcdhn7swQMT5fttfvhgrb/bD6kDSE+8PZrfExgUEhw6plPvLi22tCBgAJ+Jfao5dmz9IWMU/G1RIJSyXAKtOw= interconnect@pjotr.interconnect.nl",
        ],
    }
##### END interconnect #####

##### BEGIN cambrium #####

    add_user { cambrium:
        email    => "noc@cambrium.nl",
        company => "Cambrium",
        uid      => 5007,
        groups   => ['ring-users']
    }
    authorized_keys { "cambrium":
        sshkeys => [
            "ssh-dss AAAAB3NzaC1kc3MAAACBANnnPEOmV/40/HvwU+Xr5kkEF2CtJ15ZlYFfFDYqPSxEvXKwdUW4LL++SWj9YTi6sEEppH1t/0oSLwq/RXs6uey1pBnDMcikLIPuF5xmh3dc1yr38cLefD/1VfncXIfBpajjzb5gyhvGAMwCednKttOS6HMFYhj4XK8x7XF3R1dNAAAAFQDWRIJVFVQr9Rizit+exU3uH0ZWuwAAAIBXVZNjdibQ0blGrsNAH/pz2yPvtRZDFlUHHkLlT41pj+JitoIW/zPrBcELTRl3Bn9hPrMhs+arfT7wPMCwtUhu9RM23H0AY8A6iWMd+MAjyuRVnbKm/t5UY+9OeSGmhY0VmSd1VmgtL1WFW2Z8JruDU+SKobBs+FAnAPOVyetXogAAAIBu3pU9tLu7VZh96MqTYAOsnhkFdhcSemgQDtgWhvWN4sOah+g2i0VuqPC2G2bRpiiJO2Zu6Y6OguA46Ie6l1PCcm1I799vqe5545JKUGi3rS50lX3udH5j68twbvSTpniTMQzaGUdKB67rWBsSABKawWc75f1ifJa1eUdHxfoQxg== cambrium@cambrium01.ring.nlnog.net",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAwreIddtAA7ONovBfx2Uxt1ZA18aTomnFuynzmi/NOD+BdCHCO0xfUPyYjEPf5+R8iuNBSrjDscMKMFIO2nHShmNFueuCyCvWOYhLCFEEFA1SlmzGa3grAnNqNH71sru7igc30qtAi6/BTO591kvzB+qatxQcO2AEsxALu8aPwRk= /home/staff/johan/.ssh/id_rsa",
            "ssh-dss AAAAB3NzaC1kc3MAAACBANnnPEOmV/40/HvwU+Xr5kkEF2CtJ15ZlYFfFDYqPSxEvXKwdUW4LL++SWj9YTi6sEEppH1t/0oSLwq/RXs6uey1pBnDMcikLIPuF5xmh3dc1yr38cLefD/1VfncXIfBpajjzb5gyhvGAMwCednKttOS6HMFYhj4XK8x7XF3R1dNAAAAFQDWRIJVFVQr9Rizit+exU3uH0ZWuwAAAIBXVZNjdibQ0blGrsNAH/pz2yPvtRZDFlUHHkLlT41pj+JitoIW/zPrBcELTRl3Bn9hPrMhs+arfT7wPMCwtUhu9RM23H0AY8A6iWMd+MAjyuRVnbKm/t5UY+9OeSGmhY0VmSd1VmgtL1WFW2Z8JruDU+SKobBs+FAnAPOVyetXogAAAIBu3pU9tLu7VZh96MqTYAOsnhkFdhcSemgQDtgWhvWN4sOah+g2i0VuqPC2G2bRpiiJO2Zu6Y6OguA46Ie6l1PCcm1I799vqe5545JKUGi3rS50lX3udH5j68twbvSTpniTMQzaGUdKB67rWBsSABKawWc75f1ifJa1eUdHxfoQxg== cambrium@cambrium01.ring.nlnog.net-dss",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAKwq1BcTcA1Nrw78Kn2/7Y5cL9LR4dOODqMT00z3hFbOdpc8NF9ashJTdv4SvfQLOwbw+FbxNM9Ew2rIEZNNg86Gh76mzKIURnZ7CIxg8Msh8sm6TNc5SBYxNSkqpEJOfP+PnEjEAMtkT/InbNq++WohQNxc7kI2ZyRxLoiujCH1AAAAFQDXnhxAUR6VyxYxDNZE++DE9St+YwAAAIAMjzRnrML3nSGrG4p+llH9tZTOIPnHOycydAhKk1TEY+plWyG+0nw/F/BpmmdaZtcsSqxy3SLPy12SOeuFnMlgCWYs8VNF+NP9f5gOljrQw+llbi+bChnkH4XYC9V+YHwytCoaw3ahFVdo8KoulprMpU7MWf6v/P0hOhwlqYB0WAAAAIAd2LVhmWt48Cz3qczyVbMuvLtH+pXotDxrK49LwiTCYPH6Id2uy5laDGt9hjRzjWXKNaG1NY4hjwnIraQSREAEBMz15+NVg0/kKMT10LiD7FwtSP02nvRVy7DTgZenpXy8xrEHKtz6NgmkfYyqWeF3AwTm94vEp/zhtCOhIDq/Sg== /home/staff/johan/.ssh/id_dsa",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAougxtaZAyGf1Hk5gZxUs6VSSaV+cquTW9hrX3Cc1g1sNrNj4Z2PjAnY9L4JDjhcQ9yegg8I/x459gYh22TuEEkzNpxou1N2PSXFPj4vu9eIRyAVaGPbRJLJRCJdjdUNo/xcpprxCYm6i+sqf4zoKTHOWA7eKxETqM2Mg1F17ANc= /home/markvh/.ssh/id_rsa",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKfxXPpw9mx4RHu7Bo3bZEz14qafCLyQz3zsug3fBRXSW5FlxZ+omJOYPLWUShl0cIPwJ0Ea7IKgJYKIg2IzlwwB5TU3fJ8BciydWqhwHl2ZZFwofVHCBQjmTBj0tag6O2SNX3mVgyODxP56pBcXbWJpvc2KJsQhkzpS/7vXBprO6urvhVsOFUTTIJSKICvaHX0FJnmSwHqtVfTNNtBDNp26XgT4DfjeSgtkDKUzAA0mka28lhq3Uj3dKBzZ9Y4xIHiw+eQgStRkVoc9usjeph1p+GSN12w2su5s7rXO0ncG0DEdEs03k5sO0CpZ4Le/pnWDWKRCrWBTtQ6yEXdgPf cambrium@cambrium01.ring.nlnog.net-rsa",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC0euDuFc4u7eoEocqByrMAwFN1F80wKpv5ckRGgbKupYk1Jig458/qkjoktjmvKRAfq2RCvme9ta97DmcvQJ7yuaXP4h748neM4zOTgipX3KGPWUQ+Ejn5EuGOt2m7RbkOFVszoZMYK5YNjalnbbuoJzT7MzahxOrYKNE13GbeoXPM30IgEv/jAg8k8iDK7pAmKknXbZg1HQB7SLc4CvhofpV7XJzR6KK1pvZrm7hRJeW9hV0gf8OmpCO+LXqpVqQiSko6ciuTUS5GVsU+ynyHH+YV5srqlLkM/6R28LP1zhrJQdFHbciWNVIqbUA5W9m7go7kY9VoactRKVBuYWzV larsgn@atari",
        ],
    }
##### END cambrium #####

##### BEGIN zylon #####

    add_user { zylon:
        email    => "smite@zylon.net",
        company => "Zylon",
        uid      => 5008,
        groups   => ['ring-users']
    }
    authorized_keys { "zylon":
        sshkeys => [
            "ssh-dss AAAAB3NzaC1kc3MAAACBAKfdyrV1X4PvcSvGKFW9sMSLXqGzaUOrQFQIAceg/tl+GZKkL8EPMSLW19aoORupsuJhQMIv4Qqe2oFITl12R6AUnzbcTb65B+YK/3dpMmzBce5IpADUdTyLVzQSiGUF5gsfw8C79fLAkgBi6JXwbVDewzqnQ17XX1qc11R0sMZNAAAAFQCWZNFJhB4e+ml9KI7d2XEVrMR3oQAAAIBuPk7yGJc4tgoCZKcQUUiXDS9jyv9YuNUkvCWKBtzgJjcRmtrF4b5ntOqI6mEnuMGUBznzFcGI9mCUQHnfb/kpLL6QSzcLpTCfNXHTevA1aeG3hrIEXnYvbh2R4IpXPjp6kN1/HUfJLHYzn4svfXXZ921cmoa7iT86M4/TWKH0kwAAAIA/IYO8R6PA1B42uqiSNVbklvrecua1hKexlG7JO0WitowKQVmArKe9o8uO+2ri7k5DXGlPLNpoc3OqEWo8GOG3YMtQjEW2MUblBVlAMN7bFLj+DZSqBrEdiFZnZ/azElpH08m+ojMI0yzObGqhrnEodCkYDYi5LgVXXrOMiMFnmQ== smite@zylon.net",
        ],
    } 
##### END zylon #####
    
##### BEGIN duocast #####    
    
    add_user { duocast:
        email   => "noc@duocast.net",
        company => "Duocast",
        uid     => 5009,
        groups  => ['ring-users']
    }
    authorized_keys { "duocast":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAghMY9EavxopexZ0HhJvzDYBdIvcf4iBPzvfLrYshuF4keakyugfQ6mob2qlssVIAztJRrQfUDtgvNGKxOFrCzV9vXwf5bJUbCPbUIoSQTdoSBzwl31Q6dHpYBc5jQ5Xmez8wcc0dtxdMun+/eVOVG+ErghC8jpoCVQrwu5ikc2E= fabian@fabian.office.duocast.nl",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAghMY9EavxopexZ0HhJvzDYBdIvcf4iBPzvfLrYshuF4keakyugfQ6mob2qlssVIAztJRrQfUDtgvNGKxOFrCzV9vXwf5bJUbCPbUIoSQTdoSBzwl31Q6dHpYBc5jQ5Xmez8wcc0dtxdMun+/eVOVG+ErghC8jpoCVQrwu5ikc2E= fabian@fabian.office.duocast.nl_1",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAOgxMrwySYHnOnrmMzUW60uU/wwVCNBZ10rvBpKCHUX7ix53wTHnDm8R0SbxswimdeoRFL9CM172Q4b4xnUZw/GsPewoVRoz2gphU4cXiTbrPpd9Ysq4jSrtJCS/ZsixsUPiivd1tAMHb3hmfNarj7rZPotnUslK1zgmmxqJDKzPAAAAFQC1RqG0hmsrnrusWTJvcgG+5D0ISQAAAIAHNW3sNneWyjri0f+hJ7zq7JcdPq+/pHO7XZDQjoLSfIUxxRZxsjTDjnfLfTbPNwlC9UiSE3Zc6y0DGWBVWQyDewzANJItQVb8tQC/snkZMtAVq8SApreoQtUgc39ZNPRMPOm8ROgH2GsHCt3AIn9Fj18TO2sSJw7MFJnTjRGCiwAAAIEAkCuxqpfHoi5R7HPWW1X2GfswAK4DVmIdPT5kqlqdPmAmm8IJ5Ifxcfd48/UeBq6cjFNRTxwjW14dFlHTUxNPUIEKXyXyb/whDQjPtvHSMP6D/h/P+nUPUK5bwHGaZ4TLKnIzEzj2htO4iBwz7PjTK2upMVvoQr2orBKuz4tnk14= tozz@duocast_2",
        ],
    }
##### END duocast #####
    
##### BEGIN easyhosting #####

    add_user { easyhosting:
        email   => "systeembeheer@easyhosting.nl",
        company => "Easyhosting",
        uid     => 5010,
        groups  => ['ring-users']
    }
    authorized_keys { "easyhosting":
        sshkeys => [
            "ssh-dss AAAAB3NzaC1kc3MAAACBALEAhT8vTvMAkAj+Uk0PrGh13BBWDzWlJs8vuWf5xK/7KF5sR2VHKBYmOJ67pGtRc5i+NOkhj8sWjvF3uyVupwTUICUqTpeBLI5R/P/jB5lUeiYVZF3HzV+gDSIalijjY7yZrP35CviZvuyP5Ntr+eSFNCkgqcAKZpphmDHPAASDAAAAFQC5GbXzD7xPYH0kI7+hOjyoSBdW+QAAAIEAgAAI4tMDOkDlfJCbQfDjPMcHsGN7HNxpz9obx1cbJdZOBOGd3fWsYlQmOO/NBvVDRuaQ/JRXzvxP9BKtf7TEu7icWU4Q6PECR7Z4NpgWX2amVuMy2ol0Bs2bcnbM3UHa06IgLX17KaE+Jor0utr9SHMPFClS2doKsTnuuzRQZFoAAACAMiWkNW7j//w3kih64KBvnozjrvDGj5hVyvMq7PZEjwhe2+vx8ErY+af4SnP/a3j1wyTLwMMxDr2+c7143ZRBil5Fmgr9YuPe3OQyx/zZ2AJmCQiWQiZ1EDvMFPl4gcD8XWH6RG+zs21uGLwSShthWUMclTULBIZqUbMA80bJdx0= systeembeheer@easyhosting.nl",
        ],
    }
##### END easyhosting #####
    
##### BEGIN previder #####

    add_user { previder:
        email   => "noc@previder.net",
        company => "Previder",
        uid     => 5011,
        groups  => ['ring-users']
    }
    authorized_keys { "previder":
        sshkeys => [
            "ssh-dss AAAAB3NzaC1kc3MAAACBAOmrANjEYNBp3+yxYd6T/x0Pe45kAKfQ/rnM256Vd1ytV6LbbHUXPizQjVy/40rA7Vem/uux+9Cw42IX2ss62TFx2JSbQVcp3HxPvW/FXd55r2kSVvARI35OYUWU6KQWH3f8zrFvDtMTkpK/GiB1hB8WJIMMtZZP64r5zyqsi5abAAAAFQDoRLfZtdES20c6SCYHGOtEn1ZVPQAAAIEAr8hFL7oZCs8JRTzVJtW6qp9h/j1cFlTFHDACRy3dN8VWIJUt5+PQss9xfD+0ACobqOo6N41qxvWE6JEfchd0Aeqwx2Jie70eorj7uJKUTjVDFGx5S7T5ZRq3czXlfckzo/xRI5l0nN3kt09wp4G1zXiBmPiK+GwVF06uHSbJelIAAACAXxiOe9j62EgoxRgregDNp32s5lxVFbSGqpsxLOsddMBOB98pa50NluvZEaUwRLv8kK6+YgT4WI/q3DcWwEVXY/ZUP0IDpUmtA8PUQyouy2lBWik746GqN+Re8b5NjO6OwuNfH8bTb1HllFzc339O8+KOHN11t10VMyXzEIo1sk4= robin@previder.net",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAsNdT8O09tlD93dRZS3bHxGeSwMlO9n/+ZaHlOXeLtnGd9IvNVe+4UxEcXNK7hHgkJrthhlhT/TEQN6irawfRANZw82HprEjQXOOWKprPXUKqhoGfkBI0FV+t+AzuLxH2gDsDQ/A7aQteKoAJYE4rT1nO6nDJM+/bAosSYBCFANU= nick@mustang.introweb.nl",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEA6inD1YOQCwDt7u4EJiMkSWhaC/qlatyExWaO0gpY+cKH3rsGxzibLDpn06f3luBP4fhKPJt5QTNR8jqjrCdmjVqBX1Ox8rp1g+JYW4r69Prwoi1og6FVHQGjT+1sLwoVGDOh+ZhY9Ef8VHpfh7QCkHxv8SEsEFTtlzxMAOwxCkE= edwin@mustang.introweb.nl",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAOzn7W2wplWml+5zK0GyuRUxzI6EZcU968fRv7ZhlH9STOBxl7RwBf5Zy8/ZWmj4BYe2tfzZO4q9XvIn/6pLwTaA1o3ICsChT5/QzoYQRkLXWZXE5Z0eoqqUxGRSzUUkB9/nBmBCbimiW/lhKAsq7W3Evwy/5bjmiW/7rkV/KnFJAAAAFQD181lTWLMEgnH3WdbJawJyjdO3lwAAAIEAp2wRg4UAoIMdwk4GOqUdJZ+VcP3XvefG26unLbbc8cxfusb5t4nP10zGIa3ahya0i3E7NYj7vu7D1igtJdYHU6DTPDoXztz5apikoHgEitt+2cz+TFENwnTkIHztQ6GKjrI8BW2XpAFYBGaKxpuhSxwGQGr0kqq7MDf40jNv8SwAAACBAKgZqhEiTRgCxffmM5Dy931IK6bL3K9Tl3wXYWCaX6Wc3H+jGCZifJHxINdM1VHPAhoNeO/ExIusM1CrY8NvxXP5xkru+jlqem3ciVNN4s8dcDuvk/3aLM62Bq5qhaYfcwOHBwya5FRIbIzGYXkxr9Xd5059ua6wUnNEJU+dhcRs erik@mustang.introweb.nl",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAOzn7W2wplWml+5zK0GyuRUxzI6EZcU968fRv7ZhlH9STOBxl7RwBf5Zy8/ZWmj4BYe2tfzZO4q9XvIn/6pLwTaA1o3ICsChT5/QzoYQRkLXWZXE5Z0eoqqUxGRSzUUkB9/nBmBCbimiW/lhKAsq7W3Evwy/5bjmiW/7rkV/KnFJAAAAFQD181lTWLMEgnH3WdbJawJyjdO3lwAAAIEAp2wRg4UAoIMdwk4GOqUdJZ+VcP3XvefG26unLbbc8cxfusb5t4nP10zGIa3ahya0i3E7NYj7vu7D1igtJdYHU6DTPDoXztz5apikoHgEitt+2cz+TFENwnTkIHztQ6GKjrI8BW2XpAFYBGaKxpuhSxwGQGr0kqq7MDf40jNv8SwAAACBAKgZqhEiTRgCxffmM5Dy931IK6bL3K9Tl3wXYWCaX6Wc3H+jGCZifJHxINdM1VHPAhoNeO/ExIusM1CrY8NvxXP5xkru+jlqem3ciVNN4s8dcDuvk/3aLM62Bq5qhaYfcwOHBwya5FRIbIzGYXkxr9Xd5059ua6wUnNEJU+dhcRs erik@mustang.introweb.nl",
        ],
    }
##### END previder #####
    
##### BEGIN leaseweb #####

    add_user { leaseweb:
        email   => "noc@leaseweb.com",
        company => "Leaseweb BV",
        uid     => 5012,
        groups  => ['ring-users']
    }
    authorized_keys { "leaseweb":
        sshkeys => [
            "ssh-dss AAAAB3NzaC1kc3MAAACBAKrXxLnA6hi7ppZZHOwILVmMmG02n8tRGdgHXxuhYgyEoaEAVJrBPvdziYGSc1MLSXlXtmm+XL8uDMQTnqwb3YZiKKW8v65Se35GdWr1Uf3Gk2jF/M7lq6zR2ji/d7iFq5zUHSEWGOYDz73feDNhJu568k5j/WLSxaV0m9Z7lsdTAAAAFQCeSCQTuWFZVtQYezeFDwDpOf0OlwAAAIB/AlZANZgGYBIsruBaYXseU1jfHm4e5xNGJBmFUtrqLgi09xq+kYpCQITCpPd6eE3MLJ2JylW/o3tlREtvDU/oZDnfG8DgVIz2rtjQ7RkeVH0Wh60CrXn9wV01s/5ih9ISO6ECMV4vr3KWX9XgmQFG91YqXTdcnmHwuYZUeQLQ0AAAAIA4h0zTpnycHcmW2Bfwkor0X2mHdNSZad3+wEx3Bf4DE8VpXMNbJcYgyZ0STbvmGwyAnLZ78qe0+Id0ywkTRXtFd7GNoI02qMnQgBfgZDCcwxHxlcG4v9iI/arCCMGibIWf1Fzog/TYGiJIPExB5WE7G0G3U9jKnxQh3zxG2vtUHA== bas@louise.frogerstraat.nl",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAkCgRUkL3e3vm1UO+mQMYhnxdjOavmZXBeBWQO5X9T0y7uj70M+bX/Z3lhOF4Lq0VX4UL8UEfRy/aYa6zxv+SmUsvrPs4Lgo+yeLAVR+zxnZLjsch6r6zFV6+v4dPfKJUO+58bI69+gIUctuczwQn9nvmp76uPbsTvGXVdbtuwzc= GJA",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA2oT8VUGJb2Y0HtFzLBJ5z/mIUftYlQwdlk7/9O1GHCXgKE5cgUI8tH84wfMNMAVBQc+oJbUZkHDQvmc+bmUs+rSSwsUEo/y4obt2TwjpMqZHhX2PWAk+xjFB4GaFxiqriWqk6HYSC9N3DaBjpC6l8MSGpvvrcA7ZBHx+nt7jVA+f1zhd+FMDWelS/+Y6W9VGYzTmOPpvHYx+r9a7zwdsbVzJ/SEGKqyae00/Ke18lbjhSCy2nxbvli+dvZLuiq+XS7XHk7rR7b5LG6z2YjRZ2HnMsViEIomuzDisZ9XeXefAQZtUJbC+rbQ6XTwqlLLl3MW8agjdzplK5+3Y2nnh+Q== KDE",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAzBtWuVoHct4fH+EXBBq+OUNxjP7jIamG9Qomf9cdiUDDiUsvM8umbk1s8zRkT+7gZxUDwX/qyr1066P50/OV76J5clMYGeYPUbJBL8wBi2CmokK2EoWk629FlDoZq9eF82coi0mULJ6Poux45t1dcF8lbJE7SJRG6gVYQbYw78pJ652U4Y1wa3OzdmcWGJcc8vAlbZ6Cg0kDfzTeRscdSbQsd0PTAKHyr1G8uEQEGJTekksJ1SFHcGIvnl3uR/i3V8pNa7s/bY+ftTs+ZuruOOEuhbGaaGfKbwd6Q0Df/YUJ4fG08H2P1uELcnE8FWnEyAV1XwCu3b0F1Xiexsbe0Q== VLB",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAsLvoKmWCqyIrwyP0g3AfXpi1QB0e0VQU7Y5jCAkfb/V8sovrB6daF+XXFH2/lR9T17pVJmJyRfEjtr0EvdGY/o0C3R8CH7yVYoPEPk7GcimB8y6M//jc7vzZ5rwel4tXKQ8jWARDfEGmwx7s6m38/89KIm0DrAI89VS6Z2XNbYhct25POuIVJp5o/kVoyhv0LGZTSH//j2AzMW/ER3/srH+v7e+6IbypHbpw2xu8KJWUwfrvLgujASM/DbCquaQDd+UFJ+ySFmEm6yhz/gRPVbF99ihAmrtY0mN8JseLfwXAAz/vXe2a1y+aNBP4bgU7jMc+Hl6/WgxTkUaLDvJ8xQ== HBL",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6Pvls7HFmqcswuKQI9C6rJWUo18p/vpOINKaGjrt0BgZT4IKK6ArXKUFOSj/Sy+vfRIDR1vt8iUmCNiSLs1dIEQuweFkwzbk13mBGAIqM5sRb/1zFMEToxNeisPdaXW3CnLxTgMqtKXUUEgTU7wGjvnqmqd5k7221Hbm6TtNbVDN8kge/V85sOjl1iySLKbtJHCMmdsE0LpV8dVyYAl+yd6RSgjGoywAto8GA+sei+ogfwrNBqE4IisqIxVSKLyEBmUbWloynYfxRbBh9hB3gngtNiGm+vlbXaylxy0FwEnLYPFE72u3cjat4NsPxCWtLX5k+V0cY95p2ctXBn4ixw== TOL",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEArf+dRrIwktAU/7jF+Cf0vfL8AF57+ybcLmOoboRzmXBaAjlEROWRQpT8Zb4gum3Y1JIodckTcXEJPKSl+GTeAWY8ZM46GITRjkVc/mYLItAP88Vd2l/2qqJA4gUHWx4nsPn5jZE2RbDBHitWnBVF6Jr+uHkkyH4pVTta392aVxoXWoI8gynXvD4NfrnHJsC5zs4RP5U75Oe983E+OJplu//AsSCnFg7DqWlJV7jSHa381hrfVXftrVO7ItewqSj3XNK/LitF6GHoyviAmAq3re4/hENglXzXHk0HmD7kj86r6V6BjrDVHqwOJAIypsPouZ6BNjncNeAJGEAXYblwEQ== RDB",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAwSJX5z6hEEp8e+jreaajAjf5dR211J3nJORGBEkJDwGmdadvPs0xEFJKlrmqA3Wng6zNufN/fYaB8RMfXS4sawg+xiHNv4lsCbJRTXziGPS3FBoUvDaAr82tAiStMCk0A67bvVdqnNNQ4NIz4BTWNGiL2nM+ZOm7p8rLNDpbOxLOJPZd/R85nOzIydsnzpL69OxlqRJtlJl/9ZZEW/t3KfaFvymNeeiNMwzwC3TO5LP+C5UJWrFTbx7xuvUfraHq+csHLeV2QsuhFBiUU5P8U3uwCKAlNnYzcywc2Tbzrl4OMn9hPFb/M4YD83tYmoogJmz/l3r8+6yxoCfpyNeKPw== HIJ",
            "ssh-dss AAAAB3NzaC1kc3MAAACBALwz7tN4CrCt+Wb7YK7m71vPO2Mewy9o6wv1G6imLaiHJPBij/JD572Dh7Fr6y8IBwO29oVJs2X7qadPdV6QwZKg+UK/OagEnGQ5RIXJYH8ztOrG/RrLWdiSmrUOJBvPVTrfb65WjB47BIcaoRoZVzdQLT+iKSIw4649Gt1NjxE9AAAAFQCVa1phbmLqhxAJuYkmOPf10VCZ7QAAAIEAoRSNqDSaf91DENCDm6Brgn23VhT+8v1dFTKoGLmiI33U8MG60QOZL1iELxVh4HVQr8mISdH3hqbYJApvFAtpqoJ6iNAEHVJGEPXb/Or2Kp6afZyxW3Ja+VYHJJJbsh+T2NwAwstbrQg/M6Sd3e8BexbKR5X0NlXhj65gG7eFwIwAAACBALaB/FsqavR/P4jmz2PuCc8KNCXbaOZIdIaIUxr0XzI+6KpmzXI+M1iRqC3qLwuTSw2hMZOxcYz7Xt2GOAqEShCx26bvKNaGTpcyhlTSjYEhBb82HZeb6nKjmUY8bQ5we65SMJ4Eti9K90USBEBFuqZiJEjspOiLAnj18fdmV86x rvdm",
        ],
    }
##### END leaseweb #####
    
##### BEGIN nxs #####

    add_user { nxs:
        email   => "ralph.smit@nxs.nl",
        company => "NXS",
        uid     => 5013,
        groups  => ['ring-users']
    }
    authorized_keys { "nxs":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQC+WX1MzDMc0aKMuafHCsmT0tYSMBC1qb2pwCsCqgnskQDvTAk5cjlMwotptbFAUUOxjLY0vEP0KoEh8OFjkJAw9vMlj/X+H5FcWymoNzWePg/mmUGZH2hBWjNCCGuJnyJGPuee0P2zgmQ2MmVLU35hBRk1nEJ7K1AngOGPerY4Iw== ralphs@nxs",
        ],
    }
##### END nxs #####
    
##### BEGIN ic-hosting #####

    add_user { ic-hosting:
        email   => "info@ic-hosting.nl",
        company => "IC Hosting",
        uid     => 5014,
        groups  => ['ring-users']
    }

    authorized_keys { "ic-hosting":
        sshkeys => [
            "ssh-dss AAAAB3NzaC1kc3MAAACBAJYfi3B9pRaQf+webLv9FwG0M7QcBDB7AeKoXc3ftrHeKV9qhA/woMT2BxFh+146mmMZk61J9v2XanPIStCajN0snhzKVI4Ja6qt81uz5p0c1mICRpu30zA1YZvGj2YYfCVEjuFM3f35yJjKkWupWwKsvg1I3OxhR0sKUuhYhl9hAAAAFQDUdyWvm8LCrlcTRUkxLgK+2kOkrQAAAIACQvGwQIP4TdMZ8TVjSKqx7J1hX8XAR0gmhlFSoDkTHUIW/fuKAojUILZiTJ/gKsrBFTnOqGFnRldBgUc7zYMGj+ygxkz3K6Bi56XLep6jvTtn+VtA2nHNQrR4Csc4Hc9FAqZkkufffEHXA9/LesVay4WNWpIAqMJHB+EeOzBUXgAAAIAkeydOkjSAwIS2OlAMFyOoVSNhAOKUxphit/e0sRGjeMPGCgZuFiIFikL2btRwQoeeux/Y73VySdqQc722tGvMCQtKQg7i0aRqH/JxD77LgLAX5mO8cyOA1O6vFiQbVRKwd2wrifCuIMMJbKKsDMWdeJ4dVUREYYRzW/5rZ68ipw== info@ic-hosting.nl",
        ],
    }
##### END ic-hosting #####

##### BEGIN xs4all ##### 
    
    add_user { xs4all:
        email   => "noc@xs4all.net",
        company => "XS4All",
        uid     => 5015,
        groups  => ['ring-users']
    }
    authorized_keys { "xs4all":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEA8dDGdThW8WV/k6c+XIpZGcv9IsK067cgT88alOQtaMo/cxCpX2ESWo++RCAwc9SUWxjrsOvo3x6JWGoVOTdXq4SnBwqgX02zZGoL1DjZwfQxfF3zN/AC+uKZTqgX1RnbFfr571TO9laTnJ3dSu5pgElsBAOfURaVGz19ZhN98Ds= Carelsm@beechnut.xs4all.nl",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAzq+/8IJputPveyQKOFufRTZREZ0uE/P7u0iYbdmMZFsdy56Wt6/Qvkzny/f9AKcHqFuwkDgvYIWtVeZNKa1aL1iWqyjbC9EQkVq37vEzmnWLJRk968W9owoFV8C1JE/iQd5/ZfoNUzcolxd2jTbuvdQ8LiDfEivfbOroi7KwfMs= maarten@macbook.carels.info",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAnNQRiS9gShwU5a3t6WwHDk0QaS/XrBBUK2SOq4vmH42GLsc/qwyVp8PVFFD+xepMx7XpFmSSMiDZyGDy6sSgQJauTbkdAVTSkvR62/KaBrm2uChoeYZyBVkMmMjoG8LoOp2mPheKLSuMgKoV9XbUW0qi3ERBydQkXuSksZU7U/94Zt0QYkBMecgGh6TZrXKf5OxAamFT5a6p1X0DC5pb1bFKLDuHHPSojBFCWTYU4D9GCDank6GhTWn4JJ4SeJEjdPegy1WKfEzSeOIScRGhByIRAzjPv2LZChIGR80MLHgo0PKrLKJlQu3FzvQKFZEfq7iiznz0g1l0+9c6ezLyeQ== carelsm@netadmin.xs4all.nl",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAo8iWoeIUYwU1/k7inCwSJQWNDIkQbIklefwmXG8U94Xr07zdQzvc4WCiPycTKTjEmEtc5KJTrPanwpX7ohPgNcWXiW4LS2ceDnXN+/EbZ4nF4MywfRebAX7Yd0IwdqESIX/hvfV9GzmoaaGo6/U4WDfTUsoRu71CUEuBY2jIygMhupvcrD8CbQD6PjkXAkgFKqXoP5CW2puv+MExGpLjJSwcdgjRi2O1SXyTo1eNSnWY7DqWCF6ptJDxWYeBP1LdmnevYLxSoCcJLNUB3m4+9/u+IhYZCZD2N+rScSfGYho66SJq+giQ/peL28gJ3cBK7gbw7T/ooQq6e/W2AV3Wnw== arndm@netadmin.xs4all.net",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAO6y756diIRRmhXXepPypExQTDWTCcsC2BUc8OfM3KNY11hYcSu97ClSM66BVnbQnPDmEUH7M3dfKTpSgaQC0x8IqdD3kE4UJwcakqvvpUJ6cF4TPqlUlpPtFdlIcvGCLJpKGXTAJ/jO0wmfPjAmhxRii5H9BzWVhFPJ4nE8FyxTAAAAFQD2XsJYgLx95J/YxD8OIGiTsZjV7QAAAIAMvUl1zunvUYkqJZdSbfKzeN6nnkBl1PqkWxSJLy+L9XrSMyigTGrN7pc3MVnREwykYuC71W4Z8S++m8bT5s96bJ+YI6L5BDGUG7wYyw+Ej3omh7oCulEkSL4Tpd+HM8ovxOgkPV2AsNOTEUesRE5YxJTJpb33QmUpkhj8+7lg4AAAAIEAkJTIR+383NcOsIRDfIrS1tyUj4xrjFe8KHEFjpGd3J3YRCAFyyVnF+/iII717lycKmdTZi5rJPcdzjwEjlpF5Rwu/MSgh84KJeDlkyXjJEpt+jzWzjbcZaORmsNOUVzqMq64QRGoRXFzWBAePaIh2TvVkm4r0RCFfCRyEqyW1Dw= johnpc@lsd",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAJg/z9qQA57r7lQEUeHscMotlasH8hKRQcBmyeFHd92ncY2pWOoDKtM62kd9xUWHxRMVhpWxwLpyzpddXENaLRl7gFtPz5gUXBSfcRANNzmaW9d+X+ydu8AcYR7VKNouAhkNaXXPVAFT66RW9l9sjzdHRYqP2CPhmQTpe1x/CHYDAAAAFQDCpLVt0WEaL+L8NUsYVKQqvXl4uwAAAIEAkRKhV39R2ElY1huvtBLkASEjRCGVYvmLVa8xcYrhVJuN2BVD0rBrK9zXDcY1j98miNvf2kfvi2JaANpaYNSr/C8R48rMeOAegj1X1bp+wQ1jxECBnhN2VhwIcZakGXlMDtmfoYkI7gbEpPGvCIAlS1B2fhsRCoJLFFbKcwRz90EAAACAXa2X4ByVZ1o3/2LImQdVEBRw8+8EhG/UhulrLksNa0Wnzpk4PrR1YUdWlvBnfG37/pcah7Tf4FSdL76ZGSclZGV+oHVjqtyhuJc0ZK36UJQ/GxGSbA3d2j39MIt1QiDlysOlzyR7dxXbQZ1jbv1d/K2DDNQ36y4MR99nFF6aUwA= john@pc.xs4all.nl",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAL+cCWAag3ikC/WXp3WF95ek82JDLLR9Q2jCrbHBaWVoi8oq57sXVWPwZjPqF975E8dhWuZMmlKeV18h9lFEf4WZIadx0H1v9notCMGWXIjgDcPv/vtlC0GYAeaRIRVaZn2DmAgDYDeqvrD77F2wmXHChMYdNKES4Zr2lRCNNxiLAAAAFQCaArV2oqbWTZwQ/0uP3tKPG6EVLQAAAIBTC2pUOx44tNYoWMWV7F2ktiskxlKmayT8R1QAtcCB+w2PYiIYHpX0Qo4pYpP1gVpSx6FWgUkxf+eSfgbgaLsM9p4Xp/iKQZw38W3gTWYVHv/zTohBBvlZurMU4KFLFZonk9E/7CTVf4z7a+To07BXXIR34VfxB2kaMkSq8ODcfwAAAIEArf9ZF7R8WNNpA21Xl3P+R4dQq0CSSdewnSwZQRoxcRLyQO1g52K2fLno4FaJw9IGr8P2z5hDKycoOojsEpv12yX67drOW8wsn+d8A+XkuVNPF7ArObvYfwAxbcV7J8cw3E55PnWfJF9zcaP2WOoc9FtQ/TgWGrE4k3XSQtk45EU= kiersb@mescaline",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEAscnTkPWPZq1U4PtgJ7ObSPKNdTSNVYbV++3w5k37xmtOhMPZvf9aDzjBR8nymv7JzjPiW1yFnu2dg54tARPD8GpMxr6vCz8VbzbrXL5ROGMYKUGekHKjaZmm9rPf8HO5OHswBceycH3eaZe/uc3hPUVUiIWjeQMWuaK58Ktx+jUDLwVl44mL5ELGAlkq0G8f/NryEX6ymem2KdL+5Uzhv8eGBu74LFE6kj/OLZ2k2YX2XSvRZpObgVF+6X9nxvEpkzjpfnux1vnDVvtHpmbt1EY3H2xQwStMZrSSU9rMHHL+yZcmnW2QC+/CBs9XGIwQE1PnaDAnPR5qebNoCX4MC61i/IP12bwONaogAZb2En1j96Y2k8fjRLb2TKIFYuF3usvMwsRJwpmDxXzZb+V/p+KREoCAZisVi7YHS9uQKdUBcrFolGqmcm7/eGN0uP41jbaMEPVxRdqgrSIB6FevYQd01hsSXPQKyFy4r/9DP075f3Xg3LGof4qCemH5ID+e9g7sG8pwiFV/nDKuy8iKmfVqKsUDNmiCbc5EWIXAt+PPTPiJAHhswikGJkaRPeTGYiPvbt75JSBw+hiHla+bB+15vCNI8V0MSv/qo4KC4X3JnkMXPP31pXcVwC01BKW/OTT0mqIav/qAawjVMBqiD1xbMpYnxJ08R3BxFVRLd70= timr@netadmin.xs4all.net",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAPfAC0eY0EgYTkUMQ8oxMGdMqJg1LU75+rcVV2kmPThZaZ8CqM//7zrAF7T2vZGl7/YAAZwD9uiXv/VceEXbVifzI94nPdcULhSv2UvBr6I6fP00yA0jZrMNYEjo34m1OpDLauwVv9djMXOqxL/8QCCdrY2xRyif64Z+k00Nh0e1AAAAFQCoGGhUPUQ08k14aP+iVZxBj582wwAAAIEAj+iPMJieyhex3BIv4ESyjVx3QnP1g+WTXEb1aj1WLCuE/QSZvmD4qQMO3HtGu5H3UROsxJUKSjsnRE33x1V4XWKAK0yuoJTFKxEgnrmg2URUpqhciMCqgC7nbIFCSpqWwR+Md6vms8hQJyDbfWVcjmh4VkCeaqnL6FNdecsJlqUAAACAGfND6IM304KZx3bQ2MMFUpBqvUDq+WG+FqAlhCYvERMuEIYPfdTKY7vzELVKH77GQKTPWgDU1i3pYhVmSiNvQj9debkyMpdGzPIL3mDf/WEvrXf44cdhx87tk7zB1f9vOxIKigR3UpSxMn4PO3on3rJMPlvTNJ34cfj+Evlq2wo= timo@timo-laptop",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDH1VWa24jtQ256NJ+Ya+vLc3iK+MJOhHJx3oXl1a9jB2MOCWhIkWS2K7LBPDEISWSj+uqQJGR9XpM7AU2+aLYyDiElsMCgWQKahK8bfQarinR+3G9B8F4tD0WN4EIenebLzpI07RrshHzOnjQo+W9yHtSrenR9qkDWkiy1BsnM2j8yZtCOTJBnoXmh2h6bSUIG1568m2fKr6lGfiKVr8Ds+cMcQNotBPuVNO1ZQmTQQdCZP9DGnlSBi7tagQTqlzgu1wsyPkk7Mf36rXqVRva8OXlng2WOLjIX0CVVolq1i5gvrwNtpR+SWoJLtRdc5++MBLn21Ks0Lz9HNYWlZaW/ arndm@mabuntu",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAJ2TUhpngeAKI9zb6HTZ2G3yUfVp9F0b6Jy1Kbj4V5O/yOeR0oIYs8sXp4uvcunOfKDQDJhRQN8AhQK/FAdT3vIGHdZyifKrlBOWexmN9edhXHV5bLR59uGnq2Lm+3TihKgTgjcpx6STFl9C0HdAtcAYvgnDz3FBOIETXJnyGhXbAAAAFQC2e0EM+cqc3Pn4XpPiFq3Cys0TGQAAAIB2Skwn/2Myt5MpiC9jLplu+ZApiiohp6NcV1ZMHzGjH53efb8bI/BOIxRcNKlU8rHr71x6UJLg0w+fcbo1jdmgspayTaj/mwQq9wpNfcajlmnQYVCdQ3Y1f16KVXjAVTgcZYDWKVt15RotY2fGRjWEVmJ5HaOqCiDvGrSEiKyflgAAAIEAmvdEH47gTTZWqtbEPrXupIMZWWVhLaXZaP3yrLDwhy/0KqurYT6jN1NMJ2jcM0QbkywwgdL3cQjtfVCwG8tKfPXjCCFXjvTksmfyx+r9+MJqWIyf/7sk/Kl1IVmi8y7sCPEUvm5cMiAuD/6VJbTXQYQHIphTbOxWg0b0vKPBV38= jcqschuu@shell1.office.xs4all.nl",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAMROwonJ92paPJQkJEIVz0f/Kn7+U+Cp0o8cGmK0t3IUzOdks6z6QMmtvYpZCJBZKJP9PHiydUq17DE0NJmuzTHxrZKzAcklf3vOuViiG2OtphvrYjYMO9DljK+qY/5t7w/sLSjGRp/CobghcBr/TA/7vtS61s4uOQZkQ0+IcMKnAAAAFQCrxVJRkWcVx98y0uXA6UAYUIoylQAAAIBlJdVfbolpA2uzskZoAJt6DGEJh6jr9jFeVuuO6cYC0WkRJskGi9ZazwtDf49VBwa2/FUFahLoInxuaX8kaI6IozB0yLF6XzuTCeoAUBCRLXl0W28gfUebpMjANj5b662N7f77fxwrQV9dkx94CJJqOweD5f6MhmbxNFudaTFVVQAAAIBRLEAP5UCWsZJ03KE/soTLkU2LxC5Hk5ryQVHl+jiXhqSvTezUaKf8dIrmR+Aa8zsTzccQPDYwGnushk04fV4ASsSrSIYqn8WlPrcghH9XuzzK7cNGMs4/1F1h35ZchXkXBtIdKrZVdPjrmwf93LnVSolLSEBQc9oy39Pbf5YpKw== mikevs@xs4all.net",
            "ssh-dss AAAAB3NzaC1kc3MAAACBANmLy3/PuiImH81ufL9SiMACN7vumP1Q0QLHS5zOBAeh5Jdi2jMRKdR/M4vFe3KnrSH53j4INR/kCOqfpsMbdUG2HWNKbjp0UTbRQIsS4MOapSYx6ob4XRveJGH77yCgjmeuRR1OnbFzHTp4p8PvBnwv2muyBh7aA5f1q8Y3O2WBAAAAFQDZJM0i8iidyLhxS/1B6hsylC9lSQAAAIAlFwvhSXK7rGY2oNdLHRBWmKZ7SJLfObEZvnBSKSbzmPFK5wGLnTGMa2sMe6WAXnBaOZw1p9ZCur0VxMzrBpxde+EcbQ1b8Zni47QOUM+luz6We7CWboGpI+ZbJst6lwzl+CA4gGyK3QB2qIZHGwd+ooXGvDqNgQyKwIp322X7tQAAAIAqvBRhKigmTBy4wQ9bnc/wyoQa2kv/MvV5mlkVhIOhOyaSE7XPq48MIcDtSzuFPR86FDguibc4FKWFhkhs7CVs10iXXKyY0cUNejfMqvvOLundT3EU/r0wNMcuiw1xpbVChyKuXYIbTUHzqH9Wym9pI9KoyzisosodUI1Ab9ietg== remcovz@shell1.office.xs4all.nl",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDBAc08JRWo/4jJAfaP5hsWl3ZP74i0jNeLJvfvZhgHDtU1kBr85JRaqhHRtWrUGvXw2/3UAAZUuJyp7i0S9TfPdeOV2Ag8len5C7HrhUO3rfj21PBr+ZTL2ywvI3OUOHfxc5Hd40TvurOIjRvZMAOrXr75FRX2BmHs86unmIp7nXbPo8q1YxBqI2PwVjRM5eg3FPRF/xeiWy0Q1d2eiq/nY75hoUCSnfQWHN45N/s2pQQKjxvudakOk+CeRH4ZDPo1nHVcjaFXw5YQVtZfkXp9FJN/wuuSfmDnkGYFcu+GMwvEanEs8enQdaBK1O6LPrwCVwtrRZvQiK1a4oc9R8457PuZud8LPQbf4FgWyHPviLbA5Bld/FvbHFSxk7hoWOp2Y6OcAmriFZ+IVHdXP9jd5Y8Schs3OowhYpj0/sCsWV2yysNEd6RB8/MwAVb1qjLdUBrJ2zJIPbq2+Xh59TLKtK/j/JktkVctmAzD8Wy3+3XdDG2dGkVXAt2cQi0TYuNL8ecC8G1Lx06zgqqX13d8LLAIOxMN4cLRSD6WKzXsb2ZtLkSw45QiFfhQljtfkD31pBNh7rEV2Nc+sxoC7+HHJwvCqHkMTlXIe90oH/euWzIB8PZvEnn3aV/pSZ6GRMH/TUGI5X9qPlPINBOS9hj/UDNN8e5ri3BxOtLJq0Hi4w== Daniël_14",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAnNQRiS9gShwU5a3t6WwHDk0QaS/XrBBUK2SOq4vmH42GLsc/qwyVp8PVFFD+xepMx7XpFmSSMiDZyGDy6sSgQJauTbkdAVTSkvR62/KaBrm2uChoeYZyBVkMmMjoG8LoOp2mPheKLSuMgKoV9XbUW0qi3ERBydQkXuSksZU7U/94Zt0QYkBMecgGh6TZrXKf5OxAamFT5a6p1X0DC5pb1bFKLDuHHPSojBFCWTYU4D9GCDank6GhTWn4JJ4SeJEjdPegy1WKfEzSeOIScRGhByIRAzjPv2LZChIGR80MLHgo0PKrLKJlQu3FzvQKFZEfq7iiznz0g1l0+9c6ezLyeQ== carelsm@netadmin.xs4all.nl_3",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAzq+/8IJputPveyQKOFufRTZREZ0uE/P7u0iYbdmMZFsdy56Wt6/Qvkzny/f9AKcHqFuwkDgvYIWtVeZNKa1aL1iWqyjbC9EQkVq37vEzmnWLJRk968W9owoFV8C1JE/iQd5/ZfoNUzcolxd2jTbuvdQ8LiDfEivfbOroi7KwfMs= maarten@macbook.carels.info_1",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAJg/z9qQA57r7lQEUeHscMotlasH8hKRQcBmyeFHd92ncY2pWOoDKtM62kd9xUWHxRMVhpWxwLpyzpddXENaLRl7gFtPz5gUXBSfcRANNzmaW9d+X+ydu8AcYR7VKNouAhkNaXXPVAFT66RW9l9sjzdHRYqP2CPhmQTpe1x/CHYDAAAAFQDCpLVt0WEaL+L8NUsYVKQqvXl4uwAAAIEAkRKhV39R2ElY1huvtBLkASEjRCGVYvmLVa8xcYrhVJuN2BVD0rBrK9zXDcY1j98miNvf2kfvi2JaANpaYNSr/C8R48rMeOAegj1X1bp+wQ1jxECBnhN2VhwIcZakGXlMDtmfoYkI7gbEpPGvCIAlS1B2fhsRCoJLFFbKcwRz90EAAACAXa2X4ByVZ1o3/2LImQdVEBRw8+8EhG/UhulrLksNa0Wnzpk4PrR1YUdWlvBnfG37/pcah7Tf4FSdL76ZGSclZGV+oHVjqtyhuJc0ZK36UJQ/GxGSbA3d2j39MIt1QiDlysOlzyR7dxXbQZ1jbv1d/K2DDNQ36y4MR99nFF6aUwA= john@pc.xs4all.nl_4",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAo8iWoeIUYwU1/k7inCwSJQWNDIkQbIklefwmXG8U94Xr07zdQzvc4WCiPycTKTjEmEtc5KJTrPanwpX7ohPgNcWXiW4LS2ceDnXN+/EbZ4nF4MywfRebAX7Yd0IwdqESIX/hvfV9GzmoaaGo6/U4WDfTUsoRu71CUEuBY2jIygMhupvcrD8CbQD6PjkXAkgFKqXoP5CW2puv+MExGpLjJSwcdgjRi2O1SXyTo1eNSnWY7DqWCF6ptJDxWYeBP1LdmnevYLxSoCcJLNUB3m4+9/u+IhYZCZD2N+rScSfGYho66SJq+giQ/peL28gJ3cBK7gbw7T/ooQq6e/W2AV3Wnw== arndm@netadmin.xs4all.net_10",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEA8dDGdThW8WV/k6c+XIpZGcv9IsK067cgT88alOQtaMo/cxCpX2ESWo++RCAwc9SUWxjrsOvo3x6JWGoVOTdXq4SnBwqgX02zZGoL1DjZwfQxfF3zN/AC+uKZTqgX1RnbFfr571TO9laTnJ3dSu5pgElsBAOfURaVGz19ZhN98Ds= Carelsm@beechnut.xs4all.nl_5",
            "ssh-dss AAAAB3NzaC1kc3MAAACBANmLy3/PuiImH81ufL9SiMACN7vumP1Q0QLHS5zOBAeh5Jdi2jMRKdR/M4vFe3KnrSH53j4INR/kCOqfpsMbdUG2HWNKbjp0UTbRQIsS4MOapSYx6ob4XRveJGH77yCgjmeuRR1OnbFzHTp4p8PvBnwv2muyBh7aA5f1q8Y3O2WBAAAAFQDZJM0i8iidyLhxS/1B6hsylC9lSQAAAIAlFwvhSXK7rGY2oNdLHRBWmKZ7SJLfObEZvnBSKSbzmPFK5wGLnTGMa2sMe6WAXnBaOZw1p9ZCur0VxMzrBpxde+EcbQ1b8Zni47QOUM+luz6We7CWboGpI+ZbJst6lwzl+CA4gGyK3QB2qIZHGwd+ooXGvDqNgQyKwIp322X7tQAAAIAqvBRhKigmTBy4wQ9bnc/wyoQa2kv/MvV5mlkVhIOhOyaSE7XPq48MIcDtSzuFPR86FDguibc4FKWFhkhs7CVs10iXXKyY0cUNejfMqvvOLundT3EU/r0wNMcuiw1xpbVChyKuXYIbTUHzqH9Wym9pI9KoyzisosodUI1Ab9ietg== remcovz@shell1.office.xs4all.nl_6",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAL+cCWAag3ikC/WXp3WF95ek82JDLLR9Q2jCrbHBaWVoi8oq57sXVWPwZjPqF975E8dhWuZMmlKeV18h9lFEf4WZIadx0H1v9notCMGWXIjgDcPv/vtlC0GYAeaRIRVaZn2DmAgDYDeqvrD77F2wmXHChMYdNKES4Zr2lRCNNxiLAAAAFQCaArV2oqbWTZwQ/0uP3tKPG6EVLQAAAIBTC2pUOx44tNYoWMWV7F2ktiskxlKmayT8R1QAtcCB+w2PYiIYHpX0Qo4pYpP1gVpSx6FWgUkxf+eSfgbgaLsM9p4Xp/iKQZw38W3gTWYVHv/zTohBBvlZurMU4KFLFZonk9E/7CTVf4z7a+To07BXXIR34VfxB2kaMkSq8ODcfwAAAIEArf9ZF7R8WNNpA21Xl3P+R4dQq0CSSdewnSwZQRoxcRLyQO1g52K2fLno4FaJw9IGr8P2z5hDKycoOojsEpv12yX67drOW8wsn+d8A+XkuVNPF7ArObvYfwAxbcV7J8cw3E55PnWfJF9zcaP2WOoc9FtQ/TgWGrE4k3XSQtk45EU= kiersb@mescaline_7",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDH1VWa24jtQ256NJ+Ya+vLc3iK+MJOhHJx3oXl1a9jB2MOCWhIkWS2K7LBPDEISWSj+uqQJGR9XpM7AU2+aLYyDiElsMCgWQKahK8bfQarinR+3G9B8F4tD0WN4EIenebLzpI07RrshHzOnjQo+W9yHtSrenR9qkDWkiy1BsnM2j8yZtCOTJBnoXmh2h6bSUIG1568m2fKr6lGfiKVr8Ds+cMcQNotBPuVNO1ZQmTQQdCZP9DGnlSBi7tagQTqlzgu1wsyPkk7Mf36rXqVRva8OXlng2WOLjIX0CVVolq1i5gvrwNtpR+SWoJLtRdc5++MBLn21Ks0Lz9HNYWlZaW/ arndm@mabuntu_12",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAO6y756diIRRmhXXepPypExQTDWTCcsC2BUc8OfM3KNY11hYcSu97ClSM66BVnbQnPDmEUH7M3dfKTpSgaQC0x8IqdD3kE4UJwcakqvvpUJ6cF4TPqlUlpPtFdlIcvGCLJpKGXTAJ/jO0wmfPjAmhxRii5H9BzWVhFPJ4nE8FyxTAAAAFQD2XsJYgLx95J/YxD8OIGiTsZjV7QAAAIAMvUl1zunvUYkqJZdSbfKzeN6nnkBl1PqkWxSJLy+L9XrSMyigTGrN7pc3MVnREwykYuC71W4Z8S++m8bT5s96bJ+YI6L5BDGUG7wYyw+Ej3omh7oCulEkSL4Tpd+HM8ovxOgkPV2AsNOTEUesRE5YxJTJpb33QmUpkhj8+7lg4AAAAIEAkJTIR+383NcOsIRDfIrS1tyUj4xrjFe8KHEFjpGd3J3YRCAFyyVnF+/iII717lycKmdTZi5rJPcdzjwEjlpF5Rwu/MSgh84KJeDlkyXjJEpt+jzWzjbcZaORmsNOUVzqMq64QRGoRXFzWBAePaIh2TvVkm4r0RCFfCRyEqyW1Dw= johnpc@lsd_13",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAJ2TUhpngeAKI9zb6HTZ2G3yUfVp9F0b6Jy1Kbj4V5O/yOeR0oIYs8sXp4uvcunOfKDQDJhRQN8AhQK/FAdT3vIGHdZyifKrlBOWexmN9edhXHV5bLR59uGnq2Lm+3TihKgTgjcpx6STFl9C0HdAtcAYvgnDz3FBOIETXJnyGhXbAAAAFQC2e0EM+cqc3Pn4XpPiFq3Cys0TGQAAAIB2Skwn/2Myt5MpiC9jLplu+ZApiiohp6NcV1ZMHzGjH53efb8bI/BOIxRcNKlU8rHr71x6UJLg0w+fcbo1jdmgspayTaj/mwQq9wpNfcajlmnQYVCdQ3Y1f16KVXjAVTgcZYDWKVt15RotY2fGRjWEVmJ5HaOqCiDvGrSEiKyflgAAAIEAmvdEH47gTTZWqtbEPrXupIMZWWVhLaXZaP3yrLDwhy/0KqurYT6jN1NMJ2jcM0QbkywwgdL3cQjtfVCwG8tKfPXjCCFXjvTksmfyx+r9+MJqWIyf/7sk/Kl1IVmi8y7sCPEUvm5cMiAuD/6VJbTXQYQHIphTbOxWg0b0vKPBV38= jcqschuu@shell1.office.xs4all.nl_8",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAPfAC0eY0EgYTkUMQ8oxMGdMqJg1LU75+rcVV2kmPThZaZ8CqM//7zrAF7T2vZGl7/YAAZwD9uiXv/VceEXbVifzI94nPdcULhSv2UvBr6I6fP00yA0jZrMNYEjo34m1OpDLauwVv9djMXOqxL/8QCCdrY2xRyif64Z+k00Nh0e1AAAAFQCoGGhUPUQ08k14aP+iVZxBj582wwAAAIEAj+iPMJieyhex3BIv4ESyjVx3QnP1g+WTXEb1aj1WLCuE/QSZvmD4qQMO3HtGu5H3UROsxJUKSjsnRE33x1V4XWKAK0yuoJTFKxEgnrmg2URUpqhciMCqgC7nbIFCSpqWwR+Md6vms8hQJyDbfWVcjmh4VkCeaqnL6FNdecsJlqUAAACAGfND6IM304KZx3bQ2MMFUpBqvUDq+WG+FqAlhCYvERMuEIYPfdTKY7vzELVKH77GQKTPWgDU1i3pYhVmSiNvQj9debkyMpdGzPIL3mDf/WEvrXf44cdhx87tk7zB1f9vOxIKigR3UpSxMn4PO3on3rJMPlvTNJ34cfj+Evlq2wo= timo@timo-laptop_11",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEAscnTkPWPZq1U4PtgJ7ObSPKNdTSNVYbV++3w5k37xmtOhMPZvf9aDzjBR8nymv7JzjPiW1yFnu2dg54tARPD8GpMxr6vCz8VbzbrXL5ROGMYKUGekHKjaZmm9rPf8HO5OHswBceycH3eaZe/uc3hPUVUiIWjeQMWuaK58Ktx+jUDLwVl44mL5ELGAlkq0G8f/NryEX6ymem2KdL+5Uzhv8eGBu74LFE6kj/OLZ2k2YX2XSvRZpObgVF+6X9nxvEpkzjpfnux1vnDVvtHpmbt1EY3H2xQwStMZrSSU9rMHHL+yZcmnW2QC+/CBs9XGIwQE1PnaDAnPR5qebNoCX4MC61i/IP12bwONaogAZb2En1j96Y2k8fjRLb2TKIFYuF3usvMwsRJwpmDxXzZb+V/p+KREoCAZisVi7YHS9uQKdUBcrFolGqmcm7/eGN0uP41jbaMEPVxRdqgrSIB6FevYQd01hsSXPQKyFy4r/9DP075f3Xg3LGof4qCemH5ID+e9g7sG8pwiFV/nDKuy8iKmfVqKsUDNmiCbc5EWIXAt+PPTPiJAHhswikGJkaRPeTGYiPvbt75JSBw+hiHla+bB+15vCNI8V0MSv/qo4KC4X3JnkMXPP31pXcVwC01BKW/OTT0mqIav/qAawjVMBqiD1xbMpYnxJ08R3BxFVRLd70= timr@netadmin.xs4all.net_9",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAMROwonJ92paPJQkJEIVz0f/Kn7+U+Cp0o8cGmK0t3IUzOdks6z6QMmtvYpZCJBZKJP9PHiydUq17DE0NJmuzTHxrZKzAcklf3vOuViiG2OtphvrYjYMO9DljK+qY/5t7w/sLSjGRp/CobghcBr/TA/7vtS61s4uOQZkQ0+IcMKnAAAAFQCrxVJRkWcVx98y0uXA6UAYUIoylQAAAIBlJdVfbolpA2uzskZoAJt6DGEJh6jr9jFeVuuO6cYC0WkRJskGi9ZazwtDf49VBwa2/FUFahLoInxuaX8kaI6IozB0yLF6XzuTCeoAUBCRLXl0W28gfUebpMjANj5b662N7f77fxwrQV9dkx94CJJqOweD5f6MhmbxNFudaTFVVQAAAIBRLEAP5UCWsZJ03KE/soTLkU2LxC5Hk5ryQVHl+jiXhqSvTezUaKf8dIrmR+Aa8zsTzccQPDYwGnushk04fV4ASsSrSIYqn8WlPrcghH9XuzzK7cNGMs4/1F1h35ZchXkXBtIdKrZVdPjrmwf93LnVSolLSEBQc9oy39Pbf5YpKw== mikevs@xs4all.net_2",
        ],
    }
##### END xs4all #####

##### BEGIN nedzone #####

    add_user { nedzone:
        email   => "noc@nedzone.nl",
        company => "Nedzone BV",
        uid     => 5016,
        groups  => ['ring-users'],
    }
    authorized_keys { "nedzone":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIBr1P6kiPiQT+xCJVAmMQtL8VOerIv7epknE3n2ml2rcdlmWIMizGEtRI70rLZmBqyU7EMEU0c+hiq/k/HuzU9FW2Vla1VWi4pUtiqmwQK8u6uHd7tMKF7Vju46U3AWTItDtETIbPkSQyqx9Im1KZGj8FHrDlJ/lujk1olMjNmocw== bram-rsa-key-20110201",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAiFqSuv2cZ0riwTLeNOfXkrYmlAjWCDTYz+nTy89wAvVWvSTihqrsV2TLy10/ucH5ZMs1TYm5GubINutD13vHlJ8f7DqzF4s/uslIvrQ74GicGNniJuqD+K57nZFocEQx3Gs6SjW/lXoSdNCOR0mHkfpUQ40QGX+OfVXkYg0Dy5M= marcel-rsa-key-20110201",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA1KOp1JepL8TMPpBN0x1AdwuSw2mkNS375VFM41mziYLO8P6XUYMzC00xmSn+nlblFSV33eHzK6gi/X3xNr0b3DYPsKORHxvkbMmG4dUK8MahHwFHDl281Iv5M3e5dM2FOsyT3aWt5GdbGtzC+VBp8etVJAYtzU13FiIxZAxrTxM0Vt57mYNToYRtk8Skxp+TAkzXzChMRi4UoTzXcGcFGJ+3ezcGvRn15pSAcMQHT231taOQ3TJWQsDg3vBo3/b0+BzGng1VX2PCBKL1HZGWOW3/9stLLgHlks0oZsqK4/crR76iYAG8jUOc8KdS2eOFmCqiGKwWkthZY2gg6CYsUQ== joris@Joris-MacBook-Pro.local",
        ],
    }
##### END nedzone #####

##### BEGIN nlnogbot #####

    add_user { nlnogbot:
        email   => "sten@snore.nl",
        company => "Sten Spans limited",
        uid     => "5017",
        groups  => ['ring-users'],
    }
    authorized_keys { "nlnogbot":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA3Cg9Jq+mEZwlwrm44P3swuEOM0VoVVP1Bm5r/+wO2luQWu9hWx3RQrKNL40gcavaW0e+pv1WO2BkLGVk/S7gcH9z9bFf7JRb9AymlYkwjZqHN1EQs5eBYLGrL2o20L8Wsb85LjdcRzAe116kguESzsdpdp/qO1F8UV6w6D7b1UDsP7lGANEJtGYIfJon65gEQjnI5X1cemEcGAcXi1SA0stazNaHGpxGRuaHHpgXc5k+YoU7+WAXLuTi5NR51NjDpptU2CApb/S4HZ3BH0j7kt9W1AuWN7+eaP2u3oJfWZZrnB73Ko/73WAF3uVDVabI7jEv5D0Dl+OrkEUuamCJ9Q== sten-nlnogbot@zem.blinkenlights.nl",
        ],
    }

##### END nlnogbot #####

##### BEGIN oxilion #####

    add_user { oxilion:
        email   => "noc@oxilion.nl",
        company => "Oxilion",
        uid     => "5018",
        groups  => ['ring-users'],
    }
    authorized_keys { "oxilion":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIBlZkdBFEeyjt41M+JefGGTz+qZNU0IqH3yQ7bQC6GccJ7OqXsrHIkw6v1wqKxxp7fZgROxTlERQiV8CU9EHRytRw1oB1AXugt+gYd48qS3m7/e7ldUfMQ4bCZ7geyAbDuxCScpmBh5xpe52zALSgw45HTEvL+RM21sGuwOrIgiUw== rsa-key-20100201",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAsBbZp+Zo8Y/Jw4oqb1KHWONjGxesHSd4g6RYGrWOG1tOOqDerK1ZiFJcleIYXOFyaqyyZaVyChRQU6/U3gojP1a5jOvPX6LUo4WW6z60mi0C7utfHnKBV24wSF2s0I+7e9Saokgsw8ZpULNshD0sJZuzWFN1ep4Sk3jIPokWOrb5UR7ZkpB6PnpHQGpPLsEitbRiu7Fms6piYp10Wvj+U/alu9Ua4zWz5XtDOPm0aY13OqokGGlJCdBVmvMcF6wnk540X2y6Pd/fqrcZvLKwFFJSajW6/aNF3ZeP01M5MHd8xiE+duzL5exI9gAQY4PsV/wpKiMPM7AHgwuwLtj0iQ== tjikkun@peecee.hoentjen.eu",
            "ssh-dss AAAAB3NzaC1kc3MAAAEAU45STvUiUkfYhqTjXXQ+T6LEvyf2iMtxpMm8AgboFB3w1c3rBciveiBEH5+fp0p0OIw5Uz7xkEg2UT9Xut/oT/GuDCGGtHiBtDw+48IaMdGWjvYOvSBxWNgcoVXh2RqAZNGFzMEFWHK//QraK7HEyK2mRrwNT1Is6L4rYZjTDySoxmkPulw6tz0sy5yLHLySz83Qt+CE6HJbJvRHL3ZvfOzB8BEHQwT6wbYy3gI6EucZPHIPwIP4Ng+SC8ydEn1tq3jhQgqBcsuXBs7TZyNkFH7Qnp9Gskhga6EriOqQyQUbvhATi0w7tQQqbVqGeAeBSfeMe1YvrPrNhzit6DSNgwAAABUAn5oAMYC464Ki1cW8movZc4rUx90AAAEAHY0vVpkd4YhURJb9K4GvNc6rXJ2GDcVkvPVaZ+1pYdVuRsDntYi/vEuandm++gLP8nZoLoCE+nP0laRz/Y96keCOcHetxUBdyMPvLaB8lW83Z+Ukxa4rE4YSEOJeHag1rBmg/JWM92KfOWL55jJeJosXwCowybWcMQ3H0QKimOyQBatc31R6kRqrjA11yjWytRSJZo4csKiSNU3F1mCxrrouA/Hhi8nl8H0MPDd3CHA8Xa3n0Ri1jH4Kvpk3daO/JviHpqD/0rlZYcV7Cm/WBtopqU/GsQge7501KgOe6c8OA0LHDvDzMVumijK9mlbeIrdFHRDJYyRqnBIXfWhOzwAAAQAC5WrUj/iMsf/RXYX0IPvHmcN6B2RumNYdv0BjaTmKmtvUhKbA6rf0vvwIWKeEwhi3HR1rL41Nq3fb4QX+KlvmtHa2YQZHRmByRMe21KBXXxpl1rBN6L0W99hb/MqK5R/E1hBuPOdRDgmAKOEfr+my6NRLRMUVQHmvZ2MX3JQFGSor2a6ur0GcSbcQgT0E5jOsLpk/Qi3WCM3ntI/27cnUhmlOIbzNAyoo3B44UQbp99+GuRT+z5y5a7e6jgEsBH9pmhz55KgNG620fd/S2IzEXLPMzQs1/rSJrjqH9O+pq8vZNj1dgQBsr3jts5mq8dYpPAlrcyhH/qd+5v2+QjkS lj-key-20080618",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsp/mLeYC+KUWmXd0YE1Wo0XfhhfPih9ICA20dvIZBeloCCEZoKSj3uL0b7wZwvbSjIgA8b3zcSG2YGzHGNPBBjf5ERXj1ZT8qwzc7r+mwzAufNZQUhuQj1Efud0HY0pgF+bBERAhBb8W+AWu6SbaEnwt//2DmFDXeIS5SPA5buAKeofFxvnRkumYrzvcstqMxh3r+qQaRRX91D4y3DblLuFJs0+cABjG6xlZw4UQWc3Xh+Ikv2PQHiZU8N8IucCXUOMY0Sfc22h+N9hWm/SHwzfrj85cCGg19esoGPSBXwozoJW+sJ3C2hgxngR2cBguUNUZs0cl39+8scV3+wxE3 ekohl",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAL+naGa4gWrWrzVdGEkw6zlzjtrmkFxw9dBAe3sUimXlQ4iq1MqhYm+PqbH+7XT35uZPqwucz+u0h3daQ1GVy3WsmXmKpIj5sDe71ymJdMILiQmV4k+6wLociMpon8E+d2/Wyn9uVmtkZyxNNBroJuejcvcpi1HtXOP0Vetd8QH3AAAAFQCIda0YLTQGt2xllyBOFpAEj4fS2wAAAIEAr0sgCIhlXbxFLj9awUS/uuCmM13DLOsHxfl9anUyvwN3GqEetpvl9AcazD8JWBXt8x8e9OCKbafF/qy3yQaoy3vjPHU3ofdvvftyJqE6JUaGgIj8z7rIjxqfbdbC8Utld2yMZ68NadTxn+q9LuSyQ7dmQ3uPCPrEwkItNHpgab8AAACAR3xS4OCBNglVwQGf+HMjb1+cb/p2mCtkvpFAgiQT92790y0T45PzSDFQN20LFOfwrpRqigrxpgwHgX6thfOLUck+IPbkMPLa2TMlJYaY/IYhr08Am/hWFoi3TRPRDUPw26CSU5qNYPmfH7suC5EzBgjfoKvL3wY04eNIlSEu5Vk= tekkel@fedora.jronline.nl",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDZgUrS6PMBWjB5z3QkN3Bq3b8bfcapVNEcoZ14PbuedOZzcKo7zVm742r9UfDQV3pYe/gX4tfmU/gOSEthw62uHG8eosbMS27cUCxATMdWxlYLoyiBCUjrpWglH/L/DgLjHfJJafDaZB+N1Ugd9d+8A0Q7L8p0v+tYK7Pn69PIuFMQ+HlJwLp0U2OYPEI/DdE9ahobZGxSrl1lOW/FzYbD85zHQR6y+7ZW/mpbSDwKor81tRcqb5BTJ3XrI7G0B1qrCmrRJlZjXSgdgV7u7WCQvfAdIOQNMq+H+mlbhM5ZqrLBdZm0iCQVRxDNt6j/pSK+oNrVRHaC5jCElbOADGVP tjikkun@sleptop.hoentjen.local",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIBR3Y5KY3uInywLRDtdzFelAzO9tMFZ9MVwEIuFCfOx3KtusIz7kArynuS4y4r6K0k/4M9/WlFBkKrr9qcWeoDkwBngn6NZj2a5dw0ImwDUH8CrpoSLFaOh7B46Y4A2aDwEL6Blh5+YgHERcoOVF9ozHYwhxD1SF8FnY8wZST2yzw== arnoud@oxilion",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAIH4uNqbeod/QUf4DcKCHEFlLm5+8zf8xw3uamyRnJl1z/C1zMW5xMbPysRPNUJDJZzAxu2C4AwMSaOYdTjYKINfZWYD0aBcbgn7Ggz1bG/rxd6JcOLzp6X+Pgz4lP8RgMyt2FsiEO+5KtwcU0EA06uXO5TsFco5Eot1xLvpzi5vAAAAFQDyRQXCVHwVZ2loVneB5+8noD+x9QAAAIAb0ZnMNjefY3Lcd2ZRZKic8Gs8vNJDLuckwgytLY2HfJq4VFWs+oVxIq7C5+JVwroR3cz5wLTaUZ95Vnc4/SlpklQewCDwlL0SWOnh59TwlGkPgusypBy0UQHp/qEQH8TXiqtZLu4QjArCEO71RVqypgqTVV8NXE3cYkL6hv1ncQAAAIA1czSkbdbQfQjtwTYFWpSu1DIaQaeNsUVMnScA7W3RvZOIm+xo8kdqXvCBTyDZyZf04j815k7aZOA3fycouepZHPJNvfQj39eagcDkVmPI/kx7rgpLTFWQO+xZMJN3q9mA1gzxG0b1g5ZClUgkCn7xm4pzk3/YxOMqIqvkvKEnRA== sander@fedora.jronline.nl",
        ],
    }    
##### END oxilion #####

##### BEGIN ebayclassifiedsgroup #####

    add_user { ebayclassifiedsgroup:
        email   => "DL-eBay-Classifieds-Networking@ebay.com",
        company => "eBay Classifieds Group",
        uid     => "5019",
        groups  => ['ring-users'],
    }
    authorized_keys { "ebayclassifiedsgroup":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAtV0MJYFlw+xm3h3hNKWWC3DKUQFhFDDoMBshhCOG2uS7QH38E26ZMCH0pi10h3ZNIBgVoToyOSXVgSYvhRqOemqL9xt/TbKWW9zvod9WocoYHPqoLymcPQrFK84VqcZ6ymGvjMeR3f5wAyRoVAWuSPocwEMFb49pOeIkjpF90oO0LfkNxrkhfeIxecdkyHHXa+WZmSN8YFGc/6ev8pMoAhx6x3/GC04Fi+7QQLKhcRZoHrklzU9qoK1XiI7VtlLBI9QjGsFObnE27z+XNgtzuj1j3yUXZvjCIZ4I53a+Y7k+rEEYwuV9Z/SYyX/I4esLIUJS936qN+k4o76ivl8XAw== mmoerman@l-lwr-00122309.corp.ebay.com",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA2BNYw6ZZI1KSZ/3cL/KqewqF8OVnYiAHTOQjzoUc8wWgEChoyDsGcK22OUN2OnLaI0i5aQftwyNSuyQUtCgrQis0AHtkdfINE2hOmCzjnNsJrb+vR9+6vdV0joz4nn3EVEzrLWvsmYlI6lm/Bi23XzddF31/izaspbp73+cs6gV76mxDBwfkGYyInwU2hxsAZdGHZ5fXime7V3fBwep1sXceFBMEyKuplyhfEZ1InV6Am1MUyRQcTLUj5bdnDq9dD28G2lP5ttGXP1Ve8VuoauNwbLMCMGWPs3HdvYcpMH0jc39Ce8DV3MvRcYaYxuaFeUFRcDdPOTD+/0x/2SAKtw== kvdhulst-ebayclassifiedsgroup",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAOdtbDlpjFQPmNd9EP0kXWdtr07iol4eRxpJU99wGTSDZAroX+A80iW6+erIBkYgiaZyuxL7cLd6qvNbzUjapzueh8Oty+p+6HxZqdXYNtcJzlhgUGENw8ibW2EeQLR1QDl5Ncw/DaDMFgIU7GRjRqvSXJVzGJKyMh6EERe8xMGBAAAAFQCVyV1jy1OeY4IVIsuvolpmFrVWGwAAAIEAyi0L8GqB8kY1sZjgMpYLWCBCa1pNEDTh7vkh2O5VQY3mP0+12o4VL/K66dqZIjis3DkJWozqOKt3hFGtbIRv+2sqg/6ySd9wzoVcV5xF47RKvvqRWTiQHWdsAPeKHpjb4Z/achjMFD8lF5Ch4W2rPiAu1GbA3x57wRycnMwryekAAACBAKorVt7GGZo1pLksOC+E774xDqhwnB1wkln20lQoamcZnlC8RUmg8NvvLPmwYiE4Rm06/kwMp+3bxJvzLvoR49m6syizIh6Gqo6PV598PpseaEU8r78qejlbNz4Ngy3IbWqmoCa2/9ir0a8C+PNTx+l6pgFO5TJyRdj1YJMII/8F willem_ebay",
        ],
    }  
##### END ebayclassifiedsgroup #####

##### BEGIN evertjenetworks #####

    add_user { evertjenetworks:
        email   => "evert@vanharten.nu",
        company => "Evertje Networks",
        uid     => "5020",
        groups  => ['ring-users'],
        ensure  => absent,
    }

##### END evertjenetworks #####

##### BEGIN is #####

    add_user { is:
        email   => "netwerk@is.nl",
        company => "IS",
        uid     => "5021",
        groups  => ['ring-users'],
    }
    authorized_keys { "is":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAABAEA1LcP280wU3pX/0+gjhm7VYM9Zd3t6yg44+vq8eEp3Eku1Z2I3AUUqwQgWM1IJIFIcnexNR5VWaRsUDaJvfh+XmEzO2eJIqSxbIh2zBp/8+QMr7wq0HDzqwfWgk2wL9L1bMwR4ma/qEHZUJcNVKiI+xXbTjGfRrU9ATpNx5Rh7tS2HunYrsU7m4a1SHUk1MKjxXI0/NAG9vJJ7oyQ1LLq4cZP9BG1vwyfKYHSNgdMJvrOd+9/BjbgX1EJ5E14l3f7c700TuPSPV5x5QW+KbP74GG0/OhIvheHtRf8Zi/N3LcKRNtejbO+hctFhgWu6kp1ZqXHVJXWej5Yir5OEuf1OaRRCVyFWgoSWzQB4T3XPpjvuO3OljC2mQ5yxfWNOKqqxN3B9n13uBMo36I++RlDFkwHdJy50xMbWuTMGNTURrB0dSa6uYY5v0qw4BInXuAOIlrqdqNSPAMuQkHuHIArTYX6BoVE/6/WClYN+6CQ4u87RKtfnl1Hyuu7QEvfh5eolxz4FxpXCykv/dMPkwjV3JUIzZIEzLxqF5QA5Lofmd25TYocjMxvNGoe0hA5c8q1EjN/ll7R4rVn97Db/CbKqe+pY0ZZlFCYbdwCI/Tfzdph93CZjxtLAcLiCLDBi1ppV1m6BDztStBih50nNAe+Ivet+mVJ4bENuqBer0kO+oGTQPkYii3lzS7IfBuLZP99i2V0fkLsFYYYbrWDqESAwM9bUmw77IIjWZfRixrw6Z/cyRGD0lXLcrM0Ch8MJ9bE2TjFW5juvqQ1TITYRtWPAF3M4HmqXIYvpFovdsD3rm3+/9h3c1vQaDjmTbpO1pEOBdEleIRn4Ni0OUrgLmJwcjbNgl8bqpPTDJCPKBJchX3DVDlrJ6qYk+EZ1SyhOg+sZquoLZiRz6IIn3j70m4yH3EPYBZfwusKPZjNKrDHIxZ36UKS9hHQrCVfeP1KtJMZi3rjVC1s5me59Uc9V2DC3y+DYImWY2wcWw9gYgCNiJKRQJl4ESbSvEhq37mNH9sVMQCUJeuGv2xx8Rozrb+O9D4Jhe/GjixfeSkFMVFkfBLqyuRDJugLDA7BLdbwOKYf0xZtZ4neyxc2Kw6Il3jY26MHVxYqoqv2y6RgnzHJXdGZr+16oIWf6wWxLwmEk/kkO4namcZbJLMqlNegwt8grMPiIjLNXIa+42/pLwy07naHEUBr2OsO7fD4PokDYFKySB4NVMUU9CTTTF/eloTW2XGnO39N1k8NtGkQkffhyI9HqbuCvD8U0FdwSxFDajf3MIGBC+kL2pKQnCNRH7oJ/5oj0FkFTMO6kl8jJFLdj51Q7hf8X9oACPKmCGOK8ddc3AM0WyMkYW0OLPqIfOwRew== admpins04@shell01.pinshosting.dir",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAJu4y0R5kVef0voCJv9/9EL9ZO2TvKLD7HZRQfG8x2kxfd+NfUPQ8HKCTibE3CQQrSoZdH6m/y4c6LMMyGIjHAa7p1dX0sdse5ggQ2yfttQe5xTJb9HKhAH6XZBNGc07qCLnC3VkM7d15Bey8Y+/ZBP8++peu0dpiLJrcy9697WHAAAAFQDk8XIJV79MtatOi/iFKmVk2EwVxwAAAIAPOFq4vmckZcwGDia4o8cXc7KY3GY15oSGnQBtIA8XBo/wu0EKgjmFNOGMckwn4Yz82HYw/HVG0YWR6vEjE7j5cHJfOqAYJGKEd+XAl/CILdlKqLMNmOK5G9tdjmWhsKO2dDFXwVau1t8Mb2ib+4+FZGf7+ueasn62lTBhtaXToAAAAIAmRAtj9dM9IBzN4qx0N7VMqtyhqK3lwwm6fvAensrt+vKKvoCdgchXJ6hI+ZFolka6Xs2Oo6CutzC4mneHt8BYOWFEuiImdzuBkyvYPCTLVZtW51O84BHv6BaMHCUYzymn+EjvnuY/bigaG56GRuX/B4h338qq6Kq7WHdt9elOCA== matthijs@is.nl",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAKY4DvmUZi75w1EY4DyL0K9tnjoDOX8iZatRe4CEQqHQhVnwm86SkfGxW9Ng/tZnaxtC/cwUA4z5yIeGIZTwhsku1zCSG8wffirdTxpcvW4GngDEbZKnfPpsMxdmH2ZteNCaZbtfM8SCp7htTcgwlTCFtBdH3sj94zL/m+ysKiVZAAAAFQDVjMM2nB1e1sfuCBUIsZnX81YT7wAAAIBADnR2tvd+X9FJWmnU4vUtFxQEL+A+zRhtwqaCOy6iLHm/GSubysev9FiAzXMM2XrrqTa0O7t9WvKsaBHUMZ5DHJBvMRaiMSVw8u1Ab4W7eM0SK/z21Bf68SNR4AnbYFKJBq+eE5LQxW01+/FAwBuv4Vo6IGaR1zBP3StyOXk4wwAAAIBuEWoWhOMX18cs42b/dQgdTLhSi+TioRE2UUhvRgDG0lyqGHYcVF140YreaLBfpvJS77T1MmLxC/Xhuds/yf5l6r7mLmAptFeo4KvT8GbZQE3OeHkRj8iD2Ikhq702R48kJc2Lik6di7vLQ7UUrPNUtCqcPHna1mXqOHgGGc350Q== matthijs@ls-la.nl",
        ],
    }
##### END is #####

##### BEGIN surfnet #####

    add_user { surfnet:
        email   => "surf-ring@prolocation.eu",
        company => "SURFNet",
        uid     => "5022",
        groups  => ['ring-users'],
    }
    authorized_keys { "surfnet":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC+V1P5j1f5fcETEuGQWB+t7K58Q2LCA896JFN3AIWrM0cUwh9UgFGIqKe85WSdu+IoShXbyOR3JgW2hEskTsVuAulRaXOvmFQGM/Hg6QJVEn7Y8uvYLHx/1j+XEvVpTuA91c8ZR6VSH6RaiA7EYwGCZkIpfOYPpysHAC7bODM7Nkhev3ONV58fgoawC9ywYJMEhKNhPgkrTOFMLuLHnSTd4ynfmFuALAN8E4jHZ0vTcydV0GAtPfJWOpeg1Na4TArullroA7G64EYuVY5pE5Bn1JK/AEgpksBZGtOs3YhG+sa+wVsqf5UUIKZPBZFOf80xWQ9ZclRW2W9pnU3+hwg7 prolo@surfnet01.ring.nlnog.net",
        ],
    }
##### END surfnet #####

##### BEGIN prolocation #####

    add_user { prolocation:
        email   => "cedric@prolocation.net",
        company => "Prolocation",
        uid     => "5023",
        groups  => ['ring-users'],
    }
    authorized_keys { "prolocation":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDRNcgktqQ9WEYDV/kYEV7WuTpxYyZDNt/jEQ8im/j9J1jh/nX/fAQw5XT3yz0kIDOS+vBanewOwLk5c3ZGt4vYYHzV2lT6OvPuzW2RyW23DbGB4ZdUeCD92HfO/aDhQ17jZtaSx/DmhBnxFIqHxvKfBkS7zMlPxiSQCLZbt74RdBZFhosaFfb5aLe5MIBTCP7Cqcq8o6o93rXyQjvnSxuBEZZ2T/KQxbtji2GTF2ll98LkUsA6xSC4Uk9Jm/towZJ6zb6ozBQqsnZuncl27QBGXFfYjryEcQvMW506tYopThbJx5k0DDucrIXZ7F4qOHATosY5vgq0hvq+IHY4oFN9 prolo@prolocation01.ring.nlnog.net",
        ],
    }
##### END prolocation #####

##### BEGIN in2ip #####

    add_user { in2ip:
        email   => "noc@in2ip.nl",
        company => "IN2IP",
        uid     => "5024",
        groups  => ['ring-users'],
    }
    authorized_keys { "in2ip":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCrDK+oklbpw27vY28Jr8qmxAgiZy386qHSndxCjNdkMh4svm7qde6Caw4pbh4nH8aC5+jB0LoHatCwM5NG64tT8OqG66+VcyXKDD76+nvX24chI/Jv+S1rri+KkFjQ1umWWJ7gu4G2qYvVjVtqcgJU0EpbS2Mr5JxGCSt6sWZSOwGBwfcgVSs0X0+IwCifiTtN2sVphMPvi74qwEx9CeyKcuAm0xm19aB2GyOnpBtLAzc9ZCMU8ne7gY3liH9n4ARw+z0M9U0fAlYr8FG0VuAsR/8I5SxIg1CR4aFQwa4TjVQ30m3OpvszkRj3kUk5bitp98RRTcz2LksbJjZ+mLHH dirkjan@nmc",
        ],
    }
##### END in2ip #####

##### BEGIN netground #####

    add_user { netground:
        email   => "systeembeheer@netground.nl",
        company => "NetGround BV",
        uid     => "5025",
        groups  => ['ring-users'],
    }
    authorized_keys { "netground":
        sshkeys => [
            "ssh-dss AAAAB3NzaC1kc3MAAAEBAIK1dTAzNnkl4InISBuBqcL3LzKX1KSAX2ywcdvKHpsVrl/cPDwYWFWvDqNdN9ekpV9JtTNh+i6bfG/MBdwZ3cPzA5ws6vIYYg0MFj4EM79TRM6RrgLNS780yn/EzemzFU+NDk4Hbmn4UVVpofJa5z52cexBGK/sW93qJtZjjX47XFd3QAHf7s63r4TSI8fe6OVB8zh/T/otwFAHRHMLixsTqPrjSYa8dfi747QX1yolUxUeMLHWarRLGl1jK030ZPR2DAhgv5Sq4Zgt0VeAH1I+kQ5O4aD5EnV/FMmvp351HYv+Jh6U2+HcOfzgqG6vWnthsjM9yVX9T/wwcKy98K8AAAAVAKy5JRQBRjlniBPV8huhYPPRzPrZAAABAGsa/UJNJO5liT/jUDU70MsqL41ah7K/7gligzJRsNgUVOPN4cfCrHa0397oKpHtuFhcu/tbS94iPGP8YKGARplh832baDwyVktLWlwnI3yF8BejeR9zlfF8j+ZQ23hR1EZOU+gFWoWT13iAzc8ZwWsnW/8nDYRrKMBaXFqBj38/ugZrX26aLs/q6dPalcB3xgKtgu1OyjGVrkOFB64VBvye3t/zTucFewchyXUdj+Kj6vGAQy1KCDe2l0ftWzN8/OIuH2Zgowt7aFLsF+l4mpBchhaivIh4WmW0K86FDjOo8oEhDm+n/461RZIHODCnOwxQ5PSl1qGon3woJxHhCw0AAAEAcAtpKiUciaFkyyyf+F7SpwAPV+ZPsONBIbU8wpXvSvwUvWqPBJApIvQElaC6QaAqGD6IUnoFXB8dAuCrA1YYkL/dVlOAPkrKAAXJ55qQoVjv4Fg3gC1erldUXk35PQKpHv8elZjeSXNF5GyE9VTPzPhUvMYTEYqth1agYWmu0lT+E77At3mYnJWxMFtyNLiFStaL9hDNXPh7xlOnWBbDXynX+su8byZi1Ix/LZ9ImmdbCFDEDPv3nwhwT0eERWp5Lnz/7YK6Nqx8iTtxHEP+YBME2NqQbcMhVyqZJgF6P++D1o47gvFndqBtsi5r1HI6URCbdWIhTq4tVB1rRypYUA== Net Ground",
            "ssh-dss AAAAB3NzaC1kc3MAAAEBAIK1dTAzNnkl4InISBuBqcL3LzKX1KSAX2ywcdvKHpsVrl/cPDwYWFWvDqNdN9ekpV9JtTNh+i6bfG/MBdwZ3cPzA5ws6vIYYg0MFj4EM79TRM6RrgLNS780yn/EzemzFU+NDk4Hbmn4UVVpofJa5z52cexBGK/sW93qJtZjjX47XFd3QAHf7s63r4TSI8fe6OVB8zh/T/otwFAHRHMLixsTqPrjSYa8dfi747QX1yolUxUeMLHWarRLGl1jK030ZPR2DAhgv5Sq4Zgt0VeAH1I+kQ5O4aD5EnV/FMmvp351HYv+Jh6U2+HcOfzgqG6vWnthsjM9yVX9T/wwcKy98K8AAAAVAKy5JRQBRjlniBPV8huhYPPRzPrZAAABAGsa/UJNJO5liT/jUDU70MsqL41ah7K/7gligzJRsNgUVOPN4cfCrHa0397oKpHtuFhcu/tbS94iPGP8YKGARplh832baDwyVktLWlwnI3yF8BejeR9zlfF8j+ZQ23hR1EZOU+gFWoWT13iAzc8ZwWsnW/8nDYRrKMBaXFqBj38/ugZrX26aLs/q6dPalcB3xgKtgu1OyjGVrkOFB64VBvye3t/zTucFewchyXUdj+Kj6vGAQy1KCDe2l0ftWzN8/OIuH2Zgowt7aFLsF+l4mpBchhaivIh4WmW0K86FDjOo8oEhDm+n/461RZIHODCnOwxQ5PSl1qGon3woJxHhCw0AAAEAcAtpKiUciaFkyyyf+F7SpwAPV+ZPsONBIbU8wpXvSvwUvWqPBJApIvQElaC6QaAqGD6IUnoFXB8dAuCrA1YYkL/dVlOAPkrKAAXJ55qQoVjv4Fg3gC1erldUXk35PQKpHv8elZjeSXNF5GyE9VTPzPhUvMYTEYqth1agYWmu0lT+E77At3mYnJWxMFtyNLiFStaL9hDNXPh7xlOnWBbDXynX+su8byZi1Ix/LZ9ImmdbCFDEDPv3nwhwT0eERWp5Lnz/7YK6Nqx8iTtxHEP+YBME2NqQbcMhVyqZJgF6P++D1o47gvFndqBtsi5r1HI6URCbdWIhTq4tVB1rRypYUA== Net_Ground",
        ],
    }
##### END netground #####

##### BEGIN totaalnet #####

    add_user { totaalnet:
        email   => "noc@gl-ix.net",
        company => "Totaalnet",
        uid     => "5026",
        groups  => ['ring-users'],
    }
    authorized_keys { "totaalnet":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIB7OjD4FexzjUO+/FQ2Ao7vdbxS6ARqCdtwm1aRZKgCAOIYQatTEeWeCecOYyJ312uEFAFW6M5yTpDnW+8B5SmOSelLSs1CdEgNLHKj5Wwo7qZx8hnIleFGcxnqpMHQiwWkmaJw2FJ/4g1pDDWR+vv5F9wNxpn0bLwdCUC7zKo3mw== rsa-key-20080204_2",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEAv/TYlnItzyIn9i4BzCjFluiaR/Vn0iwlz0K5DbS5TWfaHe3RfpSiIlVN9LmasGGG+F4dHxqzFx6FrS8Mxz0Lzqbpog223gQNiwJU0eabUCBol8rWjd5aE9S98HHYpaBB27suslCFRQV7rgBdx6AMn0rcwplE319PpIYEbga75SeIOFLhPunxAnAn019HrdryIO81vdQJKeOYawwwp6YTUAvnbLfBNVzZAVPB7Q5jwlEWX0/ZEmqo2N8dczDj6cPdqbMZisvknGff8sVymM6gvk2SpbHFZnFLZaJRjEjN5Phg95L/qMaavMMr0fMxMVlWlE+yw8Yy7Egn4Un15sPc694F+l733IrbQB4gKnsoXyzZeIaNFlmIk4omDKwWUFTtYSLLZU0+V0Z1Nj4Ys959Fh3xgA0/zaY8zZLgzJFsn0KFa0QsQXUF5FS/narM6Ex/wUiAmj88TNJIKRomPK42A3TLhKh8Kzeo6K8n1xdeaOS4OH1ixgup+NMYb3bK8BkxB4S9FgkVZBQo5jKYqmMLZoEOWB9BCQvmgwOtWudxymPZJj9hzS0TKDTzUPKpAw2e+o5tZDUAhynu+F845Gda5//T9m9Ykq098ZMltXdlXEzAwz/q1+83ECrYh2PUtDfm6bZrIXwbCo4Rfi5xMZg8JcnW+Q6YsKkSGH6CwxKwh/8= jap@jap-laptop_3",
            "ssh-dss AAAAB3NzaC1kc3MAAACAbqLzvxX63OVeWsGoWVQEz2/oIJhm4DNladm4ih1Wz+LSTjWCt29QHQoq1oDX//O16SSy5yFxPm4TOJAB9oq83dF2eeexKWmbRT/adh3gtNDb+oJbho7SyZXSvy6dC9tsiqbjV34OkaWYjNPsLudpuo7LjpQ92l/UdPZig/k+GW0AAAAVAITJyEMwSqv8nC0PJxv18herrINvAAAAgAg0P/fdCWDaemekCTmduK/IzlZJpaGFj3mlJ1AO2IsNVpLhCTbJSJAxDXYDFETc1FwBT4kN+O2FwUGa+zOta1w4SmHx1xzEZFfa6FjGyXRSZxRY0C/iufnaFF6+yzYnTNgKv7yxDM1NALkeieXUHXKzEdQZUuJl6NKyoxMdE/eqAAAAgDF7LJn6EY2rWIG3Ekaos6M0z13hvGQyo9tuF2hPQ2iGTpJNKyDlF9dYscI+MRe6yfiOrZc1C77+vX0axDV/radNIQ27rMHYBJALHTTJskNL2S85nk8YrZsG3US/Pz27b1aBmxcN0Q2kzXlko5x5qiFAgBorgFG1O+M942SuYEsk dsa-key-20080204_1",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEA5hyA6Pt8K/xXoPWk/r5sOc1ted3zT1no5ptMB91jXyy/DGUkcYie1ydORu7zGjU/oPSugG8Z8GJg0sdIk+gmKzbsBWFs17fqoCpPkkD+F1hgJKmI7e58EXuQoPADvceMFGYlyixuN0LSezV0TxJOoDm1JbhMnO9tbm3LxDJtJweGNPjSi+VbdLL1LrfZ8FFVdjTsjgfix6Z4rzt/em+AMrD1KWGEFC03gZX+ZKGdGc+9D+LWeIBKv9c4neKD51MCoULtw4EFa4aI9+V538AoROIAzZNG81uPZAMpYHulLOijuE6UMfJok6BU4+FJTUwgMfy49ZY3YnTXYAmUDzSuFyCLNMUtt3IxzdLGixILZKpXlq1mScqXxJ4ubwOuFbxBYLqVzR9G4edMDjp+hps+hsMrSKJ2G2EH5iezaDSh5L8MJv/GbfDfA2sLSkkz9FCdaoqzPbkCA6UuPgY48xwLmj1T/v10LQFgX+a03l3883CE7YtLtxFr6CdHBCfhL+VYZLWFHvFXObCCM3ldeYVM/RQalaY2zPslABDczR2+iq1YhTk6shUbEC18Y7/nER9UJmGXzqxWrL476tBlx5ApGMXo6TmgyN/FGB5BGO7pfyymU5mwM+QeM7a+7f81w1iv7TZ14uQvKdN7IYtSMeCks2X9aAxedNHqwtD6ejR4Q30= freek@Blade_4",
        ],
    }
##### END totaalnet #####

##### BEGIN signet #####

    add_user { signet:
       email    => "noc@signet.nl",
       company => "SIGNet",
       uid      => "5027",
       groups   => ['ring-users'],
    }
    authorized_keys { "signet":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCm41d0scEXCFFd8kbpAFHfkTp3+smrNkvpC6O9PUKT4JNg/FBi1mlXrknvqJg3CNBlWtQ1YyfTldhGdELr85kFlcEycqtd60MsMxepyre0p9wS+hEN8ySmNzZ+VMu4blRuFpS0qGNG4bu6lBckx//VIagQ7xEuguXw8k+YhbHxGMOQ8nF7WgZO+PXHCkYEKgB9XvcxV4s5O4/ggyYl9KHkzRmntwO4+hOyQQp3WmXDc83NMEurIKCWuNVIBAGtaURiuoKdUMMJdm1XMiGBU6oLDNToWl0usZdfT4FSaQMLg78VDfiJr8Zx3WqychOwWAmQ3d3GPzKPtjm3wTel9UvkI0P2/zh1CWdR+wlddxLftiMMx+ZBQN+tOJEG8SFeChNAcobxDSy2l9koAnwv0hMmaiWKvQ+oe/OMMHp5MsoQc9BDeZeznrpVNR6cnOuFt9tiZKZfcY2RmvwT0DQHTvFnWYlIRPhEpQ08XjgMyt7kqzEuIAfrHs2hF9uYF8K3U6E= cardno:000500000C32_signet_ssh_8",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAtZ6WsC4A42OoIluLwepVvO62plibJBZLBErRCXsbLwi7pCaVxriWHncAUmrOKUi2jq1YOYoMNXnh/REndq7DERSgnMleoNPj0T5l5VhOfLMk42eFZbebL8Be8858I3CvQyjmFmNV4bnuQVHSgBQaL8T+xX2Lp6ci3J/ZeObpjpQ9MCsBy6tTe2wxVTY4QNxY5bxsKYOD7ZBn+qVFjn+w01pIuvF6ONcojA7+1JdS8AeusegJYWqZ50ltGyjJWy9DKWdVaG+iVtlUJuPY8fqKKCTk3K2hTStzeogbJCR7fd+VFnsrlpd9U6fB6BEbf/RsqWMu/3F4tyxIciX8jGkzCQ== adrie@d-Adrie_7",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC51Jz521guQFDG9kGq4fg/uwRZ3xiLsf4eMh7XyC5sCi76n5mYd5nribivZxwkt/UmLQMVUfawmcQKuW1kc36mtXndjBmeQJ8JzX7YBydXuzBhZeE0O058SIMSpYvLlK4TJ+j6z/YmY1UbbxagxyGzmCOLRWTgATO0L0pCiJ7xGf34Nm4gKgdqYzRfizdBeEKWkSMr/dVp094vOwsEYLB7xKEBSMAbjb5IbBS3FPZpBgwSB5+8CMzfIgeeNUXUSBOk1DIKCE0y4DuyFHcdw7QacWltF53tDfpsJj31OtMnR+fEYxD5hPcb21wxJrY74ICPscN0VfMYxpUn6yOlNtM5 _4",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA1Lqdb/bpSjUth9hA2yrsElsnaJXVJeqVVXAQvyHpvlXJtriYwwO0vICzpWbo65v5Pn3oZR565X4xy6m4DhZKs8WylurGZnUphXEdSRe8LiEOVy50Z+ownj2ZaAR7HRtdx3IdbPLG5f41EdVLDWpsg9MWRRz7iu4Pi/ZMCeYiJfGZ/15ldUGYDj+RBaxntWkpGr7q7kjJAQFr3NntO/qxtf4S3XfHo+pfsNVUeIWwnnI7WSWwu0NUuhSG0eLrD1RLrIDLs2bRk5nB45ihylt5DWzICHBQ8S72EToMSqw2kvn4YeLJ/BPj/z+I/AVXjmQ7Wm5hPzKDwA18ruF2MUZUmQ== justin@justin-desktop_1",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEDxq/SSPQJ0y1jVx5ANcjrtrnrR1pD+3HJvRlJ8p3vqsw6Oshyg/O82xl0Iy+DN0pqQEPJ20mGcyxGJGZMmx5yUzKmdDb5aRkOb7CqpMuBILKazJaiHWvCRaBcAgdE1Vsq2j8J/OFnEe0/a+xLTdBvjyIQPqojmXUL66+r3P1kKNgVHylSGMTr5YAL7NC89HQ5MjsSzaOju4UM+0qp0FwId+2QJEdXz9VI5ej7qjeoBKoL76Lp4Co9gL84zNwBg3OrIHiZpf4VDvSSQU+9hlXN0YHLf6T13POQ5u+bWArQzV/jn/QL62TCqUo/6T1EUl4yHPX2un14f7FAL8lpvDB post@keesmeijs.nl_2",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA1WKEYV/4jxiWGWXgb+tNwPQEO7TYblCrMfyexnTpSHA/TWHFmq2x9/V+Hyie12mM5RkIKQoRuBfFnHUSal8PS4nPQvKFbbxE1e7oWHE8Y/VzECAtmDXhaC3zLwxlXesxdy7WJkXBqGiPmAyrXl/C8Sbs213nDYAz8etex28eSyTvMl8sao2vpSK/6n5EGcV3aWMGazZsvQhk+cwXUIMuCFR2a/YqkKk1SKAXX9W7VHaZcMXwEhxKEcvjS3p3a2WGiN6vg/zY/gEgzPOTs7ZoBGyfQn1D2iSG0FlZt+br7QO3X5iKHT736yq5hJRsXBLFo/1ItpFAAwQWBHWKREcyVQ== bart@pc-bart_6",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCJ4f4eShaxk6+RvOojbWG7ayUmCsozsKV3LGT9n55g1sXh1CVnBx8o3SQb6bjnsw6oPawopJ4yH29DY7TOAVw8DzwrVs70TOZGtx2l20OO+cDuW9cjsDZsLjmayfqHiJtnvhDN0satBucfHUj4C7r7XqlGJaufc7Ewa8O1HKXQWTGIIAv5vWPVk3UwT/aSSCm9ANzrRJA3WN0xA+Ax1mJDXQPdN041K2XQjEXNejBXV4TQwmunk84nm2SmuKumhDxqRWqcKizVkmtrRw1wPF+po6KvYENTPj295qgv3nO0R4nbq6vyh4Gssn8VmRCjhyl7U4jtxpsrh6kFk6AfDE2L1PPg13K2+w/sOkS+q435s+QRKLKArzBhAF6bEeUUcWnrcGWY+jZldlVMaqQnxW2mn76z5j1V4b8kWnEp/t6YBE4DeY4Ljgv2wKG8GaCgq33eMY6hP03NmgAmwDAudczBtRriboZfOVw8JCa20EdORxGdNGFHfA+yIlkGk2ECNd8= cardno:000500000873_5",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDHC1Nq2QUeyT+v3vhHk/6tSQTxBIsg7x1wPMHuEPVAYN2Zd+ZCSUlk7pPAHQoHVA5QfihFNA5u+KHyFhRikyndaX90l8bNiyPs1tR0bWdeN5R9cclIOcj08YukDVOgGecBQ4NM0niKU9tjfbjvCLmcJEVvIw6jmCFccBQZlMEgAVnYxiASxI4PoR7NWERmv/lEdxMRS2tyoYhlPZX3OT9fTyP23gHR2HW6XofME0xCZBDYVP02GsLC+C4LPv6Dlqw3zdGHtk8NCTqdNhmNokLnshIxNCIdwkge+TYv1HvsUkQDdLK0l91R/TPem24kIonqL116MdXWY9d/vIDoho/R kmeijs@signet.nl_3",
        ],
    }
##### END signet #####

##### BEGIN tripleit #####

    add_user { tripleit:
       email    => "support@triple-it.nl",
       company => "Triple IT BV",
       uid      => "5028",
       groups   => ['ring-users'],
    }
    authorized_keys { "tripleit":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAv8fJBvh7+NWCTUcM4tjQd+6ATsTHgbtkicFjOoqxy+iSXoFGyuNjCrrzxwHC4N98OC0iFmR7mFALlmjQdJf28EwcT1m4rWBhB3KcZ/5iun9l0jD4l7rhm+FLp1/PYgz78H3gXave7UORoT5j6ACGQsnvlC+mWrHzhxMhfW4GEumpCO6zgcq7tYLbx1PCZ5xpM0VeY8g3xvFARGjavtsiGZOulkJD3AFZ9rULLts9eDRo0YWjwhN4oXPOH2Dwmp1YalPoGWyb6/dxPC0hMApbJkbxeVKQkvotzheGEoOlASVsoDmXIWk3QNJijFZeIIUvASDwZpNdDy0GRsjE/jzHOQ== Triple_1",
        ],
    }
##### END tripleit #####

##### BEGIN jaguarnetwork #####

    add_user { jaguarnetwork:
       email    => "noc@as30781.net",
       company => "Jaguar Networks",
       uid      => "5029",
       groups   => ['ring-users'],
    }
    authorized_keys { "jaguarnetwork":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvzUjHZ47GqvaO4SKo1wDVfy65v3zF55EryW0zUv8fQUlCzsN0veJCviqSfWfFicaGeU11wvhuhtj2G/o7wc/8w8TuifK36EKkGpuzz8P7asHyrNP0SK95dAGalWTthhO2spAFiT6LpgByZON+4BQxKtigCKHNWS2KBfG+janh8zqc+ICIpvKgnetGPxvr+yyi8Q3gaDy91cDcsWvmo2/BcBYvWg4MbB7EhWiDnXUZE0PSmh2tlk0LeCzLyruCuPO0L1s5CNhsToM9zar4J9fP49uNe6BjCOsFY6A+UQHSySyvWwi15jyUH6Du/AgPw5/+dxuVbraqmTC2X15FSUuJQ== nico@olivia.as30781.net.home_3",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEArMGPKn/WH8Y1peu/dC/7g2EbvAeFcuxyGCUougnRvqwwPVxfalgDSYHFu//Z86FA3p+micD8cJSbgbftEs8fpvY6ja8jndRwEWUfBa6gKFhKu64ccEpwk/XKgC8rzsAfo+5+f9wl2oHiiocE7yf9T4kqeBJsP5g7QoIcH5G99ZvGAWAb0krX8i2+eg66ig9XL22a2lgm+Gvw+aiagmVGVEsIPmnNsiwKpr9PP7iwDnfXUp9SljC6gvGZrWNu8Kd7vxxiaYA9gBZFqvtCmv9ntBaKfKpBXVqlt6bTULBiDmztc2FEd7/aiupa6P9iiwLj5giYkDIpPTlTI3ii/kO8yw== jerome@macbookpro.local_5",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDOj7L+EAiexpV8mCqG6gJzdFzz/lsR5LGLK7nFSvyK6e1zCgXuDiWh4vfbwjbXHdC1Fll9dyLFE8BpQvq5wO/V42K7EZgYV/AayQbGgcr79qF+2bAx7a4gvTo8emxmyPkKeBe9sUjBAwMw9jlgnZ4rkitkzyR7xuSAfvhrqrVaEBBzpL6PWPmKj0z3g4gX6lIklzomHpoNdWVUQdQyEOslboYwy3g6szcjz9Zkftve0GEwvLRqJldfBeiVbwWcByxupU11JUDQOnODQQ7uK+wAThiieJQSlBDj6Zx2UseXtHFUKKijdY7wmxMNBqJe0q9VbarZvgZ2CXvT6+kqBuzIJ0cswxfNEfE5s6v9YrClDGmP6hHDIcAzT+NqqFOUE6AfOYxNotzY8nHAYgR1dETx2xVjBbtfiFozD+qmS5CJ+ZxUnrIOCL0gKbqUgzTc+13J2NUVQiVXrvcTaT4P70s3dOY0G6Xb09me6e2urek51mGOa8y9RIPmc2eVXOcIzHwgVMeZ+Cmj0D031XTQwxk0bdvnsj+q3GTKl1hR4AHaRzp0UFqfSuM+Lc5+jnhXyHb9GeInbCtDkfvE9XDVDA8R3zZMYp7g8bET7dZw68BCYfuU771t+W5yz64RtaT7/BCtL9hAeIA+k7eBs9YxGvIvAD46r80lKvngBOyfahlN3w== alexandre@alexandre-G5210fr_1",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA36bkgfuHi2g6fVJuIp8yChWRvR7jVguCuVgniiI1wKTw7Ve//Pj5WJaWUALVTPZ9fWu34LfZQqfjgeIFmfokqQFg+sNHNEKSto2c8sFn1t1I40kOoJsg69VPXMKkcip9F9LVfAIt1dzYrqBM2bFliOsGvO2R73q+bPXN1g6WpA9ERVNofYJ4wVC0KEJoZJKqpVHPSHStKVjQ/oEkMOfxREhwdlDzhx5w1khBq1vhqY8sJiAFUMqTu8GJ0HOLDVGLHGueDRADteMttCI3PmRwhvWWQp6SQPw0dz6kEyY5gVwoL7dtZsg5ZBRNIaFL5XnxiukA4gAG6L7F0273afGdpw== nico@radium-as30781-net.local_4",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAtE1P0ZDzqjlAcAenpqJt2i7AP0yBBaGBAl31UF9TH4vyCqKNxY6F41Vs3nmi1/GldCfTm0ZZBluxng0qCridTWpbVL/J2ql299TbRTK1Mrh07oZQhI1sz4/z7Sjxx8SIfJXrrhYhorb4sxFwzioIBuuJlKYfuKWR3WHi1M+KbTzuAoQeepfx1xqmL0vANEhyU7SQ8wCod61C4UxEBKmynZAj2yKqtUPZUrN8znK0YHpXWDndm70tQ40bMBf+Jt4B8CbMcw6zxO5OqNJWBcqhRw46ALgH9wLsvidnnxO8KIW6rdUk2Wmg3mQCXSkzQxI/6dLIORcFyjcQ3vbPJv6kaw== matoa@general-lee_2",
        ],
    }
##### END jaguarnetwork #####

##### BEGIN tuxis #####

    add_user { tuxis:
       email    => "mark@tuxis.nl",
       company => "Tuxis Internet Engineering",
       uid      => "5030",
       groups   => ['ring-users'],
    }
    authorized_keys { "tuxis":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA4N7eB23pl5rXVGyRzY2Aqqsk3rI968VTWBh8c7KHJtZyygHIa9IB4Kpbpq99yFnYvHw79GyE57Ypu5lPvmUODujQvZpKxFmsOQVQX3nNL0SyKpbdY2/JZ5B9qqLB3NiPDIKwNLICW2MJ2tUPEH2rnYOKVyZArZi64cyAiTt2nh80qG+W4uusTtuEYek02H7KYr/Ox/mk+7wo/ugvLSSnJ3gYJ3xIid0oVusZmB+lqeRvPkfH69YVwHsGMAR8DbCERK9F3YSMF971oX8vGc25kpGKeQ9h8p67TqunoBXQGpDTvi3pqDlckFsvWOiWJNtAgJXZog/yu6XkVlBe+O/Abw== mark@tuxis",
        ],
    }
##### END tuxis #####

##### BEGIN tenet #####

    add_user { tenet:
       email    => "noc@tenet.ac.za",
       company => "TENET",
       uid      => "5031",
       groups   => ['ring-users'],
    }
    authorized_keys { "tenet":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/xAPHmJk15to6xgl3qW1rUEuHcdodOaoGhN5eMTatv6YNuu5NLopr8981pzY+nZmTwAUw43+UzSUZHA7Net57epL+6lMpKYyZm0Qa0L6og4y+BY7ksC4MOQEejJV7m1mAC5zw7sUUNPy7wtO3Ni3ur784Oc/1iQZOXr1Ak7Z6KRKt/sY0ce3gxsoOB21AwrJc0RRRr+AONOU/drswNTL2yobtGEOYgsrDOuDDTTL/6cw//lKanKVcdQ7N/GEQFJPM4Hsl9BY0B7gwsG6ybmx2vN3PJcaOClRjWlooRuWc8uZndQyGHJFhYOUEuHLrjI5vEUzo0mLg2Xxowq66EdoJ noc@tenet.ac.za",
        ],
    }
##### END tenet #####

#### BEGIN bigwells #####

    add_user { bigwells:
        email   => "neteng@bigwells.net",
        company => "Bigwells",
        uid     => "5032",
        groups  => ['ring-users'],
    }
    authorized_keys { "bigwells":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvcBYRMAmEMmj7Wlh5MWf5wqoJePWtI+Hrpes/EoV5bsQAY05rGtb1ZZPZG9TDjBqblZeRv+tFMlsEathscuSSJBtR9mAZIicfa/799EjuEXwVGkTsE36VeSqznM7efELJn5l7Nealn6R4WpXUFjmvutVzuqhNIDK/1ZvEY62wRQtlB21flFCulrHje1KxCv7TCfhmRMf7J2A8jXXXiqEVsZ8yF6YNsg7bHpjadgS0vxlNXc8RYqW6LU85b2KxWaybRoWuMY4S/AEQNxrMNUHLUD+qjxbmkTV6cVWlx9yfPb8c3tpZL4x78/Qhae/a1dZcYz3aeO90TJ2cx0xmSLjlQ== grizz@sys0.dipd.com",
        ],
    }
#### END bigwells #####

#### BEGIN atrato #####

    add_user { atrato:
        email   => "nmc@atratoip.net",
        company => "Atrato IP Networks",
        uid     => "5033",
        groups  => ['ring-users'],
    }

#### END atrato #####

#### BEGIN cyso #####

    add_user { cyso:
        email   => "noc@cyso.net",
        company => "Cyso",
        uid     => "5034",
        groups  => ['ring-users'],
    }
    authorized_keys { "cyso":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA57YS+KcnoCLi4KLZI+v/AW/TauPoz3YaaOMWzi3tIudclULf91YAODJUoy4XbSbeIuhGqd0XDMRmUWua2hoPFcXP90PTOlcXm7SqLFsJ/dYPwqIcmqG/x1MGN0344l9HElmkK9kHqwvv4DbwfcJXppBISc1izrWMBPRo7PxAbpNgdF3+yRR4q9Ik6fq8+rBhh5XZCAzkn7JdyANcq3CN6RpIedpF+hretPGSv66s5J/G2yzEPUrPSa0RL0e8PLNgn3v/Rz8oimDeki3cxDzZ6Ke736fA3seagv8YYVN92RNFRJ8FQDjtvwbjpOsie7Y4NmlZi8NRqsg5JlgVrihJcw== stanley.westerveld+20110131@cyso.nl",
            "from=\"85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\" ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA0a8om8aAyg3GrwVhxRWItUZA3NOa6mRvIPoi7VeJ4IJYzOMQlgo6QAgsTe76w51covb/mMJoTteMvuvk9arPrdYklEK02IpzbuvsPIUlJGFOsCb39QIOUmcDfJXti+nqiRT0XMuHcGZuGm191/RDzufn2LPLELVVWIF50YQtOmzcNN9Jnz1RFutKCj4g8c7sTUGfaWd9agKsheeM1+g7Y71scqlKSq0T5TvtjMY9aYIQNGYWjtLQ/CcjUK8J6y/Jr8tsft5KZavBUw8ugW4vwBNn6DEj0tR9TJjSdl5Jc7JMA8w6eC2Q2mvVHmdUo4TcwfgrUmL4sH4R4JvPDdr60Q== tjebbe.dewinter+20110202@cyso.nl_6",
            "from=\"85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\" ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAwLuJqOb0NOq26YX2Vqay49fA8oamVf4EEymB6b/3N+Zs9hX3uhXJviKxYB2X4no5DOGLRKQPI3LrGs0x6WAo8PwAkdLxhrCJf6Ie+wKy8gun3QS2CeagkdP/Jd3F7Mh+Yb4owWTAY7FC9fS84+Gk0KMMRXZDuIFt0IgOXPLh/B3PQgWZKIeSi3rfzw5xL0KNmje7PERwTdJccHCPlG+CiKbzCJLjFIaZFCXkkD5hr0n4bqeoO6RgOo6JRXYfX389JdDEfT35udRCshAx/8DZf+Yv8ef+th/WHZyXtRbhnyLRdxDbXfnb8KlJxnLrN6lirOV+34hQ4blPHB7i/6u22Q== paul.bankert+20110211@cyso.nl_13",
            "from=\"85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\" ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAtSHiwGWR9lFHWtNsQET3cWtmG3TwFZOg2W/Uy7jLw4uBKn/8ijSNlp5HFNsR0KbYaisvmwi2UpaNtBQySP1cuO7SDZ8cTbxlrT6wCFV3kmhYkyKuRKPWE8md6mUKiXpCmIrWVZ8vRn+NrDZ8i2WtfOjuYQz+ENoS1QwjnW0ZYwvQJzlBlOyYVQeqyjAzww26Q4WbYpQaZ3G/RPehoMK9UBnxfMF8FIktUcR63J9mtPCuqjOYGtMIypGkL31w5/rX4sO5bAjv4ivfsZlGdSyXCcWDR3Frnzguy2kqFDyeiWZVB59CuwiyAB7CfWneG2gCEfOZeXPJK2Lze48U56q2yQ== janjorre.laurens+20110201@cyso.nl_5",
            "from=\"85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\" ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6LuybMF1wlUfPQReIsUMO/0PeJGJmWosbk1ZKAxbybFJwIcC0Y9doO8CbP7Yi7ipzBLfphHkhWhFZqM4955iTIxITdzdHAetElMDLDR6ubTIztd9t8l2/PXq1Q1dnSIQikpY/4o7KRLqScYK2mOX0SVZfhPuhZdLo2IR2EbtsDzsradlzd+2ezrzdbz790/vCKZZV2SizDtqrRjNNn+9RccY84loSgkRak/L/IpuL4mwmuCaXlaWqGyE8FiqlFFyIm9PKTS3dYjdHH4LIHpye2pP75Ba9gwM0/Fq8KYM856RaNXuJ+ZPgpAiNQFzU0mZ+CTd+MHsViqwWs5COIVrkQ== erwin.bleeker+20110601@cyso.nl_21",
            "from=\"85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\" ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA2erTf6j7/iceVynY/+qpvC+7YvdxzgS5sRGWCFidCYNANbkP9eSOW06vb45JyOZHTckh3Ot1TAUiJSifFbDUnxnxswAwl2zOd5ifh4Mmj97VFjM14xwe3UkX2cd2vAGIOWpOW9AxelCyYbpzKhOBWDZu4IgL/hnWKWvY4+OSkkOB5gBwD+FAsXJi7ZfTW1z4abCkL4ky3tF/og5/ZITx9ImRd0AP5mZhlzsHwgkF0Ihj26WOdXziwlStvcieS5DVoH1CUa6PrAzPHU7HFV4Pore+jtVmJRykjJjwA7BHUADpstt3LyuGkg3+VAX/D3DFWtX9mGdh3kLXmKW2+9cQPQ== daphne.kuipers+20110215@cyso.nl_16",
            "from=\"85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\" ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA8SsgGI2qzMgQsd9PtRun4Op7XtDdgZRxVe6HZHp4fpNQOygnQ5Kkob6mmxh32SjcuaLn9coFc++sOVttO0kwHDcJAuRIxDEz/22lccr3xbxTy8Eu/64hPHXt9A65kuVHur9H3gBbnQ6ifP0zGLYZNR+XLaFFTDcCu8418JoK+zxGW6ZtNUnKwiCCkMjvZLo/22AtFPPY7K09k8Yb57NqsOO6hCVULeauVcixHZGtAqkhM1OzhGa/5JlpWsS0J/Mmu4Vve6WgV7QYPSwaAnJXSnRDwbpj5ycbBTj6cn9WLXw0Fci6yslXcdtWhhVFibu9kEycrdqYcjyHkflW/uoyaQ== peter.geissler+20110211@cyso.nl_8",
            "from=\"85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\" ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA57YS+KcnoCLi4KLZI+v/AW/TauPoz3YaaOMWzi3tIudclULf91YAODJUoy4XbSbeIuhGqd0XDMRmUWua2hoPFcXP90PTOlcXm7SqLFsJ/dYPwqIcmqG/x1MGN0344l9HElmkK9kHqwvv4DbwfcJXppBISc1izrWMBPRo7PxAbpNgdF3+yRR4q9Ik6fq8+rBhh5XZCAzkn7JdyANcq3CN6RpIedpF+hretPGSv66s5J/G2yzEPUrPSa0RL0e8PLNgn3v/Rz8oimDeki3cxDzZ6Ke736fA3seagv8YYVN92RNFRJ8FQDjtvwbjpOsie7Y4NmlZi8NRqsg5JlgVrihJcw== stanley.westerveld+20110131@cyso.nl_1",
            "from=\"85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\" ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA1LH8m+Gf458Q1qjlB0XRmtwt0g0UR3GgxibzGd7xbdaS2mPr/yKwvyN/2WPUK2cu+RU/oYb07w00d4sDS5oshTmxBTcsjdfF/HkKGN5d/y+YNQuL6gncIiTnal/2xJ47E2FfpMuPboR9tf/jp4rgPfHdjNYaYj1+fAwKyrGe8vY5N1Nq3bSzDuMcxRMMYfVLWgETKGFCgTfv/T5O0svGTrKY9GIvhp4bHSEmmkmSJV6vSqqYvUuwC90MyZwEly7vTkD0GTespAr2znahfzgbJwiXixU2NHmpvDwhNhrojql0uUXURDWaEHJy4BL2pD6TO+q/rgO+WGuNhEQiYKAXxQ== franklin.hink+20110526@cyso.nl_20",
            "from=\"85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\" ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEArLTEWhR25z1ADs7upqBbFPyZFZUZXJF7Y1OWyTQK0OZl2KAj+rv7Aeo2a7s6A8Fq8Wu7cb2RikbPhhyJU/6lVGH6Y12w3Q+DSnW0uk68ydvL45M6e+2MCrljIealB0Gq8eUz1uQL6QeVq60IoRRkwt8LnkMh4C2NAS2keDwk++VglZWN7Hab73yw8QyDyTQxiLBy/Y9OC0Re9tTQUQTmx54EV6XSstmnt/QtutzhQntof+dO+Rsrd6ZRUNgfN1+voIlErTgDaAxYTggRqdWku8jwUuZt52bEj2B70RQtOSmFCfG4VoPX+iK9MQEs2K206clXix8QjKrfgrsXQvRznQ== reinier.sierag+20110211@cyso.nl_14",
            "from=\"85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\" ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAo3N55XzwYFN9irEjH+cohTAtmJpKBjU0P4cfhiz0r59S2K0xdAFSbBoQap1to91OHZKDkQskAJhWZIQLMJc6qu+Sj37L0441LrjLs2oiS2uK6ei+3Lf0MIVodkiPJ/7jWDXUZFEknTcLUMqGrOM1sl1LSJp4EYFVVFKYug/b3jWkINpgVVu1Jcf+B0R3qraaJnWSZWF0fI+xjT9i9mESN+zyU+CAeDs0L+4fi8XK/GExNA2x+J0zTZTbb8S8r2/+zZ7sJq3UN49O+3mhSw9myrSwdZGTIwRPsNILX/oYU9j3J/UaRvPk3iFQm0nFOU3rjMm5JxgrFmGvoKzgB+dD/Q== randy.tenhave+20110131@cyso.nl_3",
            "from=\"85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\" ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6l6ZEmDfbQ8omCurex9uAbyjwIU55RKfuUhDlLLhG8NOiasV/715XecjHroTyWTutpbFXR/iXeIwERG3qsC1pfp8XgdkT5w2ZaZhI8hiHy6pN0Ah6XgZKMaIdBe8CZKRekwRgBaK65ANuJZfqlunXFYoTEVt80Jr4nfk98Tn/ypM9wlfoRz45sp7pi18oTsCApQLdlDcRQkuUoWdNnhCAPlgvwn7+xr6cypZQLQZzXrpnWPNWpGIYT6dWZ7HKudYCFuXa4TP2Ar7kOznr87H1OIX4H09Arfwu2rzxvysdGZi3aDkmtZag0lzIi1pcUaqpM5WBjbjzo6glcFEtcmNuw== jeroen.bakker+20110211@cyso.nl_15",
            "from=\"85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\" ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvvB9NFjeiO6xcXxaf3pek6DhHWvY1gJnDSTHv9FvflD58f8bUiuzL3R8AKZUotjO91CQZtkXTpJ4cUzio8t4uMrG1la69dImOcjosQOiVKMRqRkIk3v61gAs9rECfUk4X/t+rleNY5FTXj1pHJMjB5EAJThcImzmEDuSLTTgkCcETBj9ys95zdhmCNLiyVZdaUKzm/uTX5Dg6tZU/GGaXE81q+54G2/InY1eDzwWL2ltp7LQIb4JEOl7U6d48r1p9a5TM4svqJklUyUS0/ozYnjVK2MeIqdV84ezbNiyK64CzJsKxDiu9KxmDhRgf8lqkWM1Ls7Cfzb/0ErIRLGyTw== nick.douma+20110207@cyso.nl_7",
            "from=\"85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\" ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAuWPZTntQO3i/9rFNrTr4k5OzxuMrj1pqEfnEiXBN9npwEYkW0g8mry3kHXlHHyGCaQsYsPaV9T+WENJneTwbJg8ey4zUOo7hRT5ihsCIKF3A6X2+fvGfnAleK208PnZgiocEsIvySqgYS52Z18lwjS3gmj6X+RJTCl65pQBYtv2QDilK94izs5PuNJNkHn9MEU2GofOS8bx2CDAN+GzCaXvhBdfGrvfv5GPKNX4bTRc8j3Dr6A9cKyZ1QN3FvAVlcgkOncDlS6/+C+I2WX4wYydyIdRoeUQ/kZecugMe4ijHiYf/o0f6yL3+Zl3fN75McxvOOJEAW9n3KxL1Ua7ENw== bert.driehuis+20110117@cyso.nl_2",
            "from=\"85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\" ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA3EHuFO8NWZ/Cg4GRykh/LDNjr2uz4/Dczv3oSxvHYmbB60qbeu9ezdDmxPRIe9YCZpYLxAKhe46J+xeIUK9I55BBaDBhWgbiec6I4d3F+fWxWKARxPx9mF1fKsGvw99ZUMuUzCVsn8An6+y4wuG/eGluZJ4N8V7fkJJM0JYILwNAs0mX6c1Ra7a6XtteUYIimQBM1ZFWrAGkCnqyotcR7Q3bErkU9SCbdTwFTbmyD6f4ODRjg0NSu9zEAGamJ9bzbTYmoNzZn5Do7MeL6jHdKRyb22lTyWSdcrDVRDAVerd3nQZBujUjyW0nZrliJ3Ab3xV1Ozn+fmIoCVzNCeSLeQ== barry.schoorl+20110401@cyso.nl_18",
            "from=\"85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\" ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAt7LshrQM9hjsJhwZEnhrds1Id+akbvhl/nvJZFxUBfkNqq6Z3vbOTZ7vy3KTYGhrgklBnWs5F+WTviSHW6q59gZJ3EIyK1xy7KEWbi4N8DfJ3IhBY7sLd5OruM13y4OPWMe5MhxQgZ62bGXC7l3i37Oxc9g3cxSAYpdMUgXTKIv15DguA3sARB8jvnjlJJABg3sOj9TNxe2PS5JXiko3v1yxDD1h8kWf7Rxy9oltL47paBuFKfU+nwyUp8rbbXaGJFD/fKxmAfMia5MteznGB8P1oAHTEEqtoNyaytpns/hn3iukG27KBxuCJftaim3MBwr4gC1c8mjgW6rQe67pZw== mark.boekelaar+20110211@cyso.nl_10",
            "from=\"85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\" ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAtE5h376sZGqdKG0C+NW1vhOwO+KNFcO5JzRL6Jl1vtLvwcKHDizo+JLrVHOcaJmJ7MuFnn7TeKteKcfG1WSfb2wAuzF5q1X4hPZDrnutLlUVJcFVJAZZKStKI54dJmOXYgJ9EZsZjRsFJ4QbHrAXiR2Ab5YNVgKZT0D3dN/po/wOChzljdRfAoyhcNv/PXXUUcWt1UAkl6vSnJk3WVHaDyN1mvBWGLHO9inlwaLfLTEx2JKXobmA9wgdbFetADNYPX37ATmxl0vZ+AKxqtmHFEc+X2kO3ueqtId7Pv1tGsBFtWS5i1xP7Fld8mQGxSBpXnRE1NvJbnPiUckr4Hjuvw== jeffry.visser+20110211@cyso.nl_12",
            "from=\"85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\" ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAxL+KhpyySKrr+ROvSnNvlZeXuxAC13JMHCCsj2sMxbPkr3aOuj4Zq0ezHPGuFIhJVOi37jctFRvwg/dBCsYFxibv/rcl43fEA8//zrtJBcFgvWJgpxtaUsrXakLUfGvXer+Ip7x1Rbks5DR/Jgm+LTSeJ6IFZ2tJLO2Czuvn8wGvioxri8xT9NJ19eyXs8+WT8RJR8BNFWfKDAVYp97qiEDY7JsQWqDxlc/M+V5qCCyhgrjyONd9i7hIfStZSi3upQ2SWUH0SyIb5b7t+x8QsIfikHfqR0lNV1WG5F4Pc9Fjjl9KTK/5RXCPqSHXHYMH3Mkn3hxeBe8+bbuhXK4CUw== frank.muller+20110516@cyso.nl_19",
            "from=\"85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\" ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAsrMOiCXo7UwuqdXagMgUPx53TwffbXfZ9wtHCPuWyq5nU3OfNEHSiQVUyxE+EqcqVmG+mNA77OxXeX/EU6q0AYHZdm1XapqUNfCGhGXuFzlSoT/IzUPBkle8JO7Q23Sb8YKCOuvYRCLFK0tgrLOwU+/rzsMNFe+ej0NbVBdnxwNLuWkATdedTx9uUS8wXgukxKCYxXWk/L8OK+7ecH0NaOvMxq1N/j9sxVLiam+98tg0obcLGLSDj3980DqEe0LkkIoVU02pF/BIjClCB+emsGlOHlBpdNQn/m06rZhabxHtq6aof1qEN6M6AEZmhWcSOcRR8kSx+RMGJYH0XtcWmw== ron.ursem+20110131@cyso.nl_4",
            "from=\"85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\" ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAxmcR2nYTrSwfbTUzTPIiETEyBxSBy8/AnBTCzP2A/It7sBi112mEuFpcth7AP01zgbRvlCZVUDnzDpOICW7c+QRuF8CHQSpoVD08T1iGvaOub4fnT+SYpjYgsg7nOaSnK3W/gSqxiec90V2gKSyQ7wZ3We+gXAXKT86axtKAO1sAOKdKlL0KavWVtdJWTaH/eBnJtzpnEjBLKfFOB5S4ewuRKMrNxcNGQSmZ2xbVT/6OSwyBxkoqi+tlgKcg7PQfNzUNQWJtfQSZGqtzU2+uTKgK8KAuLiNuLOBnn0cxaFNMaJMl5F1cTdwVEIkUU5b4esJNsoB6L0HxLGjqhgVVVQ== tristan.reemer+20110211@cyso.nl_11",
            "from=\"85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\" ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvluA6v2U0gdW1zZAALZUaU/0wF+dOzi7mRzYe5UhyfrBcaa1X+VWRuuSaT5dv3Vuq/GBSQxMokKA/d3iiyuBXeK44gC62cgcUHo6cNZLn92KcEIRYaHn0FZlEIA1DbpsmsZ4D/wKsus7iyKYZsNeH6lXrK4W6EA+wkQVnPIxhFVNZaw8ZPVgZsfM65EwX7A2a3JJE0CsIPcbRhjcXD4KF2C3a/adfPoyE4yIw8UuTuEeGVZdtlVdLduPdCqzdJ2jagEF+Oms5X+ecbesX9Z9rF38DaWYjrtHoxtqpsHu+CT9VxTzjDPm1tdrBfFkgvmWhT5tr771nFcjDU5+zUAKZw== sven.visser+20110328@cyso.nl_17",
            "from=\"85.158.200.33,93.94.224.189,62.58.71.5,82.94.220.246,200.124.139.252,172.16.200.1\" ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvO7Obuq2Vqzq2G5K/Him4de+k3Wn/a2qfbu/i+TpLjG+5VMUk7jKF03Vpvw8/PuSZavSP0uMLPh6dyWMyBG18HihpC1wMwA/rxL9370p8kyWkQi0waYsUlDXoZub3CTQdD9gL6LmTkzsmZc/f8779N2JGIXgf6HJZD0Kbm7jhbx5Nhp/5pTidMDz+Rgi3NMyKjb8wAkjcUmfq90BiYyXcKUH0ladpQfUrw7eSM13l5FqlKtxyKICmaVBzVrTKhVIGPzsBJcIs2FPwkKNAbHsluGpY3eXHbHyHo00q7YD5VgzzBssvxg2aGzNxBzopMww6wb5z51yNs0kcWwEb5Moyw== mark.kraakman+20110211@cyso.nl_9",
            "from=\"85.158.200.*,85.158.201.*,85.158.202.*,85.158.203.*,85.158.204.*,85.158.205.*,85.158.206.*,85.158.207.*,93.94.224.*,93.94.225.*,93.94.226.*,93.94.227.*,93.94.228.*,93.94.229.*,93.94.230.*,93.94.231.*,109.235.72.*,109.235.73.*,109.235.74.*,109.235.75.*,109.235.76.*,109.235.77.*,109.235.78.*,109.235.79.*,217.170.2.*,217.170.3.*,172.16.*,10.*\" ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAqDl38jTxrAql2YmcI70oDob5ZamZUJ0csMsxuje59iNZlMLjMgtyTrhOVfQJJiL4PsC0RzDJ8dj+8zD9lHACDMAxiA4CtV1DFlNfZqlrCN3OuQIbOaPM5hD2K2M6Zc6dty56ky8wJDrkmzouL+WW6Il0WjHEC3ptql9DFjPLckn6K7kS4PCNlPzypZY2xa/0Z71h23dcMFdcyKGN8PhGz2N/jMTNA17eoZ2WMq4C8hV8HcNQKop4ui8CQ8pQkMW2tL/lSJeUZ3NsnHZFhldO3tEOPKz8BgLvjTsB+ONFLhwzajrOISjW3KUIYKfOZhp5eP8UfxXAPfz3C4DfwLdw/Q== backup+20110705@cyso.nl_22",
        ],
    }

#### END cyso #####

#### BEGIN tdc #####

    add_user { tdc:
        email   => "noc@tdc.fi",
        company => "TDC",
        uid     => "5035",
        groups  => ['ring-users'],
    }
    authorized_keys { "tdc":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC4GMHaBV8/XeKNyVLIqsjoFGSjFQYn9psOmzyCAYSOq07kOHcBXsY9SWlU9ytMBd+QUcnKdRlYms6f1AHUWFdTzxAXjsjaxl8E33PzblfOXmvk5iOjm6KVjvjyAz/Mlw/cDOqQB0pQUYnEMnL5pitGX1QedtOGwfw591aYbIGas8DNb6uQ1sBZ7RhAZ/Ifhmt3qiSRzlBXvAsT5bWq+2U8u3VGp/Duq90/4P+juJV1cOqXE+6hwdG+xTIWOxN74B14ztEJrTruYtFHErvClRZ4tx2EtA0UAcV+fXpE4DoeDHWbHeTF7sngR5Db+s4U65zYUbyHItklvol6hkNK5U2EeZ/M3FGSQpqdwhdGwSGTydnlqvuFxbY0tbJAjWOW4FSKeBiUbYGMPt8d/U5bNIK2Utc9ggWZ/Qk3VymFdz2Lk7Am/kZ2Gr6EX3ywWn1cfg108BMktGeMuRAqVH7bCsUcY3lrbmQtDIT1gzfK6kAQzA1EBiiD9thaUSNeZfOJifPaXHcGBShkeG/Tc10kuW6MDbM/QFthz7JHnNaOYqSUU/6NFTlBJj/hQveN1BLww+bIlY1GAFap3aRjxTVNy5Kv6mv/KFX8TYqJBahC0sxbELiT9aTeqg5qJQBwF6JZcgjvudX5UpFUsCh6H8jl0FfHdiulUJpT6laZIuk02NPJBQ== ytti@ytti.fi",
            "ssh-dss AAAAB3NzaC1kc3MAAACBALeqG8B6qbqQ1pWIgHBZWWJoo8O+dfjpcj/8Hl5CfTdJK/7RktzH8GoojCJOhIBYe+QTdjJ1i2j7wx7u0ieCotIMQD+Fc264wK7O/8zlANTcjP+veKKC4WcrDQycyng3Hk95esnNP3FXtlK6ttSDyNnMb8hPI9mSyq6klbqyG/GDAAAAFQCrpu+fO0D3i9zKSbKSKczkZZZrAwAAAIB1Yk/heZb7THxfyrK+8bHwrBPLHV0+CLqkzjvCG54L9fmRmvHs2pX6aOTh4q08dhiENAXANPzzXt0m4k5Cjjr3K2i/sauyvyjlhW3WQ5jFfl90cEQkNxXJS/emljjLOFVaXQ3oU0sQDxqCtDwtz+PYmSDhxhn1pmAKCynUsIS78QAAAIEAlbYtP4gzu55JsM4HlT3h5JQSvYjoY8ojFKRxi9ilpZdJeXAYUTjWSsRuLB4O0VH4IDJV5PrwzBG5D31RwAlVO9xYGkmtARP4272VbkaQD3dw3nP/wd19c5dBRp16xZnNUkO07z7kKS3FH9a7ONH538cxCF9ZC8NRlKAxNkIZxFg= sonny@unix.dk_1",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAKa/44RC7jLRymJsWtZ5T9VPkvsH7HPM/gSsMOUDeq0hOLrzPxLXXQZIy1RUEL2GqqBIfZaii1G7cJKdrk7LMFatPfxe8ozvnVylOErvR7x3ur+W1h64s8kIFtCqj6h5Mwq9IFRpBdc5lSlkpUE1PQLtSYQz00fKxB7XJqBocUBFAAAAFQD3m+4Hg/dmD919KlcuomVcTgkM4wAAAIEAit7CIM2oAeBo9CBWejnotYeCn2RGNoagHaXmVpctGYS5ZsfKYth1OKZK+beS5mQHh4AOdKgtBtCDDl07qgFneEE+gDHLhFQeFdyB6JNN6okInF/vVl4VwnlKWrO4SMBLWsxw3Q8AwvplpvcWX0OWRrKBIOjTMUqBVcV/BAxrO8MAAACAJPZucykYaEnjAtRApqtiFxxbsr5tyjHNVdsUhMLantBlkt8hl3y07QSmEIdU8v3C1hOCbCxo8JfoNVpWZVnB0MroY7NG5N+NlvNjIXlJZE43Wokp0afZ5LknmEFGBbDxOtYj4Xbv/aVwusT3/ZUja0Tjokza7C+BGqjCFAHg8oQ= aki.tuomi@tdc.fi_4",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC+qX07Yfz1lFM2hQEmV5DcrS4ZE5em/8sRR8kNJY/cAbITK4UlI+0N+j1OTglmyuL36tVBXZ7DsUoVs8W8zGpRoizMW2RxEgSroMDBFmVHRozignFnS+l4+ee3LVJgTFxXkIhBmo0FcZlK03t2XDyWRmOkjf35n9399y6+tO65xarpWsOncn9kCQT7Mwv1K378KoNO+J1hkmGLOIE3bk40VCy9FjPKgLa/EOBd3cOd60BazzFf529jp6h8q0xuAsctun/nTJgborWBde7uy/2RwB5nSvHbUobbW+oy2n2YD3hkyuReSliCai/ebiNaQnHStj43J/ykgu7P9zFx9cil nihb@tdc.dk_2",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAO+rNS6R4E5eSyhVv/6qxpvcibKrebG7OCc08LPiwKoKInHlE9jhRHs68yUE5fbeyaO9mFrQ0psRPR/JMO1nX1+JjJHyKrQ7yJl8Er0YMAm8/NOn7GNwF06vQNHwyt2wf74koXPZx/s7SG9uCFcT0gmt6sg726mC3oAQNzX4TOV3AAAAFQCThbu+Xcje4hX/gVNrW3m2+fMyDQAAAH8fDJYMbSFPtJBknrqdhQcRp6D7TnTqRe7wvqL4b1DkryjWSi2sCdEHceVp35o/BxaGCxE5Hn9UJ8yCQ3yyq12AUJ1TgJr4qjuUlaBXulOX2KbkeuRbveVyN7/csbqgSpa/phRcBb8qPng4xy5rflIniZDVN2E2BwLUvjaUq6zkAAAAgQCQ7j0aWKO3jVyrhVcg7OJe/zJVdCCjvem7iEVgwf9wrsxEuFo8Wz8f9hkgUbjA87VbC1lTjA+PVpkaYNldFu/DbYnhwa7ZyBF5IZQFoQtegXWrgwFvA5NtdIbClC/485UZ59tAlUyCKQjeKytvvDiSZmTKm/UPCfe9sRnLtZ8neg== anders.kalrsson@tdc.se_3",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAJ1cidxGjT8G4VwTnvBZ9RwVQOW1DIjnEE7taYZg1JYO+VxgHdZEih4Ga1Uuyo36wWRP4L+7RewKFmg/ga83jpqAsgYkbIpg4PXhHAcEDJAxhMRVE/+4oR32qt2+eNvkjHGxuqy3845Y9bMmEkTUXd1NfaeXVCi1k0haVZ1+4QH9AAAAFQCCBkToEfH9G4xAJInJuhszV+OKFwAAAIAVCae8WTUNyHcCYp48hk4qNt2H1lyRXyiPW0sVBY6yjd/LDpDqAj8uMIbgJfHiSlZIPyBpTCJ9SODpMZSt0NA46bqEsK61AU6+PDUmk7P4/VxrhNqNx1jD/zARv9ACHFrMRTKlxl/WmztSid1vp7XkT+xBPgmH0mV69dgBrHGwDgAAAIEAgbIhiwVRdiJjNHQ7iesg18RSmbTZAq+R0avOcTOhYAnqOjGvymFf55/t0FzCgvG4Y8L634HCpA3Dt7cKZpjBtFZhVtjsY5/AmLtX5tP9IGfuqzKil7XzMdKTqnsOyXAEWkK+L1T0IqDGJdCKcEM11OGj8Gq473d0z6wltc1sotI= lyngbol@freesbee.wheel.dk",
            "ssh-dss AAAAB3NzaC1kc3MAAACBANaLxQg4vf++c7SzO8uKJoriRag8mG+pOrheh29pdD10tAlSDTLW/0Xh0dzrv4127H/+moD8YJwdE2gY5tXe8VOUt5z1ueH2HKivgf6/x9KjX/O8ceLt49EbmyQloJvu1ieXNuAVzs0LJtg8CT43ibMVWiSg3vO3KfczuO+YOJBBAAAAFQDC29ofuMnqnQOPVr+cSDtY/u/6UwAAAIBmhOyZMxfo7VuZ7Bzhnn8eISTpGJRSJaj7k63M8qszp9tX6K3AttnRiJqrUn6DKeWnrhIDLVjeD4vrtP7s2ohUtUpLk6Rp4JYcvnKekfL0vZedEliWkL78V2nqH9dm8e1nFdiIABrH54jkBPVoF7+RaEaUy+7T/TOb/ZJ6RP8NfgAAAIEAgFP/orlRejAMUgnNme1SgWMHa3A+tZERm7Eovq7jokVen2eq++baxDgcACbhJDNadGiOXG8kzTLoCCKathxqgmM8NPF0+aCm4GRaIK7H7SVxqlNl7DnitXWkKn4YJIAhPFEV28mqMx5wyKuA5pw4ITTP6XdiP2Ns9BDrXwRm+10= Michael Lyngbol",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAO9Jrw9TWYP154KNqNCQAaWEGNcGxoS06BpJrGu8QPUcKOV67ZbV74DWTDJupxp0k6HGRCJvFwY3/exb6lk87nQHpyAfotEhzPHEIHOEKbquBciO2eybtepUrcQkNdUqRVsNSru4Sx0ynUm8eQxCLnDFzzOHIv4cZmIg9oXlNnt7AAAAFQDMRD+tlPi1Xq2CkLvQUgc5e2O0kwAAAIA/HQ1jdGWHjdtPnLxjXkJEoWCLjBjSt2k8nZCpXTgvhdt6+F1dh0L2Z+0VJ3sLeMDfkkJiPPXPQfmettsWlBk3x+9YSte/6znPRB2oKSDjOE20Jq+OpWjkmoan/Bb4NKwCL4cCxYTwKVc7L+TFu3q9yj3A2nYQSoic+/jq1llKBQAAAIEAyYE39w4/i/YWjFMEOm/tBeNtRpB81ddHm7bsOCBki8g9VuvVQ/bcEq82ngacjsZv+/9Z0CkTFvnjWqjWpVOiYmYngVW4A+WhLG0/baSq+u8O9MTZiihxU0cn9Vvl0jSXLEyy1GhGIbW24jsf3PD6/flQihx0qvIiixmwxYNGfPY= mikko1",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAJRpiz8GOgSeyxl3osh84IAubonVRVKeE9Jx+xTxB8XK9BX6Tbk6nDqmd/pAQS9sYB7DllBns8bXpwaW0KiXn9Wmfw8Bkf5WdrG4ESzK1aIWlAPpwfsh5efBM5cs/kWP+YOgRA5eWTpTmjNyIMrXV7J8lKvFt848RNFDBVvvgeQfAAAAFQDRlXlUoblKPU9KiXmJL+k+7XNhLQAAAIB66h6PpvUXFNFaN19Al8QzmYOXuSxFunI5qX8kI0Qmr0XIuk3k/N4XkXdEfbHftGkSZdMFlfLUepM8ITbtaJiY0WXz06E88OueAKcC97zypz1/MxmL74sGhdRJljHSy5GRWo3YWPdkeXwiBXxP2Q4j+cMUyrE49sKfIrvPCrGiJQAAAIBBQ7gMrTAdNfT2l1UqSj3Rmeta7ZfiJU9y6EIclEAYy16dPajJi0bBp+eYLovOcK1Q0iTjeqindUYPQgPrQSmnex/7oOVQgNQo0QtnN7lXIQvmuVGI9PPoHUQzPcJ7e0TiTSAKIprAzNJJamCkC3JzjGwEIbP8m7VTkRqwTZgIng== nohaneik@umma",
            "ssh-dss AAAAB3NzaC1kc3MAAACBANaLxQg4vf++c7SzO8uKJoriRag8mG+pOrheh29pdD10tAlSDTLW/0Xh0dzrv4127H/+moD8YJwdE2gY5tXe8VOUt5z1ueH2HKivgf6/x9KjX/O8ceLt49EbmyQloJvu1ieXNuAVzs0LJtg8CT43ibMVWiSg3vO3KfczuO+YOJBBAAAAFQDC29ofuMnqnQOPVr+cSDtY/u/6UwAAAIBmhOyZMxfo7VuZ7Bzhnn8eISTpGJRSJaj7k63M8qszp9tX6K3AttnRiJqrUn6DKeWnrhIDLVjeD4vrtP7s2ohUtUpLk6Rp4JYcvnKekfL0vZedEliWkL78V2nqH9dm8e1nFdiIABrH54jkBPVoF7+RaEaUy+7T/TOb/ZJ6RP8NfgAAAIEAgFP/orlRejAMUgnNme1SgWMHa3A+tZERm7Eovq7jokVen2eq++baxDgcACbhJDNadGiOXG8kzTLoCCKathxqgmM8NPF0+aCm4GRaIK7H7SVxqlNl7DnitXWkKn4YJIAhPFEV28mqMx5wyKuA5pw4ITTP6XdiP2Ns9BDrXwRm+10= MichaelLyngbol",
            "ssh-dss AAAAB3NzaC1kc3MAAACBANaLxQg4vf++c7SzO8uKJoriRag8mG+pOrheh29pdD10tAlSDTLW/0Xh0dzrv4127H/+moD8YJwdE2gY5tXe8VOUt5z1ueH2HKivgf6/x9KjX/O8ceLt49EbmyQloJvu1ieXNuAVzs0LJtg8CT43ibMVWiSg3vO3KfczuO+YOJBBAAAAFQDC29ofuMnqnQOPVr+cSDtY/u/6UwAAAIBmhOyZMxfo7VuZ7Bzhnn8eISTpGJRSJaj7k63M8qszp9tX6K3AttnRiJqrUn6DKeWnrhIDLVjeD4vrtP7s2ohUtUpLk6Rp4JYcvnKekfL0vZedEliWkL78V2nqH9dm8e1nFdiIABrH54jkBPVoF7+RaEaUy+7T/TOb/ZJ6RP8NfgAAAIEAgFP/orlRejAMUgnNme1SgWMHa3A+tZERm7Eovq7jokVen2eq++baxDgcACbhJDNadGiOXG8kzTLoCCKathxqgmM8NPF0+aCm4GRaIK7H7SVxqlNl7DnitXWkKn4YJIAhPFEV28mqMx5wyKuA5pw4ITTP6XdiP2Ns9BDrXwRm+10= Michael_7",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAJRpiz8GOgSeyxl3osh84IAubonVRVKeE9Jx+xTxB8XK9BX6Tbk6nDqmd/pAQS9sYB7DllBns8bXpwaW0KiXn9Wmfw8Bkf5WdrG4ESzK1aIWlAPpwfsh5efBM5cs/kWP+YOgRA5eWTpTmjNyIMrXV7J8lKvFt848RNFDBVvvgeQfAAAAFQDRlXlUoblKPU9KiXmJL+k+7XNhLQAAAIB66h6PpvUXFNFaN19Al8QzmYOXuSxFunI5qX8kI0Qmr0XIuk3k/N4XkXdEfbHftGkSZdMFlfLUepM8ITbtaJiY0WXz06E88OueAKcC97zypz1/MxmL74sGhdRJljHSy5GRWo3YWPdkeXwiBXxP2Q4j+cMUyrE49sKfIrvPCrGiJQAAAIBBQ7gMrTAdNfT2l1UqSj3Rmeta7ZfiJU9y6EIclEAYy16dPajJi0bBp+eYLovOcK1Q0iTjeqindUYPQgPrQSmnex/7oOVQgNQo0QtnN7lXIQvmuVGI9PPoHUQzPcJ7e0TiTSAKIprAzNJJamCkC3JzjGwEIbP8m7VTkRqwTZgIng== nohaneik@umma_9",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAO9Jrw9TWYP154KNqNCQAaWEGNcGxoS06BpJrGu8QPUcKOV67ZbV74DWTDJupxp0k6HGRCJvFwY3/exb6lk87nQHpyAfotEhzPHEIHOEKbquBciO2eybtepUrcQkNdUqRVsNSru4Sx0ynUm8eQxCLnDFzzOHIv4cZmIg9oXlNnt7AAAAFQDMRD+tlPi1Xq2CkLvQUgc5e2O0kwAAAIA/HQ1jdGWHjdtPnLxjXkJEoWCLjBjSt2k8nZCpXTgvhdt6+F1dh0L2Z+0VJ3sLeMDfkkJiPPXPQfmettsWlBk3x+9YSte/6znPRB2oKSDjOE20Jq+OpWjkmoan/Bb4NKwCL4cCxYTwKVc7L+TFu3q9yj3A2nYQSoic+/jq1llKBQAAAIEAyYE39w4/i/YWjFMEOm/tBeNtRpB81ddHm7bsOCBki8g9VuvVQ/bcEq82ngacjsZv+/9Z0CkTFvnjWqjWpVOiYmYngVW4A+WhLG0/baSq+u8O9MTZiihxU0cn9Vvl0jSXLEyy1GhGIbW24jsf3PD6/flQihx0qvIiixmwxYNGfPY= mikko1_8",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC4GMHaBV8/XeKNyVLIqsjoFGSjFQYn9psOmzyCAYSOq07kOHcBXsY9SWlU9ytMBd+QUcnKdRlYms6f1AHUWFdTzxAXjsjaxl8E33PzblfOXmvk5iOjm6KVjvjyAz/Mlw/cDOqQB0pQUYnEMnL5pitGX1QedtOGwfw591aYbIGas8DNb6uQ1sBZ7RhAZ/Ifhmt3qiSRzlBXvAsT5bWq+2U8u3VGp/Duq90/4P+juJV1cOqXE+6hwdG+xTIWOxN74B14ztEJrTruYtFHErvClRZ4tx2EtA0UAcV+fXpE4DoeDHWbHeTF7sngR5Db+s4U65zYUbyHItklvol6hkNK5U2EeZ/M3FGSQpqdwhdGwSGTydnlqvuFxbY0tbJAjWOW4FSKeBiUbYGMPt8d/U5bNIK2Utc9ggWZ/Qk3VymFdz2Lk7Am/kZ2Gr6EX3ywWn1cfg108BMktGeMuRAqVH7bCsUcY3lrbmQtDIT1gzfK6kAQzA1EBiiD9thaUSNeZfOJifPaXHcGBShkeG/Tc10kuW6MDbM/QFthz7JHnNaOYqSUU/6NFTlBJj/hQveN1BLww+bIlY1GAFap3aRjxTVNy5Kv6mv/KFX8TYqJBahC0sxbELiT9aTeqg5qJQBwF6JZcgjvudX5UpFUsCh6H8jl0FfHdiulUJpT6laZIuk02NPJBQ== ytti@ytti.fi_1",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAJ1cidxGjT8G4VwTnvBZ9RwVQOW1DIjnEE7taYZg1JYO+VxgHdZEih4Ga1Uuyo36wWRP4L+7RewKFmg/ga83jpqAsgYkbIpg4PXhHAcEDJAxhMRVE/+4oR32qt2+eNvkjHGxuqy3845Y9bMmEkTUXd1NfaeXVCi1k0haVZ1+4QH9AAAAFQCCBkToEfH9G4xAJInJuhszV+OKFwAAAIAVCae8WTUNyHcCYp48hk4qNt2H1lyRXyiPW0sVBY6yjd/LDpDqAj8uMIbgJfHiSlZIPyBpTCJ9SODpMZSt0NA46bqEsK61AU6+PDUmk7P4/VxrhNqNx1jD/zARv9ACHFrMRTKlxl/WmztSid1vp7XkT+xBPgmH0mV69dgBrHGwDgAAAIEAgbIhiwVRdiJjNHQ7iesg18RSmbTZAq+R0avOcTOhYAnqOjGvymFf55/t0FzCgvG4Y8L634HCpA3Dt7cKZpjBtFZhVtjsY5/AmLtX5tP9IGfuqzKil7XzMdKTqnsOyXAEWkK+L1T0IqDGJdCKcEM11OGj8Gq473d0z6wltc1sotI= lyngbol@freesbee.wheel.dk_6",
            "ssh-dss AAAAB3NzaC1kc3MAAACBALeqG8B6qbqQ1pWIgHBZWWJoo8O+dfjpcj/8Hl5CfTdJK/7RktzH8GoojCJOhIBYe+QTdjJ1i2j7wx7u0ieCotIMQD+Fc264wK7O/8zlANTcjP+veKKC4WcrDQycyng3Hk95esnNP3FXtlK6ttSDyNnMb8hPI9mSyq6klbqyG/GDAAAAFQCrpu+fO0D3i9zKSbKSKczkZZZrAwAAAIB1Yk/heZb7THxfyrK+8bHwrBPLHV0+CLqkzjvCG54L9fmRmvHs2pX6aOTh4q08dhiENAXANPzzXt0m4k5Cjjr3K2i/sauyvyjlhW3WQ5jFfl90cEQkNxXJS/emljjLOFVaXQ3oU0sQDxqCtDwtz+PYmSDhxhn1pmAKCynUsIS78QAAAIEAlbYtP4gzu55JsM4HlT3h5JQSvYjoY8ojFKRxi9ilpZdJeXAYUTjWSsRuLB4O0VH4IDJV5PrwzBG5D31RwAlVO9xYGkmtARP4272VbkaQD3dw3nP/wd19c5dBRp16xZnNUkO07z7kKS3FH9a7ONH538cxCF9ZC8NRlKAxNkIZxFg= sonny@unix.dk_1_4",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAKa/44RC7jLRymJsWtZ5T9VPkvsH7HPM/gSsMOUDeq0hOLrzPxLXXQZIy1RUEL2GqqBIfZaii1G7cJKdrk7LMFatPfxe8ozvnVylOErvR7x3ur+W1h64s8kIFtCqj6h5Mwq9IFRpBdc5lSlkpUE1PQLtSYQz00fKxB7XJqBocUBFAAAAFQD3m+4Hg/dmD919KlcuomVcTgkM4wAAAIEAit7CIM2oAeBo9CBWejnotYeCn2RGNoagHaXmVpctGYS5ZsfKYth1OKZK+beS5mQHh4AOdKgtBtCDDl07qgFneEE+gDHLhFQeFdyB6JNN6okInF/vVl4VwnlKWrO4SMBLWsxw3Q8AwvplpvcWX0OWRrKBIOjTMUqBVcV/BAxrO8MAAACAJPZucykYaEnjAtRApqtiFxxbsr5tyjHNVdsUhMLantBlkt8hl3y07QSmEIdU8v3C1hOCbCxo8JfoNVpWZVnB0MroY7NG5N+NlvNjIXlJZE43Wokp0afZ5LknmEFGBbDxOtYj4Xbv/aVwusT3/ZUja0Tjokza7C+BGqjCFAHg8oQ= aki.tuomi@tdc.fi_4_2",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAO+rNS6R4E5eSyhVv/6qxpvcibKrebG7OCc08LPiwKoKInHlE9jhRHs68yUE5fbeyaO9mFrQ0psRPR/JMO1nX1+JjJHyKrQ7yJl8Er0YMAm8/NOn7GNwF06vQNHwyt2wf74koXPZx/s7SG9uCFcT0gmt6sg726mC3oAQNzX4TOV3AAAAFQCThbu+Xcje4hX/gVNrW3m2+fMyDQAAAH8fDJYMbSFPtJBknrqdhQcRp6D7TnTqRe7wvqL4b1DkryjWSi2sCdEHceVp35o/BxaGCxE5Hn9UJ8yCQ3yyq12AUJ1TgJr4qjuUlaBXulOX2KbkeuRbveVyN7/csbqgSpa/phRcBb8qPng4xy5rflIniZDVN2E2BwLUvjaUq6zkAAAAgQCQ7j0aWKO3jVyrhVcg7OJe/zJVdCCjvem7iEVgwf9wrsxEuFo8Wz8f9hkgUbjA87VbC1lTjA+PVpkaYNldFu/DbYnhwa7ZyBF5IZQFoQtegXWrgwFvA5NtdIbClC/485UZ59tAlUyCKQjeKytvvDiSZmTKm/UPCfe9sRnLtZ8neg== anders.kalrsson@tdc.se_3_5",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC+qX07Yfz1lFM2hQEmV5DcrS4ZE5em/8sRR8kNJY/cAbITK4UlI+0N+j1OTglmyuL36tVBXZ7DsUoVs8W8zGpRoizMW2RxEgSroMDBFmVHRozignFnS+l4+ee3LVJgTFxXkIhBmo0FcZlK03t2XDyWRmOkjf35n9399y6+tO65xarpWsOncn9kCQT7Mwv1K378KoNO+J1hkmGLOIE3bk40VCy9FjPKgLa/EOBd3cOd60BazzFf529jp6h8q0xuAsctun/nTJgborWBde7uy/2RwB5nSvHbUobbW+oy2n2YD3hkyuReSliCai/ebiNaQnHStj43J/ykgu7P9zFx9cil nihb@tdc.dk_2_3",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDiP7Mu6W1bCu3+WmeWRtJmZyLj4ebhrLpB1FiQwIZ3nPoP1EZS3NkjdJYKYELHo0VXgMVyOAn9no12NPFewI0R4mTqZ3ZKSJGGn8Vpcmrw+rQojd8KZnId5ln4rpmPb7gH+d7t7xLf6rfp8JbuHAY7Pwp57HWrDH0f6Obw9mjaC6y416oYsGGmBaWDQtS/1HVzQLpZEiCklZQJH9RmHg3WPIsr1Ox9NmV8Bo1fpd+hqKYmFvrcQOLPv+fYnOMkv4eCRtQPTRqEVqO/KHnPTrYX1mCuKW2tdGiVyhFfCxmp3QU4wUP+u0MFjdm3Q417inboz6onedUW+BJcLaMcaLKz FC1420101222_11",
        ],
    }
#### END tdc #####

#### BEGIN netability #####

    add_user { netability:
        email   => "nick@netability.ie",
        company => "Netability",
        uid     => "5036",
        groups  => ['ring-users'],
    }
    authorized_keys { "netability":
        sshkeys => [
            "ssh-dss AAAAB3NzaC1kc3MAAACBAPb3R/3W2SqqWLfx2PHMADzGGB+LH/jskYUYxkO9kRP+raoeQXL+yKKQ4xFHaLpK+wx3RSUptTq9ckqho581cigAJoCktzBsHTM1kMSwb/Z70ljCe1Q4Z6L1Flx5+bSu1YS8Eavyb7JdKJJZKbUBw9BEJudOwFj0Y2sbL/7gU5JjAAAAFQD/W++RuOykpi5XWwuAbxXWRc4/pQAAAIEA71XZxf5hin8bNtpvKTUlBgejhqt3Lso627DCwcxDJilo/oifkXAvmFMC+56arIM/G8zqAWwqGPyX8AnbooHQjJJHpB4/L5kpfK/DZuEjY4XP+vmXuzkMMHbn1TtCeOwXcTjEOSJtDQ1B9qqIzgq3ZgRSxmruyhfLFpML5+MAorwAAACAYshCkOiE08NLqcs+Inq7uBi0AF2cRDYc9gySbL85Fhff6xC/YysJ3ZcsfPk4dXHCadWTZrUfLnwgB1Kyvm82x4CMIMRQ7vWlQdKIeSfErqRB/1E2Xhkj23s923PKxjMFckUoMMcziDSrNsFT09fYm/xq6E3MAFSX4Y7PIAUDPD0= nick@pancake.netability.ie",
        ],
    }
#### END netablity #####


#### BEGIN unilogicnetworks #####

    add_user { unilogicnetworks:
        email   => "noc@unilogicnetworks.net",
        company => "Unilogic Networks",
        uid     => "5037",
        groups  => ['ring-users'],
    }
    authorized_keys { "unilogicnetworks":
        sshkeys => [
            "ssh-dss AAAAB3NzaC1kc3MAAACBAMhjsVCvtkpwRLl9MupzWARZDd/MWKr1lJw9KwO29vPof8CmNPnLSAX9HsbTjthPLz9YyNyZeoqiBKdpfdsxbI2TPOB4dGnhhlh1ZDWh24+HBbZLtkjEI6lnTJfRwvM5Ua+kBFXTsxntqMo5858n7OtBOLrLUz3E1Hv5K1XibstVAAAAFQD4QMdCslwP9vQnlnrD7PKvGzKp4wAAAIAkP85MPa8u1eMSqjLuqS8N4Mm2roEhTzCL86jsaRfxSPgpLFx6sWiTvict8WLNJbWHa67bxxCbAoIl+evBTYGqnhFbt5byNUnyaw6e4i4dzO5f3cTpByPXbU9Xq/aHA+WpzPFvfi1XIg31R/N2c8JTDI82P5Tk2Le1DiCGXZCOYgAAAIAk5uIf9YCZkZq4aHX6kVL/uadbVQI2Cx2kL91la8thbDpeH/cJj4ns+0rSCFN5uKwfyouzUS+eTvTgccRBXuAWb3CJr6bWxfyghgZvavLohSxFkFtiQhvWPLXmy1VGzhmzYtCbwGMeqf/l8CtpQm3+UrP3ZP8/qtqFQDkHguHblg== cliff@dropkick",
        ],
    }
##### END unilogicnetworks #####

#### BEGIN maverick #####

    add_user { maverick:
        email   => "noc@maverick.com.pl",
        company => "Maverick",
        uid     => "5038",
        groups  => ['ring-users'],
    }
    authorized_keys { "maverick":
        sshkeys => [
            "ssh-dss AAAAB3NzaC1kc3MAAACBAL61XMeI9aTUHrUF40gqRErN0+bgaMV0o6DwtgtTqtoNE8bz5z7T8S1liKLr29ddIJCjDzfyJTy5Uz3C6U5uniQRFf99GufoT7VTCdbvZyFhZoTRAbaje2xnmDldoklJEgZ6erRWzRWG8W3mDpkJ2SD5+89hBfimEFZQ6AGbQry7AAAAFQCoxN8ziy6Ce0d4zyFkdyxGO1glmwAAAIEAs2Y7YWTzlKMRNsrpbsjkp8jQAI1cOSbssOuraD57H157s2ZCKTnVRguCpxLU6wJnOYgZBGuyQ4qhcn2kfEGFiHuihyl1vBqH39wAAoFuMRi6fQbKxiqZBj48g9ChDIMbwFlXNEypNdb8KtH0J0z2vF+BEK4uh3L9969dH65RQw4AAACBALfk1F6yr17jB19k4BWUJA2+wXzuH2HxQ/G5KTYClb8e3IYflI6ZTLOmDrnoKtbZsKI7rMcdvot11Tk/+WZNRCl4LIyc9wg6L4j9omirOj8RXqQ3YOdOm2gqA9iytJM72LtgUjMnCMPS5HxSIXjnH85aXBnGw0mRCTq2dk/StMoB undefine@ac",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAKq8VKg80QWwgwxIwCFIckUjuNZkyz4zcm520ZY2yTPxbHIefBpghzMLuIPyfTl59QtEe6XeEO4fOAnOdJY0Vv/6assuDRImOUwMYDLBnBgwJkdfMFNIXYaiZ2kohGT4IzMQ+6dHOBxiqpzVjtZ0GjTsZJ74jaJCopH0gO2u6lUxAAAAFQCQ6apc+CoLoLq5zT2eE7Gxk+KmKQAAAIEAmEcW/hShJcmbbu5UI1Vy6zPdEqdQTJDk1dfE9tFGlEZ4ABA3Azk2mK77l7Eul1VvrhNEbQBlHKKYSLvIsCiF3KbQciKO1D22IfbtsdzBVbyT3q/E0A2hfC/RGAQnjnvwM4DFIbXl8odqULoV4gmum6p/rpH4dh+bSVDeP/FeQ0UAAACBAIcRQ+2Z5r7f3HsvdvxaiSdhxIf7LtKaDaj3WKGggDpp68swzkJRjmWkHtk9RVklzB+4PFhdtm1o7nCzwdcsh2BMoA7Q1EvNHz1nQbFDhw4Y39wpp6/o2yGMzsVoY7oN0d0xwKomucioEV1k5mExIIeKCoAGeTVLjcz5JOvxgv7c maverick@maverick01.ring.nlnog.net_1",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAL61XMeI9aTUHrUF40gqRErN0+bgaMV0o6DwtgtTqtoNE8bz5z7T8S1liKLr29ddIJCjDzfyJTy5Uz3C6U5uniQRFf99GufoT7VTCdbvZyFhZoTRAbaje2xnmDldoklJEgZ6erRWzRWG8W3mDpkJ2SD5+89hBfimEFZQ6AGbQry7AAAAFQCoxN8ziy6Ce0d4zyFkdyxGO1glmwAAAIEAs2Y7YWTzlKMRNsrpbsjkp8jQAI1cOSbssOuraD57H157s2ZCKTnVRguCpxLU6wJnOYgZBGuyQ4qhcn2kfEGFiHuihyl1vBqH39wAAoFuMRi6fQbKxiqZBj48g9ChDIMbwFlXNEypNdb8KtH0J0z2vF+BEK4uh3L9969dH65RQw4AAACBALfk1F6yr17jB19k4BWUJA2+wXzuH2HxQ/G5KTYClb8e3IYflI6ZTLOmDrnoKtbZsKI7rMcdvot11Tk/+WZNRCl4LIyc9wg6L4j9omirOj8RXqQ3YOdOm2gqA9iytJM72LtgUjMnCMPS5HxSIXjnH85aXBnGw0mRCTq2dk/StMoB _2",
        ],
    }
##### END maverick #####

#### BEGIN acsystemy #####

    add_user { acsystemy:
        email => "noc@acsystemy.pl",
        company => "AC Systemy",
        uid => "5039",
        groups => ['ring-users'],
    }
    authorized_keys { "acsystemy":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDlDTT8/hWCy+jxYWteDZuFVFnJmMF30lPa2K+x3vDbNosZa1dMaGe5lkz0NM55JIQYC4c1/j1kem5jRmK7+SP3O6Im26Ca6lyM7+JiDCQ9trjj+xQhbQm1ctOlF6o6zQmvcCxBrcP+ED8I0ePXRX5DGf5Vp0JD41T+0hSDcN5rQXwo/5Xy88VK/HoWl9q76VLMx1vEhE5RLpfPuUP0mtVjBhPX8UD72PAOiqP/+/DNLnAgrr4Q0LF/t4dlhfSwRq1ejRDgf7lqYyjEfpg8UAvs47dPLk9pQsPalvKcm5kcel60n/6YXvZhu/ZsnnZk3FW8dXAfgHJWWjZx5xMiSSX/ barkoz@sauron_2",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDz1HLSDMIUFR3wlhQE4JwXVDsH2VA+A+Ox9SkW2i26BxFiZbizznN2bsi6N1y73XLVoaE824lIrw8bXcZZBwcFphYRQtNz8v8c+B2lAFjKL+X9uTE/v43lti7y/a+zvTjHwoPRiC8GjmlhLNVKVjWwEeYqYrRM8Pa61IECA+JbxuKl3Ko9Rnne1GZhfpzFf5nVSYt77MtHklIjOUytObu3b6OcSiDv4TLf95he0jkaAmNSzwZpLKl8LIh7U07wEk8qY5R1qUgRZ5+IQ+AImeKJLgQ70bA6dwJ5sKPxMR7P5x8dgbtCfKuR/i0lkQ0gIJCml3I1MPa/3M21JTYhjDlv alchemyx@cerber_1",
        ],
    }
#### END acsystemy #####

#### BEGIN netsign #####

    add_user { netsign:
        email => "noc@netsign.eu",
        company => "Netsign",
        uid => "5040",
        groups => ['ring-users'],
    }
    authorized_keys { "netsign":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA0MgFgdVHuY8T7ceFo9QGT9bjVguAjYAXMqDEaK+OgCk6+8SBACyZvDLnWOOxu7fMT5kyHXwu3vmdpkE4B7A/3mmQRzBy1lffZFYRIvzQ2g+5C/lSkFMq46xJt0Gqm8hZASmNXQhCiDP9t1dLYIaWh8ecr/kFNO/T6pW6dD2d8vP8EQi+dwVylpaNK25mAZQbKPEQOPldbN5DyGWRqgcI53Rxv5hSFi1FjSoJiXYIpqSC+2Hfu29spEi/Z1ypUxOFVWHbZuMFGw9nSNtLmYY9/tb8N+DNAlWdasdEFnUtXeinzy7B5zUPIxDlJEz7KODkpvJv/VR+VLUure9UKiIkuw== kre@netsign.eu_2",
        ],
    }
##### END netsign #####

#### BEGIN rrbone #####

    add_user { rrbone:
        email => "noc@rrbone.net",
        company => "rrbone",
        uid => "5041",
        groups => ['ring-users'],
    }
    authorized_keys { "rrbone":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDj1aoVGGlFRLLx/r8hbyvWtef5TFuNTsDCsSnoz/p4bh4xvR5iOhny0hmQmJ9XVNsN6KNcO9Q+p1HM2W81V87OnxbNWfgb+jMJUbo6Y4wLOMVLBwiucGgPmnS8q6JNmIc6UeNlACbtZoPBvci+6nB0OfPGiVeZqWSNXFl0TAL2jTKDbOOZqmLZ4iTUjLaCCAPOv2zpijPICiTSpVS/QKf+kX7IhIRPdqq7kGIAwx1fA6mVyImLZtmrc14Y1tyodgnqdLt2cY0ekpWWrKrEfA34TNpsRS32dxQfGBX+xx2JRJg9vxCMb2hZQXmGcRWaB3wbqEpPdQl6VPS3H1njt1Hj desirez-13092011_4",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEArUhe9k2ZJD9/u4/517qCjSlsFlt5z4AROtmPVq8vChFLi1B/E1hcePJpq3fDYYvgqfRntp6DNxnMh4h9yMuLXTbgedyAkAHiRZiioAbR1J99NpFuZCq0Mo/TvXQ89B80ZU11suG1GTNGxIHV4AcbpXgpCFQRMDYCBd5xGn/xJwjWSthKUUc83Hropgzli5Aa6HNKUsMFLj4Xh+UZEvGm8wINThvUPyAKcfDtPibwSPsef6qE+eM3p0VYU7YZzJditQdTaBsj8lAfda2z9qVckwxzgYh/W5pz3KGu5bLjEXfGCtIlH/78dxENrAjztIkEO4KH6JEasgonrPemcs9hrvr6l1Y7aOkfBf76El3bRhGOt0jBM5C5dbSufLB3CTi36OtXd16JUbTAHCUVfRtdpLLbaSNEcDks6ZLmzwSYapBUAHzpVnfa1ZfYCJdOgwj6D207mJdSFa8EJxH0SfExF9VVx5pxOquv+vBxnAen0EYBiDEgiD1giKy21sOCqRYk0jBGJ6qY+RsTQA7p3ynlSN7KrEARxdYXQQ/EWu2RwmQ/Ua2Gu9tw5VWBxwAA0P7hWvVqPkoJ5qPtUET80Zml5bBA9IxiBr9InYUqb6QagKyp064uL32/b9V9wMzZN/JSeMmKQKOm98ddw6uzw+aWqZ5HpOD3ScmIR0QG8RD7VhM= courante_2",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCG4A9uL6M6FzO8hDNN+wJ0W8Akxu1MV6V1xMQqqQwQ1Ba7L8v/5DebM/aAMsq2BMKkIYKUnSHAXAMqlIIhmaFsByuuwhi7pYV5/OgjGbr8Vvct8iOslIKQWUSmeSOmYEuWG/oepzYm2nmhZhNlGIiYoCQK6+3Fov41e5hGTWFqSuV0m9MJpTSNS5fnZ4t+vCJkBL+A/POhJ8D395YHdI6VXjuIIU7hDqNhtf89AASBmSEnGANhvlIAQQLM3j+/zXQMO9Nkz/YlWM/x8T9XyeXM9NWFLYjb5H+tVnNg1cEtUr5HsiAYpfFMqDJ60pRvxZodzGsljvQ/nEJty3Dnm5fV cardno:000500000CD6_3",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCYvhbtmv3zEE/QdeBDU0//e3elV3jCHMLOo8L66jwzTMH1SOrUkJXKs4UlCNC18lrFj7bPrtdOlIRc1qZh2PqZOkw5mYMGpzBqTAST4YADCbN7tdMcUarSaAqiepNyCKe2OcoxdhxxMtdUl6abqaYK1C2ktzMGCwaA2ZzOXEOiR4e/h/r5eAMN/LlJ2QSIlxT4/Xkc7xd3AdMehJTTQydF0sQWsF1ST7q78IkMdXoGl6Or8p2952QpOTxJcqGPM6JK/jhbQK0JrS8cjaSpZQEaK0imjIsTN1aujn3I6AQTzTJIcVoBqRpYNE2323BDbrMgb7h6YcwQG6lCQLGkEZdp cardno:000500000CD5_5",
            "ssh-dss AAAAB3NzaC1kc3MAAACBALraI+++Hln5igK26HJ69Nwt0nNVrK/pc+g5KKwSGvF2mWpSkTBEAKc1ZGQZBLMe0BOajM8feC7f5Do1QAN55slIHSwANKJnmsbyCRhlTcNV3GYvGfnwmviIN6mI5CHKTzPal3eWLyD3KUbbWP/+tILT7viK56uS+TIE3bcp/SpBAAAAFQDUoYhqv9hValZJOSg31ZX6MBlvzwAAAIBcgO/YfQHLaT4DBhi6ineURzw5JBjurpOik1lKgm/RLB5QN7xqhe3jlxAAdFCvtuZAd4d9gLaOb5dXZFdenK63DyRJvkVyhVJCbVt/psf6Pvp1P9SZ/9nJOtkdounftiyhT36EoCzp+fiZTvRrS/hXzoQ10pGJ/GKVUo8C6n90AAAAAIEAnHNTEDBLxzpdPc02LDs3EkvMe756H9Ez7Bw6gjortDqeu/7VyuqkJbQSXSRes3XKffoKw3eTHnzJzyG8SYW1fBD8bk4JOwMTjUz28XqPNg0P+Lb8vuxr7ZepsG8+epXGfPUyIr09uPApkvfqAMGT2bgsI5dVRlS4I8sYvzH4oPU= immo@benabuFaUl_6",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDecKLqLNKMvdOqNt+6MvfmNSE4hlcl6PVjjxQpkvrt5RdoZBq6jxdwF2hGSwEk30T+wRMr2EFoJ2ZjKvEZ4SwIPdji+UtI70tNc6pAS+j4/S/stX3FPPLNAhJK+Jy+Qtl07Q+myD8oDRp9I5wLKYAwHcHFOlcBUYTFqcgrL58OO3ZETFJ89qfLwag1MiNzstP4c84iIfA3ekrVK5s1ZiIlSlalDTbGmHplv5jLjoXWJe+Gaq4KMYfWO0ahm/KtZ/AZJMq9LHw0oWS82CmWMM6gtToVDUmiAaLB+3L7cLab+dCG/QV2ygwyTaoz5Mro8BU7r2fqkXs2/crVJJWH5c4J immo@T60_7",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvyZgx/+b0YU+CqDXLPbgOoRmpiyKYDkAsfXMpZ+aKVCtGZzmg8OeIVUDv1lbq+qQwNl+fOi7/V+U8w7BpyVUSf5Pn+ld/+eQK1IgkjsDyfdsFiXr4stzCDjpOzRTs/fludZ4WXEtBRJ0IsfX6VJWU2xXBZKrgw62XnbUv/I0hzpckf9Ug9RsCOdS70FfrmRxh2rCEpVdukS4KNyq8MHkwIQM381k26wvsAH6fhNJucICeBIDzfcP61bg4zWLiKQ+q+5c4U7cRoz/N0G2FNOWwQHooQueVC7+SY3Vh2o9AGG2H+Lbrg03e5NSSUBJa2ixZM933evno1yniv/NiTYbGw== lucas@luwo_8",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDOYHCpCpSDFjzWTGLX9yACSGEIj2K0wRlKSENB79pq8mlDXN92scRgjCCCBssSRdozS3k1457PXhwx02JC5mQ1JK69f/xN4DMsYyQYm+pzreWxm36ViNVTBj2gpqRHzl+iakjZFzeaKgAPtmSV6giRhuHrWu+ZAorBRaRVaDBQqAxhiBanyU7AjmMFBDgAhJm/DN3Yb4GMYfXyMhZagsZ+DVH+ZbTts0ZWwPZgbfa8eERXwYH3YvscwhBCRulySG7Vffksz7ekds/csQq75Ta8e6qjaCI2Xs494vnfdmaxUeBvuYRm21DsWJyBMXTv9y/2ustOFsEHpo6K/NpgbYBT libelle_1",
        ],
    }
##### END rrbone #####

##### BEGIN hosteam #####

    add_user { hosteam:
        email => "noc@hosteam.pl",
        company => "HosTeam",
        uid => "5042",
        groups => ['ring-users'],
    }
    authorized_keys { "hosteam":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAs1ACqSoo3R4LvDgxGUuRP3EGGgmKoLwGnRdOVBLBEjI649eodKbC42hlbJLITI4inHM6KtLsZTmcwX3nSOr9Mlc+rm0SG0iRHhvGpGJ/TUswGR+e4ZiEcrlXoQEXX3Z3VaFESlR8Qoy1WA7N1//bG0piwa7z0WSOtfPwZmWXKGE= rsa-key-20080513_1",
        ],
    }
##### END hosteam #####

##### BEGIN msp #####

    add_user { msp:
        email => "noc@mediasp.com",
        company => "Media Service Provider",
        uid => "5043",
        groups => ['ring-users'],
    }
    authorized_keys { "msp":
        sshkeys => [
            "ssh-dss AAAAB3NzaC1kc3MAAAEBAPDFF9GlMyZolbZutT3evQ/YDuDG06hk2gpP0VhFdgIQCggib8bs69B6t3U8JJYExH9i3bmom+J9m8vh+GKBHsN+rBqWEHLgOd9BVZWwXdRud2U3869VbzW4y+FqVScRz2pCamCBu90Oa4LNAmU3dmw1RGsnt/jsHCUPLXIDXPcuQ+qyN0lyigyqDxTRVJwMVJoIQCFSZm4aPMPK2BObIbGj/hXLnyftaHyUKXH1UWG8Qv0EF1+1zjCaJlAkOyPpKEEt6UD/iKFaJlTAXetcLNdDv8SfwTCwS+1elDt16aFdFRFqbkLTtYbq72HlUZALs7sRF/Oe5D4qCHcMqw7T/50AAAAVAJeOh5AmeuPKC/RQInPQHVZxG0VjAAABAQDO+6a/UuH9KgT7tkHHx/V0X5LJXhCXvs3JTEKswpV6AU/Tmvo5YjVmSoyu6UtTDGpwoVdG9JniCWY+YjahsRD+Q5oe3pTUlZG+DnGlMIOM6WIBiD2V7rbGHEcaGu1xOLSVD3JnXUqJmlMegILokeR7n2kLpHeILunGIi2POjuGcB2yUvEN+naXPLlf1cPSZlyoFbxbQW9W16uICLqeHCMzpIqoQTtUIVqtLhPqclDcJyHRtpNCuYkd07n8ko42SHgl+s9OHOgt0x3w5THRamjA56cHoO4JVpcylCbRKbfBXqdzG+D8P7e3TbjEEmWVG/spFEUhUTiNZKcI+XxxT914AAABAQCnuueFHN9eastS3TfoWiJI79xTZiZ4Q1aZmoGTWJHwpuoKOXp6AAyvsAQxH6teYLttdlAg7R/lbo/Qj4XQrPMFcd8GYEfTxuSRFXqjYFKef/qYv2ms5Bwk5eclL9HKyz/kHicObH1KvY77HlQbuBuHyVk+bSwHsJGo1mqnPr3y7J3i6yYdu4igArzqcSfxYerwuK6ZxUr+xy65lVjM1jg0Ai1gccfHIEshluNGMcEJx5y/I49RJULrxEVwhJfcApHou/4sQTeEkSkgUytoY+QbErNYu2luXXb1Jbci18RDY7Unp0Xuk5I9GAfvmGwH3PSyI7SlCULB5Xsb38lyQbxd charlie@playloudermsp.com",
        ],
    }
##### END msp #####

##### BEGIN inotel #####

    add_user { inotel:
        email => "noc@inotel.pl",
        company => "Inotel",
        uid => "5044",
        groups => ['ring-users'],
    }
    authorized_keys { "inotel":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvQMA3dgZR9kirWPiu4inUvZCkBUOy0DZEX95NexlfkNGoqm9wm3xcWZhJIGc7aq+U1DNe0rOEBe2oxaCfaVBeorwL4Wg5ZeIW8Mlfrapc+jVYBjWLrZrHb/ZJbxWSDnYW18GPF2EcZPTtyGzCmm+3p7BXYESqpi+/kQvcleOKNoQiHz7T5Wgdrr1wRBUJHuYRuwFRDH029pBNDX/zBciZbGhi2WPjapn49iLCBUUxfogKKLWGYO60S4pMQQ7ttWIMNJPoPYOMVOa/9iK9PAWxYSGh7c7XjTdsZjge5XSE7z3coqGfoFn989rSu+41JzYFHTXGPJ16c8gCW2qcSRCwQ== rozie@pluto",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAtzZcJ/YrEd8YoQk99YOL5U57pCGTyPGEkpeM1eEvLCnPfhJfnw/YU6fm+6/ungNqexJYB+78f3ihx1u72R0qa534t7GT8wwbRIhEVKzoWHVXTTBKKqitkRlFg8PbQ8awcJXVVrNHzzZxDa+rlM9yxpw2aySZpmMW0fE//z+UkvZ17SubBF6d1vGy7Jq0d1uGYHuxY0gPUJxgXape2vF2qUBIXgU8OC2yi3060tvYZLddOCyZaKBjWqPz5Oo4p7OXPzD/aTF0l0FEtOEL0WH93QZMX3i3zHnz5jr/rIRFioCzL+uCMfhAvK8KLnOM3zBxYaitLvi7+TrlGzCYViYvdQ== gigi@tauri_3",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAoeI4jT52M3SqbYbvHNEhq5fAwUohTHHTNhvWR4PhO58XztVlCflUe+/6elpD3uMGIjcngfZC9z5L0jnGjhAgndh6WN/eEBScRg/hyGIfhTVYrAyL43xeW/c8UrbtWBl3vLFUO1ygGfNj+TSPvMGmG7aXHx/dyFrzlf47I7dWCAKsxdsLZIwRgOsNsUVWfnRO8QSOX7caK+I71FA2c6RJ8zBiO8yY1yJij0rKhDPq/EaVl1SZ0qqwEiqx0niOm7UZO4Nn4nEhbhc9it3/N7prjshExfFSgr6+fN2y7Yr1LQOULXEGEfabllQikHxGzcoSCR6d6ihHXM/tp5Ev8LiFhw== sniegul@Debian_1",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvQMA3dgZR9kirWPiu4inUvZCkBUOy0DZEX95NexlfkNGoqm9wm3xcWZhJIGc7aq+U1DNe0rOEBe2oxaCfaVBeorwL4Wg5ZeIW8Mlfrapc+jVYBjWLrZrHb/ZJbxWSDnYW18GPF2EcZPTtyGzCmm+3p7BXYESqpi+/kQvcleOKNoQiHz7T5Wgdrr1wRBUJHuYRuwFRDH029pBNDX/zBciZbGhi2WPjapn49iLCBUUxfogKKLWGYO60S4pMQQ7ttWIMNJPoPYOMVOa/9iK9PAWxYSGh7c7XjTdsZjge5XSE7z3coqGfoFn989rSu+41JzYFHTXGPJ16c8gCW2qcSRCwQ== rozie@pluto_5",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAx2XQAqwx+HzOec8uRDR3eogaD2JvCkztS4FaKo+gRP1aJuk3/qgEJtgYQnMZXQflYIXtOoHwPWL0Gq+KXvvmra2BXri3X6f++n6FICz2eAFih0I92HFmpSpkz9QU+Jk6fc1zMHI8gNeoCYRvJiuYkhgzCniuQ3MtPD+FSLg9sarVksdxp1saizGuDwEaQ703KGwktzQfWnWahVtISlx2TlTU6QnR3M3KHrhg0Yj1vztRDelWV3pLofAMtEHYO3o0IYKSqfHt/quUxn86xcQcMIUXOmbVb6dTgZtbQnKx8hKPEtLQgZut+Z+O76iMaX9vrES/LopNFWgjTwF9wMzIuQ== szymon@sjazy-inotel_4",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAxX/wJQ2VY8n7QiGhmZz69Rw5EqmbmkXqDFf77rKfvvy7KjimQff56mE1CKR7XgF+0eeHwoiOJatTX6tUMAyguQYFehznnfrSa9czIYpMFP/+M0SGaVcxn/lPW9U8PA+DAobdvRgU94AGXGelGWtu9546tRa3eASWBUxVucSsqUpRUuMApfgiiDWayVCcyrrECPXGbLEWWCChzK1LSTv/mfCzjbwW5KV5Sg5RhwTReJNgpxdttusaV5YlSRCBSsiRdOebAv0FpsYqBxE9vPWA+cxLbkSWC8tyt/3P638pGITa4IRXGgYoxSb7VWNb5NNi19i56S4cGK74zag65nHl8w== sniegul@stuff.inotel.pl_2",
        ],
    }
##### END inotel #####

##### BEGIN fremaks ##### 

    add_user { fremaks:
        email => "noc@fremaks.de",
        company => "Fremaks GmbH",
        uid => "5045",
        groups => ['ring-users'],
    }
    authorized_keys { "fremaks":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA0mu67fLeiCpRS2Muv3TYbI3181u8QgcLPhNWUQOkABT4rdaGK4bO3TsImOCjsXg42Xx5+kJXhuX0e/O9W0HxdIt59AoBvgSV7dcKljIqaCRm9vgwZuotW3zcPMI5NgfyqnzZPCKWlEdW9lDY3ayyYWUmQr7/DUtFA0AaKcBeQ/y2aNJ738Je3vu4f04GUBqZfCkIn4OBL5DTLH3eV0v1aFPBCn+X4aQLuqnHf5dFofYzVTUrJw7kYQFi1uHq07cxj79Mip7YOIIm0F/z2xySPKu58OP4Dz0izOQOIV9f2FqQqqJYdYcLnt716QwaiFLqmQrbT6k45WI19q/WI/ptTQ== morpheus@mbp",
        ],
    }
##### BEGIN blix #####

    add_user { blix:
        email => "support@blixsolutions.eu",
        company => "Blix Solutions",
        uid => "5046",
        groups => ['ring-users'],
    }
    authorized_keys { "blix":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA4DGMd93hRqdTn5QNWD3RbN9dhslqJvWuKuKHXeAkpymwC58ccLYafDKhe0YoYGYskKUMgtuPXGYuNJlhWYSqpei6RVHlG2OZFVnaXGnYyUm+jBBfetPEXOByvldq45r+0Dha6+VVUyL7YFYs2/RGRv/uTI7Dtxy0PaIYHJo67rqBGG2BdMRP6nwhxZ/6KcCQ8YZq14MHZ9tg/W696onO4qWiK6rV9uNAO3d7d8COG9Ipr8RpRh2k0/329IBT+8ADuVRUH4GxxnDO9vUC+6Mi7dDJanAp6jL0mVGsRCsR/cR03pcQU7Y5LQjrC10a5a8XwYXGO/qcpuTgNzjrXE9q1w== root@jumpstation.blixbone.net",
        ],
    }
##### END blix #####

##### BEGIN portlane #####

    add_user { portlane:
        email => "noc@portlane.com",
        company => "Portlane",
        uid => "5047",
        groups => ['ring-users'],
    }
    authorized_keys { "portlane":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9hFwclD6VWkrQBAY0DHWTdLBmX5eHbByPdFI/x/L6YmnrCBBXpCyiQLJLaIU05i/iCNw/hhAdph4/DvPy1vX3Il4koYklL15RJqLB4vIymb7Xiw6YdS9e6orr1Yh86Z4RxEK3OE9p0LCh5ZGtNjmuW3Hg5XIuklE9jrkdmJKQ927cAhomxFc7AGH2Uu3g8OCIG4TD3EZkAiYOa/kEF47nL+0PlpdPYXdqT8+EItyH1enuOcLeD2joe8LC+/zul9VPWmvM/7EiKdFDMkWlbj+JgZOeVkR2ebxsr/mmmvzCUdwmBEeQnJp1kr7QnVJn32NWsFFEisHqJjMuNCRXL5fJ tobias@irc",
        ],
    }
##### END portlane #####

##### BEGIN solido #####

    add_user { solido:
        email => "noc@solido.net",
        company => "Solido",
        uid => "5048",
        groups => ['ring-users'],
    }
    authorized_keys { "solido":
        sshkeys => [
            "ssh-dss AAAAB3NzaC1kc3MAAACBAMzGjfcnofM9W8WAAZ03O+gX/susUi1prJYRpomsnHMwICiiqLL1R5J/FUb/E79hhcVtyXLh833YeEQlCm25Jw4gmYABfRGyvcWYDs2zQd7Li1kBXlXnRoxd1pxDTZ4trUSSklosKCZYHqOhFNntc0789xLkjuZWe/IzYVJCW8wrAAAAFQCQiVrdhQWLXzogUR+mRL5WmWYPtwAAAIBvRrUEsjLMvl+EZRGnX/UtOaNyFjKvGh0dzLddjJ03H9dkAVeJDkLx9LSyUEvGDMYSY+gbBoakHCWVDnF1109y2m2UQ23NkJdgkXyWBkf4M4VKGe+Yl9M1FaR2Lvr8o5qW4hZJf8XfC7MXWTiyPxuonc7xufBj1ibU53nQVcEzlAAAAIB5cgVBZTVGKznH0/65JyhJmcMNMimtX7EV/VjnCK+JK3s8sJnNo2fu297IR+XQKlVO8oyw7n/9peYEMkksWrOPW/jvdK9ce1nLGJ81T36Ppiui8G/4GsSkSd6x3igLCxGgB+fEv0tyOyEsIbKVVZ8ySTRg+LvtNlfjA/+faAw2DA== hlk@solido.net",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAyQNdrDEWpzs3bVJ3IIUrMjV6UCvQYW0zOHxdWNwQvleNv4Ktp4XIIYdRkUsnYEluLPuZ6BPXujqXQVOefzD6EIwBxHrfZc6DpLdjw9t3IUU7KR/n5bzwQ/4buL3uPCAyz4zbEcRva3/rHekMK8/1CsGU6DclD95vFmzA8bpTjaW+i3YIt4t1yd1hoMZvr5h8sl6EK9HSwltZM0voadLQWArHMrX0RvUY73RoxOVUMTcxDU2RqeQL0+qQnNM7WX2dxeRWTqMk3x3DrWMno/F9bnl+AwGi5B20a/MVJdzxUQlJge3KwzoGOtjyAxlCTZJyovSa+6yoEaQBmmQNZBy+kQ== jes@solido.net",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAiTxKsttTlWM3Tts99pmIm30BtBWf9bDHvY7DzH2WQAQR64CMhmNdQBVda3GHCOzc36jKt7+lmcgGlUJ/1omlKixm+URXiuUzMdvdhgvkmWd/EQ/1d5izHfx9xzDK4Rsqho0dqroC0jNBw1wDjJ9k6O5CqgwRSnYC1V/yxtpfAYs= jkr@solido.net",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAK+GFYxdV9BaxV1ndXhdQCjqDaCbfpBOyaPOaxUXwVo0DbcO8Hm3kN9iTJ77vO1XRk042uRLKKclMdlUx8l7rdpYUtC1iFuQBqbiGjbmS/7oFIQGdUzNkNg42QzoMfd4g3nYwolY4f/aVxtj6CxThvGRcFgPf64IMqB8gzSTxz+HAAAAFQC8tvDwK4el5vUSSax1ShTfw7AFaQAAAIBPPau1I14qq8hM1e4j9BBWloUvnlyiy/S/LUfAQtbuRHc2+3gSeMJrbPXj8rkawfKcsXW3nqQkSaLwyCZ8OYQp6YwDHNyonGXynelrPYSQdq7zofgBXoujyA6gUNVtp183Jo4UVYQx9vYFOeqYjQaPpTo70kyb2bSZYg/9cYo9KwAAAIBo5BITdTVIi5DjXxPXLJLEU5ARBo0GoSLyxYqo2MlM5vsE6bmV8UyDt/Aww+gdZN2x2UFCMoVLOJEE6iZ7pCFLSfk0oCM/8N4szxdFK7hXL++WXjqXEgyYFPlGlDYe8aXXcEe8Nd4v1nh8+vB3TclJk9VQSfIM9GQ8KO19bvrHXw== tko@solido.net",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAIwjS0UfOSr/io59o+peG8Mft7eHFG3Mh5lVB9gqmVjp7TxAlpaGYUxafd37SCgKFCTGGawWNEa8q0bIzmQ2q4+7FPCs6PmKXCCUfuQV0nTl1EPkuKSELcpb3d/qYiDnQEg/WYPjfQoxLZYV6zRz7pjKxl9h91idV+0NeMrsT/DfAAAAFQCEZ0W2fKhCrfNrUbP7K6MLiLjbuQAAAIBdhA25mn/C1QqfEAeommmhstHi/SDwhJT43SxQGYoOvM8gKx76oAoc50tAdC2Rc8/Jv7tpf4XOWpcmenFy+f/WhdD+Ztbp9NKdlqp5g7w7hmG/EWGSedru23UghP5E4leuXzClsVX/yHcZ5xw3NNglzptASVYkBGYcFkpwNr+HmAAAAIBgBtG267r/K28IZ2QhHcDWTS6alYkh5gLYP5xFrxfMHzvlTOy+FhvMRyoLiYC0lCmX558s1WoOTFor2HKkfLL2bCKfkwfRmKUDH860U3Ff1fNjduGfj/TWHYIB0WFaZX+ptPifQfKdqeKE6kla8JqCXi1MXnQ2Cn7hXHV7zSuWfQ== ch@solido.net",
        ],
    }
##### END solido #####

##### BEGIN digmia #####

    add_user { digmia:
        email => "ring@digmia.com",
        company => "Digmia",
        uid => "5049",
        groups => ['ring-users'],
    }
    authorized_keys { "digmia":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAABAEAsBEIu0o/whw3btR3JUOifIOg2CmV8PvcfNpn9LvVo/W1qZRGQQnliqU8IbBf7TAHrssZkRF2tnAu0t9PWzI303u36QIyJm+41DpXipt1i02fctw9qBbVSinOfmK0zSg1EbUVb9HCcLM4EY+/fd3kyKmdnsCSLCApQLiQ+rqFKniSE/i0ZG79sidfDVeJUMHPtHQ14wuS3JyHc1aMHj2HhJ8r+1NXlAh8GGFKeWs5yu0kczmrhot708DQOAene9vhtDl1sfK1xQBq9BjuxDa3r1oFmH2vC/tHDiTMMTzNFqPOgwEOpvRfi6QSbUJM6taWoz40S5rq4zdueJ+bnsot6DstVwF2uf2wnA5R7Ll3d/h4akOP79pSd8DGmFjYROzQ0izv8EJKZI9P/xIJMIp+Wqd3WtK3xIDOpOjgOnX70l19iSstyjtTZFm3CHMSythpHSD6M/fwzcpLub5BjNFkFhtiyZWmiqBV/93AAnxZBfW+xQCfb1lZ1FStGWJKeSL9oFbKYpRf8va8SHR0P25twSMw77Fcn3RQSVPzSFPla1hBihnDTIGrSBOIhRQJNEvakJJNgE07XQg1xjILnLe1p8sD4Z3xWIsvaTAflkgMuxhGdV/sGaOvNjmjzVAr+lmbw3jgVtZ/+WdniDJQZnyoDqxvX33DGV+pDewm2pcO/3dqcpOw7a5oz1mPUkLTmerfw/S9wb5TC/V94LRCYDNdezZ8oRL6ryZ6vf4l4tAfdPbTkX4O/H2+Rze9VofT0G91cTJC2XGHOIJzh5o1Dungvp1wcHLS/TC1srnZOcm3LQJcORbUt1/wzaKWVo1p2wUrbCnn64/noIt3C74YPJdUu2Oy/lsUz7zZkWUtGc7dLRTcvg18EcOx9wLeOTl6ptwEI2vshJQl7fCIOsjVQ+TqEMd1YFKu/VRG5a7f051Lvtx3J6VMRbPLB/e0U8PtVouLQGW+PeDPLjH5jKaS97UKUhxDU1mtEIpW0AmAkzLQVJh4z5sUUn6QyIMhn617XBQn1KCFT5tmZk1qymdoxqFOO7wZB2x5FJKmMRADmvDmHPmt5K0ERscIJgQ2XqE5M1GekaKFnb3dF40OSStVHe0ljKfoyNrH9WhdnMlWLZwW+egyjDFsuyyvBSJAKdhRy912ZcQPJOYSbxYwihWl2tcWLE1o3uFmq9693os7Ku4QbOovsuKh6/Ah78bljzGymRTOHtUlUnGAKG7WAnnupvJuT97JU6xBCl1y1MKpdfFPVCM1pqHnOBq+VG7TOYB6Y5kTcq5fjuJUIFOTle514Vq9qTeWz89S0GOhbxodXLt4D/Q1xafRchVJxNwh85nE/l/t9cjjfmaFB9nhqykGNB6wjQ== digmia@services",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAjtfZrGC/oXVu5wydMrWtd7P71n4CbXtdkogDEFEkWC+9byKFBWcZRgi/DLUrqZaigbAlgh3N9ThwPLMIWP/Sil/zNJWFMhUM5MLGXjtNBD1q24P65J/y/976mz7zHIfIPbllhghc+32tH1JekNOpZpUjsWUFLfxZbixxh432P8+U6ncF2yWrd4oMkjPRrL352htxWYLQsoz47549IbxjvXjrHx8RE/M1nIKE32B4QbdGJ9qGfA6AU4UalcgELyjGnkXG66lajGiMjlRP0UJ7lIT+I3RcqOZ5rCmGd+3iAN7fAuKb8HXm4WarEu9EsccxZcRuHuYFj3CHem1B1mDAoZdO6ZmGV4HwcIIEKGEYoYpIyLt7waVjXZ24070cj/s0DrF5OGNDxWnvQJmxjPNqxy/2Lq2jZdFf5ayLBaMkprIC4iNA6180BaiuZ0IW2Xth//s8v7Mr3BLBURWH9f4yDJJkXz20mlEkztH2zhFIGm2cBCdGJsoyHEge68pDLU3neN5gBykbFq596ii0MtxzreMswQcT+VbI4HQWrWpILae56f4phSA1jbzCWCrnQj5u+1hpgWgORdjxN8nEyLIqrYjwOmZUqJHEfHLCJ7vinDJUJnXngq2JHzGz8Qealoz4hCcV+2hz0/Q7P6m5YZRd3zBJQOo2+D95BUqHaLT20nMnhUvs6G94L/MtJIp7/8qJtaHIc3FqVlE/81w+pbFpiGk208xUAnRjKth/d6VOkLaUyf1a48Jn4/DleTl digmia@100929_1",
        ],
    }
##### END digmia #####

##### BEGIN rootlu #####

    add_user { rootlu:
        email => "noc@as5577.net",
        company => "ROOT S.A.",
        uid => "5050",
        groups => ['ring-users'],
    }
    authorized_keys { "rootlu":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvz23VR+/11p4UGf8WNe9RDIKAbMOz63nWn3Yyd0gGmdEDvEbIvlUaG0rWzUH2K15o2I4ksEpb0gmsPLxboBAiaaib4n/dHOw5PkxxRFfpIFU/kG6y9uZOB2Q7Hf2twQqJo3ov7532okT3J2Q7QRlOEH7AkwVFdp3DmhULqN9Y7huCvc135zH81agvl1+SrDg+QMJ99jPOjJQZJOas4RvCx+zaD6eLLwZUlwPRItZmqhxESzFSBGbLqBI3O0t6IJ05s+UbkUpL3SIT7kIOZvNJ/8NMiHwKjAlwUIblm8aeHUmyWPzZZVT6slfZMzfW1Ff1oJvqOvdAUpHSY+jo9+SLw== mullebutz@mullebutz-desktop-root_1",
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEAym+eYyU79lyAef3ged04g762cdoFF7jz2127/RHJimeX/8vgECLl2/gsXuBuOlV1mcnHiC3EAp/0SjGVhWN0IZU/qGlGJWmPOKvzB6marEBEfRSsTHnZJO0XqKQG8GdcrWSJUq3raZSndc5L7eUTXoIiGLJ7osEOa/i9Zb0IGNFFIB63QMEG2QBkOmVDN99HSAVARu1PBO/v88fB7p6QXAz3kRvs+XhHWFV4PQlk8avZVHz3DovphncN9SeLo/5JmJGG68Fl/r4GXCvognT3hMx9ZVab7es46iDqU2t6Z2LY5Lw3o0NedGV+VsULS0CzXEP6pyIxOMNU5wplwUPTU9VsuoBVO5Jo7va1y8JnAOeJ+QP062sUZlgk6A57c2AfqN+fmP36hP7BY5YgDzCaXT4MMxcsNobGAIwJUCWyBFbBgGGiUc0L8RfHxm0w4mI8CGZ+WAiltPLb1wZACib6BkDREKGRrBOrY836sn55M2fxmkstDPENzz8F1Cir5pQJXMXUfEcV0AgWaHulrFbnpHvf0HfWqm855uz4bmNsQ8oy7wpik600/iPD97eG3YX8fBBWqBU+iqLbUnJ+BFNXOCHznVvZxeCefB6dE+SNUf3DixcrrSW20MweAjfvtO8ldQMiNxUaN7OBRaEs/XyHTA+mx3oXaTHb68LADMaiLcs= andy@bierlair.com",
        ],
    }
##### END rootlu #####

##### BEGIN globalaxs #####

    add_user { globalaxs:
        email => "nmc@m247.com",
        company => "GlobalAXS Communications Ltd",
        uid => "5051",
        groups => ['ring-users'],
    }
    authorized_keys { "globalaxs":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAyRNgoniiGQbtJ8YOuKfWkK+1x3YELpVhfexNlPQbF7j+tbHIkuSP4RC1vo9XsmGhFN7co8jWAmZPtXx+peyXT8QDl5BPzbzjPlK+C0WTkIl74zqAwb51JHwo/TaRlDsrI6JR9gVO41q+ExtWcNmTVQRXzRJ+oo8DeuWt30r0kPrTGhyuJC5L7X/xW6vCBGVSXso2Ck0yv4xCUtWJYL70vt3qsvoEmgQY70XMHooZj3A7qMEITJ6akAzajLukCAjbhMrk9melANx1B9FxoYUxIAO7SJyn9J/Kh2TzZ3Hg4G8KYy4HJ0wFFOcm2O0WXdghZIK8RoiLPo5S1tkyGll2xQ== shafez@jumper.uk.gbxs.net",
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDSmIykA6o/1gtFYHHs3Vj/YtVxX7Fc0PMoxgNs09H0bZI4ebg7o9oyHS8QvD1/AD7ndB0s5krDbEMMNXFTv3vRLQIVvQcO4tD3LlqQDx8Dk4WsO4RZdljlQczbTC0V1w43J/72y6fgTkFvELVNUgg3Tcs7VqdyQm3n2MHUxYWMIpji0qSyx0vkfNlz4nK63GdV+aNdkk7MeE0bf3m83MFoRnzuAgZ1tRtU+ZzYYgvGp6ZDPwKFy+Q9zwlKierTbn+ybrrGb1XMPlRpsszh89F0UKXHksRRc2M0xZUJttmm9d3bTrxRXczqCEkMuYB2Hb1YwVTZFIz05nXmYQdvWN4h shafez@jumper",
        ],
    }
##### END globalaxs #####

##### BEGIN nebula #####

    add_user { nebula:
        email => "net-core@nebula.fi",
        company => "Nebula Oy",
        uid => "5052",
        groups => ['ring-users'],
    }
    authorized_keys { "nebula":
        sshkeys => [
            "ssh-dss AAAAB3NzaC1kc3MAAACBAMzvPKDvQFoHrILbrpCfxiEJ6itfemSo+IVf7YwKmjriV8zYEvOfbcR97Gf19WIO2pxud8b55U1Uu10yUlhHwSbb+HhSeWZBPuYoepvKLGb7RQhDWhh3gQW1aznoXgJvL30d3JChUOGCG3mZSB1GwLSSzl8/ammTNU5kPvxrvNWJAAAAFQCGyeTGpNeJRm6hbNMD2egQMak9CQAAAIBkJIInr0pnY/7c07+D3Gz/wYZ/lIQ2BXpCTXp336dtr7I6YXKspYbthrQ0ZFFG0+6wRwGhalM7V+jyMyxaAZ77GPazgfrqmqHWhoValRfi0fjep3MRe8bYUrodGAVe20oajLRRf9IB3PemaSw5B5Qpmh5lOCYIX81ZovQNXgRZAwAAAIEAkZEpPwgKwGRt5l62f0Bo7hnNSAlKfPTOYsfxtowObw8X0I7vKpCyM5mxO0NpNzddQmjQYKnZJpRRSxDmBA4ZoufCWvL6ZV7PmhR3n4bsvzkwmjaf3qWkVC7L8PSf0k/Izqzix3UesdhRCsyn2wOIN+oBIsqzyqbDEjkeuaR/4o0= hcg@netstat.nebula.fi",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAOtxdQzJrSk10RA+WjGiRAPdJAuYyVXJ9VXtNPg2H51O4hJaRR6Y/arGWF8v93IFpffrN76IanMu//TYglLOa6mzfvmX/IxPuO2SjcmxUnHv+y41e10tTW8KdOx6mh/2M2BgBgbqkbwg/h21EWfXYRifN7/mnVyezID1+a0FpXPHAAAAFQDZGiUqsJNYn2UVuhuFjlvHpcj5eQAAAIEAql3Or5ZQAghJAKyQk2vnVVvyHacl03RNQONAncqUMxmSAZkM8n8qtOwSmFN7OzvfMdb3W5aHP4QvUqleaA86tLWdpEjkE/rbnsR9VAKGi0AU5/q9ps63pb4HZKSmAn87F5Qx+0pNWfbiEaLi6vKNrAhUnfy+xHKrvyftJsVBvc0AAACAAIcnmU6+ZI6AILUBSY0736NeRYYMWLF4dchHjtMBt5UroPPgqGCFravpO3QrlVd1GuVaH0X7w9kIKk6PvcQCdSDA6bSvLXf163tLBIy9tJzDDNFe87QjnQr0YGuvFWO7W/2la1V5pOL2WCDHMvJW59F+ujNTzyKqGq1apoy96NE= zabbix@zabbix-node1.pit.hel.nebula.fi",
            "ssh-dss AAAAB3NzaC1kc3MAAACBAMZ/mS1N3Fqb8xt2uigeRossmF+IEJf+aIFLu13eP3zDXQeFHK4jBDEkNMpH/o0a+lPmbv+t06nc++y4lsqBja2tBewIWLv9DTgUmzFszaIaoGi/niLrXeZxkFmw+2ZRmhl5F+nzxnND6Ylm3ufVjzGF0bZNN83PxAwVexNaShoTAAAAFQD0hCNlc+73oLzLnDPmiwyecO+FTwAAAIAuyuwroSjfSTG8hNPoMJ/iMpfdvGS7HvU1TNJRxFGh4H0ufiWXiCjLsL4roE2vJObmsAsxKSJGG/GE3ER1IxyEWZriDm+iWjWYCMaLOi/X6WvOjAuXdYlKgittTiyjvC2QwygL+ZBo6j87YZ+yTXDcHWirvThBDO0Q6JyhEacZVQAAAIEAxU0T+6abdi+xLPZFsb6TYkcp41yu908/2NE49kDWckgbyzKM0qSo/3ji5r1HSBHi4eyKgUiQU6s0avmjaKmx123Qn5d2LkcfWwRj1m74yqLKarBgXWGqciTvydWdkEON4u6hMg2nCqA8i5uek62EEkcGbeJZTT2ppmxy+ehzSSA= noc@netstat.nebula.fi",
            "ssh-dss AAAAB3NzaC1kc3MAAAEBAP1jOaIBZaRw2m0lc5mDZgZcNGOATyrm+eHV7RszuH9jxIYuHRYwVK+9M/drjd/aGLaVfCOA9ZdaFHprtoC9nAJDRu4HJc7uniXxeMbUsei/v17vcI2z2Q7lHPLGLq6IdduyNvv+jkYZWlCACe/vzN5NfFG5/6yWnEUqgGpwkQZcFppEuuDzuixLyeJ6itX4KxGDu6kgEaF/t79GmC2fg7k4YhH4JhxeqQXQKWavExRnlGUrBdjD4tCvQau5Lgv+PmzsGWNjwZ2Z2Ff5FdMP2Pb5mG7slundzkwHffG+yyishQws2nYG4R0vLpfi5VlF0a4KsIqKrCTcNhN95vMSd4UAAAAVAMZ80t7o8zWnucN8xQVL2k5RLxHDAAABAEkMyiSxh2SwLBbtyI2gCe8AleZ+6nhAv3ULWGBQTs0oSduVIBKuk2ZzQ1I6pSRCU/seBxdk08DPO33/nJxJWOtw7fNIsPzZ/lo345cGfBJUUtQaeivOgq3BYjvPWf5LOg/kJdW+v684rrsfHb9FT05e6Z2hhaQ+W/O+zrUfcZtcABqARmaHo5hyqJPThbVhJCHhPnDwYoje8JBM55++xwcc/l+zjZ2n34ASWPb2Fwd2jEQTkAoinU+IOvVJSNbCKtI/2JirGYp3d846xhfLWQ/YssDXxQa0t9hoG8FgoruVb65RW5myNbLt+0mgDfWNvoUPfCbjD2Widi9sjj9YvccAAAEBAPaX65mhG2FcZ2pqH+Lko2C5bPjzbOpzjpx5Fw30vjbFp3r8uyVoMuvAw9jULojvEyOGKnBS17XhhLXWTjiXbV57JgMf7DEmTAdTs7dIdJKz6jkWUoNIhVRniXVCYQO3qADQIM5GZJ8AWlwS6CHrRg9cNaBKVtxxDmdxmsT+UcudJ5rrzwdQBBfGivr+xvb9uSMsfkm2Y8AzR2++ZiRrdQRZEMKKXBNiCsYSJGr9Fh0T/f54dT8HnhsJxLoG+x+BvkInTmPHPZsEiEXBqQW9uyHRzVhUoQHIriIiyKRyaCu0U1Z7ZJRS+JAs2cI2Bd1XaVgK3LhuAqOEpPeUCDwTx0s=",
        ],
    }

##### END nebula #####

##### BEGIN tilaa #####

    add_user { tilaa:
        email => "noc@tilaa.nl",
        company => "Tilaa",
        uid => "5053",
        groups => ['ring-users'],
    }
    authorized_keys { "tilaa":
        sshkeys => [
        "ssh-dss AAAAB3NzaC1kc3MAAACBAIEoXfQtARWvxrJZM+xseVIdFfVhGXJERIZEg9tSmVf8ojsmc2OEszLqU9olkoiEt+rrrw5hmQt9iKN3Wu1xo6EEH6A2idmX73jkH2AttHlRbQ4ugzXUeRdlQNTIsR8X45cek6/yrFRQORZCd0wlL1/r6WGWYsV1wvdPYxRCETHfAAAAFQDIFV1iKo6tAPgWTaUXHzq5tkGyUQAAAIB6mpIYyFhTMOikwWLub3XfEm6LC8Z/wD4Wwd5YTQvUKfNjFeDZ5wOtB8beDoSC/ZHr/lT/U6MH1On7UTnKnUqniYkZrwyrbc9nYjsEnY77x8/CCgArRsPvVIOfUlX5Ea9Td1dVHLNcrEKAc9ylcVDG+w4A1MIQ7OA0cTmoyI+TDAAAAIBcXOEOkFAf62cjR6YoGfavchRAeRYdhkCrRVGWYLNANFtO/uaUb79+ZsmSAjqQ9tZtz+g6PAIZgddyUGU19gQhHdH0w+jMhJdNzJnwj+ujZd0tzTw6NwK3Vd7qD9pyE4+uCl1H9Os/7bn+BNlwk080W/biazvKU19MBhwO/f1Jlw== dennis@tilaa.nl",
        "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAw5k6B/Qri11fQut8NuZ81N2SiUBcbEi+RVaaGTJlwMpze1OdcdYNpD2BQv14D99rU8LETALnSBGyhn2ZEEmVWfKJErcToSLXADVEm4Bnfu4PYROLlky4EOuZgxJ0V+2h9EUmO8Udrl+b4GDj/XGIJJDswr8JvZPuBcDCtKQqI1F0n+mFXCwbXflQbAf0O+Vuu1A3nKP/OCOwRs8znt77FHqEwQb4qGzfdH3yWexSXvbiuG6eA7D0b5vFmz0i4tei1BdMBXdurgM/LK8bTzGGwoSwknq4M2SjM736VogvqXLQ6eHPe23dKICZ0wOeEszBpdjW/YeCBnMp8K0vn+yy2w== ruben@tilaa.nl",
        ],
    }
##### END tilaa #####


}
