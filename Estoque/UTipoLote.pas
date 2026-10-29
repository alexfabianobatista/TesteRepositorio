unit UTipoLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, ImgList, OracleNavigator, variants, ActnList, DBPanel,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFTipoLoteCad = class(TFTCadSimples)
    TipodeLote1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    DBCheckBox1: TDBCheckBox;
    OracleNavigator1: TOracleNavigator;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    RelatorioMovimentoPorLote1: TMenuItem;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel5: TDBPanel;
    DBPanel6: TDBPanel;
    DBPanel7: TDBPanel;
    DBPanel8: TDBPanel;
    DBPanel9: TDBPanel;
    DBPanel10: TDBPanel;
    DBPanel11: TDBPanel;
    DBPanel12: TDBPanel;
    DBPanel13: TDBPanel;
    DBPanel14: TDBPanel;
    DBPanel15: TDBPanel;
    DBPanel16: TDBPanel;
    DBPanel17: TDBPanel;
    DBPanel18: TDBPanel;
    DBPanel19: TDBPanel;
    DBPanel20: TDBPanel;
    DBPanel21: TDBPanel;
    DBPanel22: TDBPanel;
    DBPanel23: TDBPanel;
    DBPanel24: TDBPanel;
    DBPanel25: TDBPanel;
    DBPanel26: TDBPanel;
    DBPanel27: TDBPanel;
    DBPanel29: TDBPanel;
    DBPanel30: TDBPanel;
    DBPanel31: TDBPanel;
    DBPanel28: TDBPanel;
    DBPanel32: TDBPanel;
    DBPanel33: TDBPanel;
    DBPanel34: TDBPanel;
    DBMObservacao: TDBMemo;
    Label1: TLabel;
    DBPanel3: TDBPanel;
    DBPanel35: TDBPanel;
    ProdutosXLoteXVencimento1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure TipodeLote1Click(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBHelpClick(Sender: TObject);
    procedure RelatorioMovimentoPorLote1Click(Sender: TObject);
    procedure DBPanel4DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel7DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure OracleNavigator1Click(Sender: TObject;
      Button: TOracleNavigateBtn);
    procedure ProdutosXLoteXVencimento1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTipoLoteCad: TFTipoLoteCad;

implementation

uses UTipoLote_cl, UTipoLoteCons, UTipoLoteParam, URTipoLote, UProdutoCons,
  UProduto_cl, UrMovimentoPorLote, UCadastroCons, UCadastro_cl, URVencimentoPorLote,
  UParamSistema_cl;

{$R *.DFM}

procedure TFTipoLoteCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMTipoLote do
  Begin
    QTipoLote.Open;
    QClaspar.Open;
  End;

end;

procedure TFTipoLoteCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FTipoLoteCons = Nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  if FTipoLoteCons.ShowModal = mrOk then
  with DMTipoLote do
  begin
    QTipoLote.Close;
    QTipoLote.SetVariable('PK',QTipoLoteConsCod_Lote_Tipo.Value);
    QTipoLote.Open;
  end;
end;

procedure TFTipoLoteCad.TipodeLote1Click(Sender: TObject);
begin
  inherited;
  If FTipoLoteParam=Nil then
    FTipoLoteParam:=TFTipoLoteParam.Create(Application);
  FTipoLoteParam.PGRelatorio.Pages[0].TabVisible:=true;
  If FTipoLoteParam.Showmodal= mrOk then
    Begin
    DMTipoLote.QRTipoLote.Close;
      If FRTipoLote=Nil then
        FRTipoLote:=TFRTipoLote.Create(Application);
      if (DMParamSistema.CodEmpresa = 'GOLDEN') then
      begin
        if (trim(FTipoLoteParam.Me1Dt_Vencimento.Text) <> '') then
          DMTipoLote.QRTipoLote.SetVariable('DT_VENCIMENTO',trim(FTipoLoteParam.Me1Dt_Vencimento.Text))
        else
          DMTipoLote.QRTipoLote.SetVariable('DT_VENCIMENTO', Null);
      end;
      DMTipoLOte.QRTipoLote.Open;
    If FTipoLoteParam.RGPreview.ItemIndex=0 then
      FRTipoLote.QRPrimario.Preview
    Else
      FRTipoLote.QRPrimario.Print;
    End;
end;

procedure TFTipoLoteCad.SBConfirmarClick(Sender: TObject);
Var
  wCodigo:real;
begin
  wCodigo:=DMTipoLote.QTipoLoteCod_Lote_Tipo.Value;
  inherited;
  DMTipoLote.QTipoLote.Close;
  DMTipoLote.QTipoLote.SetVariable('PK',wCodigo);
  DMTipoLote.QTipoLote.Open;
end;

procedure TFTipoLoteCad.SBCancelarClick(Sender: TObject);
Var
  wCodigo:real;
begin
  wCodigo:=DMTipoLote.QTipoLoteCod_Lote_Tipo.Value;
  inherited;
  DMTipoLote.QTipoLote.Close;
  DMTipoLote.QTipoLote.SetVariable('PK',wCodigo);
  DMTipoLote.QTipoLote.Open;
end;

procedure TFTipoLoteCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  If DMTipoLote.QClaspar.State in [dsEdit,dsInsert] then
    Raise Exception.Create('Dados ainda não confirmados!');
  With DMTipoLote do
  Begin
    QTipoLote.Close;
    QClaspar.Close;
  End;
  Action := CaFree;
  FTipoLoteCad := Nil;
end;

procedure TFTipoLoteCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(5);
end;

procedure TFTipoLoteCad.RelatorioMovimentoPorLote1Click(Sender: TObject);
begin
  inherited;
  If FTipoLoteParam=Nil then
    FTipoLoteParam:=TFTipoLoteParam.Create(Application);
  FTipoLoteParam.PGRelatorio.Pages[1].TabVisible:=true;
  If FTipoLoteParam.Showmodal= mrOk then
   Begin
     DMTipoLote.QRMovimentoPorLote.Close;
     If Trim(FTipoLoteParam.Me1Filial.Text) <> '' Then
        DMTipoLote.QRMovimentoPorLote.SetVariable('Cod_Filial',Trim(FTipoLoteParam.Me1Filial.Text))
     Else
        DMTipoLote.QRMovimentoPorLote.SetVariable('Cod_Filial',Null);
     If Trim(FTipoLoteParam.Me1Produto.Text) <> '' Then
        DMTipoLote.QRMovimentoPorLote.SetVariable('Cod_Produto',Trim(FTipoLoteParam.Me1Produto.Text))
     Else
        DMTipoLote.QRMovimentoPorLote.SetVariable('Cod_Produto',Null);
     DMTipoLote.QRMovimentoPorLote.SetVariable('Data_I',Trim(FTipoLoteParam.Me1Data_I.Text));
     DMTipoLote.QRMovimentoPorLote.SetVariable('Data_F',Trim(FTipoLoteParam.Me1Data_F.Text));
     If FrMovimentoPorLote=Nil then
        FrMovimentoPorLote:=TFrMovimentoPorLote.Create(Application);
     FrMovimentoPorLote.QRLPeriodo.Caption := 'De:'+ Trim(FTipoLoteParam.Me1Data_I.Text) + ' Até:'+Trim(FTipoLoteParam.Me1Data_F.Text);
     DMTipoLote.QRMovimentoPorLote.Open;
     If FTipoLoteParam.RGPreview.ItemIndex=0 then
       FrMovimentoPorLote.QRPrimario.Preview
     Else
       FrMovimentoPorLote.QRPrimario.Print;
   End;

end;

procedure TFTipoLoteCad.DBPanel4DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FProdutoCons;
  Classe := TFProdutoCons;
end;

procedure TFTipoLoteCad.DBPanel7DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFTipoLoteCad.OracleNavigator1Click(Sender: TObject;
  Button: TOracleNavigateBtn);
begin
  inherited;
  if (Button = nbPost) and (not ValidaCampos(Self, DMTipoLote.DSClaspar)) then
    Abort;
end;

procedure TFTipoLoteCad.ProdutosXLoteXVencimento1Click(Sender: TObject);
var
 wOrdem, wTipoProduto, wQuantidade: String;
begin
  inherited;
  If FTipoLoteParam=Nil then
    FTipoLoteParam:=TFTipoLoteParam.Create(Application);
  FTipoLoteParam.PGRelatorio.Pages[2].TabVisible:=true;
  If FTipoLoteParam.Showmodal= mrOk then
  begin
    with DMTipoLote do
    begin
      QRLoteVencimentoProduto.Close;
      if (trim(FTipoLoteParam.FmLote2.MeLote.Text) <> '') then
        QRLoteVencimentoProdutoCOD_LOTE_TIPO.Text := trim(FTipoLoteParam.FmLote2.EdLote.Text)
      else
        QRLoteVencimentoProduto.SetVariable('COD_LOTE_TIPO',null);
      if (FTipoLoteParam.Me2DtVencimentoI.Text <> '') then
        QRLoteVencimentoProduto.SetVariable('DT_VENCIMENTO_I',StrToDate(FTipoLoteParam.Me2DtVencimentoI.Text))
      else
        QRLoteVencimentoProduto.SetVariable('DT_VENCIMENTO_I',null);
      if (FTipoLoteParam.Me2DtVencimentoF.Text <> '') then
        QRLoteVencimentoProduto.SetVariable('DT_VENCIMENTO_F',StrToDate(FTipoLoteParam.Me2DtVencimentoF.Text))
      else
        QRLoteVencimentoProduto.SetVariable('DT_VENCIMENTO_F',null);
      if trim(FTipoLoteParam.FmSubClasse2Inicial.MeClasse.Text) <> '' then
        QRLoteVencimentoProduto.SetVariable('CLASSE_INICIAL', trim(FTipoLoteParam.FmSubClasse2Inicial.MeClasse.Text))
      else
        QRLoteVencimentoProduto.SetVariable('CLASSE_INICIAL',null);
      if trim(FTipoLoteParam.FmSubClasse2Inicial.MeSubClasse.Text) <> '' then
        QRLoteVencimentoProduto.SetVariable('SUBCLASSE_INICIAL',trim(FTipoLoteParam.FmSubClasse2Inicial.MeSubClasse.Text))
      else
        QRLoteVencimentoProduto.SetVariable('SUBCLASSE_INICIAL',null);
      if trim(FTipoLoteParam.FmSubClasse2Final.MeClasse.Text) <> '' then
        QRLoteVencimentoProduto.SetVariable('CLASSE_FINAL',trim(FTipoLoteParam.FmSubClasse2Final.MeClasse.Text))
      else
        QRLoteVencimentoProduto.SetVariable('CLASSE_FINAL',null);
      if trim(FTipoLoteParam.FmSubClasse2Final.MeSubClasse.Text) <> '' then
        QRLoteVencimentoProduto.SetVariable('SUBCLASSE_FINAL',trim(FTipoLoteParam.FmSubClasse2Final.MeSubClasse.Text))
      else
        QRLoteVencimentoProduto.SetVariable('SUBCLASSE_FINAL',null);
      if trim(FTipoLoteParam.CB2TipoProduto.Text) <> '' then
      begin
        QRLoteVencimentoProduto.SetVariable('TIPO_PRODUTO',FTipoLoteParam.CB2TipoProduto.Text);
        wTipoProduto:= FTipoLoteParam.CB2TipoProduto.Text;
      end
      else
      begin
        QRLoteVencimentoProduto.SetVariable('TIPO_PRODUTO',null);
        wTipoProduto:= 'Todos';
      end;
      case FTipoLoteParam.RGEstoqueLote.ItemIndex of
        0:
          begin
            QRLoteVencimentoProduto.SetVariable('ESTOQUE', 'Tb_Estoque.Qt_Quantidade > 0');
            wQuantidade := 'Sim.';
          end;
        1:
          begin
            QRLoteVencimentoProduto.SetVariable('ESTOQUE', 'Tb_Estoque.Qt_Quantidade = 0');
            wQuantidade := 'Não.';
          end;
        2:
          begin
            QRLoteVencimentoProduto.SetVariable('ESTOQUE', '1 = 1');
            wQuantidade := 'Todos.';
          end;

      end;      
{Remove a ultima linha da Sql para ajustar a ordem conforme selecionado na tela.}        
      QRLoteVencimentoProduto.SQL[QRLoteVencimentoProduto.SQL.Count - 1] := '';
      if FTipoLoteParam.RG2Ordem.ItemIndex = 0 then
      begin
        QRLoteVencimentoProduto.SQL.Add('ORDER BY TB_LOTE_TIPO.DT_VENCIMENTO, TB_PRODUTO.COD_PRODUTO');
        wOrdem:= 'Código Produto';
      end;
      if FTipoLoteParam.RG2Ordem.ItemIndex = 1 then
      begin
        QRLoteVencimentoProduto.SQL.Add('ORDER BY TB_LOTE_TIPO.DT_VENCIMENTO, TB_PRODUTO.DESC_PRODUTO');
        wOrdem:= 'Descrição Produto';
      end;
      if FTipoLoteParam.RG2Ordem.ItemIndex = 2 then
      begin
        QRLoteVencimentoProduto.SQL.Add('ORDER BY TB_LOTE_TIPO.DT_VENCIMENTO, TB_LOTE_TIPO.COD_LOTE_TIPO');
        wOrdem:= 'Código do Lote';
      end;
      if FrVencimentoPorLote = Nil then
        FrVencimentoPorLote := TFrVencimentoPorLote.Create(Application);
      FrVencimentoPorLote.QRLTitulo.Caption := ' Relatório de Produtos por Data de Vencimento do Lote';
      FrVencimentoPorLote.QRLPeriodo.Caption := 'De: ' + Trim(FTipoLoteParam.Me2DtVencimentoI.Text) + ' Até: ' + Trim(FTipoLoteParam.Me2DtVencimentoF.Text) +
                                                 ', Lote: ' + Trim(FTipoLoteParam.FmLote2.EdLote.Text) + ', Ordenado por: ' + wOrdem + ', SubClasse Inicial: ' +
                                                 trim(FTipoLoteParam.FmSubClasse2Inicial.EdClasse.Text) + ', SubClasse Final: ' + trim(FTipoLoteParam.FmSubClasse2Final.EdClasse.Text)
                                                 + ', Tipo de Produto: ' + wTipoProduto + ', Produto com Estoque: ' + wQuantidade;
      QRLoteVencimentoProduto.Open;
      if FTipoLoteParam.RGPreview.ItemIndex = 0 then
        FrVencimentoPorLote.QRPrimario.Preview
      else
        FrVencimentoPorLote.QRPrimario.Print;
    end;
  end;

end;

end.
