unit UContratoJuridicaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls;

type
  TFContratoJuridicaCons = class(TFTConsulta)
    Label3: TLabel;
    MECodFilial: TMaskEdit;
    SpeedButton2: TSpeedButton;
    MEFilial: TMaskEdit;
    RGSituacao: TRadioGroup;
    Label5: TLabel;
    MECodCliente: TMaskEdit;
    Label6: TLabel;
    EdCodProduto: TEdit;
    SpeedButton1: TSpeedButton;
    BtProdutoCons: TSpeedButton;
    MECliente: TMaskEdit;
    EdProdutoDesc: TEdit;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtProdutoConsClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoJuridicaCons: TFContratoJuridicaCons;

implementation

uses UContratoJuridica_cl, UFilialCons, UFilial_cl, UCadastroCons,
  UCadastro_cl, UProdutoCons, UProduto_cl, UUsuario_cl;

{$R *.DFM}

procedure TFContratoJuridicaCons.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = MrOk then
    With DMFilial do
      begin
        MECodFilial.Text:=FloatToStr(QFilialConsCod_Filial.Value);
        //MECodFilialExit(Self);
        MEFilial.Text:= QFilialConsDesc_filial.Value;
      end;

end;

procedure TFContratoJuridicaCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FcadastroCons.ShowModal = MrOk then
    with DmCadastro do
      begin
        MECodCliente.text:=FloatToStr(QCadastroConsCod_Cadastro.Value);
        //MECodClienteExit(Self);
        MECliente.Text:= QCadastroConsNome.Value;
      end;

end;

procedure TFContratoJuridicaCons.BtProdutoConsClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    EdProdutoDesc.Text:=DMProduto.QProdutoConsDesc_Produto.Value;
    EdCodProduto.Text:=FloatToStr(DMProduto.QProdutoConsCod_Produto.Value);
  end;

end;

procedure TFContratoJuridicaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(MECODFILIAL.Text),'AGRICOLA');
  with DMContratoJuridica do
    begin
      QContratoCompraJuridicaCons.Close;
      if Trim(MEtexto.Text)<>'' then
        QContratoCompraJuridicaCons.SetVariable('NUM_CONTRATO',MEtexto.Text)
      else
        QContratoCompraJuridicaCons.SetVariable('NUM_CONTRATO',Null);

      if Trim(MECodFilial.Text)<>'' then
        QContratoCompraJuridicaCons.SetVariable('COD_FILIAL',MECODFILIAL.Text)
      else
        QContratoCompraJuridicaCons.SetVariable('COD_FILIAL',Null);
      if Trim(MECodCliente.Text)<>'' then
        QContratoCompraJuridicaCons.SetVariable('COD_CADASTRO',MECODCliente.Text)
      else
        QContratoCompraJuridicaCons.SetVariable('COD_CADASTRO',Null);
      if Trim(EDCodProduto.Text)<>'' then
        QContratoCompraJuridicaCons.SetVariable('COD_PRODUTO',EDCodProduto.Text)
      else
        QContratoCompraJuridicaCons.SetVariable('COD_PRODUTO',Null);
      Case RgSituacao.ItemIndex Of
        0 : QContratoCompraJuridicaCons.SetVariable('IND_SITUACAO','ABERTO');
        1 : QContratoCompraJuridicaCons.SetVariable('IND_SITUACAO','FECHADO');
        2 : QContratoCompraJuridicaCons.SetVariable('IND_SITUACAO',Null);
      End;
      
      QContratoCompraJuridicaCons.Open;
    end;

end;

end.
