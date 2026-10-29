unit UContrato_PJuridicaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants,
  Menus;

type
  TFContrato_PJuridicaCons = class(TFTConsulta)
    GroupBox5: TGroupBox;
    Label64: TLabel;
    Label65: TLabel;
    MeDtInicial: TMaskEdit;
    MeDtFinal: TMaskEdit;
    Label2: TLabel;
    MEFilial: TMaskEdit;
    SBFilial: TSpeedButton;
    Label4: TLabel;
    MEProduto: TMaskEdit;
    SBProduto: TSpeedButton;
    Label3: TLabel;
    MECliente: TMaskEdit;
    SBCliente: TSpeedButton;
    Label5: TLabel;
    MECorretora: TMaskEdit;
    SBCorretora: TSpeedButton;
    RgMercado: TRadioGroup;
    MENumContrato: TMaskEdit;
    EdFilial: TEdit;
    EdProduto: TEdit;
    EdCliente: TEdit;
    EdCorretora: TEdit;
    RgTipoPreco: TRadioGroup;
    RGSituacao: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
    procedure SBFilialClick(Sender: TObject);
    procedure SBClienteClick(Sender: TObject);
    procedure SBProdutoClick(Sender: TObject);
    procedure SBCorretoraClick(Sender: TObject);
    procedure MEFilialExit(Sender: TObject);
    procedure MEProdutoExit(Sender: TObject);
    procedure MEClienteExit(Sender: TObject);
    procedure MECorretoraExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContrato_PJuridicaCons: TFContrato_PJuridicaCons;

implementation

uses UContrato_Pjuridica_cl, UUsuario_cl, UFilialCons, UCadastroCons,
  UProdutoCons, UOracle_cl, UFilial_cl, UProduto_cl, UCadastro_cl;

{$R *.DFM}

procedure TFContrato_PJuridicaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(MEFILIAL.Text),'AGRICOLA');
  with DMContrato_PJuridica do
    begin
      QContratoPJuridicaCons.Close;
      if Trim(MeNumContrato.Text)<>'' then
        QContratoPJuridicaCons.SetVariable('NUM_CONTRATO',MeNumContrato.Text)
      else
        QContratoPJuridicaCons.SetVariable('NUM_CONTRATO',Null);
      if Trim(MeFilial.Text)<>'' then
        QContratoPJuridicaCons.SetVariable('COD_FILIAL',MeFILIAL.Text)
      else
        QContratoPJuridicaCons.SetVariable('COD_FILIAL',Null);
      if Trim(MeCliente.Text)<>'' then
        QContratoPJuridicaCons.SetVariable('COD_CADASTRO',MeCliente.Text)
      else
        QContratoPJuridicaCons.SetVariable('COD_CADASTRO',Null);
      if Trim(MeProduto.Text)<>'' then
        QContratoPJuridicaCons.SetVariable('COD_PRODUTO',MeProduto.Text)
      else
        QContratoPJuridicaCons.SetVariable('COD_PRODUTO',Null);
      if Trim(MeCorretora.Text)<> '' then
        QContratoPJuridicaCons.SetVariable('COD_CORRETORA',MeCorretora.Text)
      else
        QContratoPJuridicaCons.SetVariable('COD_CORRETORA',NULL);
      if Trim(MeDtInicial.Text)<> '' then
        QContratoPJuridicaCons.SetVariable('DT_INICIAL',MeDtInicial.Text)
      else
        QContratoPJuridicaCons.SetVariable('DT_INICIAL',NULL);
      if Trim(MeDtFinal.Text)<> '' then
        QContratoPJuridicaCons.SetVariable('DT_FINAL',MeDtFinal.Text)
      else
        QContratoPJuridicaCons.SetVariable('DT_FINAL',NULL);
   
      Case RgMercado.ItemIndex Of
        0 : QContratoPJuridicaCons.SetVariable('IND_TIPO_MERCADO','INTERNO');
        1 : QContratoPJuridicaCons.SetVariable('IND_TIPO_MERCADO','EXTERNO');
        2 : QContratoPJuridicaCons.SetVariable('IND_TIPO_MERCADO','EXPORTACAO');
        3 : QContratoPJuridicaCons.SetVariable('IND_TIPO_MERCADO',NULL);
      End;
      Case RgTipoPreco.ItemIndex Of
        0 : QContratoPJuridicaCons.SetVariable('IND_TIPO_PRECO','FIXO');
        1 : QContratoPJuridicaCons.SetVariable('IND_TIPO_PRECO','FIXAR');
        2 : QContratoPJuridicaCons.SetVariable('IND_TIPO_PRECO',Null);
      End;
      QContratoPJuridicaCons.SQL[QContratoPJuridicaCons.SQL.Count-1] := '';
      Case RgSituacao.ItemIndex Of
        0 : QContratoPJuridicaCons.Sql.Add(' And TB_CONTRATO_PJURIDICA.SALDO_NF_EMBARQUE > 0');
        1 : QContratoPJuridicaCons.Sql.Add(' And TB_CONTRATO_PJURIDICA.SALDO_NF_EMBARQUE = 0');
      End;
      QContratoPJuridicaCons.Open;
    end;
end;

procedure TFContrato_PJuridicaCons.SBFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.Showmodal = mrOk then
   Begin
     MeFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
     MeFilialExit(Self);
   End;
end;

procedure TFContrato_PJuridicaCons.SBClienteClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
   Begin
     MeCliente.Text:=DMCadastro.QCadastroConsCod_Cadastro.Text;
     MeClienteExit(Self);
   end;
end;

procedure TFContrato_PJuridicaCons.SBProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
   Begin
     MeProduto.Text := DMProduto.QProdutoConsCod_Produto.Text;
     MEProdutoExit(Self);
   End;
end;

procedure TFContrato_PJuridicaCons.SBCorretoraClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons  = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
   Begin
     MeCorretora.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
     MeCorretoraExit(Self);
   End;
end;

procedure TFContrato_PJuridicaCons.MEFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(MEFilial.Text)<>'' then
    EdFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MEFilial.text)
  else
    EdFilial.Text :='Todos';

end;

procedure TFContrato_PJuridicaCons.MEProdutoExit(Sender: TObject);
begin
  inherited;
  if trim(MEProduto.text)<>'' then
    EdProduto.text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+MEProduto.text)
  else
    EdProduto.Text:='Todos';
end;

procedure TFContrato_PJuridicaCons.MEClienteExit(Sender: TObject);
begin
  inherited;
  if trim(MECliente.text)<>'' then
    EdCliente.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECliente.text)
  else
    EdCliente.Text:='Todos';

end;

procedure TFContrato_PJuridicaCons.MECorretoraExit(Sender: TObject);
begin
  inherited;
  if Trim(MECorretora.text)<>'' then
    EdCorretora.text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECorretora.Text)
  else
    EdCorretora.Text:='Todos';

end;

end.
