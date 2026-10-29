unit URegServPrestadosParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask;

type
  TFRegServPrestadosParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label1: TLabel;
    MEFilial: TMaskEdit;
    BtConsFilial: TBitBtn;
    EdFilial: TEdit;
    MENatOperacao: TMaskEdit;
    Label5: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    MEDataI: TMaskEdit;
    MEDataF: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure MEFilialExit(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRegServPrestadosParam: TFRegServPrestadosParam;

implementation

uses UUsuario_cl, UOracle_cl, UFilial_cl, UFilialCons, UBiblioteca,
  URegServPrestados_cl, URRegServPrestados;

{$R *.DFM}

procedure TFRegServPrestadosParam.FormCreate(Sender: TObject);
Var
  wDia,wMes,wAno : Word;
begin
  inherited;
  DecodeDate(Date,wAno,wMes,wDia);
  MEFilial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  MEFilialExit(Self);
  MEDataI.Text := DateToStr(StrToDate('01/'+FormatFloat('00',wMes)+'/'+FormatFloat('0000',wAno) ) );
  MEDataF.Text := DateToStr(StrToDate(FormatFloat('00',DMOracle.DiasNoMes(Date))+'/'+FormatFloat('00',wMes)+'/'+FormatFloat('0000',wAno) ) );
end;

procedure TFRegServPrestadosParam.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    MEFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    MEFilialExit(Self);
  End;

end;

procedure TFRegServPrestadosParam.MEFilialExit(Sender: TObject);
begin
  inherited;
  If Trim(MEFilial.Text) <> '' Then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',MEFilial.Text);
    QFilial.Open;
    EdFilial.Text := QFilialDesc_Filial.Value;
  End
  Else
    EdFilial.Text := 'Todos';
end;

procedure TFRegServPrestadosParam.BtOkClick(Sender: TObject);
var
  wAno,wMes,wDia: Word;
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(MEFilial.Text),'LIVRO FISCAL');
  Try
    with DMRegServPrestados do
    begin
      QRegServPrestados.Close;
      If Trim(MENatOperacao.Text) = '' Then
        QRegServPrestados.SetVariable('NAT_OPERACAO',Null)
      Else
        QRegServPrestados.SetVariable('NAT_OPERACAO',MENatOperacao.Text);

      If Trim(MEFilial.Text) = '' Then
        QRegServPrestados.SetVariable('COD_FILIAL',Null)
      Else
        QRegServPrestados.SetVariable('COD_FILIAL',MEFilial.Text);

      QRegServPrestados.SetVariable('DATA_I',MEDataI.Text);
      QRegServPrestados.SetVariable('DATA_F',MEDataF.Text);
      QRegServPrestados.Open;
    End;
    if FRRegServPrestados = nil then
       FRRegServPrestados := TFRRegServPrestados.Create(Application);
    with DMFilial do
    begin
      QFilial.Close;
      QFilial.SetVariable('PK',MEFilial.Text);
      QFilial.Open;
      FRRegServPrestados.QRLNomeFilial.Caption := QFilialDesc_Filial.Value;
      FRRegServPrestados.QRLCGCFilial.Caption := QFilialNum_CGC.Value;
      FRRegServPrestados.QRLInscricaoFilial.Caption := QFilialDesc_Inscricao.Value;
      DecodeDate(StrToDate(MEDataI.Text),wAno,wMes,wDia);
      FRRegServPrestados.QRLPeriodo.Caption := Bib.NomeMes(wMes)+'/'+FormatFloat('0000',wAno);
    End;

//    FRRegSaida.pPaginaCorrente := Trunc( StrToFloat(FRegSaidaParam.ME0PaginaI.Text) );
    FRRegServPrestados.QRPrimario.Preview;
    DMRegServPrestados.QRegServPrestados.Close;
    DMFilial.QFilial.Close;
  Except
    Raise;
  End;

end;

end.
