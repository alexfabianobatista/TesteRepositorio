unit UProprietarioCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants, Menus;

type
  TFProprietarioCons = class(TFTConsulta)
    Label2: TLabel;
    EDCodigo: TEdit;
    Label3: TLabel;
    MeCnpj: TMaskEdit;
    Label5: TLabel;
    METipoCadastro: TMaskEdit;
    BtConsTipoCadastro: TBitBtn;
    procedure BtProcurarClick(Sender: TObject);
    procedure BtConsTipoCadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProprietarioCons: TFProprietarioCons;

implementation

uses UProprietario_cl, UTipoCadastro_cl, UTipoCadastroCons;

{$R *.DFM}

procedure TFProprietarioCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMProprietario do
  Begin
    QProprietarioCons.Close;
    if MEtexto.text <> '' then
      QProprietarioCons.SetVariable('Descricao',METexto.Text)
    else
      QProprietarioCons.SetVariable('Descricao', Null);
    if EdCodigo.text <> '' then
       QProprietarioCons.SetVariable('Cod_proprietario',StrToInt(EdCodigo.Text))
    else
       QProprietarioCons.SetVariable('Cod_proprietario',Null);
    if MeCnpj.text <> '' then
       QProprietarioCons.SetVariable('NUM_CNPJ_CGC',Trim(MeCnpj.Text))
    else
       QProprietarioCons.SetVariable('NUM_CNPJ_CGC',Null);

    if trim(METipoCadastro.Text) <> '' then
      QproprietarioCons.SetVariable('COD_TIPO_CADASTRO', StrToInt(Trim(METipoCadastro.Text)))
    else
      QProprietarioCons.SetVariable('COD_TIPO_CADASTRO', null);

    QProprietarioCons.Open;
  End;
end;

procedure TFProprietarioCons.BtConsTipoCadastroClick(Sender: TObject);
begin
  inherited;
  if FTipoCadastroCons = nil then
    FTipoCadastroCons := TFTipoCadastroCons.Create(Application);
  if FTipoCadastroCons.ShowModal = mrOk then
    METipoCadastro.Text := DMTipoCadastro.QTipoCadastroConsCod_Tipo_Cadastro.Text;
end;

end.
