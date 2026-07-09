library MyIME;

{$mode delphi}

uses
  Windows, Messages;

var
  hInst: HINST;

function ImeInquire(lpIMEInfo: Pointer; szWndClass: PChar; var lpReserved: Pointer): BOOL; stdcall;
begin
  // 告訴系統這是一個 IME
  Result := True;
end;

function ImeConfigure(hWnd: HWND; lpIMEInfo: Pointer; szWndClass: PChar): BOOL; stdcall;
begin
  // 配置介面 (簡化範例，不做任何事)
  Result := True;
end;

function ImeProcessKey(hIMC: HIMC; uVKey: UINT; lParam: LPARAM; var fTransKey: BOOL): BOOL; stdcall;
begin
  // 處理鍵盤輸入 (這裡簡單回傳 False，不攔截)
  fTransKey := False;
  Result := False;
end;

function ImeToAsciiEx(uVKey: UINT; uScanCode: UINT; lpKeyState: PByte;
  lpTransKey: PWord; fuState: UINT; hIMC: HIMC): Integer; stdcall;
begin
  // 將鍵盤輸入轉換成文字 (簡化範例)
  lpTransKey^ := Word('A');  // 永遠輸出字母 A
  Result := 1;
end;

exports
  ImeInquire,
  ImeConfigure,
  ImeProcessKey,
  ImeToAsciiEx;

begin
  hInst := hInstance;
end.
