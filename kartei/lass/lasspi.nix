{ r6, w6, ... }:
{
  consul = false;
  cores = 1;
  nets = {
    retiolum = {
      ip4.addr = "10.243.1.89";
      ip6.addr = r6 "189";
      aliases = [
        "lasspi.r"
      ];
      tinc = {
        pubkey = ''
          -----BEGIN PUBLIC KEY-----
          MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA3zUXIiw8/9okrGaxlAR1
          JvoXNxAzLj5wwE2B0A+9ppev7Vl52HJarNoM6+0RN4aZDGMhDWg8J5ZQSdGUNm5F
          CIdxE1TwLXxzW5nd7BIb+MVsjtw0pxId7Gxq6Wgtx1QljUdsp8OVrJActqsmXYMl
          oYEWdENHRONYTCyhs+Kd18MERyxQCqOXOnD170iaFuCcHiIa2nSOtlk+aIPNIE/P
          Qsp7Q0RCRvqd5LszsI7bp3gZL9mgGquQEW+3ZxSaIYHGTdK/zI4PHYpEa7IvdJFS
          BJjJj+PbilnSxy7iL826O8ckxBqA0rNS0EynCKCI0DoVimCeklk20vLagDyXiDyC
          VW2774j1rF35eIowPTBVJNfquEptNDl9MLV3MC2P8gnCZp5x+7dEwpqsvecBQ7Z8
          +Ry9JZ/zlWi5qT86SrwKKqJqRhWHjZZSRzWdo4ypaNOy0cKHb2DcVfgn38Kf16xs
          QM11XLCRE8VLIVl5UFgrF6q/0f8JP1BG8RO90NDsLwIW/EwKiJ9OGFtayvxkmgHP
          zgmzgws8cn50762OPkp4OVzVexN77d9N8GU9QXAlsFyn2FJlO26DvFON4fHIf0bP
          6lqI1Up2jAy0eSl2txlxxKbKRlkIaebHulhxIxQ1djA+xPb/5cfasom9Qqwf6/Lc
          287nChBcbY+HlshTe0lZdrkCAwEAAQ==
          -----END PUBLIC KEY-----
        '';
        pubkey_ed25519 = "vSCHU+/BkoCo6lL5OmikALKBWgkRY8JRo4q8ZZRd5EG";
      };
    };
    wiregrill = {
      ip6.addr = w6 "189";
      aliases = [
        "lasspi.w"
      ];
      wireguard.pubkey = ''
        IIBAiG7jZEliQJJsNUQswLsB5FQFkAfq5IwyHAp71Vw=
      '';
    };
  };
  ssh.pubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEjYOaTQE9OvvIaWWjO+3/uSy7rvnhnJA48rWYeB2DfB";
}
