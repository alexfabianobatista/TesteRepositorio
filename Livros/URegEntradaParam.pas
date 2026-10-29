unit URegEntradaParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask, variants;

type
  TFRegEntradaParam = class(TFTParametro)
    Label22: TLabel;
    TabSheet1: TTabSheet;
    Ed0Filial: TEdit;
    Bt0ConsFilial: TBitBtn;
    ME0Filial: TMaskEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    ME0DataI: TMaskEdit;
    ME0DataF: TMaskEdit;
    Label1: TLabel;
    ME0NatOperacao: TMaskEdit;
    Label2: TLabel;
    ME0PaginaI: TMaskEdit;
    Label5: TLabel;
    procedure Bt0ConsFilialClick(Sender: TObject);
    procedure ME0FilialExit(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure Me1CodFilialExit(Sender: TObject);
    procedure Bt1FilialConsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRegEntradaParam: TFRegEntradaParam;

implementation

uses URRegEntrada, UFilial_cl, UFilialCons, URegEntrada_cl, UUsuario_cl,
  UOracle_cl, UBiblioteca;

{$R *.DFM}

procedure TFRegEntradaParam.Bt0ConsFilialClick(Sender: TObject);
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

procedure TFRegEntradaParam.ME0FilialExit(Sender: TObject);
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

procedure TFRegEntradaParam.BtOkClick(Sender: TObject);
Var wAno,wMes,wDia : Word;
begin
  inherited;
  // ModalResult := mrNone;
  DmUsuario.Checar_Filial_Usuario( Trim(ME0Filial.Text),'LIVRO FISCAL');
  Try
    If Trim(ME0Filial.Text) = '' Then
      Raise Exception.Create('Filial não informada!');
    If Trim(ME0PaginaI.Text) = '' Then
      ME0PaginaI.Text := '1';
    With DMRegEntrada do
    Begin
      QRegEntrada.Close;
      if Trim(ME0NatOperacao.Text) = '' Then
        QRegEntrada.SetVariable('NAT_OPERACAO',Null)
      else
        QRegEntrada.SetVariable('NAT_OPERACAO',ME0NatOperacao.Text);
      QRegEntrada.SetVariable('FILIAL',ME0Filial.Text);
      QRegEntrada.SetVariable('DATA_I',ME0DataI.Text);
      QRegEntrada.SetVariable('DATA_F',ME0DataF.Text + ' 23:59:59');
      QRegEntrada.Open;
    End;
//    If DMRegEntrada.QRegEntrada.RecordCount <= 0 Then
//      Raise Exception.Create('Nenhum documento no período!');
    If FRRegEntrada = Nil Then
      FRRegEntrada := TFRRegEntrada.Create(Application);
    With DMFilial do
    Begin
      QFilial.Close;
      QFilial.SetVariable('PK',ME0Filial.Text);
      QFilial.Open;
      FRRegEntrada.QRLNomeFilial.Caption := QFilialDesc_Filial.Value;
      FRRegEntrada.QRLCGCFilial.Caption := QFilialNum_CGC.Value;
      FRRegEntrada.QRLInscricaoFilial.Caption := QFilialDesc_Inscricao.Value;
      DecodeDate(StrToDate(ME0DataI.Text),wAno,wMes,wDia);
      FRRegEntrada.QRLPeriodo.Caption := Bib.NomeMes(wMes)+'/'+FormatFloat('0000',wAno);
    End;
    FRRegEntrada.pPaginaCorrente := Trunc( StrToFloat(FRegEntradaParam.ME0PaginaI.Text) );
    FRRegEntrada.Preview;
    DMRegEntrada.QRegEntrada.Close;
    DMFilial.QFilial.Close;
//    FRRegEntrada.Destroy;
//    FRRegEntrada := Nil;
  Except
    Raise;
  End;
end;

procedure TFRegEntradaParam.FormCreate(Sender: TObject);
Var wDia,wMes,wAno : Word;
begin
  inherited;
  DecodeDate(Date,wAno,wMes,wDia);
  ME0Filial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  ME0FilialExit(Self);
  ME0DataI.Text := DateToStr(StrToDate('01/'+FormatFloat('00',wMes)+'/'+FormatFloat('0000',wAno) ) );
  ME0DataF.Text := DateToStr(StrToDate(FormatFloat('00',DMOracle.DiasNoMes(Date))+'/'+FormatFloat('00',wMes)+'/'+FormatFloat('0000',wAno) ) );  
end;

procedure TFRegEntradaParam.FormActivate(Sender: TObject);
begin
  inherited;
  ME0Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
end;

procedure TFRegEntradaParam.TabSheet1Show(Sender: TObject);
begin
  inherited;
  FRegEntradaParam.HelpContext:=2;
end;

procedure TFRegEntradaParam.Me1CodFilialExit(Sender: TObject);
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

procedure TFRegEntradaParam.Bt1FilialConsClick(Sender: TObject);
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
