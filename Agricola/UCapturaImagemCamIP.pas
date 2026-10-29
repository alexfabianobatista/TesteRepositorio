unit UCapturaImagemCamIP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtDlgs, FFLog, FFBaseComponent, FFBasePlay, FFPlay, ComCtrls,
  StdCtrls, ExtCtrls, Jpeg,SyncObjs;

type
  TFCapturaImagemCamIP = class(TForm)
    Panel1: TPanel;
    btnOpen: TButton;
    btnURL: TButton;
    btnPause: TButton;
    btnStep: TButton;
    btnStop: TButton;
    btnCapture: TButton;
    FFPlayer: TFFPlayer;
    FFLogger: TFFLogger;
    OpenDialog1: TOpenDialog;
    SavePictureDialog1: TSavePictureDialog;
    lblRenderOn: TLabel;
    lblVideoStream: TLabel;
    lblSubtitleStream: TLabel;
    chkWaterMark: TCheckBox;
    cboScreens: TComboBox;
    cboVideo: TComboBox;
    cboSubtitle: TComboBox;
    chkVideoHook: TCheckBox;
    trbHue: TTrackBar;
    btnHue: TButton;
    chkMsgLog: TCheckBox;
    Panel2: TPanel;
    btnOpen2: TButton;
    btnURL2: TButton;
    btnPause3: TButton;
    btnStep2: TButton;
    btnStop2: TButton;
    btnCapture2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    cboScreens2: TComboBox;
    cboVideo2: TComboBox;
    FFPlayer2: TFFPlayer;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure btnPauseClick(Sender: TObject);
    procedure btnStepClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnCaptureClick(Sender: TObject);
    procedure btnURLClick(Sender: TObject);
    procedure FFPlayerFileOpen(Sender: TObject; const ADuration: Int64;
      AFrameWidth, AFrameHeight: Integer; var AScreenWidth,
      AScreenHeight: Integer);
    procedure FFPlayerFrameHook(Sender: TObject; APicture: PAVPicture;
      APixFmt: TAVPixelFormat; AWidth, AHeight: Integer;
      const APTS: Int64);
    procedure FFPlayerVideoHook(Sender: TObject; ABitmap: TBitmap;
      const APTS: Int64; var AUpdate: Boolean);
    procedure cboScreensChange(Sender: TObject);
    procedure cboScreens2Change(Sender: TObject);
    procedure btnURL2Click(Sender: TObject);
    procedure btnOpen2Click(Sender: TObject);
    procedure FFPlayer2FileOpen(Sender: TObject; const ADuration: Int64;
      AFrameWidth, AFrameHeight: Integer; var AScreenWidth,
      AScreenHeight: Integer);
    procedure FFPlayer2FrameHook(Sender: TObject; APicture: PAVPicture;
      APixFmt: TAVPixelFormat; AWidth, AHeight: Integer;
      const APTS: Int64);
    procedure FFPlayer2VideoHook(Sender: TObject; ABitmap: TBitmap;
      const APTS: Int64; var AUpdate: Boolean);
    procedure btnPause3Click(Sender: TObject);
    procedure btnStep2Click(Sender: TObject);
    procedure btnStop2Click(Sender: TObject);
    procedure btnCapture2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FDuration: Int64;
    FIsBytes: Boolean;
    FTrackChanging: Boolean;
    FScreenControl: TWinControl;
    FScreenControl2: TWinControl;
    FLock: TCriticalSection;
    FRect: TRect;
    URL: string;
    URL2: string;
    function GetScreenHandle: HWND;
    function GetScreenHandle2: HWND;

  public
    { Public declarations }
    FBrightness: Single;
    FSaturation: Single;
    FHue: Single;
  end;

var
  FCapturaImagemCamIP: TFCapturaImagemCamIP;

implementation
{$R *.dfm}

uses
  UParamSistema_cl,
  FrameEffects, // adjust eq and hue
  libavfilter,  // for PPAVFilter
  AVFilterStubs, // for avfilter_get_by_name()
//  MsgLogFrm,
  FFUtils, libavformat,
  ShellAPI,
  MyUtils;

const
  CLibAVPath = 'LibAV';
  CWaterMark = 'watermark.png';

//  SAppTitle = ' %s';
//  SCaption = 'Demo of FFPlayer %s - /cemapa';
  SWebSiteC = 'http://www.CCAVC.com';
  SWebSiteE = 'www.cemapa.com.br';


  CDialogOptions = [ofHideReadOnly, ofFileMustExist, ofEnableSizing];
  CPictureFiles = '*.BMP;*.GIF;*.JPEG;*.JPG;*.PNG;';
  CAudioFiles = '*.AAC;*.AC3;*.APE;*.DTS;*.FLAC;*.M4A;*.MKA;*.MP2;*.MP3;' +
      '*.MPA;*.MPC;*.OFR;*.OGG;*.RA;*.TTA;*.WAV;*.WMA;';
  CVideoFiles = '*.3GP;*.ASF;*.AVI;*.AVM;*.AVS;*.DAT;*.FLV;*.MKV;*.MOV;' +
      '*.MP4;*.MPEG;*.MPG;*.NSV;*.OGM;*.RM;*.RMVB;*.TP;*.TS;*.VOB;*.WMV;';
  CDialogFilter =
      'Video/Audio/Picture Files|' + CVideoFiles + CAudioFiles + CPictureFiles +
      '|Video Files|' + CVideoFiles +
      '|Audio Files|' + CAudioFiles +
      '|Picture Files|' + CPictureFiles +
      '|All Files|*.*';

//  SHookTimeStamp = 'FFPlayer - Time Stamp: %d'; //junior

var
  SWebSite: string = SWebSiteE;

{$IF CompilerVersion <= 18.5} // Delphi 2007 and olders
type
  // Delphi 6 undefined
  // Delphi 7 to Delphi 2007 defined incorrectly, SizeOf(NativeInt) = 8, thus re-define it
  NativeInt = Integer;
  NativeUInt = Cardinal;
{$IFEND}

{$IF Defined(VER140) OR Defined(VER150)} // Delphi 6, 7
type
  TCriticalSectionEx = class(TCriticalSection)
  public
    function TryEnter: Boolean;
  end;
function TCriticalSectionEx.TryEnter: Boolean;
begin
  Result := TryEnterCriticalSection(FSection);
end;
{$IFEND}
// maximize or normal form
{$IF Defined(VER140) OR Defined(VER150) OR Defined(VER170)} // Delphi 6, 7, 2005

procedure GetBorderStyles(AForm: TCustomForm; ABorderStyle: TFormBorderStyle;
  var Style, ExStyle, ClassStyle: Cardinal);
begin
  // Clear existing border styles
  Style := Style and not (WS_POPUP or WS_CAPTION or WS_BORDER or WS_THICKFRAME or WS_DLGFRAME or DS_MODALFRAME);
  ExStyle := ExStyle and not (WS_EX_DLGMODALFRAME or WS_EX_WINDOWEDGE or WS_EX_TOOLWINDOW);
  ClassStyle := ClassStyle and not (CS_SAVEBITS or CS_BYTEALIGNWINDOW);

  // Set new border styles
  case ABorderStyle of
    bsNone:
      if (AForm.Parent = nil) and (AForm.ParentWindow = 0) then
        Style := Style or WS_POPUP;
    bsSingle, bsToolWindow:
      Style := Style or (WS_CAPTION or WS_BORDER);
    bsSizeable, bsSizeToolWin:
      Style := Style or (WS_CAPTION or WS_THICKFRAME);
    bsDialog:
      begin
        Style := Style or WS_POPUP or WS_CAPTION;
        ExStyle := ExStyle or WS_EX_DLGMODALFRAME or WS_EX_WINDOWEDGE;
        if not NewStyleControls then
          Style := Style or WS_DLGFRAME or DS_MODALFRAME;
        ClassStyle := ClassStyle or CS_DBLCLKS or CS_SAVEBITS or CS_BYTEALIGNWINDOW;
      end;
  end;
  if ABorderStyle in [bsToolWindow, bsSizeToolWin] then
    ExStyle := ExStyle or WS_EX_TOOLWINDOW;
end;
procedure GetBorderIconStyles(AForm: TCustomForm; ABorderStyle: TFormBorderStyle;
  var Style, ExStyle: Cardinal);
var
  LIcons: TBorderIcons;
begin
  // Clear existing border icon styles
  Style := Style and not (WS_MINIMIZEBOX or WS_MAXIMIZEBOX or WS_SYSMENU);
  ExStyle := ExStyle and not WS_EX_CONTEXTHELP;

  // Adjust icons based on border style
  LIcons := TForm(AForm).BorderIcons;
  case ABorderStyle of
    bsNone: LIcons := [];
    bsDialog: LIcons := LIcons * [biSystemMenu, biHelp];
    bsToolWindow,
    bsSizeToolWin: LIcons := LIcons * [biSystemMenu];
  end;

  // Set border icon styles
  if ABorderStyle in [bsSingle, bsSizeable, bsNone] then
  begin
    if biMinimize in LIcons then Style := Style or WS_MINIMIZEBOX;
    if biMaximize in LIcons then Style := Style or WS_MAXIMIZEBOX;
  end;
  if biSystemMenu in LIcons then Style := Style or WS_SYSMENU;
  if biHelp in LIcons then ExStyle := ExStyle or WS_EX_CONTEXTHELP;
end;
procedure SetBorderStyle(AForm: TCustomForm; ABorderStyle: TFormBorderStyle);
var
  LStyle, LExStyle, LClassStyle: Cardinal;
  LIcon: HICON;
begin
  LStyle := GetWindowLong(AForm.Handle, GWL_STYLE);
  LExStyle := GetWindowLong(AForm.Handle, GWL_EXSTYLE);
  LClassStyle := GetClassLong(AForm.Handle, GCL_STYLE);

  GetBorderStyles(AForm, ABorderStyle, LStyle, LExStyle, LClassStyle);
  GetBorderIconStyles(AForm, ABorderStyle, LStyle, LExStyle);

  SetWindowLong(AForm.Handle, GWL_STYLE, LStyle);
  SetWindowLong(AForm.Handle, GWL_EXSTYLE, LExStyle);
  SetClassLong(AForm.Handle, GCL_STYLE, LClassStyle);

  // Update icon on window frame
  if NewStyleControls then
    if ABorderStyle <> bsDialog then
    begin
      LIcon := TForm(AForm).Icon.Handle;
      if LIcon = 0 then LIcon := Application.Icon.Handle;
      if LIcon = 0 then LIcon := LoadIcon(0, IDI_APPLICATION);
      SendMessage(AForm.Handle, WM_SETICON, ICON_BIG, LIcon);
    end
    else
      SendMessage(AForm.Handle, WM_SETICON, ICON_BIG, 0);

  // Reset system menu based on new border style
  GetSystemMenu(AForm.Handle, True);
  AForm.Perform(WM_NCCREATE, 0, 0);

  SetWindowPos(AForm.Handle, 0, 0, 0, 0, 0, SWP_FRAMECHANGED or SWP_NOMOVE or
    SWP_NOZORDER or SWP_NOSIZE or SWP_NOACTIVATE);
  AForm.Invalidate;
end;
procedure SetStayOnTop(AHandle: HWND; AStayOnTop: Boolean);
const
  HWND_STYLE: array[Boolean] of HWND = (HWND_NOTOPMOST, HWND_TOPMOST);
begin
  SetWindowPos(AHandle, HWND_STYLE[AStayOnTop], 0, 0, 0, 0,
    SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_NOOWNERZORDER);
end;
{$IFEND}
procedure MaxOrNormalForm(AForm: TForm; AMax: Boolean);
const
{$J+}
  LastBounds: TRect = ();
{$J-}
begin
  if AMax then
  begin
    LastBounds := AForm.BoundsRect;
{$IF Defined(VER140) OR Defined(VER150) OR Defined(VER170)} // Delphi 6, 7, 2005
    SetStayOnTop(AForm.Handle, True);
    SetBorderStyle(AForm, bsNone);
{$ELSE}
    AForm.FormStyle := fsStayOnTop;
    AForm.BorderStyle := bsNone;
{$IFEND}
    AForm.BoundsRect := Screen.MonitorFromWindow(AForm.Handle).BoundsRect;
  end
  else
  begin
{$IF Defined(VER140) OR Defined(VER150) OR Defined(VER170)} // Delphi 6, 7, 2005
    SetStayOnTop(AForm.Handle, False);
    SetBorderStyle(AForm, bsSizeable);
{$ELSE}
    AForm.FormStyle := fsNormal;
    AForm.BorderStyle := bsSizeable;
{$IFEND}
    AForm.BoundsRect := LastBounds;
  end;
end;

// return desktop handle
function enumUserWindowsCB(ahwnd: HWND; lParam: LPARAM): BOOL; stdcall;
var
  wflags: Longint;
  sndWnd: HWND;
  targetWnd: HWND;
  resultHwnd: PLongWord;
begin
  wflags := GetWindowLong(ahwnd, GWL_STYLE);
  if (wflags and WS_VISIBLE) <> 0 then
  begin
    sndWnd := FindWindowEx(ahwnd, 0, 'SHELLDLL_DefView', nil);
    if sndWnd <> 0 then
    begin
      targetWnd := FindWindowEx(sndWnd, 0, 'SysListView32', 'FolderView');
      if targetWnd <> 0 then
      begin
        resultHwnd := PLongWord(lParam);
        resultHwnd^ := targetWnd;
        Result := False;
        Exit;
      end;
    end;
  end;
  Result := True;
end;
function GetDesktopHandle: HWND;
begin
  // works under Windows XP or classic theme under Windows Vista/7
  Result := FindWindow('ProgMan', nil);    {Do not Localize}
  if Result <> 0 then
  begin
    Result := GetWindow(Result, GW_CHILD);
    if Result <> 0 then
    begin
      Result := GetWindow(Result, GW_CHILD);
      if Result <> 0 then
        Exit;
    end;
  end;
  // works under Vista/7
  EnumWindows(@enumUserWindowsCB, NativeInt(@Result));
end;

// whether mouse is down
function IsMouseDown: Boolean;
begin
  if GetSystemMetrics(SM_SWAPBUTTON) <> 0 then
    Result := GetAsyncKeyState(VK_RBUTTON) and $8000 <> 0
  else
    Result := GetAsyncKeyState(VK_LBUTTON) and $8000 <> 0;
end;

// find wincontrol of form by name
function FindWinControl(AForm: TForm; const AName: string): TWinControl;
var
  I: Integer;
begin
  for I := 0 to AForm.ControlCount - 1 do
  begin
    if (AForm.Controls[I] is TWinControl) and (AForm.Controls[I].Name = AName) then
    begin
      Result := TWinControl(AForm.Controls[I]);
      Exit;
    end;
  end;
  Result := nil;
end;

function FindWinControl2(AForm: TForm; const AName: string): TWinControl;
var
  I: Integer;
begin
  for I := 0 to AForm.ControlCount - 1 do
  begin
    if (AForm.Controls[I] is TWinControl) and (AForm.Controls[I].Name = AName) then
    begin
      Result := TWinControl(AForm.Controls[I]);
      Exit;
    end;
  end;
  Result := nil;
end;

type
  // audio level thread
  TLevelThread = class(TThread)
  private
    FEvent: TEvent;
    FLeftBar: TProgressBar;
    FRightBar: TProgressBar;
    FLeft: Integer;
    FRight: Integer;
  protected
    procedure Execute; override;
  public
    constructor Create(ALeftBar, ARightBar: TProgressBar);
    destructor Destroy; override;
    procedure Update(ALeft, ARight: Integer);
  end;

constructor TLevelThread.Create(ALeftBar, ARightBar: TProgressBar);
begin
  inherited Create(False);
  Self.FreeOnTerminate := True;
  FEvent := TEvent.Create(nil, True, False, '');
  FLeftBar := ALeftBar;
  FRightBar := ARightBar;
  FLeft := 0;
  FRight := 0;
end;

destructor TLevelThread.Destroy;
begin
  FEvent.Free;
end;

procedure TLevelThread.Execute;
begin
  while not Self.Terminated do
  begin
    FLeftBar.Position := Round(100 * FLeft / $8000); // $8000 -> 32768, max value of signed 16 bits
    FRightBar.Position := Round(100 * FRight / $8000);
    FEvent.ResetEvent;
    while FEvent.WaitFor(10) = wrTimeout do
      if Self.Terminated then
        Break;
  end;
end;

procedure TLevelThread.Update(ALeft, ARight: Integer);
begin
  FLeft := ALeft;
  FRight := ARight;
  FEvent.SetEvent;
end;

var
  FLevelThread: TLevelThread = nil;


procedure TFCapturaImagemCamIP.FormCreate(Sender: TObject);
var
  I, T: Integer;
  Found: Boolean;
begin
 // initialize
//  Application.Title := Format(SAppTitle, [FFPlayer.Version]);
//  Self.Caption := Format(SCaption, [FFPlayer.Version]);

  if SysUtils.SysLocale.PriLangID = LANG_CHINESE then
    SWebSite := SWebSiteC
  else
    SWebSite := SWebSiteE;

{$IF CompilerVersion >= 35.0}
{$IFEND}
{$IF CompilerVersion >= 22.0}
  SysUtils.FormatSettings.DecimalSeparator := '.';
  SysUtils.FormatSettings.ThousandSeparator := ',';
{$ELSE}
  SysUtils.DecimalSeparator := '.';
  SysUtils.ThousandSeparator := ',';
{$IFEND}

  // equalizer
  FBrightness := 0;
  FSaturation := 1;
  FHue := 0;

//   generate screen list
  cboScreens.Items.Clear;
  cboScreens.Items.BeginUpdate;
  cboScreens2.Items.Clear;
  cboScreens2.Items.BeginUpdate;

  try
    cboScreens.Items.Add('Desktop');
    cboScreens.Items.Add('Popup');
    cboScreens2.Items.Add('Desktop');
    cboScreens2.Items.Add('Popup');
    T := 0;
    while True do
    begin
      Found := False;
      for I := 0 to Self.ControlCount - 1 do
      begin
        if (Self.Controls[I] is TWinControl) and ((Self.Controls[I] as TWinControl).TabOrder = T) then
        begin
          cboScreens.Items.Add(Self.Controls[I].Name);
          cboScreens2.Items.Add(Self.Controls[I].Name);
          Inc(T);
          Found := True;
          Break;
        end;
      end;
      if not Found then
        Break;
    end;
    cboScreens.ItemIndex := 2;
    cboScreens2.ItemIndex := 17;
  finally
    cboScreens.Items.EndUpdate;
    cboScreens2.Items.EndUpdate;
  end;

{$IF Defined(VER140) OR Defined(VER150)} // Delphi 6, 7
  FLock := TCriticalSectionEx.Create;
{$ELSE}
  FLock := TCriticalSection.Create;
{$IFEND}
  FRect.Left := 0;
  FRect.Top := 0;
  FRect.Right := -1;
  FRect.Bottom := -1;

  // open dialog setting
  OpenDialog1.Options := CDialogOptions;
  OpenDialog1.Filter := CDialogFilter;

  // save dialog setting
  SavePictureDialog1.Options := [ofOverwritePrompt, ofHideReadOnly, ofExtensionDifferent, ofPathMustExist, ofEnableSizing];
  SavePictureDialog1.Filter := 'Bitmaps (*.bmp)|*.bmp|JPEG Image File |*.jpg;*.jpeg';
  SavePictureDialog1.DefaultExt := 'bmp';

  // disable all fpu exceptions(floating point exceptions):
  //   invalid operation, denormalized, divide by zero, overflow, underflow, inexact/precision
  FFPlayer.DisableFPUExceptions;
  FFPlayer2.DisableFPUExceptions;
end;

procedure TFCapturaImagemCamIP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
with FFPlayer do
  begin
    // Clear the event handlers
    OnPosition := nil;
    OnState := nil;
    OnFrameHook := nil;
    OnVideoHook := nil;
    OnAudioHook := nil;
  end;
  FFLogger.OnLog := nil;
  if Assigned(FLevelThread) then
  begin
    FLevelThread.Terminate;
    FLevelThread := nil;
  end;
  with FFPlayer2 do
  begin
    // Clear the event handlers
    OnPosition := nil;
    OnState := nil;
    OnFrameHook := nil;
    OnVideoHook := nil;
    OnAudioHook := nil;
  end;
  FFLogger.OnLog := nil;
  if Assigned(FLevelThread) then
  begin
    FLevelThread.Terminate;
    FLevelThread := nil;
  end;
end;

procedure TFCapturaImagemCamIP.FormDestroy(Sender: TObject);
begin
  FLock.Free;
end;

function FindSubFile(APath, AFileName: string): string;
var
  LSearchRec: TsearchRec;
begin
  try
    if FindFirst(APath + AFileName, faAnyFile, LSearchRec) = 0 then
    begin
      repeat
        if ((LSearchRec.Attr and faAnyFile) <> 0) and
          (LSearchRec.Name <> '.') and (LSearchRec.Name <> '..') then
        begin
          Result := APath + LSearchRec.Name;
          Exit;
        end;
      until FindNext(LSearchRec) <> 0;
    end;
    Result := '';
  finally
    SysUtils.FindClose(LSearchRec);
  end;
end;

function CheckVideoFilter(AFilter: string): Boolean;
begin
  Assert(Assigned(avfilter_get_by_name));
  Result := Assigned(avfilter_get_by_name(PAnsiChar(AnsiString(AFilter))));
end;

function GetSubFile(AVideoFile: string): string;
const
  CExts: array[0..3] of string = ('srt', 'smi', 'ssa', 'ass');
var
  P, S, F: string;
  I: Integer;
begin
  P := ExtractFilePath(AVideoFile);
  S := ChangeFileExt(ExtractFileName(AVideoFile), '');
  // base file name subtitles
  for I := 0 to High(CExts) do
    if FileExists(P + S + '.' + CExts[I]) then
    begin
      Result := P + S + '.' + CExts[I];
      Exit;
    end;
  // base file name + * subtitles
  for I := 0 to High(CExts) do
  begin
    F := FindSubFile(P, S + '*.' + CExts[I]);
    if (F <> '') and FileExists(F) then
    begin
      Result := F;
      Exit;
    end;
  end;
  // * subtitles
  Result := '';
end;

function TFCapturaImagemCamIP.GetScreenHandle: HWND;
begin
  // wincontrol used for render video
  FScreenControl := FindWinControl(Self, cboScreens.Items.Strings[cboScreens.ItemIndex]);
  if Assigned(FScreenControl) then
    Result := FScreenControl.Handle
  else if cboScreens.Text = 'Desktop' then
    // render video on desktop
    Result := GetDesktopHandle
  else
    // render video on popup window
    Result := 0;
end;

function TFCapturaImagemCamIP.GetScreenHandle2: HWND;
begin
  // wincontrol used for render video
  FScreenControl2 := FindWinControl2(Self, cboScreens2.Items.Strings[cboScreens2.ItemIndex]);
  if Assigned(FScreenControl2) then
    Result := FScreenControl2.Handle
  else if cboScreens2.Text = 'Desktop' then
    // render video on desktop
    Result := GetDesktopHandle
  else
    // render video on popup window
    Result := 0;
end;


procedure TFCapturaImagemCamIP.btnOpenClick(Sender: TObject);
var
  LScreenHandle: HWND;
  LPngFile: string;
  LSubFile: string;
begin

  // Load dynamic link libraries
  if not FFPlayer.AVLibLoaded then
  begin
    if not FFPlayer.LoadAVLib(ExePath + CLibAVPath) then
    begin
//      AddMsgLog(FFPlayer.LastErrMsg, True);
      Exit;
    end;
  end;

  if Sender = btnURL then
  begin
    // open url
    FFPlayer.ReadTimeout := 1000 * 60;
    if not InputQuery('Open', 'URL(or Filename)', URL) or (Trim(URL) = '') then
      // cancel open url
      Exit;
  end
  else
    // open media file
    if not OpenDialog1.Execute then
      // cancel open file
      Exit;

  FFPlayer.VideoFilters := Format('hue=b=%f:s=%f:H=%f', [FBrightness, FSaturation, FHue]);

  if chkWaterMark.Checked then
  begin
    LPngFile := ExtractFilePath(Application.ExeName) + CWaterMark;
    LPngFile := StringReplace(LPngFile, '\', '/', [rfReplaceAll]);
    LPngFile := StringReplace(LPngFile, ':', '\\:', [rfReplaceAll]);

    if FFPlayer.VideoFilters <> '' then
      FFPlayer.VideoFilters := FFPlayer.VideoFilters + ' [main]; [main] ';
    FFPlayer.VideoFilters := Format('movie=%s [watermark]; [in] %s [watermark] overlay=main_w-overlay_w-10:10 [out]',
      [LPngFile, FFPlayer.VideoFilters]);
  end;

  LScreenHandle := GetScreenHandle;

  if Sender = btnURL then
  begin
    // try to open and play url, render on the custom window specified by handle
    //if not FFPlayer.Open(URL, LScreenHandle, chkOpenPaused.Checked) then
    //  AddMsgLog(FFPlayer.LastErrMsg, True);
    FFPlayer.TryOpen(URL, LScreenHandle{, chkOpenPaused.Checked});
//  end
//  else
    // try to open and play media file, render on the custom window specified by handle
    //if not FFPlayer.Open(OpenDialog1.FileName, LScreenHandle, chkOpenPaused.Checked) then
    //  AddMsgLog(FFPlayer.LastErrMsg, True);
    FFPlayer.TryOpen(OpenDialog1.FileName, LScreenHandle{, chkOpenPaused.Checked});
  end;
end;

procedure TFCapturaImagemCamIP.btnPauseClick(Sender: TObject);
begin
  FFPlayer.TogglePause;
end;

procedure TFCapturaImagemCamIP.btnStepClick(Sender: TObject);
begin
  FFPlayer.StepToNextFrame;
end;

procedure TFCapturaImagemCamIP.btnStopClick(Sender: TObject);
begin
  FFPlayer.Stop(True);
end;

procedure TFCapturaImagemCamIP.btnCaptureClick(Sender: TObject);
var
  BMP: TBitmap;
  PTS: Int64;
begin
// capture video frame
//  dirTemp1 := ExtractFilePath(Application.ExeName);
//  dirTemp1 := ExtractFilePath(Application.ExeName) +'tempPesagem1.jpeg';

  if FFPlayer.CurrentFrame(BMP, PTS) then
  begin
    BMP.SaveToFile(ExtractFilePath(Application.ExeName) + 'tempCam1.jpeg');
//    BMP.SaveToFile('C:\tempCam1.jpeg');// + IntToStr(PTS) + '.bmp');

    btnStopClick(Sender);
    btnURL2Click(Sender);

//    btnURL2.Click;
{    SavePictureDialog1.FileName := ChangeFileExt(FFPlayer.FileName, '_snapshot_') + IntToStr(PTS);
    if SavePictureDialog1.Execute then
    begin
      if SameText(ExtractFileExt(SavePictureDialog1.FileName), '.bmp') then
        BMP.SaveToFile(SavePictureDialog1.FileName)
      else
        with TJPEGImage.Create do
        try
          Assign(BMP);
          SaveToFile(SavePictureDialog1.FileName);
      finally
          Free;
        end;
    end;}
  end;
end;

procedure TFCapturaImagemCamIP.btnURLClick(Sender: TObject);
var
  LScreenHandle: HWND;
  LScreenHandle2: HWND;
  LPngFile: string;
  LSubFile: string;
begin
  // Load dynamic link libraries
  URL := DMParamSistema.QParamSistemaDESC_IP_CAM1.Value; //novo

  if not FFPlayer.AVLibLoaded then
  begin
    if not FFPlayer.LoadAVLib(ExePath + CLibAVPath) then
    begin
      Exit;
    end;
  end;

  if Sender = btnURL then
  begin
    // open url
    FFPlayer.ReadTimeout := 1000;// * 60;
{    if not InputQuery('Open', 'URL(or Filename)', URL) or (Trim(URL) = '') then
      // cancel open url
      Exit; }
  end;
  LScreenHandle := GetScreenHandle;

  if Sender = btnURL then
    FFPlayer.TryOpen(URL, LScreenHandle);
end;

procedure GetLevelS16(ASample: PByte; ASize, ASampleRate, AChannels: Integer;
  out L, R: Integer);
var
  P: PSmallInt;
  I, C: Integer;
  L1, L2: SmallInt;
begin
  // get level of audio sample in signed 16 bits format
  P := PSmallInt(ASample);
  L1 := 0;
  L2 := 0;
  for I := 0 to ASize div SizeOf(SmallInt) div AChannels - 1 do
  begin
    for C := 0 to AChannels - 1 do
    begin
      if (C mod 2) = 0 then
      begin
        if Abs(P^) > L1 then
          L1 := Abs(P^);
      end
      else
      begin
        if Abs(P^) > L2 then
          L2 := Abs(P^);
      end;
      Inc(P);
    end;
  end;
  L := L1;
  R := L2;
end;

function BytesToStr(AFileSize: Int64): string;
begin
  Result := Format('%.3d', [AFileSize mod 1000]);
  AFileSize := Trunc(AFileSize / 1000);
  while AFileSize > 0 do
  begin
    Result := Format('%.3d,%s', [AFileSize mod 1000, Result]);
    AFileSize := Trunc(AFileSize / 1000);
  end;
end;

procedure TFCapturaImagemCamIP.FFPlayerFileOpen(Sender: TObject;
  const ADuration: Int64; AFrameWidth, AFrameHeight: Integer;
  var AScreenWidth, AScreenHeight: Integer);
var
  I: Integer;
  aspect_ratio: Single;
  P: PAVStream;
begin
// AddMsgLog(FFPlayer.Decoder.FileInfoText);

  // aspect ratio
  if FFPlayer.VideoStreamIndex >= 0 then
  begin
    P := PPtrIdx(FFPlayer.Decoder.FileHandle.streams, FFPlayer.VideoStreamIndex);
    with P.codecpar^ do
    begin
      if (sample_aspect_ratio.num <> 0) and (sample_aspect_ratio.den <> 0) then
        aspect_ratio := sample_aspect_ratio.num / sample_aspect_ratio.den
      else
        aspect_ratio := 1.0;
      aspect_ratio := aspect_ratio * width / height;
    end;
//    AddMsgLog(Format('aspect ratio: %f', [aspect_ratio]));
  end;

  // tell player the screen size
  if Assigned(FScreenControl) then
  begin
    // win control
    AScreenWidth := FScreenControl.Width;
    AScreenHeight := FScreenControl.Height;
  end
  else if cboScreens.Text = 'Desktop' then
  begin
    // desktop
    AScreenWidth := Screen.DesktopWidth;
    AScreenHeight := Screen.DesktopHeight;
  end
  else
  begin
    // popup window
    AScreenWidth := 640; // Screen.Width;
    AScreenHeight := 480; // Screen.Height;
  end;

  // duration of media file
  FDuration := ADuration;
  if (FDuration < 0) and (FFPlayer.Decoder.FileSize > 0) then
  begin
    FIsBytes := True;
    FDuration := FFPlayer.Decoder.FileSize;
  end
  else
    FIsBytes := False;
  cboVideo.Items.BeginUpdate;
  cboSubtitle.Items.BeginUpdate;
  try
    cboVideo.Items.Clear;
    for I := 0 to FFPlayer.Decoder.StreamCount - 1 do
    begin
      if FFPlayer.Decoder.IsVideoStream(I) then
        cboVideo.Items.Add(Format('Video#%d', [I]))
      else if FFPlayer.Decoder.IsSubtitleStream(I) then //and (FFPlayer.Decoder.SubtitleStreamInfos[I].SubFormat = 0) then
        cboSubtitle.Items.Add(Format('Subtitle#%d', [I]));
    end;
    cboVideo.Enabled := (cboVideo.Items.Count > 1) and (FFPlayer.VideoStreamIndex >= 0);
    cboVideo.ItemIndex := cboVideo.Items.IndexOf(Format('Video#%d', [FFPlayer.VideoStreamIndex]));
    cboSubtitle.Enabled := (cboSubtitle.Items.Count > 0) and (FFPlayer.VideoStreamIndex >= 0);
    if cboSubtitle.Enabled then
    begin
      cboSubtitle.Items.Insert(0, 'Subtitle#-1');
      cboSubtitle.ItemIndex := cboSubtitle.Items.IndexOf(Format('Subtitle#%d', [FFPlayer.SubtitleStreamIndex]));
    end;
  finally
    cboVideo.Items.EndUpdate;
    cboSubtitle.Items.EndUpdate;
  end;
end;

procedure TFCapturaImagemCamIP.FFPlayerFrameHook(Sender: TObject;
  APicture: PAVPicture; APixFmt: TAVPixelFormat; AWidth, AHeight: Integer;
  const APTS: Int64);
var
  R: TRect;
begin
{  FLock.Enter;
  try
    R := FFPlayer.DisplayToActualRect(FRect);
    if (R.Right > R.Left) and (R.Bottom > R.Top) then
      FrameEffects.adjust_eq(PByte(NativeUInt(APicture.data[0]) + NativeUInt(APicture.linesize[0] * R.Top + R.Left)),
               APicture.linesize[0],
               R.Right - R.Left,
               R.Bottom - R.Top,
               20,
               0);
  finally
    FLock.Leave;
  end;
}
end;

procedure TFCapturaImagemCamIP.FFPlayerVideoHook(Sender: TObject; ABitmap: TBitmap; const APTS: Int64; var AUpdate: Boolean);
begin
  // OnVideoHook event handler
  {with ABitmap.Canvas.Font do
  begin // setup font example
    Color := clWhite;
    Name := 'Tahoma';
    Size := 12;
    Style := [fsBold, fsUnderline];
  end;
  // text out with Presentation Time Stamp example
  ABitmap.Canvas.TextOut(10, 10, Format(SHookTimeStamp, [APTS]));
  // draw graphic example
  ABitmap.Canvas.Draw(ABitmap.Width - Application.Icon.Width - 10,
                      ABitmap.Height - Application.Icon.Height - 10,
                      Application.Icon);}
end;

procedure TFCapturaImagemCamIP.cboScreensChange(Sender: TObject);
begin
  FFPlayer.ScreenHandle := GetScreenHandle;
end;

procedure TFCapturaImagemCamIP.cboScreens2Change(Sender: TObject);
begin
  FFPlayer2.ScreenHandle := GetScreenHandle;
end;

procedure TFCapturaImagemCamIP.btnURL2Click(Sender: TObject);
var
  LScreenHandle2: HWND;
//  LPngFile: string;
//  LSubFile: string;
begin
  url2 := DMParamSistema.QParamSistemaDESC_IP_CAM2.Value;
//  url2 := 'rtsp://192.168.250.240/live/ch00_0';
  // Load dynamic link libraries
  if not FFPlayer2.AVLibLoaded then
  begin
    if not FFPlayer2.LoadAVLib(ExePath + CLibAVPath) then
    begin
      Exit;
    end;
  end;

  if Sender = btnURL2 then
  begin
    // open url
    FFPlayer2.ReadTimeout := 1000;//2000 * 60;
{    if not InputQuery('Open', 'URL(or Filename)', URL2) or (Trim(URL2) = '') then
      // cancel open url
      Exit;}
  end;
  LScreenHandle2 := GetScreenHandle2;

//  if Sender = btnURL2 then
    FFPlayer2.TryOpen(URL2, LScreenHandle2{ chkOpenPaused.Checked});
  btnCapture2Click(Sender);
end;

procedure TFCapturaImagemCamIP.btnOpen2Click(Sender: TObject);
var
  LScreenHandle2: HWND;
  LPngFile: string;
  LSubFile: string;
begin
// Load dynamic link libraries
  if not FFPlayer2.AVLibLoaded then
  begin
    if not FFPlayer2.LoadAVLib(ExePath + CLibAVPath) then
    begin
//      AddMsgLog(FFPlayer.LastErrMsg, True);
      Exit;
    end;
  end;

  if Sender = btnURL2 then
  begin
    // open url
    FFPlayer2.ReadTimeout := 1000 * 60;
    if not InputQuery('Open', 'URL(or Filename)', URL) or (Trim(URL) = '') then
      // cancel open url
      Exit;
  end
  else
    // open media file
    if not OpenDialog1.Execute then
      // cancel open file
      Exit;

  FFPlayer2.VideoFilters := Format('hue=b=%f:s=%f:H=%f', [FBrightness, FSaturation, FHue]);

  if chkWaterMark.Checked then
  begin
    LPngFile := ExtractFilePath(Application.ExeName) + CWaterMark;
    LPngFile := StringReplace(LPngFile, '\', '/', [rfReplaceAll]);
    LPngFile := StringReplace(LPngFile, ':', '\\:', [rfReplaceAll]);

    if FFPlayer2.VideoFilters <> '' then
      FFPlayer2.VideoFilters := FFPlayer2.VideoFilters + ' [main]; [main] ';
    FFPlayer2.VideoFilters := Format('movie=%s [watermark]; [in] %s [watermark] overlay=main_w-overlay_w-10:10 [out]',
      [LPngFile, FFPlayer2.VideoFilters]);
  end;

  LScreenHandle2 := GetScreenHandle2;

  if Sender = btnURL2 then
  begin
    // try to open and play url, render on the custom window specified by handle
    //if not FFPlayer.Open(URL, LScreenHandle, chkOpenPaused.Checked) then
    //  AddMsgLog(FFPlayer.LastErrMsg, True);
    FFPlayer2.TryOpen(URL2, LScreenHandle2{, chkOpenPaused.Checked});
//  end
//  else
    // try to open and play media file, render on the custom window specified by handle
    //if not FFPlayer.Open(OpenDialog1.FileName, LScreenHandle, chkOpenPaused.Checked) then
    //  AddMsgLog(FFPlayer.LastErrMsg, True);
    FFPlayer2.TryOpen(OpenDialog1.FileName, LScreenHandle2{, chkOpenPaused.Checked});
  end;
end;

procedure TFCapturaImagemCamIP.FFPlayer2FileOpen(Sender: TObject;
  const ADuration: Int64; AFrameWidth, AFrameHeight: Integer;
  var AScreenWidth, AScreenHeight: Integer);
var
  I: Integer;
  aspect_ratio: Single;
  P: PAVStream;
begin

  // aspect ratio
  if FFPlayer2.VideoStreamIndex >= 0 then
  begin
    P := PPtrIdx(FFPlayer2.Decoder.FileHandle.streams, FFPlayer2.VideoStreamIndex);
    with P.codecpar^ do
    begin
      if (sample_aspect_ratio.num <> 0) and (sample_aspect_ratio.den <> 0) then
        aspect_ratio := sample_aspect_ratio.num / sample_aspect_ratio.den
      else
        aspect_ratio := 1.0;
      aspect_ratio := aspect_ratio * width / height;
    end;
//    AddMsgLog(Format('aspect ratio: %f', [aspect_ratio]));
  end;

  // tell player the screen size
  if Assigned(FScreenControl2) then
  begin
    // win control
    AScreenWidth := FScreenControl2.Width;
    AScreenHeight := FScreenControl2.Height;
  end
  else if cboScreens2.Text = 'Desktop' then
  begin
    // desktop
    AScreenWidth := Screen.DesktopWidth;
    AScreenHeight := Screen.DesktopHeight;
  end
  else
  begin
    // popup window
    AScreenWidth := 640; // Screen.Width;
    AScreenHeight := 480; // Screen.Height;
  end;

  // duration of media file
  FDuration := ADuration;
  if (FDuration < 0) and (FFPlayer2.Decoder.FileSize > 0) then
  begin
    FIsBytes := True;
    FDuration := FFPlayer2.Decoder.FileSize;
  end
  else
    FIsBytes := False;
  cboVideo2.Items.BeginUpdate;
//  cboSubtitle.Items.BeginUpdate;
  try
    cboVideo2.Items.Clear;
    for I := 0 to FFPlayer2.Decoder.StreamCount - 1 do
    begin
      if FFPlayer2.Decoder.IsVideoStream(I) then
        cboVideo2.Items.Add(Format('Video#%d', [I]));
//      else if FFPlayer2.Decoder.IsSubtitleStream(I) then //and (FFPlayer.Decoder.SubtitleStreamInfos[I].SubFormat = 0) then
//        cboSubtitle.Items.Add(Format('Subtitle#%d', [I]));
    end;
 //   cboVideo2.Enabled := (cboVideo2.Items.Count > 1) and (FFPlayer2.VideoStreamIndex >= 0);
    cboVideo2.ItemIndex := cboVideo2.Items.IndexOf(Format('Video#%d', [FFPlayer2.VideoStreamIndex]));
  finally
    cboVideo2.Items.EndUpdate;
  end;
end;

procedure TFCapturaImagemCamIP.FFPlayer2FrameHook(Sender: TObject;
  APicture: PAVPicture; APixFmt: TAVPixelFormat; AWidth, AHeight: Integer;
  const APTS: Int64);
var
  R: TRect;
begin
{  FLock.Enter;
  try
    R := FFPlayer2.DisplayToActualRect(FRect);
    if (R.Right > R.Left) and (R.Bottom > R.Top) then
      FrameEffects.adjust_eq(PByte(NativeUInt(APicture.data[0]) + NativeUInt(APicture.linesize[0] * R.Top + R.Left)),
               APicture.linesize[0],
               R.Right - R.Left,
               R.Bottom - R.Top,
               20,
               0);
  finally
    FLock.Leave;
  end;
}
end;

procedure TFCapturaImagemCamIP.FFPlayer2VideoHook(Sender: TObject;
  ABitmap: TBitmap; const APTS: Int64; var AUpdate: Boolean);
begin
 // OnVideoHook event handler
{  with ABitmap.Canvas.Font do
  begin // setup font example
    Color := clWhite;
    Name := 'Tahoma';
    Size := 12;
    Style := [fsBold, fsUnderline];
  end;
  // text out with Presentation Time Stamp example
  ABitmap.Canvas.TextOut(10, 10, Format(SHookTimeStamp, [APTS]));
  // draw graphic example
  ABitmap.Canvas.Draw(ABitmap.Width - Application.Icon.Width - 10,
                      ABitmap.Height - Application.Icon.Height - 10,
                      Application.Icon); }
end;

procedure TFCapturaImagemCamIP.btnPause3Click(Sender: TObject);
begin
 FFPlayer2.TogglePause;
end;

procedure TFCapturaImagemCamIP.btnStep2Click(Sender: TObject);
begin
  FFPlayer2.StepToNextFrame;
end;

procedure TFCapturaImagemCamIP.btnStop2Click(Sender: TObject);
begin
 FFPlayer2.Stop(True);
end;

procedure TFCapturaImagemCamIP.btnCapture2Click(Sender: TObject);
var
  BMP: TBitmap;
  PTS: Int64;
begin
// capture video frame
  if FFPlayer2.CurrentFrame(BMP, PTS) then
  begin
    BMP.SaveToFile(ExtractFilePath(Application.ExeName) + 'tempCam2.jpeg');
//    BMP.SaveToFile('C:\tempCam2.jpeg');// + IntToStr(PTS) + '.jpeg');//.bmp
    btnStop2Click(Sender);
    Close;
   { SavePictureDialog1.FileName := ChangeFileExt(FFPlayer2.FileName, '_snapshot_') + IntToStr(PTS);
    if SavePictureDialog1.Execute then
    begin
      if SameText(ExtractFileExt(SavePictureDialog1.FileName), '.bmp') then
        BMP.SaveToFile(SavePictureDialog1.FileName)
      else
        with TJPEGImage.Create do
        try
          Assign(BMP);
          SaveToFile(SavePictureDialog1.FileName)
        finally
          Free;
        end;
    end;}
  end;

end;


procedure TFCapturaImagemCamIP.FormActivate(Sender: TObject);
begin
  btnURL.Click;
end;

end.
