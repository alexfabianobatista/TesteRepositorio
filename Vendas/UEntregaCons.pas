unit UEntregaCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  UFmFilial, UFmCadastro, ExtCtrls;

type
  TFEntregaCons = class(TFTConsulta)
    MEDtFim: TMaskEdit;
    Label2: TLabel;
    FmFilial1: TFmFilial;
    Label3: TLabel;
    MeDtEntregaIni: TMaskEdit;
    Label4: TLabel;
    MeDtEntregaFim: TMaskEdit;
    FmCadastro1: TFmCadastro;
    FmEntregador: TFmCadastro;
    EdNumPedido: TEdit;
    Label5: TLabel;
    RgSituacao: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
    procedure FmEntregadorBtCadastroClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEntregaCons: TFEntregaCons;

implementation

uses
 UPedido_cl, UCadastroCons, UCadastro_cl, UOracle_cl;

{$R *.dfm}

procedure TFEntregaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMPedido do
  begin
    QEntregaCons.Close;
    if Trim(METexto.Text) <> '' then
      QEntregaCons.SetVariable('DT_EMISSAO_INI', StrToDate(METexto.Text) )
    else
      QEntregaCons.SetVariable('DT_EMISSAO_INI', Null);

    if Trim(MEDtFim.Text) <> '' then
      QEntregaCons.SetVariable('DT_EMISSAO_FIM', StrToDate(MEDtFim.Text) )
    else
      QEntregaCons.SetVariable('DT_EMISSAO_FIM', Null);

    if trim(FmFilial1.MeFilial.Text) = '' then
      QEntregaCons.SetVariable('COD_FILIAL',Null)
    else
      QEntregaCons.SetVariable('COD_FILIAL',StrToInt(trim(FmFilial1.MeFilial.Text)));

    if Trim(MeDtEntregaIni.Text) <> '' then
      QEntregaCons.SetVariable('DT_ENTREGA_INI', StrToDate(MeDtEntregaIni.Text))
    else
      QEntregaCons.SetVariable('DT_ENTREGA_INI',Null);

    if Trim(MeDtEntregaFim.Text) <> '' then
      QEntregaCons.SetVariable('DT_ENTREGA_FIM', StrToDate(MeDtEntregaFim.Text))
    else
      QEntregaCons.SetVariable('DT_ENTREGA_FIM',Null);

    if Trim(FmCadastro1.MeCadastro.Text) <> '' then
      QEntregaCons.SetVariable('COD_CADASTRO', StrToInt(Trim(FmCadastro1.MeCadastro.Text)))
    else
      QEntregaCons.SetVariable('COD_CADASTRO', Null);

    if Trim(FmEntregador.MeCadastro.Text) <> '' then
      QEntregaCons.SetVariable('COD_ENTREGADOR', StrToInt(Trim(FmEntregador.MeCadastro.Text)))
    else
      QEntregaCons.SetVariable('COD_ENTREGADOR', Null);

    if Trim(EdNumPedido.Text) <> '' then
      QEntregaCons.SetVariable('NUM_PEDIDO', StrToInt(Trim(EdNumPedido.Text)))
    else
      QEntregaCons.SetVariable('NUM_PEDIDO', Null);

    case RgSituacao.ItemIndex of
        0: QEntregaCons.SetVariable('SITUACAO', 'P');
        1: QEntregaCons.SetVariable('SITUACAO', 'C');
        2: QEntregaCons.SetVariable('SITUACAO', 'E');
        3: QEntregaCons.SetVariable('SITUACAO', 'R');
        4: QEntregaCons.SetVariable('SITUACAO', Null);
      end;

    QEntregaCons.Open;
  end;
end;

procedure TFEntregaCons.FmEntregadorBtCadastroClick(Sender: TObject);
var
  wTipoCadastro : String;
begin
  inherited;
  wTipoCadastro := DMOracle.FastSelect('COD_TIPO_CADASTRO','TB_TIPO_CADASTRO','DESC_TIPO_CADASTRO = ' + chr(39) + 'ENTREGADOR' + chr(39) );
  if FCadastroCons = Nil then
  begin
    FCadastroCons := TFCadastroCons.Create(Application);
    FCadastroCons.METipoCadastro.Text := wTipoCadastro;
  end;
  FCadastroCons.METipoCadastro.Text := wTipoCadastro;
  if FCadastroCons.ShowModal = mrOk then
  begin
    FCadastroCons.METipoCadastro.Text := wTipoCadastro;
    FmEntregador.MeCadastro.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
    FmEntregador.MeCadastroExit(Sender);
  end;

end;

procedure TFEntregaCons.FormActivate(Sender: TObject);
begin
  inherited;
  DMPedido.QEntregaCons.Close;
  DMPedido.QEntregaCons.ClearVariables;
end;

end.
