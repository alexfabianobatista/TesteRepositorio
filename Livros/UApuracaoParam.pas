unit UApuracaoParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask;

type
  TFApuracaoParam = class(TFTParametro)
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
    RG0TipoGrupo: TRadioGroup;
    procedure ME0FilialExit(Sender: TObject);
    procedure Bt0ConsFilialClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FApuracaoParam: TFApuracaoParam;

implementation

uses UFilial_cl, UUsuario_cl, UOracle_cl, UFilialCons, URegEntrada_cl,
  URApuracaoE, UBiblioteca, URApuracaoS;

{$R *.DFM}

procedure TFApuracaoParam.ME0FilialExit(Sender: TObject);
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

procedure TFApuracaoParam.Bt0ConsFilialClick(Sender: TObject);
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

procedure TFApuracaoParam.FormCreate(Sender: TObject);
Var wDia,wMes,wAno : Word;
begin
  inherited;
  DecodeDate(Date,wAno,wMes,wDia);
  ME0Filial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  ME0FilialExit(Self);
  ME0DataI.Text := DateToStr(StrToDate('01/'+FormatFloat('00',wMes)+'/'+FormatFloat('0000',wAno) ) );
  ME0DataF.Text := DateToStr(StrToDate(FormatFloat('00',DMOracle.DiasNoMes(Date))+'/'+FormatFloat('00',wMes)+'/'+FormatFloat('0000',wAno) ) );

end;

procedure TFApuracaoParam.BtOkClick(Sender: TObject);
//Var wAno,wMes,wDia : Word;
begin
  inherited;
//  DmUsuario.Checar_Filial_Usuario(Trim(ME0Filial.Text),'LIVRO FISCAL');
//  with DMRegEntrada do
//  begin
//    QApuracaoE.Close;
//    QApuracaoE.SetVariable('FILIAL',ME0Filial.Text);
//    QApuracaoE.SetVariable('DATA_I',ME0DataI.Text);
//    QApuracaoE.SetVariable('DATA_F',ME0DataF.Text);
//    QApuracaoE.Open;
//    QApuracaoS.Close;
//    QApuracaoS.SetVariable('FILIAL',ME0Filial.Text);
//    QApuracaoS.SetVariable('DATA_I',ME0DataI.Text);
//    QApuracaoS.SetVariable('DATA_F',ME0DataF.Text);
//    QApuracaoS.Open;
//  end;

//  if FRApuracaoS = Nil Then
//    FRApuracaoS := TFRApuracaoS.Create(Application);

//  if FRApuracaoE = Nil Then
//    FRApuracaoE := TFRApuracaoE.Create(Application);

//  with DMFilial do
//  begin
//    QFilial.Close;
//    QFilial.SetVariable('PK',ME0Filial.Text);
//    QFilial.Open;
//    FRApuracaoE.QRLNomeFilial.Caption := QFilialDesc_Filial.Value;
//    FRApuracaoE.QRLCGCFilial.Caption := QFilialNum_CGC.Value;
//    FRApuracaoE.QRLInscricaoFilial.Caption := QFilialDesc_Inscricao.Value;
//    DecodeDate(StrToDate(ME0DataI.Text),wAno,wMes,wDia);
//    FRApuracaoE.QRLPeriodo.Caption := Bib.NomeMes(wMes)+'/'+FormatFloat('0000',wAno);
{    FRApuracaoE.QRLabel33.Caption := 'ENTRADAS';
    FRApuracaoE.QRLabel30.Caption := 'OPERAÇÕES COM CRED. DO IMP.';
    FRApuracaoE.QRLabel32.Caption := 'IMP. CREDITADO';
    FRApuracaoE.QRLabel35.Caption := 'OPERAÇÕES SEM CRED. DO IMP.';
 }
//    FRApuracaoS.QRLNomeFilial.Caption := QFilialDesc_Filial.Value;
//    FRApuracaoS.QRLCGCFilial.Caption := QFilialNum_CGC.Value;
//    FRApuracaoS.QRLInscricaoFilial.Caption := QFilialDesc_Inscricao.Value;
//    //DecodeDate(StrToDate(ME0DataI.Text),wAno,wMes,wDia);
//    FRApuracaoS.QRLPeriodo.Caption := Bib.NomeMes(wMes)+'/'+FormatFloat('0000',wAno);
//  End;
//  FRApuracaoE.pPaginaCorrente := Trunc( StrToFloat(FApuracaoParam.ME0PaginaI.Text) );
//
//  If RGPreview.ItemIndex = 0 Then
//    FRApuracaoE.QRCompositeReport1.Preview
//  Else
//    FRApuracaoE.QRCompositeReport1.Print;
//  DMRegEntrada.QApuracaoE.Close;
//  DMRegEntrada.QApuracaoS.Close;
//  DMFilial.QFilial.Close;
end;

procedure TFApuracaoParam.FormActivate(Sender: TObject);
begin
  inherited;
  ME0Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
end;

end.
