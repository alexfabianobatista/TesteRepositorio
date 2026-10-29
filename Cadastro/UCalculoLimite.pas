unit UCalculoLimite;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask;

type
  TFCalculoLimite = class(TForm)
    Label90: TLabel;
    MeTipoCadastro: TMaskEdit;
    Bt12TipoCadastro: TBitBtn;
    EdTipoCadastro: TEdit;
    Label95: TLabel;
    MeClassificacao: TMaskEdit;
    BtClassificacao: TBitBtn;
    EdClassificacao: TEdit;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    Label81: TLabel;
    MECadastro: TMaskEdit;
    BtCadastro: TSpeedButton;
    EdCadastro: TMaskEdit;
    procedure MeTipoCadastroExit(Sender: TObject);
    procedure Bt12TipoCadastroClick(Sender: TObject);
    procedure MeClassificacaoExit(Sender: TObject);
    procedure BtClassificacaoClick(Sender: TObject);
    procedure MECadastroExit(Sender: TObject);
    procedure BtCadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCalculoLimite: TFCalculoLimite;

implementation

uses UTipoCadastro_cl, UTipoCadastroCons, UClassCadastro_cl,
  UClassCadastroCons, UCadastro_cl, UCadastroCons;

{$R *.DFM}

procedure TFCalculoLimite.MeTipoCadastroExit(Sender: TObject);
begin
  If Trim(METipoCadastro.Text) <> '' Then
  With DMTipoCadastro do
  Begin
    QTipoCadastro.Close;
    QTipoCadastro.SetVariable('PK',StrToFloat(Trim(METipoCadastro.Text)));
    QTipoCadastro.Open;
    EdTipoCadastro.Text := QTipoCadastroDesc_Tipo_Cadastro.Text;
  End
  Else
    EdTipoCadastro.Text := 'Todos';

end;

procedure TFCalculoLimite.Bt12TipoCadastroClick(Sender: TObject);
begin
  If FTipoCadastroCons = Nil then
    FTipoCadastroCons := TFTipoCadastroCons.Create(Application);
  If FTipoCadastroCons.ShowModal = mrOk then
  Begin
    METipoCadastro.Text := DMTipoCadastro.QTipoCadastroConsCod_Tipo_Cadastro.Text;
    METipoCadastroExit(Self);
  End;

end;

procedure TFCalculoLimite.MeClassificacaoExit(Sender: TObject);
begin
  If Trim(MEClassificacao.Text) <> '' Then
  With DMClassCadastro do
  Begin
    QClassCadastro.Close;
    QClassCadastro.SetVariable('PK',StrToFloat(MEClassificacao.Text));
    QClassCadastro.Open;
    EdClassificacao.Text := QClassCadastroDesc_Classificacao.Text;
  End
  Else
    EdClassificacao.Text := 'Todos';

end;

procedure TFCalculoLimite.BtClassificacaoClick(Sender: TObject);
begin
  If FClassCadastroCons = Nil then
    FClassCadastroCons := TFClassCadastroCons.Create(Application);
  If FClassCadastroCons.ShowModal = mrOk then
  Begin
    MEClassificacao.Text := DMClassCadastro.QClassCadastroConsCod_Class_Cadastro.Text;
    MEClassificacaoExit(Self);
  End;


end;

procedure TFCalculoLimite.MECadastroExit(Sender: TObject);
begin
 If Trim(MECadastro.Text) <> '' Then
  With DMCadastro do
  Begin
    QCadastro.Close;
    QCadastro.SetVariable('PK',StrToInt(Trim(MECadastro.Text)));
    QCadastro.Open;
    EdCadastro.Text := QCadastroNome.Text;
  End
  Else
    EdCadastro.Text := 'Todos';

end;

procedure TFCalculoLimite.BtCadastroClick(Sender: TObject);
begin
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    MECadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    MECadastroExit(Self);
  End;

end;

end.
