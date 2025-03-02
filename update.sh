#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SYO�|  �_�Tp}���~�ގ����  D   � P P-����,�(���4d�zd�#I��z�3(���M�<F�bjz�e�h'�=SiI�4���h �   b�ЍMzi� F�4  4  �h4�i�C��M�b A$�d&i��FOH6���  @h �� f�߮6�^�4ܧ�T�|�бVt�V�^�bwV�Q�a
��,	�`�LDy[��7��k�Px�U���,G�UD0���N!)��A4��s7Y,Λ�\��p���HR����G4�-p�M��: ��V�o���!B|��P��Z���zmV�-G��]�j�H%�A7�#xi�Q�4qL�nB�N���'�r\��"@��/K�g?lt�o�m�%w�x��m	Y�R|����M`s�G�'���CQ�ະ�D3D�䖇�@�#$�Ba*/!��,��)��6Ah�^���j"�<� �K���Ӽ��L�3��0&C/[O0r��P�����Ϣ�"��`�1��.7J�Lt+�H��Bņ4knxS$;�C0���윾A� �1!/4��#�F<l)(�op0L��?�7�Zdm`S]AHxӶ�h���<A�����
UU\���}Q�k��TQ�)Y�d��T+6!�8�~D��!�Y"`�6e~4��"$�<�|Οʬ���-\����}j�B��B��pS�4�N`�X�hD*� R-��CJ{����;U9��{Dp����y��,�_��#IAA��Y�(�<���B���X	FTT��ώ���XK���&1X�
���feOQ$�`c(�D�*J�!��E��B�t_B|F٥	ST %�ć���S���D(a���YHU��`W.�[�__T��V1��d���]�54�Y7��b@��xH��qj�OT���@��.�p� ���