unit URegSaidaParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask, variants;

type
  TFRegSaidaParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Ed0Filial: TEdit;
    Bt0ConsFilial: TBitBtn;
    ME0Filial: TMaskEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    ME0DataI: TMaskEdit;
    ME0DataF: TMaskEdit;
    ME0NatOperacao: TMaskEdit;
    ME0PaginaI: TMaskEdit;
    procedure ME0FilialExit(Sender: TObject);
    procedure Bt0ConsFilialClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure Me1CodFilialExit(Sender: TObject);
    procedure Bt1ConsFilialClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRegSaidaParam: TFRegSaidaParam;

implementation

uses UFilial_cl, UUsuario_cl, UOracle_cl, UFilialCons, URegSaida_cl,
  URRegSaida, UBiblioteca;

{$R *.DFM}

procedure TFRegSaidaParam.ME0FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Filial.Text) <> '' Then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',ME0Filial.Text);
    QFilial.Open;
    Ed0Filial.Text := QFilialDesc_Filial.Value;
  End
  Else
    Ed0Filial.Text := 'Todos';
end;

procedure TFRegSaidaParam.Bt0ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME0Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME0FilialExit(Self);
  End;
end;

procedure TFRegSaidaParam.FormCreate(Sender: TObject);
Var wDia,wMes,wAno : Word;
begin
  inherited;
  DecodeDate(Date,wAno,wMes,wDia);
  ME0Filial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  ME0FilialExit(Self);
  ME0DataI.Text := DateToStr(StrToDate('01/'+FormatFloat('00',wMes)+'/'+FormatFloat('0000',wAno) ) );
  ME0DataF.Text := DateToStr(StrToDate(FormatFloat('00',DMOracle.DiasNoMes(Date))+'/'+FormatFloat('00',wMes)+'/'+FormatFloat('0000',wAno) ) );
end;

procedure TFRegSaidaParam.BtOkClick(Sender: TObject);
Var wAno,wMes,wDia : Word;
begin
  inherited;
  // ModalResult := mrNone;
  DmUsuario.Checar_Filial_Usuario( Trim(ME0Filial.Text),'LIVRO FISCAL');
  Try
    if Trim(ME0Filial.Text) = '' Then
      Raise Exception.Create('Filial não informada!');
    if Trim(ME0PaginaI.Text) = '' Then
      ME0PaginaI.Text := '1';
    with DMRegSaida do
    begin
      QRegSaida.Close;
      If Trim(ME0NatOperacao.Text) = '' Then
        QRegSaida.SetVariable('NAT_OPERACAO',Null)
      Else
        QRegSaida.SetVariable('NAT_OPERACAO',ME0NatOperacao.Text);
      QRegSaida.SetVariable('FILIAL',ME0Filial.Text);
      QRegSaida.SetVariable('DATA_I',ME0DataI.Text);
      QRegSaida.SetVariable('DATA_F',ME0DataF.Text + ' 23:59:59');
      QRegSaida.Open;
    End;
//    if DMRegSaida.QRegSaida.RecordCount <= 0 Then
//       raise Exception.Create('Nenhum documento no período!');
    if FRRegSaida = nil then
       FRRegSaida := TFRRegSaida.Create(Application);
    with DMFilial do
    begin
      QFilial.Close;
      QFilial.SetVariable('PK',ME0Filial.Text);
      QFilial.Open;
      FRRegSaida.QRLNomeFilial.Caption := QFilialDesc_Filial.Value;
      FRRegSaida.QRLCGCFilial.Caption := QFilialNum_CGC.Value;
      FRRegSaida.QRLInscricaoFilial.Caption := QFilialDesc_Inscricao.Value;
      DecodeDate(StrToDate(ME0DataI.Text),wAno,wMes,wDia);
      FRRegSaida.QRLPeriodo.Caption := Bib.NomeMes(wMes)+'/'+FormatFloat('0000',wAno);
    End;
    FRRegSaida.pPaginaCorrente := Trunc( StrToFloat(FRegSaidaParam.ME0PaginaI.Text) );
    FRRegSaida.Preview;
    DMRegSaida.QRegSaida.Close;
    DMFilial.QFilial.Close;
//    FRRegSaida.Destroy;
//    FRRegSaida := Nil;
  Except
    Raise;
  End;
end;

procedure TFRegSaidaParam.FormActivate(Sender: TObject);
begin
  inherited;
  ME0Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
end;

procedure TFRegSaidaParam.TabSheet1Show(Sender: TObject);
begin
  inherited;
  FRegSaidaParam.HelpContext:=3;
end;

procedure TFRegSaidaParam.Me1CodFilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Filial.Text) <> '' Then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',ME0Filial.Text);
    QFilial.Open;
    Ed0Filial.Text := QFilialDesc_Filial.Value;
  End
  Else
    Ed0Filial.Text := 'Todos';
end;

procedure TFRegSaidaParam.Bt1ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME0Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME0FilialExit(Self);
  End;
end;

end.
