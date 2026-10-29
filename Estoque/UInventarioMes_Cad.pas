unit UInventarioMes_Cad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, DBDirceu, ActnList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFInventarioMes_Cad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    SbFilial: TSpeedButton;
    SbLote: TSpeedButton;
    SbProduto: TSpeedButton;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    RelalrioInventrioMs1: TMenuItem;
    procedure SbFilialClick(Sender: TObject);
    procedure SbProdutoClick(Sender: TObject);
    procedure SbLoteClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure RelalrioInventrioMs1Click(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FInventarioMes_Cad: TFInventarioMes_Cad;

implementation

uses UInventarioMes_cl, UFilialCons, UProdutoCons, UTipoLoteCons, UParamSistema_cl,
  UInventarioMes_Cons, UFilial_cl, UProduto_cl, UTipoLote_cl, UOracle_cl,
  UEstoqueParam, UREstoqueInventarioMes, UEstoque_cl;

{$R *.dfm}

procedure TFInventarioMes_Cad.SbFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=mrOk then
     DMInventarioMes.QInventarioMes_CadCod_Filial.VAlue:=DMFilial.QFilialConsCod_Filial.Value;

end;

procedure TFInventarioMes_Cad.SbProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons:=TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal=mrOk then
     DMInventarioMes.QInventarioMes_CadCod_Produto.Value:=DMProduto.QProdutoConsCod_Produto.Value;

end;

procedure TFInventarioMes_Cad.SbLoteClick(Sender: TObject);
begin
  inherited;
  if FTipoLoteCons = Nil then
    FTipoLoteCons:=TFTipoLoteCons.Create(Application);
  if FTipoLoteCons.ShowModal=mrOk then
     DMInventarioMes.QInventarioMes_CadCod_Lote_Tipo.Value:=DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Value;

end;

procedure TFInventarioMes_Cad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FInventarioMes_Cons = Nil Then
     FInventarioMes_Cons := TFInventarioMes_Cons.Create(Application);
  If FInventarioMes_Cons.ShowModal = MrOk Then
   Begin
     DMInventarioMes.QInventarioMes_Cad.Close;
     DMInventarioMes.QInventarioMes_Cad.SetVariable('Pk',DMInventarioMes.QInventarioMes_ConsCod_Estoque_Inventario.Value);
     DMInventarioMes.QInventarioMes_Cad.Open;
   End;  
end;

procedure TFInventarioMes_Cad.FormActivate(Sender: TObject);
begin
  inherited;
  DMInventarioMes.QInventarioMes_Cad.open;
end;

procedure TFInventarioMes_Cad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMInventarioMes.QInventarioMes_Cad.Close;
end;

procedure TFInventarioMes_Cad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SbFilial.Enabled := DSPrimario.State in [DsEdit,DsInsert];
  SbProduto.Enabled := DSPrimario.State in [DsEdit,DsInsert];
  SbLote.Enabled := DSPrimario.State in [DsEdit,DsInsert];
end;

procedure TFInventarioMes_Cad.RelalrioInventrioMs1Click(Sender: TObject);
var wClasses: String;
i: Integer;
begin
  inherited;
  if FEstoqueParam=nil then
    FEstoqueParam:=TFEstoqueParam.Create(Application);
  FEstoqueParam.PGRelatorio.Pages[15].TabVisible:=true;
  if FEstoqueParam.ShowModal = MrOk then
    begin
      With DMInventarioMes do
        Begin
          QRInventarioMes.Close;
          If Trim(FEstoqueParam.Fm15Filial.MeFilial.Text)<>'' then
            QRInventarioMes.SetVariable('COD_FILIAL',FEstoqueParam.Fm15Filial.MeFilial.text)
          Else
            QRInventarioMes.SetVariable('COD_FILIAL',Null);

          If Trim(FEstoqueParam.Fm15Ncm.MeNcm.Text)<>'' then
            QRInventarioMes.SetVariable('NCM',Trim(FEstoqueParam.Fm15Ncm.MeNcm.text))
          Else
            QRInventarioMes.SetVariable('NCM',Null);

          Try
            QRInventarioMes.SetVariable('Num_Ano',Trim(FEstoqueParam.Me15Ano.Text));
            QRInventarioMes.SetVariable('Num_Mes',Trim(FEstoqueParam.Me15Mes.Text));
          Except
            raise Exception.Create('Informe Ano e Mês!');
          end;

          wClasses := '(';
          If FEstoqueParam.M2Classes.Lines[0] = '' then
            QRInventarioMes.SetVariable('CLASSE_INICIAL', '1 = 1')
          else
          begin
            for i := 0 to FEstoqueParam.M2Classes.Lines.Count do
              wClasses := wClasses + FEstoqueParam.M2Classes.Lines[i] + ',';
            wClasses := Copy(wClasses, 1, Length(wClasses) - 3) + ')';
            QRInventarioMes.SetVariable('CLASSE_INICIAL', 'TB_CLASSE.NUM_CLASSE IN ' + wClasses);
          end;

          if FEstoqueParam.rg15Produto.ItemIndex = 0 then
            QRInventarioMes.SetVariable('IND_CODIGO','SISTEMA')
          else
            QRInventarioMes.SetVariable('IND_CODIGO','FABRICANTE');

          if FEstoqueParam.CB15TipoProduto.Text = 'TODOS' then
            QRInventarioMes.SetVariable('TIPO', Null)
          else
            QRInventarioMes.SetVariable('TIPO', FEstoqueParam.CB15TipoProduto.Text);

          if FEstoqueParam.RG15Estoque.ItemIndex = 0 then
            QRInventarioMes.SetVariable('ESTOQUE', '1=1')
          else
            QRInventarioMes.SetVariable('ESTOQUE','TB_PRODUTO.IND_TIPO_PRODUTO NOT IN ('+ QuotedStr('IMOBILIZAD') + ',' + QuotedStr('IMOBILIZADO')+ ',' + QuotedStr('CONSUMO')+')');

          case FEstoqueParam.CB15Situacao.ItemIndex of
            0: QRInventarioMes.SetVariable('SITUACAO', Null);
            1: QRInventarioMes.SetVariable('SITUACAO', 'ATIVO');
            2: QRInventarioMes.SetVariable('SITUACAO', 'DESATIVADO');
            3: QRInventarioMes.SetVariable('SITUACAO', 'FORA DE LINHA');
          end;

          QRInventarioMes.SQL[QRInventarioMes.SQL.Count-1]:='';  // elimina a última Linha da SQL
          case FEstoqueParam.Cb15Ordem.ItemIndex of
            0:QRInventarioMes.SQL.Add('ORDER BY Tb_produto.COD_PRODUTO');
            1:QRInventarioMes.SQL.Add('ORDER BY Tb_produto.DESC_PRODUTO');
          end;

          If Trim(FEstoqueParam.Fm15Lote.MeLote.Text)<>'' then
            QRInventarioMes.SetVariable('COD_LOTE_TIPO',FEstoqueParam.Fm15Lote.MeLote.text)
          Else
            QRInventarioMes.SetVariable('COD_LOTE_TIPO',Null);

          QRInventarioMes.Open;

          if FREstoqueInventarioMes=nil then
             FREstoqueInventarioMes:=TFREstoqueInventarioMes.Create(Application);

          if FEstoqueParam.rg15Estoque.ItemIndex = 0 then
            FREstoqueInventarioMes.QRLTitulo.Caption := 'Relatório Inventário Mês ' + Trim(FEstoqueParam.Me15Ano.Text)+'/'+Trim(FEstoqueParam.Me15Mes.Text)
          else
            FREstoqueInventarioMes.QRLTitulo.Caption := 'Relatório Inventário Mês Para o SPED ' + Trim(FEstoqueParam.Me15Ano.Text)+'/'+Trim(FEstoqueParam.Me15Mes.Text);
          FREstoqueInventarioMes.QRLFilial.Caption := FEstoqueParam.Fm15Filial.EdFilial.text;
          FREstoqueInventarioMes.QRLSituacao.Caption := FEstoqueParam.CB15Situacao.Text;
          FREstoqueInventarioMes.QRLTipoProduto.Caption := FEstoqueParam.CB15TipoProduto.Text;
          DMEstoque.pNrPagina := StrToInt(Trim(FEstoqueParam.Me15Pagina.Text));
          FREstoqueInventarioMes.wPagina := StrToInt(Trim(FEstoqueParam.Me15Pagina.Text));

          if (DMParamSistema.CodEmpresa = 'IRRIGASOLO') then
          begin
            FREstoqueInventarioMes.QRLabel4.Caption := 'Unid.';
            FREstoqueInventarioMes.QRDBText2.DataField := 'DESC_UNIDADE';
          end;

          if FEstoqueParam.RGPreview.ItemIndex=0 then
            FREstoqueInventarioMes.QRPrimario.Preview
          else
          begin
            FREstoqueInventarioMes.QRPrimario.Print;
            QRInventarioMes.Close;
          end;
        end; //End With
    end;
end;

procedure TFInventarioMes_Cad.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit2.Text);
end;

end.
