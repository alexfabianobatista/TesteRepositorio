unit UOrdemCompraCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, ExtCtrls, Menus;

type
  TFOrdemCompraCons = class(TFTConsulta)
    Label2: TLabel;
    MEFilial: TMaskEdit;
    Label3: TLabel;
    MEDataI: TMaskEdit;
    BtConsFilial: TBitBtn;
    BtConsCadastro: TBitBtn;
    Bt_OrdemItensCons: TBitBtn;
    RgSituacao: TRadioGroup;
    Label4: TLabel;
    MeNumero: TMaskEdit;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
    procedure Bt_OrdemItensConsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOrdemCompraCons: TFOrdemCompraCons;

implementation

uses UOrdemCompra_cl, UFilialCons, UCadastroCons, UFilial_cl, UCadastro_cl,
  UUsuario_cl, UOrdem_Compra_ItensCons;

{$R *.DFM}

procedure TFOrdemCompraCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMOrdemCompra do
  Begin
//    DmUsuario.Checar_Filial_Usuario( TRIM(FOrdemCompraCons.MEFilial.Text),'COMPRA');
    QOrdemCompraCons.Close;
    QOrdemCompraCons.Sql.Clear;
    QOrdemCompraCons.Sql.Add('SELECT COD_ORDEM_COMPRA_CAB,TB_ORDEM_COMPRA_CAB.COD_FILIAL,');
    QOrdemCompraCons.Sql.Add('TB_ORDEM_COMPRA_CAB.COD_CADASTRO,NUM_ORDEM_COMPRA,');
    QOrdemCompraCons.Sql.Add('TB_ORDEM_COMPRA_CAB.DT_EMISSAO,TB_ORDEM_COMPRA_CAB.IND_CONDICAO_PAGTO,NOME ');
    QOrdemCompraCons.Sql.Add('FROM TB_ORDEM_COMPRA_CAB, TB_CADASTRO WHERE ');
    QOrdemCompraCons.Sql.Add('TB_ORDEM_COMPRA_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO(+) ');
    If Trim(MeTexto.Text) <> '' Then
       QOrdemCompraCons.Sql.Add(' AND TB_ORDEM_COMPRA_CAB.COD_CADASTRO = ' + Trim(MeTexto.Text));
    If Trim(MeNumero.Text) <> '' Then
       QOrdemCompraCons.Sql.Add(' AND TB_ORDEM_COMPRA_CAB.NUM_ORDEM_COMPRA = ' + Trim(MeNumero.Text));
    If Trim(MeFilial.Text) <> '' Then
       QOrdemCompraCons.Sql.Add(' AND TB_ORDEM_COMPRA_CAB.COD_FILIAL = ' + Trim(MeFilial.Text));
    If Trim(MeDataI.Text) <> '//' Then
       QOrdemCompraCons.Sql.Add(' AND TB_ORDEM_COMPRA_CAB.DT_EMISSAO >= ' + chr(39) + Trim(MeDataI.Text) + Chr(39));
    If RgSituacao.ItemIndex <> 2 Then
     Begin
       QOrdemCompraCons.Sql.Add(' AND TB_ORDEM_COMPRA_CAB.COD_ORDEM_COMPRA_CAB IN (SELECT TB_ORDEM_COMPRA_CAB.COD_ORDEM_COMPRA_CAB ');
       QOrdemCompraCons.Sql.Add('FROM TB_ORDEM_COMPRA_CAB, TB_ORDEM_COMPRA_ITEM WHERE ');
       QOrdemCompraCons.Sql.Add('TB_ORDEM_COMPRA_CAB.COD_ORDEM_COMPRA_CAB = TB_ORDEM_COMPRA_ITEM.COD_ORDEM_COMPRA_CAB AND ');
       If RgSituacao.ItemIndex = 0 Then
          QOrdemCompraCons.Sql.Add('QT_PEDIDO - QT_ATENDIDO - QT_CANCELADO > 0)')
       Else
          QOrdemCompraCons.Sql.Add('QT_PEDIDO - QT_ATENDIDO - QT_CANCELADO = 0)');
     End;
    QOrdemCompraCons.Sql.Add(' ORDER BY TB_ORDEM_COMPRA_CAB.DT_EMISSAO');
    QOrdemCompraCons.Open;
  End;
end;



procedure TFOrdemCompraCons.FormCreate(Sender: TObject);
begin
  inherited;
  MEDataI.Text := DateToStr(Date-30);
end;


procedure TFOrdemCompraCons.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    MEFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
end;


procedure TFOrdemCompraCons.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    METexto.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

procedure TFOrdemCompraCons.Bt_OrdemItensConsClick(Sender: TObject);
begin
  inherited;
  With DMOrdemCompra do
  Begin
    QOrdemCompra.Close;
    QItemOC.Close;
    QOrdemCompra.SetVariable('PK',QOrdemCompraConsCod_Ordem_Compra_Cab.Value);
    QOrdemCompra.Open;
    QItemOC.Open;
  End;
  If FOrdem_Compra_ItensCons = Nil then
    FOrdem_Compra_ItensCons := TFOrdem_Compra_ItensCons.Create(Application);
  FOrdem_Compra_ItensCons.ShowModal;
end;

procedure TFOrdemCompraCons.FormActivate(Sender: TObject);
begin
  inherited;
  MEDataI.Text := DateToStr(Date - 180);
end;

end.
