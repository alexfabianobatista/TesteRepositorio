unit UPesagemRenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, DBCtrls, Grids, DBGrids, ExtCtrls, OracleNavigator,
  Buttons, Mask, ComCtrls, CPort;

type
  TFPesagemRenda = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    MEPeso: TMaskEdit;
    Label1: TLabel;
    btCadastraPeso: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    BtExcluir: TBitBtn;
    BtLerPeso: TBitBtn;
    StatusBar1: TStatusBar;
    lbMensagem: TLabel;
    ComPort1: TComPort;
    lbPeso: TLabel;
    DBText1: TDBText;
    btPesoLeitura: TBitBtn;
    procedure BtExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btCadastraPesoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtLerPesoClick(Sender: TObject);
    procedure ComPort1RxChar(Sender: TObject; Count: Integer);
    procedure FormDeactivate(Sender: TObject);
    procedure btPesoLeituraClick(Sender: TObject);
  private
    { Private declarations }
    procedure Contar(ms : longint);
  public
    { Public declarations }
  end;

var
  FPesagemRenda: TFPesagemRenda;
  wPesoFinal: Double;
  wPeso: string;

implementation

uses URomaneioAgricola_cl, Math, UOracle_cl, URomaneioCad, StrUtils;


{$R *.dfm}

procedure TFPesagemRenda.BtExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir a pesagem?', mtInformation,
    [mbYes, mbNo], 0) = mrYes then
    DMRomaneioAgricola.QPesagemRenda.Delete;
end;

procedure TFPesagemRenda.FormActivate(Sender: TObject);
var wLiberado: String;
begin
  with DMRomaneioAgricola do
  begin
    if QBalanca.RecordCount = 0 then
    begin
      MessageDlg('Nenhuma balanÁa (placa) foi informada.', mtError,
        [mbOk], 0);
      PostMessage(Handle, WM_CLOSE, 0, 0);
    end
    else
    begin
      QPesagemRenda.Close;
      QPesagemRenda.SetVariable('FK', QBalancaCOD_BALANCA.Value);
      QPesagemRenda.Open;
      wLiberado := DMOracle.FastSelect('IND_LIBERA_PESO_RENDA','TB_FILIAL',
        'COD_FILIAL = ' + QBalancaCOD_FILIAL.Text);
      Panel1.Enabled := (wLiberado = 'S');
      lbMensagem.Visible := (wLiberado = 'N');
      lbPeso.Caption := '0.00';
      try
        ComPort1.Open;
        ComPort1.ClearBuffer(true,true);
      except on e: Exception do
      begin
        messageDlg('Impressora n„o conectada na COM1.' + #13#10
          + e.Message, mtError, [mbOk], 0);
        abort;
      end;
      end;
    end;
    wPesoFinal := 0;
    wPeso := '';
  end;
end;

procedure TFPesagemRenda.btCadastraPesoClick(Sender: TObject);
begin
  if Trim(MEPeso.Text) <> '' then
  begin
    with DMRomaneioAgricola do
    begin
      try
        QPesagemRenda.Append;
        QPesagemRendaCOD_BALANCA.Value := QBalancaCOD_BALANCA.Value;
        QPesagemRendaDT_PESAGEM.Value := DMOracle.DataHoraServ;
        QPesagemRendaQT_PESO_RENDA.Text := MEPeso.Text;
        QPesagemRenda.Post;
        QPesagemRenda.RefreshRecord;
      Except
        on E:Exception do
        begin
        MessageDlg('Erro: ' + E.message, mtError,
          [mbOk], 0);
        QPesagemRenda.Cancel;
        MEPeso.Clear;
        MEPeso.SetFocus;
        Abort;
        end;
      end;
    end;
    MEPeso.Clear;
    MEPeso.SetFocus;
  end;
end;

procedure TFPesagemRenda.FormCreate(Sender: TObject);
begin
  DMROmaneioAgricola.QPesagemRenda.Open;
end;

procedure TFPesagemRenda.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if gdSelected in State then
  begin
    DBGrid1.Canvas.Brush.Color := clSilver;
    DBGrid1.Canvas.Font.Color := clblack;
  end;
  dbgrid1.DefaultDrawColumnCell( Rect,DataCol,Column,State);
end;

procedure TFPesagemRenda.BtLerPesoClick(Sender: TObject);
begin
  try
    wPesoFinal
      := StrToFloat(stringReplace(wPeso, '.', ',' , [rfReplaceAll]));
  except
    on E: Exception do
    begin
      MessageDlg('Erro: ' + E.message, mtError,
            [mbOk], 0);
      wPesoFinal := 0;
      Abort;
    end;
  end;
  if wPesoFinal > 0 then
  begin
    with DMRomaneioAgricola do
    begin
      try
        QPesagemRenda.Append;
        QPesagemRendaCOD_BALANCA.Value := QBalancaCOD_BALANCA.Value;
        QPesagemRendaDT_PESAGEM.Value := DMOracle.DataHoraServ;
        QPesagemRendaQT_PESO_RENDA.Value := wPesoFinal;
        QPesagemRenda.Post;
        wPesoFinal := 0;
      Except
        on E:Exception do
        begin
          wPesoFinal := 0;        
          MessageDlg('Erro: ' + E.message, mtError,
            [mbOk], 0);
          Abort;
        end;
      end;
    end;
  end
  else
  begin
    if Panel1.Enabled then
      MEPeso.SetFocus;
  end;
  lbPeso.Caption := '0.00';
end;

procedure TFPesagemRenda.Contar(ms : longint);
var OTempo : LongInt;
begin
  OTempo := GetTickCount + ms;
  while GetTickCount < OTempo do Application.ProcessMessages;
end;


procedure TFPesagemRenda.ComPort1RxChar(Sender: TObject; Count: Integer);
Var
wAux, wIndPeso, wStr : string;
wMin, wMax : Real;
wValidade : integer;
wteste: string;
begin
  inherited;
  // Desabilitado a leitura autom·tica para ser utilizado pelo bot„o.
  // Para habilitar deve-se alterar a configuraÁ„o nos eventos do ComPort1
  if wPesoFinal = 0 then
  begin
    try
      contar(40);
      ComPort1.ReadStr(wStr,8);
      contar(40);
    except on e: Exception do
    begin
      messageDlg('N„o foi possÌvel ler porta COM1.' + #13#10
        + e.message
        ,mtError, [mbOk], 0);
      abort;
    end;
    end;
    while wStr[1] <> 'D' do
    begin
      if wStr[1] = 'F' then
      begin
        lbPeso.Caption
          := 'NULL';
        Application.ProcessMessages;
      end;
      ComPort1.ReadStr(wStr,8);
      contar(100);
    end;
    wPeso := copy(wStr, 2, length(wStr)-1);
    contar(40);
    lbPeso.Caption := wPeso;
    contar(500);
    Application.ProcessMessages;
  end;
  
  contar(500);
  if wPesoFinal <> 0 then
    wPesoFinal := 0;

//    ComPort1.ReadStr(wStr,1);
//    if (wStr = '‘') then
//    Begin
//      lbPeso.Caption := lbPeso.Caption + wStr;
//      if wStr = '‘' then
//        While (wStr <> 'ç') do
//        Begin
//          contar(40);
//          ComPort1.ReadStr(wStr,1);
//          lbPeso.Caption := lbPeso.Caption + wStr;
//        end;
//
//      wAux := Copy(lbPeso.Caption,8,7);
//      wPeso := AnsiReplaceStr(wAux,'±','1');
//      wPeso := AnsiReplaceStr(wPeso,'≤','2');
//      wPeso := AnsiReplaceStr(wPeso,'3','3');
//      wPeso := AnsiReplaceStr(wPeso,'¥','4');
//      wPeso := AnsiReplaceStr(wPeso,'5','5');
//      wPeso := AnsiReplaceStr(wPeso,'6','6');
//      wPeso := AnsiReplaceStr(wPeso,'∑','7');
//      wPeso := AnsiReplaceStr(wPeso,'∏','8');
//      wPeso := AnsiReplaceStr(wPeso,'9','9');
//      wPeso := AnsiReplaceStr(wPeso,'0','0');
//      wPesoFinal := StrtoFloat(AnsiReplaceStr(wPeso,'.',','));
//
      //ComPort1.ClearBuffer(true,true);
//      lbPeso.Caption := '';
//    end;

end;

procedure TFPesagemRenda.FormDeactivate(Sender: TObject);
begin
  ComPort1.Close;
end;

procedure TFPesagemRenda.btPesoLeituraClick(Sender: TObject);
Var
wAux, wIndPeso, wStr : string;
wMin, wMax : Real;
wValidade : integer;
wteste: string;
begin
  inherited;
  if wPesoFinal = 0 then
  begin
    lbPeso.Caption := '';
    try
      ComPort1.ReadStr(wStr,8);
    except on e: Exception do
    begin
      messageDlg('N„o foi possÌvel ler porta COM1.' + #13#10
        + e.message
        ,mtError, [mbOk], 0);
      abort;
    end;
    end;
    screen.Cursor := crHourGlass;
    while wStr[1] <> 'D' do
    begin
      if wStr[1] = 'F' then
      begin
        lbPeso.Caption
          := 'NULL';
        Application.ProcessMessages;
        screen.Cursor := crDefault;
        exit;
      end;
      ComPort1.ReadStr(wStr,8);
      contar(100);
    end;
    screen.Cursor := crDefault;
    wPeso := copy(wStr, 2, length(wStr)-1);
    lbPeso.Caption := wPeso;
    Application.ProcessMessages;
  end;
  if wPesoFinal <> 0 then
    wPesoFinal := 0;
  ComPort1.ClearBuffer(true,true);
end;

end.
