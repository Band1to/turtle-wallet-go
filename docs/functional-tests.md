Functional tests to be done on windows, mac and linux before merging to master and deploying a release.

\# | Action | Result
---|---|---
1 | Open wallet | busy indicator for a few seconds then wallet opens and display balance, etc..., sync is ok
2 | Click on button to backup keys | backup keys are displayed
3 | Click on button to copy keys to clipboard | Keys are copied to clipboard
4 | Create wallet | busy indicator for a few seconds, then the wallet should be created in app folder and wallet open and display backup keys
5 | Create wallet with name already exist in folder | error
6 | Open wallet -> Close wallet | Wallet closes
7 | Import wallet from keys | wallet created in app folder. Check backup keys, address, balance.
8 | Open existing wallet -> close Nest -> reopen Nest | path to previously opened wallet should appear. Test opening it again without changing path. 
9 | Button copy address | Pop up "Copied!" and address should be copied to clipboard.
10 | Button copy tr. id | Pop up "Copied!" and tr. id should be copied to clipboard.
11 | Button explore transaction | Trtl explorer opens in default browser with the right transacton.
12 | Receive trtl | Balance updates automatically and new confirmed transaction added to list previous transactions
13 | Send TRTL, address diff. than 99 chars | error: address invalid
14 | Send TRTL, address not start by TRTL | error: address invalid
15 | Send TRTL, amount is 0 or less | error: amount should be greater than 0
16 | Send TRTL, amount is not a number | error: amount invalid
17 | Send TRTL, amount + fee is more than available balance | error: available balance is insufficient
18 | Send TRTL, small valid amount | popup TRTL sent. amount is received on the other end
19 | Send TRTL, more than 5M | error: split in smaller portions of 5M max
20 | Send TRTL, invalid payment id | error: wrong payment id format
21 | Send TRTL, valid payment id | popup TRTL sent. amount is received on the other end with correct payment id
22 | select the option local blockchain, restart | local blockchain should still be selected
23 | Test using the wallet with local blockchain selected | 
24 | Test using the wallet with remote node selected |
25 | Reduce window height and test scrolling |
26 | Check wallet filename is displayed above address |
27 | Click Settings | Settings screen appears
28 | Close Settings | Settings screen disappears
29 | Settings: Enable display in USD -> Close Nest -> Reopen | Setting is still enabled
30 | Display in USD enabled -> Open a wallet| Balance is displayed in USD (under TRTL balance)
31 | Display in USD enabled -> type an amount to be transfered| Value is displayed in USD
32 | Settings: change remote node address and port -> click save -> close and reopen Nest | new address in remote node radio button and in settings
33 | Settings: click remote node reset to default -> close and reopen Nest | default address in remote node radio button and in settings