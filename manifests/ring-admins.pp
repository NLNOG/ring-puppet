class users::virtual::ring_admins {
    
    @add_user { job:
        email    => "job@instituut.net",
        company  => "Job Snijders",
        uid      => 6001,
        groups   => ['ring-admins', 'ring-users']
    }

    @authorized_keys { "job":
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA4Ejc9Q/RwP5rEY51RdKY3BHpXWYSmePBoppyEjJR5t+/rD7Q2pwbsbrgIm960TpqnOf8ExTje5fCj9yosvqFPgt6K2Tp/9WDkCxMfPj7Fc2rVCFxoTaa2tM/xCgYQpcp+adH/GI0lCsC07FFUHI4+81YLJsxxBm/QExB2gqVZCMH5j+s8q2iWMEQMyXtOdU02/EilUcAcUhPAgoT+U7OG/6bsrBBbVHegQs6uNHfuJtQMh/mmDAeo+qGqBsAIKMtc5H9VGaXNg7jd6wvn8+3EYQ+B1B7NKxEZt/xtWKK4fSdfWiyQY8ZJlGKHrI60dyrW2yKuqcyX3W2hUSQQzp9rQ== job@instituut.net-nlnogring-2011",
            ],
        }

    @add_user { martin:
        email    => "martin@rodecker.nl",
        company  => "Pels",
        uid      => 6002,
        groups   => ['ring-admins', 'ring-users']
    }
    @authorized_keys { martin:
        sshkeys => [
            "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEArZl+3qDiBGF4v3fszgwFti5e4xVoY1fbXsqpAZmbZm1pbSlpJBsHc6ObrxepypoRik5JuiuAoLVFBziEq3m+GgMnUHYbdSBeqHJloa3bIdy8byVGowIYwV4zZyRCwEYuvto7xfUScCSgboBoHs+hU58kyYQxwWRZVCIhEMSIYlwHDCR3juHV1Z50XxgZEJgZeyKxGL4oeeLq9zbQDQxhglygia7nPXUVh+4Z2w6S7oS8prJH5saOg5ixtnBP3isQ5/WOwdAJrcu30s+4P6eWvcJQVtRNZDJyNCctkjCPaN2PVNRvhEu6oeWptwb/pek6LSwmKvUETUHz4W4FKHCKPw== martin@rodecker.nl",
            ],
    }
    
    @add_user { edwin:
        email    => "edwin@madtech.cx",
        company  => "NXS",
        uid      => 6003,
        groups   => ['ring-admins', 'ring-users']
    }
    @authorized_keys { "edwin":
        sshkeys => [
            "ssh-dss AAAAB3NzaC1kc3MAAACBALe0YYtE0HPDn49Pd7KGhhUjtDQffAS/K2iZv56nLmieT0DOgsMErs4EwZUnKJvnXuSRnhyseyiOTWNOM2ZkAeoAu0vkJiyTgytnPh6jK5lm2vqQN6mxtFWT4Wpp6395oCpvD++Zv4KQ+Qh+yNe1eZZoWlXWkV7VX4VDF6RMZFXFAAAAFQCM0P8mO97fGYF5/EuK1M0w4qKLiwAAAIEAj866L9Yf45bE3N2aapipnpC43xkiDPtyyo4AqqVwYYb87ZjVrI3OqqmjwHWr3nkLc3xQP9Mx1CFAYUZ/2wqz1K5I9HaJY+scJwWn7LVJh4+AE5Xw0VaC0yspm3WYKRTnaQewo6o72/JTYuCsoqoCRbY4AZRZ/VemjTls0lTaEEcAAACABva2tDPaEYUdX7sCKirsTy8BuQtecZDzQIww5L25fOHL9324jPXPJT7HhZCUrac2Plmi2AVx9ALCvvRPdHx532VNpRg5Bq0I7nAWvwaALIvyCmsaUnfAv/nyYzbYOsqihjQRjN4gE1Ej6HfTMlYJp53vGtikQvQ1+23EmUVrYjc= madeddie@kyra",
        ],
    } 
    
    @add_user { peter:
        email    => "peter+ring@7bits.nl",
        company  => "van Dijk",
        uid      => 6004,
        groups   => ['ring-admins', 'ring-users']
    }
    @authorized_keys { "peter":
        sshkeys => [
            "ssh-dss AAAAB3NzaC1kc3MAAAEBANPt8mExz5YFc/D/c3hGYdPJr6u+qUPDYqA7LQC9p7jLotLq+PmwJsjKJZQ6kd78DrQi9Cx4A9YwjCyZAxZN43NbzNImMhfr1/ZKv+Akx2cybolgmN4AKDf3rvBpQL+56zO1j4tYsc1h0b2Zpllq/Gk4/llqiiQeL2ldMEmc5n1uotGrbjsCBRIJJSGeHJsYcWeZcx8n/m4GHh1dYEmIujh+F6BdVLIDz/1F3GBdNmyU5jgNuEFW7TeYeEcgWbWzGWWkM8P5pUAKUr8Kg9BA4pLdgWpcU++Oz0cA8OUvS+XBZ7kfvwK4hX8RiB08O3Wa6XAC40x0rS9YkVHih1o9JdUAAAAVAO1K2cPtGNCt/0CnZvPhFpTDNAHVAAABAGAQ9t8yyHLLj0Q246OVgnVbroT+2xJscI4dnNAKm2r1fyhzBtjzuAgPmjOlCQ2o6+IiGSgD2pJDlTT7q1GlABz8B8+8qrVHezrLmCUoUwCTd1BBf2wNHOe3YPfQAbQKkPWqEcJDJ/Kmp7Hv5MzRd3ThJ8qmRZnAjq9J65UlsH1lN58JV7q/JMK897Sdl+8E4eoMKHBs9pF/uy4FQNlJA8UZt1NxMrqWQN6pfaDUCqujZ9Xxlp8D72qR7XooaFMXSwJYf5Vpd3mm5N4t/rkWknuH89S/khBupTuzYLUzlg8nXM0HBy9FGeYdFh74wTBxJJMHi/z6tSkCFK5FR4V4BVkAAAEAQhgU2f/ecIsnWda8PuJjeCw0Xy5l1j0yx8D3LY1DqSqdwCx6BZbmpNBhdVXzgVC9vQncfCunBFc1szReefs7oX7i/BMiRpEy0/PMX4hhojnXT1t96B/RVAVlvIlCvc5n8ibj3idJ4Fn7ADHUfJ/o52y8IKsttSYEDwi7NZtFPLzQeaS/6WC6gtFHuSgryJIzR7oF2aX+A2FERjv8B4YKzJLaiToAIS+1B2qndgfiLk5QiOPvCaIL/lnHCXLnDgJJ/g42kYREGbr7TBcK3yVhNcUUxptu61abKwATElBdHCiug23E0U/OAT1zkEWGskWEVCtlLhtTaRvzoCkRiEAkEw== peter@onion.home.dataloss.nl",
        ],
    }
}
