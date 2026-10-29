unit UContratoMensalCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants,
  UFmCadastro, ExtCtrls, Menus;

type
  TFContratoMensalCons = class(TFTConsulta)
    BtConsFilial: TBitBtn;
    RgTipoCadastro: TRadioGroup;
    FmCadastro1: TFmCadastro;
    RgCobranca: TRadioGroup;
    procedure BtConsFilialClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoMensalCons: TFContratoMensalCons;

implementation

uses UOrdemServico_cl, UFilialCons, UFilial_cl;

{$R *.DFM}

procedure TFContratoMensalCons.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    MeTexto.Text := DMFilial.QFilialConsCod_Filial.Text;

end;

procedure TFContratoMensalCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMOrdemServico do
  begin
    QContratoMensalCons.Close;
    If Trim(METexto.Text) = '' Then
      QContratoMensalCons.SetVariable('COD_FILIAL',Null)
    Else
      QContratoMensalCons.SetVariable('COD_FILIAL',METexto.Text);
    If Trim(FmCadastro1.MeCadastro.Text) = '' Then
      QContratoMensalCons.SetVariable('COD_CADASTRO',Null)
    Else
      QContratoMensalCons.SetVariable('COD_CADASTRO',Trim(FmCadastro1.MeCadastro.Text));
    Case RgTipoCadastro.ItemIndex Of
      0 : QContratoMensalCons.SetVariable('IND_SITUACAO','TB_CONTRATO_MENSAL.IND_SITUACAO = ' + QuotedStr('ATIVO'));
      1 : QContratoMensalCons.SetVariable('IND_SITUACAO','TB_CONTRATO_MENSAL.IND_SITUACAO = ' + QuotedStr('INATIVO'));
      2 : QContratoMensalCons.SetVariable('IND_SITUACAO','1 = 1');
    End;
    Case RgCobranca.ItemIndex Of
      0 : QContratoMensalCons.SetVariable('DESC_FORMA_PAGTO','UPPER(TB_CONTRATO_MENSAL.DESC_FORMA_PAGTO) = ' + QuotedStr('ANUAL'));
      1 : QContratoMensalCons.SetVariable('DESC_FORMA_PAGTO','UPPER(TB_CONTRATO_MENSAL.DESC_FORMA_PAGTO) = ' + QuotedStr('MENSAL'));
      2 : QContratoMensalCons.SetVariable('DESC_FORMA_PAGTO','1 = 1');
    End;
    QContratoMensalCons.Open;
  end;

end;

end.
