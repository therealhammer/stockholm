{ r6, w6, ... }:
{
  cores = 1;
  nets = {
    retiolum = {
      ip4.addr = "10.243.11.1";
      ip6.addr = r6 "111";
      aliases = [
        "styx.r"
      ];
      tinc = {
        pubkey = ''
          -----BEGIN PUBLIC KEY-----
          MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAuMJFklzpbxoDGD8LQ3tn
          ETYrLu/TJjq5iSQx/JbbonJriMS3X/0+m8JREzeol67svQDuZEXTEg5EfEldxrrU
          aZpNmTSmFbj2NLLCIfNBL/oLOvg9ElzhN+f+4jvakfEKi7Y7LekV25VVGrHbOEVE
          3G6XWfHx5qO5Vd6kqNWQKD3LG38aZ/Lx9XYDMbujYxPGCtOsabtAz8BKo/RgOZzi
          6A/54RFhdecJm0VoQk3iKpp2YqyCN6dLfJVLil4cREs4sW6nDyF4Y4l3dtZdfskq
          m/MoZt6fwOjNIKuI9DGdU4/X1hQelnemstzxY5x1XwG52cz+ww0h7pMF2aggsHqn
          Vmaq3b0fXrbn066Ybkbhz3UEIU9zKQGYaANGCnXxbvkd5lWbIN60GEXGE3zYJSAt
          EH3FLDTGa27fTNgAnbdnSV40KWKN4FM0iY/xrt3aOXfneTP9S2fqzTVEL9vd04C/
          7RWvRjvZ7mlAi+kVKSHkOibFVjeo+Z4Pvw5YxCAavrjXCiWj8zP8o3MNWcq/bMao
          Uk9zBMXymm8zX43w5LNnhf59oitBjiY/mzZ3NDI9N3szMvJsaUEnhO4Kq1CWtMs2
          6/TpEyRSmen1UmNwgKKFx3rELuctwMmNbOLL8cGLotEBhIk7vnZKD7NvLVX7xtOF
          wzhy2N6a3ypB4XqM7dBzzAUCAwEAAQ==
          -----END PUBLIC KEY-----
        '';
        pubkey_ed25519 = "yVT5nQstw+o5P0ZoBK81G7sL6nQEBwg42wyBn6ogZgK";
        weight = null;
      };
    };
    wiregrill = {
      ip6.addr = w6 "111";
      aliases = [
        "styx.w"
      ];
      wireguard.pubkey = ''
        0BZfd8f0pZMRfyoHrdYZY0cR5zfFvJcS8gQLn6xGuFs=
      '';
    };
  };
  ssh.pubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII3OpzRB3382d7c2apdHC+U/R0ZlaWxXZa3GFAj54ZhU ";
  syncthing.id = "JAVJ6ON-WLCWOA3-YB7EHPX-VGIN4XF-635NIVZ-WZ4HN4M-QRMLT4N-5PL5MQN";
}
