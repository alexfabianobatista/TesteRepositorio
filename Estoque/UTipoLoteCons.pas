unit UTipoLoteCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, ExtCtrls, Menus,
  ComCtrls, ActnList;

type
  TFTipoLoteCons = class(TFTConsulta)
    Label30: TLabel;
    MECodProduto: TMaskEdit;
    SpeedButton11: TSpeedButton;
    MEProduto: TMaskEdit;
    RgEstoque: TRadioGroup;
    Label2: TLabel;
    MeDescricao: TMaskEdit;
    RGProducao: TRadioGroup;
    ActionList1: TActionList;
    StatusBar1: TStatusBar;
    Action1: TAction;
    procedure BtProcurarClick(Sender: TObject);
    procedure MECodProdutoChange(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MeDescricaoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTipoLoteCons: TFTipoLoteCons;

implementation

uses UTipoLote_cl, UOracle_cl, UProdutoCons, UProduto_cl, UParamSistema_cl,
  UImpressoraFiscal;

{$R *.DFM}

procedure TFTipoLoteCons.BtProcurarClick(Sender: TObject);
Var wWhere : Char;
begin
  inherited;
//  If MECodProduto.Text = '' then
//     Raise Exception.Create('Informar Código do Produto');
  With DMTipoLote do
  Begin
    wWhere := 'N';
    QTipoLoteCons.Close;
    QTipoLoteCons.Sql.Clear;
    QTipoLoteCons.Sql.Add('SELECT DISTINCT TB_LOTE_TIPO.COD_LOTE_TIPO ,TB_LOTE_TIPO.DESC_LOTE');
    QTipoLoteCons.Sql.Add(' FROM TB_LOTE_TIPO ');
    If RgEstoque.ItemIndex = 0 Then
     Begin
       wWhere := 'S';
       QTipoLoteCons.Sql.Add(',TB_ESTOQUE WHERE TB_LOTE_TIPO.COD_LOTE_TIPO=TB_ESTOQUE.COD_LOTE_TIPO AND QT_QUANTIDADE > 0');
       If Trim(MECodProduto.Text) <> '' Then
          QTipoLoteCons.Sql.Add(' And TB_ESTOQUE.COD_PRODUTO = ' + Trim(MECodProduto.Text));
     End
    Else
     If Trim(MECodProduto.Text) <> '' Then
      Begin
        wWhere := 'S';
        QTipoLoteCons.Sql.Add(' WHERE TB_LOTE_TIPO.COD_PRODUTO = ' + Trim(MECodProduto.Text));
      End;
    If Trim(MeDescricao.Text) <> '' Then
     Begin
       If wWhere = 'S' Then
          QTipoLoteCons.Sql.Add(' And Desc_Lote like ' + Chr(39)
            + '%' + Trim(MeDescricao.Text) + '%' + Chr(39))
       Else
          QTipoLoteCons.Sql.Add(' Where Desc_Lote like ' + Chr(39)
            + '%' + Trim(MeDescricao.Text) + '%' + Chr(39));
       wWhere := 'S'
     End;
    If RGProducao.ItemIndex = 0 Then
     Begin
       If wWhere = 'S' Then
          QTipoLoteCons.Sql.Add(' And Ind_Tipo_Producao = ' + Chr(39) + 'PROPRIA' + Chr(39))
       Else
          QTipoLoteCons.Sql.Add(' Where Ind_Tipo_Producao = ' + Chr(39) + 'PROPRIA' + Chr(39))
     End
    Else
    Begin
      If RGProducao.ItemIndex = 1 Then
       If wWhere = 'S' Then
          QTipoLoteCons.Sql.Add(' And Ind_Tipo_Producao = ' + Chr(39) + 'TERCEIROS' + Chr(39))
       Else
          QTipoLoteCons.Sql.Add(' Where Ind_Tipo_Producao = ' + Chr(39) + 'TERCEIROS' + Chr(39));
    end;
   
    QTipoLoteCons.Sql.Add(' ORDER BY TB_LOTE_TIPO.DESC_LOTE');
    QTipoLoteCons.Open;
  End;
end;

procedure TFTipoLoteCons.MECodProdutoChange(Sender: TObject);
begin
  inherited;
  if Trim(MECodProduto.text)<>'' then
   Begin
     MEProduto.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+MECodProduto.text,True);
     BtProcurarClick(Self);
   End
  else
    MEProduto.Clear;
end;

procedure TFTipoLoteCons.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOK then
    begin
      MECodProduto.text:=DMProduto.QProdutoConsCOD_PRODUTO.Text;
      MECodProdutoChange(Self);
    end;

end;

procedure TFTipoLoteCons.FormActivate(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'FGLASS')  or (DMParamSistema.CodEmpresa = 'INSIDE') or
     (DMParamSistema.CodEmpresa = 'DISPART') or (DMParamSistema.CodEmpresa = 'ESPINDOLA') or
     (DMParamSistema.CodEmpresa = 'MATRANSP') then
  begin
    RgEstoque.ItemIndex := 1;
    MECodProduto.Text := '';
  end;

end;

procedure TFTipoLoteCons.MeDescricaoChange(Sender: TObject);
begin
  inherited;
  If Trim(MeDescricao.Text) <> '' Then
     BtProcurarClick(Self);
end;

procedure TFTipoLoteCons.FormCreate(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
    StatusBar1.Panels[0].Text := 'MENU FISCAL -> CTRL + ALT + F';
end;

procedure TFTipoLoteCons.Action1Execute(Sender: TObject);
begin
  inherited;
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

end.
