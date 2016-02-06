{ lib, ... }:

with lib;

{
  hosts = {
    pnp = {
      cores = 1;
      dc = "makefu"; #vm on 'omo'
      nets = {
        retiolum = {
          addrs4 = ["10.243.0.210"];
          addrs6 = ["42:f9f1:0000:0000:0000:0000:0000:0001"];
          aliases = [
            "pnp.retiolum"
            "cgit.pnp.retiolum"
          ];
          tinc.pubkey = ''
            -----BEGIN RSA PUBLIC KEY-----
            MIIBCgKCAQEAugkgEK4iy2C5+VZHwhjj/q3IOhhazE3TYHuipz37KxHWX8ZbjH+g
            Ewtm79dVysujAOX8ZqV8nD8JgDAvkIZDp8FCIK0/rgckhpTsy1HVlHxa7ECrOS8V
            pGz4xOxgcPFRbv5H2coHtbnfQc4GdA5fcNedQ3BP3T2Tn7n/dbbVs30bOP5V0EMR
            SqZwNmtqaDQxOvjpPg9EoHvAYTevrpbbIst9UzCyvmNli9R+SsiDrzEPgB7zOc4T
            TG12MT+XQr6JUu4jPpzdhb6H/36V6ADCIkBjzWh0iSfWGiFDQFinD+YSWbA1NOTr
            Qtd1I3Ov+He7uc2Z719mb0Og2kCGnCnPIwIDAQAB
            -----END RSA PUBLIC KEY-----
            '';
        };
      };
    };
    tsp = {
      cores = 1;
      dc = "makefu"; #x200
      nets = {
        retiolum = {
          addrs4 = ["10.243.0.212"];
          addrs6 = ["42:f9f1:0000:0000:0000:0000:0000:0002"];
          aliases = [
            "tsp.retiolum"
          ];
          tinc.pubkey = ''
            -----BEGIN RSA PUBLIC KEY-----
            MIICCgKCAgEAwW+RjRcp3uarkfXZ+FcCYY2GFcfI595GDpLRuiS/YQAB3JZEirHi
            HFhDJN80fZ9qHqtq9Af462xSx+cIb282TxAqCM1Z9buipOcYTYo0m8xIqkT10dB3
            mR87B+Ed1H6G3J6isdwEb9ZMegyGIIeyR53FJQYMZXjxdJbAmGMDKqjZSk1D5mo+
            n5Vx3lGzTuDy84VyphfO2ypG48RHCxHUAx4Yt3o84LKoiy/y5E66jaowCOjZ6SqG
            R0cymuhoBhMIk2xAXk0Qn7MZ1AOm9N7Wru7FXyoLc7B3+Gb0/8jXOJciysTG7+Gr
            Txza6fJvq2FaH8iBnfezSELmicIYhc8Ynlq4xElcHhQEmRTQavVe/LDhJ0i6xJSi
            aOu0njnK+9xK+MyDkB7n8dO1Iwnn7aG4n3CjVBB4BDO08lrovD3zdpDX0xhWgPRo
            ReOJ3heRO/HsVpzxKlqraKWoHuOXXcREfU9cj3F6CRd0ECOhqtFMEr6TnuSc8GaE
            KCKxY1oN45NbEFOCv2XKd2wEZFH37LFO6xxzSRr1DbVuKRYIPjtOiFKpwN1TIT8v
            XGzTT4TJpBGnq0jfhFwhVjfCjLuGj29MCkvg0nqObQ07qYrjdQI4W1GnGOuyXkvQ
            teyxjUXYbp0doTGxKvQaTWp+JapeEaJPN2MDOhrRFjPrzgo3aW9+97UCAwEAAQ==
            -----END RSA PUBLIC KEY-----
            '';
        };
      };
    };
    pornocauster = {
      cores = 2;
      dc = "makefu"; #x220
      nets = {
        retiolum = {
          addrs4 = ["10.243.0.91"];
          addrs6 = ["42:0b2c:d90e:e717:03dc:9ac1:7c30:a4db"];
          aliases = [
            "pornocauster.retiolum"
          ];
          tinc.pubkey = ''
            -----BEGIN RSA PUBLIC KEY-----
            MIICCgKCAgEAwW+RjRcp3uarkfXZ+FcCYY2GFcfI595GDpLRuiS/YQAB3JZEirHi
            HFhDJN80fZ9qHqtq9Af462xSx+cIb282TxAqCM1Z9buipOcYTYo0m8xIqkT10dB3
            mR87B+Ed1H6G3J6isdwEb9ZMegyGIIeyR53FJQYMZXjxdJbAmGMDKqjZSk1D5mo+
            n5Vx3lGzTuDy84VyphfO2ypG48RHCxHUAx4Yt3o84LKoiy/y5E66jaowCOjZ6SqG
            R0cymuhoBhMIk2xAXk0Qn7MZ1AOm9N7Wru7FXyoLc7B3+Gb0/8jXOJciysTG7+Gr
            Txza6fJvq2FaH8iBnfezSELmicIYhc8Ynlq4xElcHhQEmRTQavVe/LDhJ0i6xJSi
            aOu0njnK+9xK+MyDkB7n8dO1Iwnn7aG4n3CjVBB4BDO08lrovD3zdpDX0xhWgPRo
            ReOJ3heRO/HsVpzxKlqraKWoHuOXXcREfU9cj3F6CRd0ECOhqtFMEr6TnuSc8GaE
            KCKxY1oN45NbEFOCv2XKd2wEZFH37LFO6xxzSRr1DbVuKRYIPjtOiFKpwN1TIT8v
            XGzTT4TJpBGnq0jfhFwhVjfCjLuGj29MCkvg0nqObQ07qYrjdQI4W1GnGOuyXkvQ
            teyxjUXYbp0doTGxKvQaTWp+JapeEaJPN2MDOhrRFjPrzgo3aW9+97UCAwEAAQ==
            -----END RSA PUBLIC KEY-----
            '';
        };
      };
      ssh.privkey.path = <secrets/ssh_host_ed25519_key>;
      ssh.pubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHDM0E608d/6rGzXqGbNSuMb2RlCojCJSiiz6QcPOC2G root@pornocauster";

    };

    vbob = {
      cores = 2;
      dc = "makefu"; #vm local
      nets = {
        retiolum = {
          addrs4 = ["10.243.1.91"];
          addrs6 = ["42:0b2c:d90e:e717:03dd:9ac1:0000:a400"];
          aliases = [
            "vbob.retiolum"
          ];
          tinc.pubkey = ''
          -----BEGIN RSA PUBLIC KEY-----
          MIIBCgKCAQEA+0TIo0dS9LtSdrmH0ClPHLO7dHtV9Dj7gaBAsbyuwxAI5cQgYKwr
          4G6t7IcJW+Gu2bh+LKtPP91+zYXq4Qr1nAaKw4ajsify6kpxsCBzknmwi6ibIJMI
          AK114dr/XSk/Pc6hOSA8kqDP4c0MZXwitRBiNjrWbTrQh6GJ3CXhmpZ2lJkoAyNP
          hjdPerbTUrhQlNW8FanyQQzOgN5I7/PXsZShmb3iNKz1Ban5yWKFCVpn8fjWQs5o
          Un2AKowH4Y+/g8faGemL8uy/k5xrHSrn05L92TPDUpAXrcZXzo6ao1OBiwJJVl7s
          AVduOY18FU82GUw7edR0e/b2UC6hUONflwIDAQAB
          -----END RSA PUBLIC KEY-----

            '';
        };
      };
      ssh.privkey.path = <secrets/ssh_host_ed25519_key>;
      ssh.pubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICPLTMl+thSq77cjYa2XF7lz5fA7JMftrLo8Dy/OBXSg root@nixos";
    };
    flap = rec {
      cores = 1;
      dc = "cac"; #vps

      extraZones = {
        "krebsco.de" = ''
          mediengewitter    IN A      ${head nets.internet.addrs4}
          flap              IN A      ${head nets.internet.addrs4}
        '';
      };
      nets = {
        internet = {
          addrs4 = ["162.248.11.162"];
          aliases = [
            "flap.internet"
          ];
        };
        retiolum = {
          addrs4 = ["10.243.211.172"];
          addrs6 = ["42:472a:3d01:bbe4:4425:567e:592b:065d"];
          aliases = [
            "flap.retiolum"
          ];
          tinc.pubkey = ''
            -----BEGIN RSA PUBLIC KEY-----
            MIIBCgKCAQEAwtLD+sgTQGO+eh2Ipq2r54J1I0byvfkaTBeBwhtUmWst+lUQUoGy
            2fGReRYsb4ThDLeyK439jZuQBeXSc5r2g0IHBJCSWj3pVxc1HRTa8LASY7QuprQM
            8rSQa2XUtx/KpfM2eVX0yIvLuPTxBoOf/AwklIf+NmL7WCfN7sfZssoakD5a1LGn
            3EtZ2M/4GyoXJy34+B8v7LugeClnW3WDqUBZnNfUnsNWvoldMucxsl4fAhvEehrL
            hGgQMjHFOdKaLyatZOx6Pq4jAna+kiJoq3mVDsB4rcjLuz8XkAUZmVpe5fXAG4hr
            Ig8l/SI6ilu0zCWNSJ/v3wUzksm0P9AJkwIDAQAB
            -----END RSA PUBLIC KEY-----
            '';
        };
      };
    };
    pigstarter = rec {
      cores = 1;
      dc = "frontrange"; #vps

      extraZones = {
        "krebsco.de" = ''
          euer              IN MX 1   aspmx.l.google.com.
          pigstarter        IN A      ${head nets.internet.addrs4}
          gold              IN A      ${head nets.internet.addrs4}
          boot              IN A      ${head nets.internet.addrs4}
        '';
      };
      nets = {
        internet = {
          addrs4 = ["192.40.56.122"];
          addrs6 = ["2604:2880::841f:72c"];
          aliases = [
            "pigstarter.internet"
          ];
        };
        retiolum = {
          addrs4 = ["10.243.0.153"];
          addrs6 = ["42:9143:b4c0:f981:6030:7aa2:8bc5:4110"];
          aliases = [
            "pigstarter.retiolum"
          ];
          tinc.pubkey = ''
            -----BEGIN RSA PUBLIC KEY-----
            MIIBCgKCAQEA/efJuJRLUIZROe3QE8WYTD/zyNGRh9I2/yw+5It9HSNVDMIOV1FZ
            9PaspsC+YQSBUQRN8SJ95G4RM6TIn/+ei7LiUYsf1Ik+uEOpP5EPthXqvdJEeswv
            3QFwbpBeOMNdvmGvQLeR1uJKVyf39iep1wWGOSO1sLtUA+skUuN38QKc1BPASzFG
            4ATM6rd2Tkt8+9hCeoePJdLr3pXat9BBuQIxImgx7m5EP02SH1ndb2wttQeAi9cE
            DdJadpzOcEgFatzXP3SoKVV9loRHz5HhV4WtAqBIkDvgjj2j+NnXolAUY25Ix+kv
            sfqfIw5aNLoIX4kDhuDEVBIyoc7/ofSbkQIDAQAB
            -----END RSA PUBLIC KEY-----
            '';
        };
      };
    };
    wry = rec {
      cores = 1;
      dc = "makefu"; #dc = "cac";
      extraZones = {
        "krebsco.de" = ''
          euer           IN A  ${head nets.internet.addrs4}
          wiki.euer      IN A  ${head nets.internet.addrs4}
          wry            IN A  ${head nets.internet.addrs4}
          io             IN NS wry.krebsco.de.
          graphs         IN A  ${head nets.internet.addrs4}
          paste       60 IN A  ${head nets.internet.addrs4}
          tinc           IN A  ${head nets.internet.addrs4}
        '';
      };
      nets = rec {
        internet = {
          addrs4 = ["104.233.87.86"];
          aliases = [
            "wry.internet"
            "paste.internet"
          ];
        };
        retiolum = {
          via = internet;
          addrs4 = ["10.243.29.169"];
          addrs6 = ["42:6e1e:cc8a:7cef:827:f938:8c64:baad"];
          aliases = [
            "graphs.wry.retiolum"
            "graphs.retiolum"
            "paste.wry.retiolum"
            "paste.retiolum"
            "wry.retiolum"
            "wiki.makefu.retiolum"
            "wiki.wry.retiolum"
            "blog.makefu.retiolum"
            "blog.wry.retiolum"
          ];
          tinc.pubkey = ''
            -----BEGIN RSA PUBLIC KEY-----
            MIICCgKCAgEAvmCBVNKT/Su4v9nl/Nm3STPo5QxWPg7xEkzIs3Oh39BS8+r6/7UQ
            rebib7mczb+ebZd+Rg2yFoGrWO8cmM0VcLy5bYRMK7in8XroLEjWecNNM4TRfNR4
            e53+LhcPdkxo0A3/D+yiut+A2Mkqe+4VXDm/JhAiAYkZTn7jUtj00Atrc7CWW1gN
            sP3jIgv4+CGftdSYOB4dm699B7OD9XDLci2kOaFqFl4cjDYUok03G0AduUlRx10v
            CKbKOTIdm8C36A902/3ms+Hyzkruu+VagGIZuPSwqXHJPCu7Ju+jarKQstMmpQi0
            PubweWDL0o/Dfz2qT3DuL4xDecIvGE6kv3m41hHJYiK+2/azTSehyPFbsVbL7w0V
            LgKN3usnZNcpTsBWxRGT7nMFSnX2FLDu7d9OfCuaXYxHVFLZaNrpccOq8NF/7Hbk
            DDW81W7CvLyJDlp0WLnAawSOGTUTPoYv/2wAapJ89i8QGCueGvEc6o2EcnBVMFEW
            ejWTQzyD816f4RsplnrRqLVlIMbr9Q/n5TvlgjjhX7IMEfMy4+7qLGRQkNbFzgwK
            jxNG2fFSCjOEQitm0gAtx7QRIyvYr6c7/xiHz4AwxYzBmvQsL/OK57NO4+Krwgj5
            Vk8TQ2jGO7J4bB38zaxK+Lrtfl8i1AK1171JqFMhOc34JSJ7T4LWDMECAwEAAQ==
            -----END RSA PUBLIC KEY-----
          '';
        };
      };
      ssh.privkey.path = <secrets/ssh_host_ed25519_key>;
      ssh.pubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH4Tjx9qK6uWtxT1HCpeC0XvDZKO/kaPygyKatpAqU6I root@wry";
    };
    filepimp = rec {
      cores = 1;
      dc = "makefu"; #nas

      nets = {
        retiolum = {
          addrs4 = ["10.243.153.102"];
          addrs6 = ["42:4b0b:d990:55ba:8da8:630f:dc0e:aae0"];
          aliases = [
            "filepimp.retiolum"
          ];
          tinc.pubkey = ''
            -----BEGIN RSA PUBLIC KEY-----
            MIIBCgKCAQEAvgvzx3rT/3zLuCkzXk1ZkYBkG4lltxrLOLNivohw2XAzrYDIw/ZY
            BTDDcD424EkNOF6g/3tIRWqvVGZ1u12WQ9A/R+2F7i1SsaE4nTxdNlQ5rjy80gO3
            i1ZubMkTGwd1OYjJytYdcMTwM9V9/8QYFiiWqh77Xxu/FhY6PcQqwHxM7SMyZCJ7
            09gtZuR16ngKnKfo2tw6C3hHQtWCfORVbWQq5cmGzCb4sdIKow5BxUC855MulNsS
            u5l+G8wX+UbDI85VSDAtOP4QaSFzLL+U0aaDAmq0NO1QiODJoCo0iPhULZQTFZUa
            OMDYHHfqzluEI7n8ENI4WwchDXH+MstsgwIDAQAB
            -----END RSA PUBLIC KEY-----
            '';
        };
      };
    };

    omo = rec {
      cores = 2;
      dc = "makefu"; #AMD E350

      nets = {
        retiolum = {
          addrs4 = ["10.243.0.89"];
          addrs6 = ["42:f9f0::10"];
          aliases = [
            "omo.retiolum"
          ];
          tinc.pubkey = ''
              -----BEGIN RSA PUBLIC KEY-----
              MIIBCgKCAQEAuHQEeowvxRkoHJUw6cUp431pnoIy4MVv7kTLgWEK46nzgZtld9LM
              ZdNMJB9CuOVVMHEaiY6Q5YchUmapGxwEObc0y+8zQxTPw3I4q0GkSJqKLPrsTpkn
              sgEkHPfs2GVdtIBXDn9I8i5JsY2+U8QF8fbIQSOO08/Vpa3nknDAMege9yEa3NFm
              s/+x+2pS+xV6uzf/H21XNv0oufInXwZH1NCNXAy5I2V6pz7BmAHilVOGCT7g2zn6
              GasmofiYEnro4V5s8gDlQkb7bCZEIA9EgX/HP6fZJQezSUHcDCQFI0vg26xywbr6
              5+9tTn8fN2mWS5+Pdmx3haX1qFcBP5HglwIDAQAB
              -----END RSA PUBLIC KEY-----
            '';
        };
      };
      ssh.privkey.path = <secrets/ssh_host_ed25519_key>;
      ssh.pubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIujMZ3ZFxKpWeB/cjfKfYRr77+VRZk0Eik+92t03NoA root@servarch";
    };
    wbob = rec {
      cores = 1;
      dc = "none";
      nets = {
        retiolm = {
          addrs4 = ["10.243.214.15/32"];
          addrs6 = ["42:5a02:2c30:c1b1:3f2e:7c19:2496:a732/128"];
          aliases = [
              "wbob.retiolum"
          ];
          tinc.pubkey = ''
-----BEGIN RSA PUBLIC KEY-----
MIIBCgKCAQEAqLTJx91OdR0FlJAc2JGh+AJde95oMzzh8o36JBFpsaN7styNfD3e
QGM/bDXFjk4ieIe5At0Z63P2KWxRp3cz8LWKJsn5cGsX2074YWMAGmKX+ZZJNlal
cJ994xX+8MJ6L2tVKpY7Ace7gqDN+l650PrEzV2SLisIqOdxoBlbAupdwHieUBt8
khm4NLNUCxPYUx2RtHn4iGdgSgUD/SnyHEFdyDA17lWAGfEi4yFFjFMYQce/TFrs
rQV9t5hGaofu483Epo6mEfcBcsR4GIHI4a4WKYANsIyvFvzyGFEHOMusG6nRRqE9
TNs2RYfwDy/r6H/hDeB/BSngPouedEVcPwIDAQAB
-----END RSA PUBLIC KEY-----
'';
        };
      };
    };

    gum = rec {
      cores = 1;
      dc = "online.net"; #root-server

      extraZones = {
        "krebsco.de" = ''
          share.euer        IN A      ${head nets.internet.addrs4}
          mattermost.euer   IN A      ${head nets.internet.addrs4}
          git.euer          IN A      ${head nets.internet.addrs4}
          gum               IN A      ${head nets.internet.addrs4}
          cgit.euer         IN A      ${head nets.internet.addrs4}
        '';
      };
      nets = {
        internet = {
          addrs4 = ["195.154.108.70"];
          aliases = [
            "gum.internet"
          ];
        };
        retiolum = {
          addrs4 = ["10.243.0.211"];
          addrs6 = ["42:f9f0:0000:0000:0000:0000:0000:70d2"];
          aliases = [
            "gum.retiolum"
            "cgit.gum.retiolum"
          ];
          tinc.pubkey = ''
            -----BEGIN RSA PUBLIC KEY-----
            MIIBCgKCAQEAvgvzx3rT/3zLuCkzXk1ZkYBkG4lltxrLOLNivohw2XAzrYDIw/ZY
            BTDDcD424EkNOF6g/3tIRWqvVGZ1u12WQ9A/R+2F7i1SsaE4nTxdNlQ5rjy80gO3
            i1ZubMkTGwd1OYjJytYdcMTwM9V9/8QYFiiWqh77Xxu/FhY6PcQqwHxM7SMyZCJ7
            09gtZuR16ngKnKfo2tw6C3hHQtWCfORVbWQq5cmGzCb4sdIKow5BxUC855MulNsS
            u5l+G8wX+UbDI85VSDAtOP4QaSFzLL+U0aaDAmq0NO1QiODJoCo0iPhULZQTFZUa
            OMDYHHfqzluEI7n8ENI4WwchDXH+MstsgwIDAQAB
            -----END RSA PUBLIC KEY-----
            '';
        };
      };
      ssh.privkey.path = <secrets/ssh_host_ed25519_key>;
      ssh.pubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIcxWFEPzke/Sdd9qNX6rSJgXal8NmINYajpFCxXfYdj root@gum";
    };
  };
  users = rec {
    makefu = {
      mail = "makefu@pornocauster.retiolum";
      pubkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCl3RTOHd5DLiVeUbUr/GSiKoRWknXQnbkIf+uNiFO+XxiqZVojPlumQUVhasY8UzDzj9tSDruUKXpjut50FhIO5UFAgsBeMJyoZbgY/+R+QKU00Q19+IiUtxeFol/9dCO+F4o937MC0OpAC10LbOXN/9SYIXueYk3pJxIycXwUqhYmyEqtDdVh9Rx32LBVqlBoXRHpNGPLiswV2qNe0b5p919IGcslzf1XoUzfE3a3yjk/XbWh/59xnl4V7Oe7+iQheFxOT6rFA30WYwEygs5As//ZYtxvnn0gA02gOnXJsNjOW9irlxOUeP7IOU6Ye3WRKFRR0+7PS+w8IJLag2xb makefu@pornocauster";
    };
    makefu-omo = {
      inherit (makefu) mail;
      pubkey = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAtDhAxjiCH0SmTGNDqmlKPug9qTf+IFOVjdXfk01lAV2KMVW00CgNo2d5kl5+6pM99K7zZO7Uo7pmSFLSCAg8J6cMRI3v5OxFsnQfcJ9TeGLZt/ua7F8YsyIIr5wtqKtFbujqve31q9xJMypEpiX4np3nLiHfYwcWu7AFAUY8UHcCNl4JXm6hsmPe+9f6Mg2jICOdkfMMn0LtW+iq1KZpw1Nka2YUSiE2YuUtV+V+YaVMzdcjknkVkZNqcVk6tbJ1ZyZKM+bFEnE4VkHJYDABZfELpcgBAszfWrVG0QpEFjVCUq5atpIVHJcWWDx072r0zgdTPcBuzsHHC5PRfVBLEw== makefu@servarch";
    };
    makefu-tsp = {
      inherit (makefu) mail;
      pubkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1srWa67fcsw3r64eqgIuHbMbrj6Ywd9AwzCM+2dfXqYQZblchzH4Q4oydjdFOnV9LaA1LfNcWEjV/gVQKA2/xLSyXSDwzTxQDyOAZaqseKVg1F0a7wAF20+LiegQj6KXE29wcTW1RjcPncmagTBv5/vYbo1eDLKZjwGpEnG0+s+TRftrAhrgtbsuwR1GWWYACxk1CbxbcV+nIZ1RF9E1Fngbl4C4WjXDvsASi8s24utCd/XxgKwKcSFv7EWNfXlNzlETdTqyNVdhA7anc3N7d/TGrQuzCdtrvBFq4WbD3IRhSk79PXaB3L6xJ7LS8DyOSzfPyiJPK65Zw5s4BC07Z makefu@tsp";
    };
    makefu-vbob = {
      inherit (makefu) mail;
      pubkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCiKvLKaRQPL/Y/4EWx3rNhrY5YGKK4AeqDOFTLgJ7djwJnMo7FP+OIH/4pFxS6Ri2TZwS9QsR3hsycA4n8Z15jXAOXuK52kP65Ei3lLyz9mF+/s1mJsV0Ui/UKF3jE7PEAVky7zXuyYirJpMK8LhXydpFvH95aGrL1Dk30R9/vNkE9rc1XylBfNpT0X0GXmldI+r5OPOtiKLA5BHJdlV8qDYhQsU2fH8S0tmAHF/ir2bh7+PtLE2hmRT+b8I7y1ZagkJsC0sn9GT1AS8ys5s65V2xTTIfQO1zQ4sUH0LczuRuY8MLaO33GAzhyoSQdbdRAmwZQpY/JRJ3C/UROgHYt makefu@vbob";
    };
    exco = {
      mail = "dickbutt@excogitation.de";
      pubkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC7HCK+TzelJp7atCbvCbvZZnXFr3cE35ioactgpIJL7BOyQM6lJ/7y24WbbrstClTuV7n0rWolDgfjx/8kVQExP3HXEAgCwV6tIcX/Ep84EXSok7QguN0ozZMCwX9CYXOEyLmqpe2KAx3ggXDyyDUr2mWs04J95CFjiR/YgOhIfM4+gVBxGtLSTyegyR3Fk7O0KFwYDjBRLi7a5TIub3UYuOvw3Dxo7bUkdhtf38Kff8LEK8PKtIku/AyDlwZ0mZT4Z7gnihSG2ezR5mLD6QXVuGhG6gW/gsqfPVRF4aZbrtJWZCp2G21wBRafpEZJ8KFHtR18JNcvsuWA1HJmFOj2K0mAY5hBvzCbXGhSzBtcGxKOmTBDTRlZ7FIFgukP/ckSgDduydFUpsv07ZRj+qY07zKp3Nhh3RuN7ZcveCo2WpaAzTuWCMPB0BMhEQvsO8I/p5YtTaw2T1poOPorBbURQwEgNrZ92kB1lL5t1t1ZB4oNeDJX5fddKLkgnLqQZWOZBTKtoq0EAVXojTDLZaA+5z20h8DU7sicDQ/VG4LWtqm9fh8iDpvt/3IHUn/HJEEnlfE1Gd+F2Q+R80yu4e1PClmuzfWjCtkPc4aY7oDxfcJqyeuRW6husAufPqNs31W6X9qXwoaBh9vRQ1erZUo46iicxbzujXIy/Hwg67X8dw== dickbutt@excogitation.de";
    };
  };
}
