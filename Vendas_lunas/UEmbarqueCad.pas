unit UEmbarqueCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, clipbrd, variants;

type
  TFEmbarqueCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
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
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBEdit9: TDBEdit;
    BtConsTransportador: TBitBtn;
    BtConsPedido: TBitBtn;
    Carga1: TMenuItem;
    Acerto1: TMenuItem;
    EmbarqueNotaFiscal1: TMenuItem;
    Label9: TLabel;
    DBEdit10: TDBEdit;
    Label10: TLabel;
    DBEdit11: TDBEdit;
    EmbarquesCondioPagto1: TMenuItem;
    RotadeEntrega1: TMenuItem;
    Label11: TLabel;
    DBEdit12: TDBEdit;
    SubstituioTributaria1: TMenuItem;
    Opes1: TMenuItem;
    EmissoNotas1: TMenuItem;
    LBParcela: TListBox;
    ConsultaEmbarquePelaNota1: TMenuItem;
    ExcluiProdutodoPedidodeUmEmbarque1: TMenuItem;
    DBRadioGroup1: TDBRadioGroup;
    RelaodeCargas1: TMenuItem;
    BaixaEstoquePeloEmbarque1: TMenuItem;
    Label12: TLabel;
    DBEdit13: TDBEdit;
    DataSource2: TDataSource;
    RelaoTotalPorPedidos1: TMenuItem;
    VoltaEstoquepeloEmbarque1: TMenuItem;
    RelaoBaixadoporData1: TMenuItem;
    RelProdutosEmbarcados1: TMenuItem;
    DBEdit14: TDBEdit;
    Label13: TLabel;
    EmbarqueNotaFiscaltxt1: TMenuItem;
    Label14: TLabel;
    DBEdit15: TDBEdit;
    EmbarqueporCliente1: TMenuItem;
    PosioEstoqueEmbarque1: TMenuItem;
    BloquearEmbarque1: TMenuItem;
    DesbloquearPedido1: TMenuItem;
    TabSheet3: TTabSheet;
    Label16: TLabel;
    DBEdit17: TDBEdit;
    Label17: TLabel;
    DBEdit18: TDBEdit;
    Label20: TLabel;
    DBEdit21: TDBEdit;
    DBRadioGroup2: TDBRadioGroup;
    N2: TMenuItem;
    GeraContasaPagar1: TMenuItem;
    ExcluiContasaPagar1: TMenuItem;
    Label22: TLabel;
    DBEdit16: TDBEdit;
    Label15: TLabel;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    Label21: TLabel;
    DBEdit25: TDBEdit;
    Label24: TLabel;
    DBEdit26: TDBEdit;
    Label25: TLabel;
    LBPercentual: TLabel;
    Label26: TLabel;
    DBRadioGroup3: TDBRadioGroup;
    N3: TMenuItem;
    RelFretes1: TMenuItem;
    Label27: TLabel;
    DBEdit27: TDBEdit;
    Label28: TLabel;
    DBEdit28: TDBEdit;
    Label29: TLabel;
    DBEdit29: TDBEdit;
    EtiqCodBarraProduoEmbarque1: TMenuItem;
    N4: TMenuItem;
    SituaoAcerto1: TMenuItem;
    N5: TMenuItem;
    BaixaEstoque1: TMenuItem;
    N6: TMenuItem;
    GeraContasPagarAdiantamento1: TMenuItem;
    VoltaAdiantamentoContasPagar1: TMenuItem;
    Label31: TLabel;
    DBEdit31: TDBEdit;
    ControleAcertoCargas1: TMenuItem;
    DBEdit20: TDBEdit;
    Label19: TLabel;
    Label23: TLabel;
    DBEdit22: TDBEdit;
    Label18: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    Label34: TLabel;
    DBEdit19: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit32: TDBEdit;
    SbReciboAdto: TSpeedButton;
    DBEdit33: TDBEdit;
    N7: TMenuItem;
    VoltaEtiquetaEmbarque1: TMenuItem;
    procedure SBConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtConsTransportadorClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure BtConsPedidoClick(Sender: TObject);
    procedure Carga1Click(Sender: TObject);
    procedure Acerto1Click(Sender: TObject);
    procedure EmbarqueNotaFiscal1Click(Sender: TObject);
    procedure EmbarquesCondioPagto1Click(Sender: TObject);
    procedure RotadeEntrega1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SBHelpClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SubstituioTributaria1Click(Sender: TObject);
    procedure EmissoNotas1Click(Sender: TObject);
    procedure ConsultaEmbarquePelaNota1Click(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure ExcluiProdutodoPedidodeUmEmbarque1Click(Sender: TObject);
    procedure RelaodeCargas1Click(Sender: TObject);
    procedure BaixaEstoquePeloEmbarque1Click(Sender: TObject);
    procedure RelaoTotalPorPedidos1Click(Sender: TObject);
    procedure VoltaEstoquepeloEmbarque1Click(Sender: TObject);
    procedure RelaoBaixadoporData1Click(Sender: TObject);
    procedure RelProdutosEmbarcados1Click(Sender: TObject);
    procedure EmbarqueNotaFiscaltxt1Click(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure EmbarqueporCliente1Click(Sender: TObject);
    procedure PosioEstoqueEmbarque1Click(Sender: TObject);
    procedure BloquearEmbarque1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure DesbloquearPedido1Click(Sender: TObject);
    procedure GeraContasaPagar1Click(Sender: TObject);
    procedure ExcluiContasaPagar1Click(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure SbReciboAdtoClick(Sender: TObject);
    procedure DBEdit25Exit(Sender: TObject);
    procedure DBEdit19Exit(Sender: TObject);
    procedure DBEdit20Exit(Sender: TObject);
    procedure DBEdit22Change(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit6Change(Sender: TObject);
    procedure RelFretes1Click(Sender: TObject);
    procedure EtiqCodBarraProduoEmbarque1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SituaoAcerto1Click(Sender: TObject);
    procedure BaixaEstoque1Click(Sender: TObject);
    procedure GeraContasPagarAdiantamento1Click(Sender: TObject);
    procedure VoltaAdiantamentoContasPagar1Click(Sender: TObject);
    procedure DBEdit30Exit(Sender: TObject);
    procedure ControleAcertoCargas1Click(Sender: TObject);
    procedure VoltaEtiquetaEmbarque1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ExcluiMovimentos(wCodigo:Integer);
    Procedure GeraContasPagar(wValor : Real; wTipo : String; wFinalidade,wNumero : Integer);
    procedure InsereNf(wFilial,wCadastro,wOperacao,wVendedor,wNr_Dias_Cheque,wNr_Dias_Cheque1,wNr_Dias_Cheque2,wNr_Dias_Cheque3,wNr_Dias_Cheque4,
                       wTransportador,wCodMensagem,wDepartamento,wNum_Pedido,wCod_Prazo : Integer;
                      wPerc_Comissao_Nota,wVal_Desconto : Real;
                      wTipo_Pagamento,wTipo_Frete,wComplemento_Obs,wObservacao : String);
    procedure InsereItensNf(wProduto,wTributacao,wCod_Lote_Tipo,wCod_Cultura : Integer;
             wQuant,wUnitario,wPerc_Desconto_Item,wPerc_Comissao_Itens,wPerc_Sub : Real;
             wPerc_Desconto1,wPerc_Desconto2,wPerc_Acrescimo : String);
    Procedure Emite_Recibo_Frete(wValor: Real; wComplemento:String);
    Procedure Emite_Conhecimento_Frete(wVal_Frete,wVal_Icms,wVal_Ajuda,wVal_Pedagio,wAdiantamento:Real;wComplemento:String);

  public
    { Public declarations }

  end;

var
  FEmbarqueCad: TFEmbarqueCad;
  wTbValor : array[1..50] of Real;
  wTbProduto : array[1..50] of Integer;
  wtbComissao : array[1..50] of Real;
  wTbCodPedido_Item : array[1..50] of Integer;
  wInd_Tb : Integer;  // serve para controlar o indice das tabelas acima


implementation

uses UEmbarque_cl, UOracle_cl, UCadastroCons, UCadastro_cl, UTela_cl,
  UEmbarqueCons, UPedidoCons, UPedido_cl, UEmbarqueParam, URPedido_Produto,
  UREmbarque, UREmbarque2, UREmbarque3, UREmbarque_Acerto, UREmbarquePedNf,
  UREmbarque1, UREmbarquePagto, UrEmbarquePedNf1, UREmbarque_Rota,
  UParamSistema_cl, UREmbarqueImposto, UNotaSaida_cl, USerie_cl,
  uNotaImpressao,UPrazoVencimento_cl,UBiblioteca, UEmbarqueNota,
  UUsuario_cl, UREmbarqueCarga, UEstoque_cl, UrEmbarquePedido,
  UREmbarqueBaixado, URProdutoEmbarcado, UBaixaEstoqueEmbarque,
  UREmbarqueCliente, URPosicaoEstoqueEmbarque, UContasPagar_cl,
  UConhecimento_CP, UContasReceber_cl, UEmiteRecibo, UFilial_cl, URRecibo,
  URReciboFrete, URFretes, UREtiqCodBarra_Producao, USituacaoAcerto,
  UBaixaEstoqueLeitor, UREtiqCodBarra_Embarque, USequencia_cl,
  URControleAcertoCargas, UVoltaEtiquetaEmbarque, URPACad, Urembarques2;

{$R *.DFM}

procedure TFEmbarqueCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFEmbarqueCad.FormActivate(Sender: TObject);
Var wEmpresa : String;
begin
  inherited;
  With DMEmbarque do
  Begin
    QEmbarque.Open;
    QEmbarqueItem.Open;
    QCalculaValorCarga.Open;
  End;
  DMTela.VerificaTela('VENDA',FEmbarqueCad.Caption,FEmbarqueCad.Name);
  wEmpresa := DMOracle.BuscaNome('SELECT COD_EMPRESA FROM TB_PARAM_SISTEMA', 'COD_FILIAL > 0');
  if wEmpresa <> 'CGS' Then
  Begin
    DBEdit10.Visible := False;
    DBEdit11.Visible := False;
    Label9.Visible := False;
    Label10.Visible := False;
  end;
  if (wEmpresa <> 'FAVILLE') And
     (wEmpresa <> 'ZADIMEL') Then
  Begin
    DBEdit12.Visible := False;
    Label11.Visible := False;
  End;

end;

procedure TFEmbarqueCad.BtConsTransportadorClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    DMEmbarque.QEmbarqueCod_Transportador.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFEmbarqueCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',QEmbarqueConsCod_Embarque.Value);
    QEmbarque.Open;
  End;
end;

procedure TFEmbarqueCad.BtConsPedidoClick(Sender: TObject);
begin
  inherited;
  If FPedidoCons = Nil then
    FPedidoCons := TFPedidoCons.Create(Application);
  If FPedidoCons.ShowModal = mrOk then
  Begin
    If (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'CGS') And
       (DMPedido.QPedidoConsInd_Embarque.Value = 'S') Then
       Raise Exception.Create('Pedido já utilizado em outro embarque');
    DMEmbarque.QEmbarqueItemCod_Pedido_Cab.Value := DMPedido.QPedidoConsCod_Pedido_Cab.Value;
    DBEdit8Exit(Self);
  End;
end;

procedure TFEmbarqueCad.Carga1Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[0].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    DmUsuario.Checar_Filial_Usuario(Trim(FEmbarqueParam.MeFilial.Text),'VENDA');
    QREmbarque.Close;
    QREmbarque2.Close;
    QREmbarque3.Close;
    if Trim(FEmbarqueParam.MEEmbarque.Text) = '' then
    begin
      QREmbarque.SetVariable('EMBARQUE',Null);
      QREmbarque2.SetVariable('EMBARQUE',Null);
      QREmbarque3.SetVariable('EMBARQUE',Null);
    end
    Else
    begin
      QREmbarque.SetVariable('EMBARQUE',FEmbarqueParam.MEEmbarque.Text);
      QREmbarque2.SetVariable('EMBARQUE',FEmbarqueParam.MEEmbarque.Text);
      QREmbarque3.SetVariable('EMBARQUE',FEmbarqueParam.MEEmbarque.Text);
    End;
    Case FEmbarqueParam.Rg0Operacao.ItemIndex Of
     0 :
      Begin
        QREmbarque.SetVariable('IND_LIVRO_FISCAL','S');
        QREmbarque2.SetVariable('IND_LIVRO_FISCAL','S');
        QREmbarque3.SetVariable('IND_LIVRO_FISCAL','S');
      End;
     1 :
      Begin
        QREmbarque.SetVariable('IND_LIVRO_FISCAL','N');
        QREmbarque2.SetVariable('IND_LIVRO_FISCAL','N');
        QREmbarque3.SetVariable('IND_LIVRO_FISCAL','N');
      End;
     2 :
      Begin
        QREmbarque.SetVariable('IND_LIVRO_FISCAL',Null);
        QREmbarque2.SetVariable('IND_LIVRO_FISCAL',Null);
        QREmbarque3.SetVariable('IND_LIVRO_FISCAL',Null);
      End;
    End;
    Case FEmbarqueParam.Rg0Pintura.ItemIndex Of
     0 :
      Begin
        QREmbarque.SetVariable('IND_PINTURA','SIM');
        QREmbarque2.SetVariable('IND_PINTURA','SIM');
      End;
     1 :
      Begin
        QREmbarque.SetVariable('IND_PINTURA',Null);
        QREmbarque2.SetVariable('IND_PINTURA',Null);
      End;
    End;
    Case FEmbarqueParam.Rg0Estofaria.ItemIndex Of
     0 :
      Begin
        QREmbarque.SetVariable('IND_ESTOFARIA','SIM');
        QREmbarque2.SetVariable('IND_ESTOFARIA','SIM');
      End;
     1 :
      Begin
        QREmbarque.SetVariable('IND_ESTOFARIA',Null);
        QREmbarque2.SetVariable('IND_ESTOFARIA',Null);
      End;
    End;
    If Trim(FEmbarqueParam.ME0Operacao1.Text) = '' then
     begin
      QREmbarque.SetVariable('COD_OPERACAO1',Null);
      QREmbarque2.SetVariable('COD_OPERACAO1',Null);
      QREmbarque3.SetVariable('COD_OPERACAO1',Null);
     end
    Else
     begin
      QREmbarque.SetVariable('COD_OPERACAO1',FEmbarqueParam.ME0Operacao1.Text);
      QREmbarque2.SetVariable('COD_OPERACAO1',FEmbarqueParam.ME0Operacao1.Text);
      QREmbarque3.SetVariable('COD_OPERACAO1',FEmbarqueParam.ME0Operacao1.Text);
     end;
    If Trim(FEmbarqueParam.ME0Operacao2.Text) = '' then
     begin
      QREmbarque.SetVariable('COD_OPERACAO2',Null);
      QREmbarque2.SetVariable('COD_OPERACAO2',Null);
      QREmbarque3.SetVariable('COD_OPERACAO2',Null);
     end
    Else
     begin
      QREmbarque.SetVariable('COD_OPERACAO2',FEmbarqueParam.ME0Operacao2.Text);
      QREmbarque2.SetVariable('COD_OPERACAO2',FEmbarqueParam.ME0Operacao2.Text);
      QREmbarque3.SetVariable('COD_OPERACAO2',FEmbarqueParam.ME0Operacao2.Text);
     end;
    If Trim(FEmbarqueParam.ME0Operacao3.Text) = '' then
     begin
      QREmbarque.SetVariable('COD_OPERACAO3',Null);
      QREmbarque2.SetVariable('COD_OPERACAO3',Null);
      QREmbarque3.SetVariable('COD_OPERACAO3',Null);
     end
    Else
     begin
      QREmbarque.SetVariable('COD_OPERACAO3',FEmbarqueParam.ME0Operacao3.Text);
      QREmbarque2.SetVariable('COD_OPERACAO3',FEmbarqueParam.ME0Operacao3.Text);
      QREmbarque3.SetVariable('COD_OPERACAO3',FEmbarqueParam.ME0Operacao3.Text);
     end;
    If Trim(FEmbarqueParam.ME0Operacao4.Text) = '' then
     begin
      QREmbarque.SetVariable('COD_OPERACAO4',Null);
      QREmbarque2.SetVariable('COD_OPERACAO4',Null);
      QREmbarque3.SetVariable('COD_OPERACAO4',Null);
     end
    Else
     begin
      QREmbarque.SetVariable('COD_OPERACAO4',FEmbarqueParam.ME0Operacao4.Text);
      QREmbarque2.SetVariable('COD_OPERACAO4',FEmbarqueParam.ME0Operacao4.Text);
      QREmbarque3.SetVariable('COD_OPERACAO4',FEmbarqueParam.ME0Operacao4.Text);
     end;

    if Trim(FEmbarqueParam.ME0Classe.Text) = '' then //alterado Marcos 09/11/06 só aparece o parametro p/ CGS
      QREmbarque2.SetVariable('CLASSE',Null)
    else
      QREmbarque2.SetVariable('CLASSE',FEmbarqueParam.ME0Classe.Text);

    QREmbarque.SetVariable('COD_OPERACAO_NULLO',Trim(FEmbarqueParam.ME0Operacao1.Text)+Trim(FEmbarqueParam.ME0Operacao2.Text)+Trim(FEmbarqueParam.ME0Operacao3.Text)+Trim(FEmbarqueParam.ME0Operacao4.Text));
    QREmbarque2.SetVariable('COD_OPERACAO_NULLO',Trim(FEmbarqueParam.ME0Operacao1.Text)+Trim(FEmbarqueParam.ME0Operacao2.Text)+Trim(FEmbarqueParam.ME0Operacao3.Text)+Trim(FEmbarqueParam.ME0Operacao4.Text));
    QREmbarque3.SetVariable('COD_OPERACAO_NULLO',Trim(FEmbarqueParam.ME0Operacao1.Text)+Trim(FEmbarqueParam.ME0Operacao2.Text)+Trim(FEmbarqueParam.ME0Operacao3.Text)+Trim(FEmbarqueParam.ME0Operacao4.Text));
    QREmbarque2.SQL[QREmbarque2.SQL.Count-1]:='';  // elimina a última Linha da SQL
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
      QREmbarque2.SQL.ADD(' DESC_UNIDADE, DESC_CLASSE, COD_PRODUTO, DESC_LOTE')
    else
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'CGS' Then
        QREmbarque2.SQL.ADD(' DESC_PRODUTO')
      Else
         QREmbarque2.SQL.ADD(' DESC_CLASSE, DESC_UNIDADE, COD_PRODUTO, DESC_LOTE');

    QREmbarque.SQL[QREmbarque.SQL.Count-1]:='';  // elimina a última Linha da SQL
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'CGS' Then
       QREmbarque.SQL.ADD(' TB_CADASTRO.NOME')
    Else
       QREmbarque.SQL.ADD(' Tb_Embarque_Item.Num_Sequencial, TB_PEDIDO_CAB.COD_PEDIDO_CAB, TB_PRODUTO.COD_PRODUTO');

    QREmbarque.Open;
    QREmbarque2.Open;
    QREmbarque3.Open;
    If FREmbarque = Nil then
      FREmbarque := TFREmbarque.Create(Application);
    If FREmbarque2 = Nil then
      FREmbarque2 := TFREmbarque2.Create(Application);
    If FREmbarque3 = Nil then
      FREmbarque3 := TFREmbarque3.Create(Application);
    If DmParamSistema.QParamSistemaCod_Empresa.Value = 'CGS' Then
      FREmbarque.QRGroup1.ForceNewPage := True;
    If DmParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
     Begin
       FREmbarque.QRLabel18.Font.Color := clWindowText;
       FREmbarque.QRExpr1.Font.Color := clWindowText;
       FREmbarque2.QRLabel14.Font.Color := ClWhite;
       FREmbarque2.QRDbText12.Font.Color := ClWhite;
       FREmbarque2.QRExpr7.Font.Color := ClWhite;
       FREmbarque2.QRExpr4.Font.Color := ClWhite;
     End;
    FREmbarque.QRLTitulo.Caption := 'Relacao Para Carga Caminhao Nr. '+FEmbarqueParam.MEEmbarque.text;
    FREmbarque.QRLEmpresa.Caption := 'Empresa:'+FEmbarqueParam.EdFilial.Text;
    FREmbarque2.QRLEmpresa.Caption := 'Empresa:'+FEmbarqueParam.EdFilial.Text;
    FREmbarque3.QRLEmpresa.Caption := 'Empresa:'+FEmbarqueParam.EdFilial.Text;
    If FEmbarqueParam.RGPreview.ItemIndex = 0 then
       FREmbarque.QRCompositeReport1.Preview
    Else
      FREmbarque.QRCompositeReport1.Print;
    QREmbarque.Close;
    QREmbarque2.Close;
    QREmbarque3.Close;
  End;
end;

procedure TFEmbarqueCad.Acerto1Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[0].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FEmbarqueParam.MeFilial.Text),'VENDA');
    QEmbarque.Close;
    QREmbarque3.Close;
    QRNFs.Close;
    QSomaNF.Close;
    QSomaNF2.Close;
    QSomaImposto.Close;
    If Trim(FEmbarqueParam.MEEmbarque.Text) = '' then
    Begin
      QEmbarque.SetVariable('PK',Null);
      QREmbarque3.SetVariable('EMBARQUE',Null);
      QSomaNF.SetVariable('EMBARQUE',Null);
    End
    Else
    begin
      QEmbarque.SetVariable('PK',FEmbarqueParam.MEEmbarque.Text);
      QREmbarque3.SetVariable('EMBARQUE',FEmbarqueParam.MEEmbarque.Text);
      QRNFs.SetVariable('EMBARQUE',FEmbarqueParam.MEEmbarque.Text);
      QSomaNF.SetVariable('EMBARQUE',FEmbarqueParam.MEEmbarque.Text);
      QSomaNF2.SetVariable('EMBARQUE',FEmbarqueParam.MEEmbarque.Text);
      QSomaImposto.SetVariable('COD_EMBARQUE',FEmbarqueParam.MEEmbarque.Text);
    End;
    Case FEmbarqueParam.Rg0Operacao.ItemIndex Of
     0 :
      Begin
        QREmbarque3.SetVariable('IND_LIVRO_FISCAL','S');
        QSomaNF.SetVariable('IND_LIVRO_FISCAL','S');
        QSomaNF2.SetVariable('IND_LIVRO_FISCAL','S');
        QRNFs.SetVariable('IND_LIVRO_FISCAL','S');
        QSomaImposto.SetVariable('IND_LIVRO_FISCAL','S');
      End;
     1 :
      Begin
        QREmbarque3.SetVariable('IND_LIVRO_FISCAL','N');
        QSomaNF.SetVariable('IND_LIVRO_FISCAL','N');
        QSomaNF2.SetVariable('IND_LIVRO_FISCAL','N');
        QRNFs.SetVariable('IND_LIVRO_FISCAL','N');
        QSomaImposto.SetVariable('IND_LIVRO_FISCAL','N');
      End;
     2 :
      Begin
        QREmbarque3.SetVariable('IND_LIVRO_FISCAL',Null);
        QSomaNF.SetVariable('IND_LIVRO_FISCAL',Null);
        QSomaNF2.SetVariable('IND_LIVRO_FISCAL',Null);
        QRNFs.SetVariable('IND_LIVRO_FISCAL',Null);
        QSomaImposto.SetVariable('IND_LIVRO_FISCAL',Null);
      End;
    End;
    QEmbarque.Open;
    QREmbarque3.Open;
    QSomaNF.Open;
    QSomaImposto.Open;
    QSomaNF2.Open;
    QRNFs.Open;
    If FREmbarque_Acerto = Nil then
      FREmbarque_Acerto := TFREmbarque_Acerto.Create(Application);
    FREmbarque_Acerto.QRLNota.Caption := '';
    While not QRNFs.Eof do
    Begin
      FREmbarque_Acerto.QRLNota.Caption := FREmbarque_Acerto.QRLNota.Caption
                                           +QRNFsNum_Nota.Text+' ';
      QRNFs.Next;
    End;

    If FREmbarque3 = Nil then
       FREmbarque3 := TFREmbarque3.Create(Application);
    FREmbarque_Acerto.QRLTitulo.Caption := 'Controle de Cargas '+FEmbarqueParam.MEEmbarque.text;
    FREmbarque_Acerto.QRLNumero.Caption := FEmbarqueParam.MEEmbarque.text;
    If FEmbarqueParam.RGPreview.ItemIndex = 0 then
      FREmbarque_Acerto.QRCompositeReport1.Preview
    Else
      FREmbarque_Acerto.QRCompositeReport1.Print;
  End;
end;

procedure TFEmbarqueCad.EmbarqueNotaFiscal1Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[0].TabVisible := True;
  FEmbarqueParam.Rg0Pintura.Visible := False;
  FEmbarqueParam.Rg0Estofaria.Visible :=False;
  FEmbarqueParam.Me0Operacao1.Visible := False;
  FEmbarqueParam.Me0Operacao2.Visible := False;
  FEmbarqueParam.Me0Operacao3.Visible := False;
  FEmbarqueParam.Me0Operacao4.Visible := False;
  FEmbarqueParam.Label26.Visible := False;
  FEmbarqueParam.Label27.Visible := False;
  FEmbarqueParam.Label28.Visible := False;
  FEmbarqueParam.Label29.Visible := False;
  FEmbarqueParam.BitBtn15.Visible := False;
  FEmbarqueParam.BitBtn16.Visible := False;
  FEmbarqueParam.BitBtn17.Visible := False;
  FEmbarqueParam.BitBtn18.Visible := False;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FEmbarqueParam.MeFilial.Text),'VENDA');
    QREmbarque_Ped_Nf.Close;
    If Trim(FEmbarqueParam.MEEmbarque.Text) = '' then
      QREmbarque_Ped_Nf.SetVariable('EMBARQUE',Null)
    Else
      QREmbarque_Ped_Nf.SetVariable('EMBARQUE',Trim(FEmbarqueParam.MEEmbarque.Text));
    If Trim(FEmbarqueParam.MEFilial.Text) = '' then
      QREmbarque_Ped_Nf.SetVariable('COD_FILIAL',Null)
    Else
      QREmbarque_Ped_Nf.SetVariable('COD_FILIAL',Trim(FEmbarqueParam.MEFilial.Text));
    If Trim(FEmbarqueParam.ME0Vendedor.Text) = '' then
      QREmbarque_Ped_Nf.SetVariable('COD_VENDEDOR',Null)
    Else
      QREmbarque_Ped_Nf.SetVariable('COD_VENDEDOR',Trim(FEmbarqueParam.ME0Vendedor.Text));
    Case FEmbarqueParam.Rg0Operacao.ItemIndex Of
     0 : QREmbarque_Ped_Nf.SetVariable('IND_LIVRO_FISCAL','S');
     1 : QREmbarque_Ped_Nf.SetVariable('IND_LIVRO_FISCAL','N');
     2 : QREmbarque_Ped_Nf.SetVariable('IND_LIVRO_FISCAL',Null);
    End;
    QREmbarque_Ped_Nf.SetVariable('DT_INICIAL',Trim(FEmbarqueParam.ME0DtInicial.Text));
    QREmbarque_Ped_Nf.SetVariable('DT_FINAL',Trim(FEmbarqueParam.ME0DtFinal.Text));
    QREmbarque_Ped_Nf.Open;
    If FrEmbarque_Ped_Nf = Nil then
      FrEmbarque_Ped_Nf := TFrEmbarque_Ped_Nf.Create(Application);
    FREmbarque_Ped_Nf.QRLTitulo.Caption := 'Relacao Notas Para Embarque Nr. '+FEmbarqueParam.MEEmbarque.text;
    If FEmbarqueParam.RGPreview.ItemIndex = 0 then
      FREmbarque_Ped_Nf.QRPrimario.Preview
    Else
      FREmbarque_Ped_Nf.QRPrimario.Print;
    QREmbarque_Ped_Nf.Close;
  End;
  FEmbarqueParam.Rg0Pintura.Visible := True;
  FEmbarqueParam.Rg0Estofaria.Visible :=True;
  FEmbarqueParam.Me0Operacao1.Visible := True;
  FEmbarqueParam.Me0Operacao2.Visible := True;
  FEmbarqueParam.Me0Operacao3.Visible := True;
  FEmbarqueParam.Me0Operacao4.Visible := True;
  FEmbarqueParam.Label26.Visible := True;
  FEmbarqueParam.Label27.Visible := True;
  FEmbarqueParam.Label28.Visible := True;
  FEmbarqueParam.Label29.Visible := True;
  FEmbarqueParam.BitBtn15.Visible := True;
  FEmbarqueParam.BitBtn16.Visible := True;
  FEmbarqueParam.BitBtn17.Visible := True;
  FEmbarqueParam.BitBtn18.Visible := True;
end;

procedure TFEmbarqueCad.EmbarquesCondioPagto1Click(Sender: TObject);
Var wTipoPagto:String;
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[1].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    QRAcertoCondPagto.Close;
    QRAcertoCondPagto.Sql.Clear;
    If FEmbarqueParam.Rg1Tipo.ItemIndex = 0 Then
     Begin
      QRAcertoCondPagto.Sql.Add('SELECT Tb_nota_cab.COD_CADASTRO,Tb_nota_cab.NUM_NOTA,Tb_nota_cab.COD_NOTA_CAB,Tb_embarque.COD_EMBARQUE,TB_EMBARQUE.NUM_EMBARQUE,');
      QRAcertoCondPagto.Sql.Add('Tb_embarque.NOME_MOTORISTA,Tb_embarque.DT_EMBARQUE,Tb_Cadastro.Nome,SUM(Tb_nota_item.VAL_TOTAL - Tb_nota_item.Val_Desconto) AS SVAL_TOTAL,');
      QRAcertoCondPagto.Sql.Add('SUM(Tb_nota_item.QT_QUANTIDADE) AS SQT_QUANTIDADE FROM TB_BAIXA_PEDIDO,TB_PEDIDO_CAB,TB_PEDIDO_ITEM,TB_EMBARQUE,');
      QRAcertoCondPagto.Sql.Add('TB_EMBARQUE_ITEM,TB_NOTA_CAB,TB_NOTA_ITEM,TB_CADASTRO WHERE (Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB)');
      QRAcertoCondPagto.Sql.Add(' AND (Tb_baixa_pedido.COD_NOTA_ITEM = Tb_nota_item.COD_NOTA_ITEM) AND (Tb_pedido_item.COD_PEDIDO_ITEM = Tb_baixa_pedido.COD_PEDIDO_ITEM) ');
      QRAcertoCondPagto.Sql.Add(' AND (Tb_pedido_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB) AND (Tb_embarque.COD_EMBARQUE = Tb_embarque_item.COD_EMBARQUE) ');
      QRAcertoCondPagto.Sql.Add(' AND (Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB) AND (Tb_nota_Cab.COD_CADASTRO = Tb_CADASTRO.COD_CADASTRO) ');
      QRAcertoCondPagto.Sql.Add(' AND (TB_NOTA_CAB.IND_SITUACAO = ' + chr(39) + '2' + chr(39)+')');
      QRAcertoCondPagto.Sql.Add(' AND (TB_EMBARQUE.COD_EMBARQUE = ' +  Trim(FEmbarqueParam.ME1Embarque.Text)+')');
      Case FEmbarqueParam.RGTipoPagto.ItemIndex of
        0 :
         Begin
          QRAcertoCondPagto.Sql.Add(' AND (TB_NOTA_CAB.IND_CONDICAO_PAGTO = ' + chr(39) + '1' + chr(39)+')');
          wTipoPagto := ' A Vista';
         End;
        1 :
         Begin
          QRAcertoCondPagto.Sql.Add(' AND (TB_NOTA_CAB.IND_CONDICAO_PAGTO = ' + chr(39) + '2' + chr(39)+')');
          wTipoPagto := ' A Prazo';
         End;
        2 :
         Begin
          QRAcertoCondPagto.Sql.Add(' AND (TB_NOTA_CAB.IND_CONDICAO_PAGTO = ' + chr(39) + '3' + chr(39)+')');
          wTipoPagto := ' Com Cheque';
         End;
      End;
      QRAcertoCondPagto.Sql.Add(' GROUP BY Tb_nota_cab.COD_CADASTRO,Tb_nota_cab.NUM_NOTA,Tb_nota_cab.COD_NOTA_CAB,Tb_embarque.COD_EMBARQUE,TB_EMBARQUE.NUM_EMBARQUE,');
      QRAcertoCondPagto.Sql.Add(' Tb_embarque.DT_EMBARQUE,Tb_embarque.NOME_MOTORISTA,Tb_cadastro.NOME ORDER BY Tb_nota_cab.NUM_NOTA');
     end
    else
     Begin
      QRAcertoCondPagto.Sql.Add('SELECT Tb_pedido_cab.COD_CADASTRO,Tb_pedido_cab.num_pedido as NUM_NOTA,Tb_pedido_cab.cod_pedido_cab as COD_NOTA_CAB,Tb_embarque.COD_EMBARQUE,TB_EMBARQUE.NUM_EMBARQUE,');
      QRAcertoCondPagto.Sql.Add('Tb_embarque.NOME_MOTORISTA,Tb_embarque.DT_EMBARQUE,Tb_Cadastro.Nome,SUM((Tb_pedido_item.VAL_UNITARIO - Tb_pedido_item.Val_Desconto) * Tb_Pedido_Item.Qt_Pedido) AS SVAL_TOTAL,');
      QRAcertoCondPagto.Sql.Add('SUM(Tb_pedido_item.QT_PEDIDO) AS SQT_QUANTIDADE FROM TB_PEDIDO_CAB,TB_PEDIDO_ITEM,TB_EMBARQUE,');
      QRAcertoCondPagto.Sql.Add('TB_EMBARQUE_ITEM,TB_CADASTRO WHERE (Tb_pedido_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB)');
      QRAcertoCondPagto.Sql.Add(' AND (Tb_embarque.COD_EMBARQUE = Tb_embarque_item.COD_EMBARQUE) ');
      QRAcertoCondPagto.Sql.Add(' AND (Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB) AND (Tb_pedido_Cab.COD_CADASTRO = Tb_CADASTRO.COD_CADASTRO) ');
      QRAcertoCondPagto.Sql.Add(' AND (TB_EMBARQUE.COD_EMBARQUE = ' +  Trim(FEmbarqueParam.ME1Embarque.Text)+')');
      Case FEmbarqueParam.RGTipoPagto.ItemIndex of
        0 :
         Begin
          QRAcertoCondPagto.Sql.Add(' AND (Tb_pedido_cab.IND_TIPO_PAGAMENTO = ' + chr(39) + 'A VISTA' + chr(39)+')');
          wTipoPagto := ' A Vista';
         End;
        1 :
         Begin
          QRAcertoCondPagto.Sql.Add(' AND (Tb_pedido_cab.IND_TIPO_PAGAMENTO = ' + chr(39) + 'A PRAZO' + chr(39)+')');
          wTipoPagto := ' A Prazo';
         End;
        2 :
         Begin
          QRAcertoCondPagto.Sql.Add(' AND (Tb_pedido_cab.IND_TIPO_PAGAMENTO = ' + chr(39) + 'OUTROS' + chr(39)+')');
          wTipoPagto := ' Com Cheque';
         End;
      End;
      QRAcertoCondPagto.Sql.Add(' GROUP BY Tb_pedido_cab.COD_CADASTRO,Tb_pedido_cab.NUM_PEDIDO,Tb_pedido_cab.cod_pedido_cab,Tb_embarque.COD_EMBARQUE,TB_EMBARQUE.NUM_EMBARQUE,');
      QRAcertoCondPagto.Sql.Add(' Tb_embarque.DT_EMBARQUE,Tb_embarque.NOME_MOTORISTA,Tb_cadastro.NOME ORDER BY Tb_pedido_cab.NUM_PEDIDO');
     end;
    QRAcertoCondPagto.Open;
    If FrEmbarquePagto = Nil then
      FrEmbarquePagto := TFrEmbarquePagto.Create(Application);
    FrEmbarquePagto.QRLTitulo.Caption := 'Relacao Cargas Por Condicao Pagto '+wTipoPagto;
    If FEmbarqueParam.RGPreview.ItemIndex = 0 then
      FrEmbarquePagto.QRPrimario.Preview
    Else
      FrEmbarquePagto.QRPrimario.Print;
    QRAcertoCondPagto.Close;
  End;

end;

procedure TFEmbarqueCad.RotadeEntrega1Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[2].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    QREmbarque_Rota.Close;
    If Trim(FEmbarqueParam.ME2Embarque1.Text) <> '' then
      QREmbarque_Rota.SetVariable('COD_EMBARQUE1',FEmbarqueParam.ME2Embarque1.Text);

    If Trim(FEmbarqueParam.ME2Embarque2.Text) <> '' then
      QREmbarque_Rota.SetVariable('COD_EMBARQUE2',FEmbarqueParam.ME2Embarque2.Text);

    If Trim(FEmbarqueParam.ME2Embarque3.Text) <> '' then
      QREmbarque_Rota.SetVariable('COD_EMBARQUE3',FEmbarqueParam.ME2Embarque3.Text);

    If Trim(FEmbarqueParam.ME2Embarque4.Text) <> '' then
      QREmbarque_Rota.SetVariable('COD_EMBARQUE4',FEmbarqueParam.ME2Embarque4.Text);
    If FrEmbarque_Rota = Nil then
      FrEmbarque_Rota := TFrEmbarque_Rota.Create(Application);
    FrEmbarque_Rota.QRDBText5.Font.Color := clWindowText;
    FrEmbarque_Rota.QRLabel7.Font.Color := clWindowText;
    FrEmbarque_Rota.SummaryBand1.Enabled := True;
    Case FEmbarqueParam.Rg2Operacao.ItemIndex Of
     0 :
      Begin
        QREmbarque_Rota.SetVariable('IND_LIVRO_FISCAL','S');
        FrEmbarque_Rota.QRDBText5.Font.Color := ClWhite;
        FrEmbarque_Rota.QRLabel7.Font.Color := ClWhite;
        FrEmbarque_Rota.SummaryBand1.Enabled := False;
        if DMParamSistema.QParamSistemaCod_Empresa.Text = 'FAVILLE' then
        begin
          FrEmbarque_Rota.QRDBText6.enabled := false;
          FrEmbarque_Rota.QRLabel10.enabled := false;
        end;
      End;
     1 : QREmbarque_Rota.SetVariable('IND_LIVRO_FISCAL','N');
     2 : QREmbarque_Rota.SetVariable('IND_LIVRO_FISCAL',Null);
    End;
    QREmbarque_Rota.Open;
    FrEmbarque_Rota.QRLTitulo.Caption := 'Relatório de Entrega Rota(s) Nr '+FEmbarqueParam.ME2Embarque1.Text+ ' - ' + FEmbarqueParam.ME2Embarque2.Text + ' - ' + FEmbarqueParam.ME2Embarque3.Text + ' - ' + FEmbarqueParam.ME2Embarque4.Text;
    If FEmbarqueParam.RGPreview.ItemIndex = 0 then
      FrEmbarque_Rota.QRPrimario.Preview
    Else
      FrEmbarque_Rota.QRPrimario.Print;
    FrEmbarque_Rota.QRDBText6.enabled := true;
    FrEmbarque_Rota.QRLabel10.enabled := true;
    QREmbarque_Rota.Close;
  End;
end;

procedure TFEmbarqueCad.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'ZADIMEL') and
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'FAVILLE') then
  begin
    If Key = Chr(43) Then
    Begin
      DbNavigator1.BtnClick(NbInsert);
      DbEdit8.SetFocus;
    End;
    If Key = Chr(45) Then
    Begin
      DbNavigator1.BtnClick(NbDelete);
      DbEdit8.SetFocus;
    End;
  end;
end;

procedure TFEmbarqueCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(10);
end;

procedure TFEmbarqueCad.SBExcluirClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFEmbarqueCad.SubstituioTributaria1Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[3].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FEmbarqueParam.ME2Filial.Text),'VENDA');
    QREmbarqueImposto.Close;
    If Trim(FEmbarqueParam.ME2Embarque.Text) <>'' Then
      QREmbarqueImposto.SetVariable('COD_EMBARQUE',Trim(FEmbarqueParam.ME2Embarque.Text))
    Else
      QREmbarqueImposto.SetVariable('COD_EMBARQUE',null);
    If Trim(FEmbarqueParam.ME2Filial.Text) = '' then
      QREmbarqueImposto.SetVariable('COD_FILIAL',Null)
    Else
      QREmbarqueImposto.SetVariable('COD_FILIAL',Trim(FEmbarqueParam.ME2Filial.Text));
    QREmbarqueImposto.SetVariable('COD_ESTADO',Trim(FEmbarqueParam.ME2Estado.Text));
    QREmbarqueImposto.Open;
    If FrEmbarqueImposto = Nil then
      FrEmbarqueImposto := TFrEmbarqueImposto.Create(Application);
    FrEmbarqueImposto.QRLCarga.Caption := 'Embarque Número: '+FEmbarqueParam.ME2Embarque.Text;
    If FEmbarqueParam.RGPreview.ItemIndex = 0 then
      FrEmbarqueImposto.QRPrimario.Preview
    Else
      FrEmbarqueImposto.QRPrimario.Print;
    QREmbarqueImposto.Close;
  End;
End;

procedure TFEmbarqueCad.EmissoNotas1Click(Sender: TObject);
Var wCadastro_Anterior,wOperacao_Anterior,wCod_Pedido_Anterior,wNum_Pedido_Anterior,wCont,wOperNota : Integer;
    wDias1,wDias2,wDias3,wDias4,wDias5 : Integer;
    wValor_Parcelas,wTotal,wTotal_Nota : Real;
    wLinha,wAux,wNumParcelas,wCodigo_Prazo,wBanco,wDep,wContaCorrente,wPagto : String;
Const wBranco : String = '                                      ';
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.Me3DtSaida.Text := DateToStr(Date);
  FEmbarqueParam.PGRelatorio.Pages[4].TabVisible := True;
  FEmbarqueParam.Rg4OpcaoQtd.ItemIndex := 1;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    QEmbarque_EmiteNota.Close;
    If Trim(FEmbarqueParam.Me3Embarque.Text) <> '' then
      QEmbarque_EmiteNota.SetVariable('EMBARQUE',FEmbarqueParam.ME3Embarque.Text)
    Else
      Raise Exception.Create ('Informar Número do Embarque');
    If Trim(FEmbarqueParam.Me3Operacao.Text) <> '' then
      QEmbarque_EmiteNota.SetVariable('COD_OPERACAO',FEmbarqueParam.Me3Operacao.Text)
    Else
      QEmbarque_EmiteNota.SetVariable('COD_OPERACAO',Null);
    Case FEmbarqueParam.Rg4Operacao.ItemIndex Of
      0 : QEmbarque_EmiteNota.SetVariable('IND_LIVRO_FISCAL','S');
      1 : QEmbarque_EmiteNota.SetVariable('IND_LIVRO_FISCAL','N');
      2 : QEmbarque_EmiteNota.SetVariable('IND_LIVRO_FISCAL',Null);
    End;
    Case FEmbarqueParam.Rg4OpcaoQtd.ItemIndex Of
      0 : QEmbarque_EmiteNota.SetVariable('QT_ZEROS',Null);
      1 : QEmbarque_EmiteNota.SetVariable('QT_ZEROS','NAO');
    End;
    If Trim(FEmbarqueParam.Me3Finalidade.Text) = '' then
      Raise Exception.Create ('Informar Código Finalidade');
    QEmbarque_EmiteNota.Open;
    DMNotaSaida.QNotaSaida.Open;
    DMNotaSaida.QItemNf.Open;
    DMNotaSaida.QAtuBaixaPed.Open;
    DMNotaSaida.pConfirmando := True;
    wCadastro_Anterior := 0;
    wOperacao_Anterior := 0;
    wNum_Pedido_Anterior := 0;
    DMNotaSaida.pTrazPedido := True;
    Try
      While not QEmbarque_EmiteNota.Eof Do
      Begin
        With DMNotaSaida do
        Begin
          If (wCadastro_Anterior = QEmbarque_EmiteNotaCod_Cadastro.Value) And
             (wCod_Pedido_Anterior = QEmbarque_EmiteNotaCod_Pedido_Cab.Value) And
//             (wNum_Pedido_Anterior = QEmbarque_EmiteNotaNum_Pedido.Value) And  estava esta linha tirado pelo César para o moinho 2 pedidos com mesmo numro emite 2 notas
             (wOperacao_Anterior = QEmbarque_EmiteNotaCod_Operacao.Value)  then
             QNotaSaida.Edit
          Else
           Begin
             pCC:=True;
             // procedure que vai inserir a nota fiscal
             InsereNf(QEmbarque_EmiteNotaCod_Filial.Value,QEmbarque_EmiteNotaCod_Cadastro.Value,QEmbarque_EmiteNotaCod_Operacao.Value,
                      QEmbarque_EmiteNotaCod_Vendedor.Value,QEmbarque_EmiteNotaNr_Dias_Cheque.Value,
                      QEmbarque_EmiteNotaNr_Dias_Cheque1.Value,QEmbarque_EmiteNotaNr_Dias_Cheque2.Value,QEmbarque_EmiteNotaNr_Dias_Cheque3.Value,
                      QEmbarque_EmiteNotaNr_Dias_Cheque4.Value,QEmbarque_EmiteNotaCod_Transportador.Value,
                      QEmbarque_EmiteNotaCod_Mensagem.Value,QEmbarque_EmiteNotaCod_Departamento.Value,
                      QEmbarque_EmiteNotaNum_Pedido.Value,QEmbarque_EmiteNotaCod_Prazo_Vencimento.Value,
                      QEmbarque_EmiteNotaPerc_Comissao_Nota.Value,QEmbarque_EmiteNotaVal_Desconto.Value,
                      QEmbarque_EmiteNotaInd_Tipo_Pagamento.Value,QEmbarque_EmiteNotaInd_Tipo_Frete.Value,
                      QEmbarque_EmiteNotaDesc_Complemento_Obs.Text,QEmbarque_EmiteNotaDesc_Observacao.Text);
             For wind_tb:= 1 to 50 do
              Begin
                wTbValor[wind_tb] := 0;
                wTbProduto[wind_tb] := 0;
                wTbComissao[wind_tb] := 0;
                wTbCodPedido_Item[wind_tb] := 0;
              End;
              wind_tb := 0;
           End;
           // procedure para inserir os itens da nota fiscal
           InsereItensNf(Trunc(QEmbarque_EmiteNotaCod_Produto.Value),QEmbarque_EmiteNotaCod_Tributacao.Value,
                 QEmbarque_EmiteNotaCod_Lote_Tipo.Value,QEmbarque_EmiteNotaCod_Cultura.Value,
                 QEmbarque_EmiteNotaQt_Pedido.Value,QEmbarque_EmiteNotaVal_Unitario.Value,QEmbarque_EmiteNotaPerc_Desconto_Item.Value,
                 QEmbarque_EmiteNotaPerc_Comissao_Itens.Value,QEmbarque_EmiteNotaPerc_Sub.Value,QEmbarque_EmiteNotaPerc_Desconto1.Text,
                 QEmbarque_EmiteNotaPerc_Desconto2.Text,QEmbarque_EmiteNotaPerc_Acrescimo.Text);

           QAtuBaixaPed.Insert;
           QAtuBaixaPedCod_Nota_Item.Value := QItemNFCod_Nota_Item.Value;
           QAtuBaixaPedCod_Pedido_Item.Value := QEmbarque_EmiteNotaCod_Pedido_Item.Value;
           QAtuBaixaPedQt_Baixa.Value := QEmbarque_EmiteNotaQt_Pedido.Value;
           QAtuBaixaPed.Post;
           wTbCodPedido_Item[wind_tb] := QEmbarque_EmiteNotaCod_Pedido_Item.Value; // para conseguir relacionar as subfaturadas
           DMNotaSaida.QAtzItemPedido.Close;
           DMNotaSaida.QAtzItemPedido.SetVariable('COD_PEDIDO_ITEM',QAtuBaixaPedCod_Pedido_item.Value);
           DMNotaSaida.QAtzItemPedido.SetVariable('QT_ACRESCENTAR',(QAtuBaixaPedQt_Baixa.Value));
           DMNotaSaida.QAtzItemPedido.ExecSQL;
           wCadastro_Anterior := QEmbarque_EmiteNotaCod_Cadastro.Value;
           wOperacao_Anterior := QEmbarque_EmiteNotaCod_Operacao.Value;
//           wNum_Pedido_Anterior := QEmbarque_EmiteNotaNum_Pedido.Value;
           wCodigo_Prazo := QEmbarque_EmiteNotaCod_Prazo_Vencimento.Text; // guarda para fazer parcelas
           wCod_Pedido_Anterior := QEmbarque_EmiteNotaCod_Pedido_Cab.Value; // guarda para atualizar data de faturamento do pedido
           wBanco := QEmbarque_EmiteNotaCod_Banco_Agencia.Text;  //para quando preenche o codigo do banco no pedido
           wContaCorrente := QEmbarque_EmiteNotaCod_Conta_Corrente.Text;  //para quando preenche a Conta Corrente no pedido
           wDep := IntToStr(QEmbarque_EmiteNotaCod_Departamento.Value);
           QEmbarque_EmiteNota.Next;
           If DMParamSistema.QParamSistemaCod_Empresa.Value = 'TEMPERMED' Then  // tempermed é por cadastro varios pedidos na mesma nota
              wCod_Pedido_Anterior := QEmbarque_EmiteNotaCod_Pedido_Cab.Value;
           If (wCadastro_Anterior <> QEmbarque_EmiteNotaCod_Cadastro.Value) or
              (wOperacao_Anterior <> QEmbarque_EmiteNotaCod_Operacao.Value) or
              (wCod_Pedido_Anterior <> QEmbarque_EmiteNotaCod_Pedido_Cab.Value) or
//              (wNum_Pedido_Anterior <> QEmbarque_EmiteNotaNum_Pedido.Value) or
              (QEmbarque_EmiteNota.Eof)  then
           Begin
              If QNotaSaidaNum_Nota.Value = 0 then
                 QNotaSaidaNum_Nota.Value := DMSerie.NumeroSerie(QNotaSaidaCod_Filial.Value,QNotaSaidaCod_Serie.Value);
              QSomaItemNota.Close;
              QSomaItemNota.Open;
              DMNotaSaida.AtualizaEstoque(-1);
              QNotaSaidaInd_Situacao.Value := '2'; // Confirmada
              If DMParamSistema.QparamSistemaInd_Contabiliza.Value = 'S' Then
                 Contabiliza;
              If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
                 DesdobramentoClaspar;
              QNotaSaida.Post;
              If QNotaSaidaInd_Condicao_Pagto.Value = '2' Then
              Begin
                if wCodigo_Prazo = '' then
                  raise exception.Create('Código Prazo de vencimento não informado');
                wNumParcelas := DMOracle.BuscaNome('SELECT NUM_PARCELAS FROM TB_PRAZO_VENCIMENTO','COD_PRAZO_VENCIMENTO = '+wCodigo_Prazo);
                wTotal_Nota := QSomaItemNotaSVal_Total_Nota.Value;
                If (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZADIMEL') Or (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'FAVILLE') Then
                   If (DMNotaSaida.QNotaSaidaCOD_FILIAL.Value = 4) And (DMNotaSaida.QNotaSaidaCOD_ESTADO.Value <> 'BA') Then
                      wTotal_Nota := (QSomaItemNotaSVal_Total_Nota.Value - QSomaItemNotaSVal_Icms_Subst.Value);
                wValor_Parcelas := wTotal_Nota / StrToInt(wNumParcelas);
                DMPrazoVencimento.QPrazoVencimentoDias.Close;
                DMPrazoVencimento.QPrazoVencimentoDias.SetVariable('COD_PRAZO_VENCIMENTO',wCodigo_Prazo);
                DMPrazoVencimento.QPrazoVencimentoDias.SetVariable('NUM_DIAS',Null);
                DMPrazoVencimento.QPrazoVencimentoDias.Open;
                LBParcela.Items.Clear;
                wCont := 1;
                wTotal := 0;
                While not DMPrazoVencimento.QPrazoVencimentoDias.Eof Do
                Begin
                  wLinha := DateToStr(Date + DMPrazoVencimento.QPrazoVencimentoDiasNum_Dias.Value);
                  if wCont = StrToInt(wNumParcelas) Then  // serve para calcular o valor da ultima parcela devido a diferenca de centavos
                     wValor_Parcelas := wTotal_Nota - wTotal;
                  wAux := FormatFloat('###,###,##0.00',wValor_Parcelas);
                  wAux := Copy(wBranco,1,15-Length(waux)) + wAux;
                  wLinha := wLinha + wAux;
                  Inc(wCont);
                  wTotal := wTotal + StrToFloat(Bib.LimpaString(Trim(wAux),'.'));
                  LBParcela.Items.Add(wLinha);
                  DMPrazoVencimento.QPrazoVencimentoDias.Next;
                End;
                If wBanco = '' Then
                 Begin
                   wBanco := Trim(FembarqueParam.Me3Banco.Text);
                   wContaCorrente := Trim(FembarqueParam.Me3ContaCorrente.Text);
                 End;
                If (wDep = '0') Or (wDep = '') Then
                   wDep := '1';
                DMNotaSaida.GeraContaReceber(LBParcela.Items,StrToInt(Trim(FEmbarqueParam.Me3Finalidade.Text)),wBanco,wDep,wContaCorrente);
              End;
              FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
              QAtuDtFatura_Ped.Close;           // rotina para atualizar dt faturamento do pedido
              QAtuDtFatura_Ped.SetVariable('COD_PEDIDO_CAB',wCod_Pedido_Anterior);
              QAtuDtFatura_Ped.Open;
              QAtuDtFatura_Ped.Edit;
              QAtuDtFatura_PedDt_Faturamento.Value := DMOracle.DataServ;
              QAtuDtFatura_Ped.Post;
              QAtuDtFatura_Ped.Close;
              If wTbProduto[1] <> 0 Then  // vai fazer nota do percentual das sub faturadas
               begin
                 If DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE' Then
                    wOperNota := 122
                 Else
                    wOperNota := 591;
                 wPagto := QNotaSaidaInd_Condicao_Pagto.Value;
                 If QNotaSaidaInd_Condicao_Pagto.Value = '2' Then
                  Begin              // para zadimel e faville quando a nota fiscal for a prazo o pedido deve ser cheque
                    wPagto := '3';
                    DMPrazoVencimento.QPrazoVencimentoDias.Close;
                    DMPrazoVencimento.QPrazoVencimentoDias.SetVariable('COD_PRAZO_VENCIMENTO',wCodigo_Prazo);
                    DMPrazoVencimento.QPrazoVencimentoDias.SetVariable('NUM_DIAS',Null);
                    DMPrazoVencimento.QPrazoVencimentoDias.Open;
                    wCont := 1;
                    While not DMPrazoVencimento.QPrazoVencimentoDias.Eof Do
                    Begin
                      Case wCont of
                        1 : wDias1 := DMPrazoVencimento.QPrazoVencimentoDiasNum_Dias.Value;
                        2 : wDias2 := DMPrazoVencimento.QPrazoVencimentoDiasNum_Dias.Value;
                        3 : wDias3 := DMPrazoVencimento.QPrazoVencimentoDiasNum_Dias.Value;
                        4 : wDias4 := DMPrazoVencimento.QPrazoVencimentoDiasNum_Dias.Value;
                        5 : wDias5 := DMPrazoVencimento.QPrazoVencimentoDiasNum_Dias.Value;
                      End;
                      Inc(wCont);
                      DMPrazoVencimento.QPrazoVencimentoDias.Next;
                    End;
                  End
                 Else
                  Begin
                    wDias1 := QNotaSaidaNr_Dias_Cheque.Value;
                    wDias2 := QNotaSaidaNr_Dias_Cheque1.Value;
                    wDias3 := QNotaSaidaNr_Dias_Cheque2.Value;
                    wDias4 := QNotaSaidaNr_Dias_Cheque3.Value;
                    wDias5 := QNotaSaidaNr_Dias_Cheque4.Value;
                  End;
                 InsereNf(QNotaSaidaCod_Filial.Value,QNotaSaidaCod_Cadastro.Value,wOperNota,
                    QNotaSaidaCod_Vendedor.Value,wDias1,wDias2,wDias3,wDias4,wDias5,QNotaSaidaCod_Transportador.Value,
                    QNotaSaidaCod_Mensagem.Value,QNotaSaidaCod_Departamento.Value,
                    QEmbarque_EmiteNotaNum_Pedido.Value,QNotaSaidaCod_Prazo_Vencimento.Value,
                    QNotaSaidaPerc_Comissao.Value,0,wPagto,
                    QNotaSaidaInd_Tipo_Frete.Value,QNotaSaidaObs_Complemento.Text,QNotaSaidaObs.Text);
                 for wInd_Tb := 1 to 50 do
                 begin
                   if wTbProduto[wind_Tb] > 0 Then
                    Begin
                      InsereItensNf(wTbProduto[wind_Tb],4,1,0,0,wtbValor[wind_Tb],0,wtbComissao[wind_Tb],0,'','','');
                      QAtuBaixaPed.Insert;
                      QAtuBaixaPedCod_Nota_Item.Value := QItemNFCod_Nota_Item.Value;
                      QAtuBaixaPedCod_Pedido_Item.Value := wTbCodPedido_Item[wind_tb];
                      QAtuBaixaPedQt_Baixa.Value := 0; // quantidade subfaturada é sempre zero
                      QAtuBaixaPed.Post;
                    End;
                 end;
                 QNotaSaida.Edit;
                 If QNotaSaidaNum_Nota.Value = 0 then
                    QNotaSaidaNum_Nota.Value := DMSerie.NumeroSerie(QNotaSaidaCod_Filial.Value,QNotaSaidaCod_Serie.Value);
                 QSomaItemNota.Close;
                 QSomaItemNota.Open;
                 QNotaSaidaInd_Situacao.Value := '2'; // Confirmada
                 If DMParamSistema.QparamSistemaInd_Contabiliza.Value = 'S' Then
                    Contabiliza;
                 If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
                    DesdobramentoClaspar;
                 QNotaSaida.Post;
                 If QNotaSaidaInd_Condicao_Pagto.Value = '2' Then
                 Begin
                   if wCodigo_Prazo = '' then
                     raise exception.Create('Código Prazo de vencimento não informado');
                   wNumParcelas := DMOracle.BuscaNome('SELECT NUM_PARCELAS FROM TB_PRAZO_VENCIMENTO','COD_PRAZO_VENCIMENTO = '+wCodigo_Prazo);
                   wValor_Parcelas := QSomaItemNotaSVal_Total_Nota.Value / StrToInt(wNumParcelas);
                   DMPrazoVencimento.QPrazoVencimentoDias.Close;
                   DMPrazoVencimento.QPrazoVencimentoDias.SetVariable('COD_PRAZO_VENCIMENTO',wCodigo_Prazo);
                   DMPrazoVencimento.QPrazoVencimentoDias.SetVariable('NUM_DIAS',Null);
                   DMPrazoVencimento.QPrazoVencimentoDias.Open;
                   LBParcela.Items.Clear;
                   wCont := 1;
                   wTotal := 0;
                   While not DMPrazoVencimento.QPrazoVencimentoDias.Eof Do
                   Begin
                     wLinha := DateToStr(Date + DMPrazoVencimento.QPrazoVencimentoDiasNum_Dias.Value);
                     if wCont = StrToInt(wNumParcelas) Then  // serve para calcular o valor da ultima parcela devido a diferenca de centavos
                        wValor_Parcelas := QSomaItemNotaSVal_Total_Nota.Value - wTotal;
                     wAux := FormatFloat('###,###,##0.00',wValor_Parcelas);
                     wAux := Copy(wBranco,1,15-Length(waux)) + wAux;
                     wLinha := wLinha + wAux;
                     Inc(wCont);
                     wTotal := wTotal + StrToFloat(Bib.LimpaString(Trim(wAux),'.'));
                     LBParcela.Items.Add(wLinha);
                     DMPrazoVencimento.QPrazoVencimentoDias.Next;
                   End;
                   If wBanco = '' Then
                    Begin
                      wBanco := Trim(FembarqueParam.Me3Banco.Text);
                      wContaCorrente := Trim(FembarqueParam.Me3ContaCorrente.Text);
                    End;
                   If (wDep = '0') Or (wDep = '') Then
                      wDep := '1';
                   DMNotaSaida.GeraContaReceber(LBParcela.Items,StrToInt(Trim(FEmbarqueParam.Me3Finalidade.Text)),wBanco,wDep,wContaCorrente);
                 End;
                 FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
               end;
              DMOracle.DBCemapa.Commit;
              If FRpaCad = Nil Then
                 FRpaCad := TFRpaCad.Create(Application);
              FRpaCad.ShowModal;
           End;
        End;
      End;
    Except
      Begin
        If DMNotaSaida.QNotaSaida.State in [dsEdit,dsInsert] then
         Begin
           DMNotaSaida.QNotaSaida.Cancel;
           DMNotaSaida.QItemNF.Cancel;
           DMNotaSaida.QAtuBaixaPed.Cancel;
         End;
        If DMOracle.DBCemapa.InTransaction then
           DMOracle.DBCemapa.RollBack;
        Raise;
      End;
    End;
    // atualiza a data do embarque pela data do faturamento
    With DMOracle do
    Begin
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      wAux := 'UPDATE TB_EMBARQUE SET DT_EMBARQUE='+Chr(39) + DateToStr(DataServ) + Chr(39);
      wAux := wAux + ' WHERE COD_EMBARQUE = '+Trim(FEmbarqueParam.Me3Embarque.Text);
      QExecSQL.SQL.Add(wAux);
      QExecSQL.ExecSQL;
      If DMOracle.DBCemapa.InTransaction then
         DMOracle.DBCemapa.Commit;
    End;
    DMEmbarque.QEmbarque_EmiteNota.Close;
    DMNotaSaida.QNotaSaida.Close;
    DMNotaSaida.QItemNf.Close;
    DMNotaSaida.QAtuBaixaPed.Close;
    DMNotaSaida.pConfirmando := False;
    DMNotaSaida.pTrazPedido := False;
  End;
END;
procedure TFEmbarqueCad.ConsultaEmbarquePelaNota1Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueNota = Nil Then
     FEmbarqueNota := TFEmbarqueNota.Create(Application);
  FEmbarqueNota.ShowModal;
  DMEmbarque.QNotaEmbarque.Close;
end;

procedure TFEmbarqueCad.DBEdit8Exit(Sender: TObject);
Var wDtVencto, wClassificacao,wDescClassificacao,wCadastro,wAtendido : String;
begin
  inherited;
  If Trim(DMEmbarque.QEmbarqueItemCod_Pedido_Cab.Text) <> '' Then
   begin
     wCadastro := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_PEDIDO_CAB','COD_PEDIDO_CAB = '+DMEmbarque.QEmbarqueItemCod_Pedido_Cab.Text);
     wAtendido := DMOracle.BuscaNome('SELECT QT_ATENDIDO FROM TB_PEDIDO_ITEM','COD_PEDIDO_CAB = '+DMEmbarque.QEmbarqueItemCod_Pedido_Cab.Text);
     If (wAtendido) = '' Then
        Raise Exception.Create('Pedido Não Cadastrado');
     If StrToFloat(wAtendido) <> 0 then
        ShowMessage('Este Pedido Já foi faturado');
   End;
  If wCadastro <> '' then
  begin
    wDtVencto := DMOracle.BuscaNome('SELECT Min(DT_VENCIMENTO) FROM TB_CONTA_RECEBER_CAB','COD_CADASTRO = '+FloatToStr(dmPedido.QPedidoCod_Cadastro.Value)+ ' AND IND_SITUACAO <> '+chr(39)+'BAIXA TOTAL'+chr(39));
    if wDtvencto <> '' then
       if StrToDate(wDtVencto) < Date Then
          ShowMessage('Cliente Com Titulos Atrasados')
       Else
         If DMParamSistema.QParamSistemaCOD_EMPRESA.value <> 'MOINHO' then
            ShowMessage('Cliente Com Titulos A Vencer');
    If DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'ZADIMEL' then
    Begin
      wClassificacao := DMOracle.BuscaNome('SELECT COD_CLASS_CADASTRO FROM TB_CADASTRO',' COD_CADASTRO = '+wCadastro);
      If StrToInt(wClassificacao) > 2 Then
       Begin
         wDescClassificacao := DMOracle.BuscaNome('SELECT DESC_CLASSIFICACAO FROM TB_CLASS_CADASTRO','COD_CLASS_CADASTRO = '+Trim(wClassificacao));
         ShowMessage('Cliente com Classificação = '+wDescClassificacao);
       End;
    End;
  End;
end;

procedure TFEmbarqueCad.ExcluiProdutodoPedidodeUmEmbarque1Click(
  Sender: TObject);
Var wComando : String;
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[5].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    QEmbarqueItensPed.Close;
    If Trim(FEmbarqueParam.Me4Embarque.Text) <> '' then
      QEmbarqueItensPed.SetVariable('COD_EMBARQUE',FEmbarqueParam.ME4Embarque.Text)
    Else
      Raise Exception.Create ('Informar Número do Embarque');
    If Trim(FEmbarqueParam.Me4Produto.Text) <> '' then
      QEmbarqueItensPed.SetVariable('COD_PRODUTO',FEmbarqueParam.Me4Produto.Text)
    Else
      Raise Exception.Create ('Informar Código Produto');
    QEmbarqueItensPed.Open;
    If QEmbarqueItensPedQt_Atendido.Value > 0 Then
       Raise Exception.Create('Pedido Já Faturado - Emitido Notas');
    While not QEmbarqueItensPed.Eof Do
    Begin
      With DMOracle do
      Begin
        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        wComando := 'DELETE FROM TB_PEDIDO_ITEM WHERE COD_PEDIDO_ITEM =' + QEmbarqueItensPedCod_Pedido_Item.Text;
        QExecSQL.SQL.Add(wComando);
        QExecSQL.ExecSQL;
        If DMOracle.DBCemapa.InTransaction then
           DMOracle.DBCemapa.Commit;
        QEmbarqueItensPed.Next;
      End;
    End;
    QEmbarqueItensPed.Close;
  End;
end;

Procedure TFEmbarqueCad.RelaodeCargas1Click(Sender: TObject);
Begin
  inherited;
  If FEmbarqueParam = nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[6].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  with DMEmbarque do
  begin
    QREmbarqueCarga.Close;
    If (Trim(FEmbarqueParam.ME7DtInicio.Text) = '') or (Trim(FEmbarqueParam.ME7DtFim.Text) = '') then
      Raise Exception.Create('Período deve ser Informado');
    QREmbarqueCarga.SetVariable('DT_INICIAL',StrToDate(Trim(FEmbarqueParam.ME7DtInicio.Text)));
    QREmbarqueCarga.SetVariable('DT_FINAL',StrToDate(Trim(FEmbarqueParam.ME7DtFim.Text)));
    case FEmbarqueParam.RG7Situacao.ItemIndex of
      0 : QREmbarqueCarga.SetVariable('IND_SITUACAO', NULL);
      1 : QREmbarqueCarga.SetVariable('IND_SITUACAO', 'ABERTO');
      2 : QREmbarqueCarga.SetVariable('IND_SITUACAO', 'ACERTADO');
      3 : QREmbarqueCarga.SetVariable('IND_SITUACAO', 'BAIXADO');
    end;
    QREmbarqueCarga.Open;
    If FREmbarqueCarga = nil then
      FREmbarqueCarga := TFREmbarqueCarga.Create(Application);
    FREmbarqueCarga.QRLTitulo.Caption:= 'RELAÇÃO DE CARGAS NO PERÍODO DE '+FEmbarqueParam.ME7DtInicio.Text+' À '+FEmbarqueParam.ME7DtFim.Text;
    Case FEmbarqueParam.RG7Situacao.ItemIndex of
      0 : FREmbarqueCarga.QRLTitulo.Caption := FREmbarqueCarga.QRLTitulo.Caption + ' TODOS';
      1 : FREmbarqueCarga.QRLTitulo.Caption := FREmbarqueCarga.QRLTitulo.Caption + ' ABERTO';
      2 : FREmbarqueCarga.QRLTitulo.Caption := FREmbarqueCarga.QRLTitulo.Caption + ' ACERTADO S/LANCTO CHEQUE';
      3 : FREmbarqueCarga.QRLTitulo.Caption := FREmbarqueCarga.QRLTitulo.Caption + ' BAIXADO TOTAL';
    End;
    If FEmbarqueParam.RGPreview.ItemIndex = 0 then
      FREmbarqueCarga.QRPrimario.Preview
    Else
      FREmbarqueCarga.QRPrimario.Print;
    QREmbarqueCarga.Close;
  end;
end;

procedure TFEmbarqueCad.BaixaEstoquePeloEmbarque1Click(Sender: TObject);
begin
  inherited;
  If FBaixaEstoquePeloEmbarque = Nil then
    FBaixaEstoquePeloEmbarque := TFBaixaEstoquePeloEmbarque.Create(Application);
  FBaixaEstoquePeloEmbarque.ShowModal;
end;

procedure TFEmbarqueCad.RelaoTotalPorPedidos1Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[8].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FEmbarqueParam.ME2Filial.Text),'VENDA');
    QREmbarquePedido.Close;
    If Trim(FEmbarqueParam.Me8Embarque.Text) <>'' Then
      QREmbarquePedido.SetVariable('EMBARQUE',Trim(FEmbarqueParam.Me8Embarque.Text))
    Else
      QREmbarquePedido.SetVariable('EMBARQUE',null);
    If Trim(FEmbarqueParam.Me8Cadastro.Text) = '' then
      QREmbarquePedido.SetVariable('COD_CADASTRO',Null)
    Else
      QREmbarquePedido.SetVariable('COD_CADASTRO',Trim(FEmbarqueParam.Me8Cadastro.Text));
    QREmbarquePedido.Open;
    If FrEmbarquePedido = Nil then
      FrEmbarquePedido := TFrEmbarquePedido.Create(Application);
    If FEmbarqueParam.RGPreview.ItemIndex = 0 then
      FrEmbarquePedido.QRPrimario.Preview
    Else
      FrEmbarquePedido.QRPrimario.Print;
    QREmbarquePedido.Close;
  End;

end;

procedure TFEmbarqueCad.VoltaEstoquepeloEmbarque1Click(Sender: TObject);
Var wFilial : Integer;
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[7].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    QEmbarqueItensNota.Close;
    If Trim(FEmbarqueParam.Me7Embarque.Text) <> '' then
      QEmbarqueItensNota.SetVariable('COD_EMBARQUE',Trim(FEmbarqueParam.Me7Embarque.Text))
    Else
      Raise Exception.Create ('Informar Número do Embarque');
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',StrToInt(Trim(FEmbarqueParam.Me7Embarque.Text)));
    QEmbarque.Open;
    If QEmbarqueInd_Atualiza_Estoque.Value = 'NAO' Then
      Raise Exception.Create ('Não é possivel voltar estoque porque embarque nunca foi Atualizado');
    QEmbarqueItensNota.Open;
    QEmbarqueItensNota.First;
    if QEmbarqueItensNota.recordCount > 0 then
    begin
      Try
        DMOracle.DBCemapa.StartTransaction;
        While not QEmbarqueItensNota.Eof Do
        Begin
          wFilial := QEmbarqueItensNotaCod_Filial.Value;
          If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ZADIMEL' Then // para zadimel sempre filial 1
             wFilial := 1;
          DmEstoque.Atualiza_Estoque(-1,wFilial,QEmbarqueItensNotaCod_Produto.Value,1,
                                    (QEmbarqueItensNotaQt_Quantidade.Value), 0,Date,Date);
          QEmbarqueItensNota.Next;
        End;
        QEmbarque.Edit;
        QEmbarqueInd_Atualiza_Estoque.Value := 'NAO';
        QEmbarqueDt_Atualiza_Estoque.Text := '';
        QEmbarque.Post;
        DmOracle.DBCemapa.Commit;
        QEmbarqueItensNota.Close;
      Except
        DmOracle.DBCemapa.Rollback;
        QEmbarqueItensNota.Cancel;
        Raise;
      End;
    End
    else
      raise exception.Create('Estoque não pode ser atualizado, verifique situação das notas');
  End;
end;

procedure TFEmbarqueCad.RelaoBaixadoporData1Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[9].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    QREmbarqueBaixado.Close;
    If Trim(FEmbarqueParam.Me9Embarque.Text) <>'' Then
      QREmbarqueBaixado.SetVariable('EMBARQUE',Trim(FEmbarqueParam.Me9Embarque.Text))
    Else
      QREmbarqueBaixado.SetVariable('EMBARQUE',null);
    If (FEmbarqueParam.Me9DtInicial.Text = '') or (FEmbarqueParam.Me9DtFinal.Text = '')  Then
      Raise Exception.create('É Preciso informar a data')
    else
      QREmbarqueBaixado.SetVariable('DT_INICIAL',trim(FEmbarqueParam.ME9DtInicial.Text));
      QREmbarqueBaixado.SetVariable('DT_FINAL',trim(FEmbarqueParam.ME9DtFinal.Text));
      
    QREmbarqueBaixado.Open;
    If FrEmbarqueBaixado = Nil then
      FrEmbarqueBaixado := TFrEmbarqueBaixado.Create(Application);
      FREmbarqueBaixado.QRLPeriodo.Caption:='Período:'+ FEmbarqueParam.ME9DtInicial.Text+ ' até ' +FEmbarqueParam.ME9DtFinal.Text;
    If FEmbarqueParam.RGPreview.ItemIndex = 0 then
      FrEmbarqueBaixado.QRPrimario.Preview
    Else
      FrEmbarqueBaixado.QRPrimario.Print;
    QREmbarqueBaixado.Close;
  End;

end;

procedure TFEmbarqueCad.RelProdutosEmbarcados1Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[10].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    QRProdutoEmbarcado.Close;
    If Trim(FEmbarqueParam.Me9Classe.Text) <>'' Then
      QRProdutoEmbarcado.SetVariable('COD_CLASSE',Trim(FEmbarqueParam.Me9Classe.Text))
    Else
      QRProdutoEmbarcado.SetVariable('COD_CLASSE',null);

    If (FEmbarqueParam.Me9Data_I.Text = '') or (FEmbarqueParam.Me9Data_F.Text = '')  Then
      Raise Exception.create('É Preciso informar um período')
    else
      QRProdutoEmbarcado.SetVariable('DATA_I',trim(FEmbarqueParam.Me9Data_I.Text));
      QRProdutoEmbarcado.SetVariable('DATA_F',trim(FEmbarqueParam.Me9Data_F.Text)); 

    QRProdutoEmbarcado.Open;
    If FRProdutoEmbarcado = Nil then
      FRProdutoEmbarcado := TFRProdutoEmbarcado.Create(Application);
      FRProdutoEmbarcado.QRLPeriodo.Caption:='Período:'+ trim(FEmbarqueParam.Me9Data_I.Text)+ ' até ' +trim(FEmbarqueParam.Me9Data_F.Text);
    If FEmbarqueParam.RGPreview.ItemIndex = 0 then
      FRProdutoEmbarcado.QRPrimario.Preview
    Else
      FRProdutoEmbarcado.QRPrimario.Print;
    QRProdutoEmbarcado.Close;
  End;
end;

procedure TFEmbarqueCad.EmbarqueNotaFiscaltxt1Click(Sender: TObject);
begin
  inherited;
    If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[0].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FEmbarqueParam.MeFilial.Text),'VENDA');
    QREmbarque_Ped_Nf.Close;

    If Trim(FEmbarqueParam.MEEmbarque.Text) = '' then
      QREmbarque_Ped_Nf.SetVariable('EMBARQUE',Null)
    Else
      QREmbarque_Ped_Nf.SetVariable('EMBARQUE',FEmbarqueParam.MEEmbarque.Text);
    If Trim(FEmbarqueParam.ME0Vendedor.Text) = '' then
      QREmbarque_Ped_Nf.SetVariable('COD_VENDEDOR',Null)
    Else
      QREmbarque_Ped_Nf.SetVariable('COD_VENDEDOR',FEmbarqueParam.ME0Vendedor.Text);

    If (FEmbarqueParam.Me0DtInicial.Text = '') or (FEmbarqueParam.Me0DtFinal.Text = '')  Then
      Raise Exception.create('É Preciso informar um período');
    QREmbarque_Ped_Nf.SetVariable('DT_INICIAL',trim(FEmbarqueParam.Me0DtInicial.Text));
    QREmbarque_Ped_Nf.SetVariable('DT_FINAL',trim(FEmbarqueParam.Me0DtFinal.Text));

    Case FEmbarqueParam.Rg0Operacao.ItemIndex Of
     0 : QREmbarque_Ped_Nf.SetVariable('IND_LIVRO_FISCAL','S');
     1 : QREmbarque_Ped_Nf.SetVariable('IND_LIVRO_FISCAL','N');
     2 : QREmbarque_Ped_Nf.SetVariable('IND_LIVRO_FISCAL',Null);
    End;
    QREmbarque_Ped_Nf.Open;
    If FrEmbarque_Ped_Nf = Nil then
      FrEmbarque_Ped_Nf := TFrEmbarque_Ped_Nf.Create(Application);
    FREmbarque_Ped_Nf.QRLTitulo.Caption := 'Relacao Notas Para Embarque Nr. '+FEmbarqueParam.MEEmbarque.text;
    If FEmbarqueParam.RGPreview.ItemIndex = 0 then
      FREmbarque_Ped_Nf.QRPrimario.Preview
    Else
      FrEmbarque_Ped_Nf.QRPrimario.Print;
    QREmbarque_Ped_Nf.Close;
  End;
end;

procedure TFEmbarqueCad.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  DbEdit8.SetFocus;
end;

procedure TFEmbarqueCad.EmbarqueporCliente1Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[13].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    QREmbarqueCliente.close;
    If (FEmbarqueParam.Me14DtInicial.Text = '') or (FEmbarqueParam.Me14DtFinal.Text = '')  Then
      Raise Exception.create('É Preciso informar um período');
    QREmbarqueCliente.SetVariable('DT_INICIAL',trim(FEmbarqueParam.Me14DtInicial.Text));
    QREmbarqueCliente.SetVariable('DT_FINAL',trim(FEmbarqueParam.Me14DtFinal.Text));
    QREmbarqueCliente.Open;
    If FrEmbarqueCliente = Nil then
      FrEmbarqueCliente := TFrEmbarqueCliente.Create(Application);
    FrEmbarqueCliente.QRLPeriodo.Caption := 'Período: '+FEmbarqueParam.ME14DtInicial.text + ' até '+FEmbarqueParam.ME14DtFinal.Text;
    If FEmbarqueParam.RGPreview.ItemIndex = 0 then
      FrEmbarqueCliente.QRPrimario.Preview
    Else
      FrEmbarqueCliente.QRPrimario.Print;
    QREmbarqueCliente.Close;
  End;
end;

procedure TFEmbarqueCad.PosioEstoqueEmbarque1Click(Sender: TObject);
var
  wVirgula, wAux : string;
  i : integer;
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[14].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    QREstoqueEmbarque.close;
    If Trim(FEmbarqueParam.ME15Filial.Text) = '' then
      //raise exception.create('É necessário informar uma Filial.')
      QREstoqueEmbarque.SetVariable('FILIAL',Null)  
    Else
      QREstoqueEmbarque.SetVariable('FILIAL',Trim(FEmbarqueParam.ME15Filial.Text));
    QREstoqueEmbarque.SetVariable('DT_REFERENCIA',StrToDate(Trim(FEmbarqueParam.Me15DtReferencia.Text)));
    QREstoqueEmbarque.SetVariable('DT_REFERENCIA_FINAL',StrToDate(Trim(FEmbarqueParam.Me15DtReferenciaFinal.Text)));
    QREstoqueEmbarque.SetVariable('ROWNUM_EMBARQUE',StrToInt(FEmbarqueParam.MEEmbarqueInicial.text));

    if FEmbarqueParam.LB15Embarque.Items.Count = 0 then
      QREstoqueEmbarque.SetVariable('LISTA_EMBARQUE','0')
    else
    begin
      wVirgula := '';
      wAux := '';
      For i:=0 to FEmbarqueParam.LB15Embarque.Items.Count-1 do
      begin
        wAux := wAux + wVirgula + FEmbarqueParam.LB15Embarque.Items.Strings[i];
        wVirgula := ',';
      end;
      QREstoqueEmbarque.SetVariable('LISTA_EMBARQUE',wAux);
    end;

    QREstoqueEmbarque.Open;
    If FrPosicaoEstoqueEmbarque = Nil then
      FrPosicaoEstoqueEmbarque := TFrPosicaoEstoqueEmbarque.Create(Application);
    FrPosicaoEstoqueEmbarque.QRLFilial.Caption := 'Filial: '+FEmbarqueParam.ME15Filial.text+ ' '+ FembarqueParam.Ed15Filial.Text;
    FrPosicaoEstoqueEmbarque.QRLPeriodo.Caption := 'Dt. Referência:'+Trim(FEmbarqueParam.Me15DtReferencia.Text);
    FrPosicaoEstoqueEmbarque.setRowNumEmbarque(StrToInt(FEmbarqueParam.MEEmbarqueInicial.text));


    If FEmbarqueParam.RGPreview.ItemIndex = 0 then
      FrPosicaoEstoqueEmbarque.QRPrimario.Preview
    Else
      FrPosicaoEstoqueEmbarque.QRPrimario.Print;
    QREstoqueEmbarque.Close;
  End;

end;

procedure TFEmbarqueCad.BloquearEmbarque1Click(Sender: TObject);
begin
  inherited;
  //--- altera situacao do embarque para bloqueado
  if trim(DMEmbarque.QEmbarqueCOD_EMBARQUE.Text) = '' then
    raise exception.create('É necessário escolher o embarque a ser Bloqueado');

  With DMOracle do
  Begin
    try
      DBCemapa.StartTransaction;
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      QExecSQL.SQL.Add('UPDATE TB_EMBARQUE SET IND_BLOQUEADO = '+CHR(39)+'S'+CHR(39));
      QExecSQL.SQL.Add(' WHERE COD_EMBARQUE = '+trim(DMEmbarque.QEmbarqueCOD_EMBARQUE.Text));
      QExecSQL.ExecSQL;
      DBCemapa.Commit;
    except
      DBCemapa.Rollback;
      showmessage('Não foi possivel bloquear o Embarque');
    end;
  end;
  DMEmbarque.QEmbarque.Refresh;
end;

procedure TFEmbarqueCad.PageControl1Change(Sender: TObject);
begin
  inherited;
  if (trim(DMEmbarque.QEmbarqueCOD_EMBARQUE.Text) <> '') and (DMEmbarque.QEmbarqueIND_BLOQUEADO.Text = 'S') then
  begin
     FEmbarqueCad.PageControl1.Pages[1].Hide;
     showmessage('Embarque Bloqueado, procure a gerência');
  end;
end;

procedure TFEmbarqueCad.DesbloquearPedido1Click(Sender: TObject);
begin
  inherited;
  //--- altera situacao do embarque para desbloqueado
  if trim(DMEmbarque.QEmbarqueCOD_EMBARQUE.Text) = '' then
    raise exception.create('É necessário escolher o embarque a ser Desbloqueado');

  if DMEmbarque.SenhaLiberaCadastro = false then
    raise exception.create('Senha não confere');

  With DMOracle do
  Begin
    try
      DBCemapa.StartTransaction;
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      QExecSQL.SQL.Add('UPDATE TB_EMBARQUE SET IND_BLOQUEADO = '+CHR(39)+'N'+CHR(39));
      QExecSQL.SQL.Add(' WHERE COD_EMBARQUE = '+trim(DMEmbarque.QEmbarqueCOD_EMBARQUE.Text));
      QExecSQL.ExecSQL;
      DBCemapa.Commit;
    except
      DBCemapa.Rollback;
      showmessage('Não foi possivel desbloquear o Embarque');
    end;
  end;
  DMEmbarque.QEmbarque.Refresh;

end;

procedure TFEmbarqueCad.GeraContasaPagar1Click(Sender: TObject);
begin
  inherited;
  if (DMEmbarque.QEmbarqueVAL_TOTAL_FRETE.Value <= 0) Or (DMEmbarque.QEmbarqueVAL_TOTAL_FRETE.Text = '') then
    raise exception.create('Valor inválido de Frete');
  DMOracle.DBCemapa.StartTransaction;
  Try
    With DMEmbarque Do
    begin
      If FConhecimento_CP = Nil then
         FConhecimento_CP := TFConhecimento_CP.Create(Application);
      FConhecimento_CP.BitBtn1.Visible := False;
      FConhecimento_CP.Label1.Caption := 'Frete';
      FConhecimento_CP.Label4.Visible := True;
      FConhecimento_CP.MeCodFinalidadePedagio.Visible := True;
      FConhecimento_CP.SpeedButton4.Visible := True;
      FConhecimento_CP.MeFinalidadePedagio.Visible := True;
      FConhecimento_CP.Label5.Visible := True;
      FConhecimento_CP.MeFinalidadeIcms.Visible := True;
      FConhecimento_CP.EdFinalidadeIcms.Visible := True;
      FConhecimento_CP.SbFinalidadeIcms.Visible := True;
      FConhecimento_CP.MECodbanco.Text := '1';
      FConhecimento_CP.MECodDepartamento.Text := '1';
      FConhecimento_CP.MeCodFinalidadePedagio.Text := '606';
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE' Then
       Begin
         FConhecimento_CP.MECodFinalidade.Text := '4';
         FConhecimento_CP.MeFinalidadeICMS.Text := '287';
       End
      else
       Begin
         FConhecimento_CP.MECodFinalidade.Text := '68';
         FConhecimento_CP.MeFinalidadeICMS.Text := '635';
       End;
      If FConhecimento_CP.ShowModal = MrOk Then
       Begin
         QEmbarque.Edit;
         If (QEmbarqueVAL_TOTAL_FRETE.Value - QEmbarqueVAL_MANIFESTO.Value - QEmbarqueVAL_ADTO_FRETE.Value + QEmbarqueVAL_AJUDA_CUSTO.Value) > 0 Then
          Begin
            GeraContasPagar(QEmbarqueVAL_TOTAL_FRETE.Value - QEmbarqueVAL_MANIFESTO.Value - QEmbarqueVAL_ADTO_FRETE.Value + QEmbarqueVAL_AJUDA_CUSTO.Value,'FRE',StrToInt(Trim(FConhecimento_CP.MECodFinalidade.Text)),QEmbarqueCod_Embarque.Value);
            QEmbarqueCod_Conta_Pagar_Cab.Value := DMContasPagar.QContasPagar_CabCod_Conta_Pagar_Cab.Value;
          End;
         If QEmbarqueVal_Pedagio.Value <> 0 Then
         Begin
           GeraContasPagar(QEmbarqueVal_Pedagio.Value,'PDG',StrToInt(Trim(FConhecimento_CP.MeCodFinalidadePedagio.text)),QEmbarqueCod_Embarque.Value);
           QEmbarqueCod_Conta_Pagar_Cab_Pedagio.Value := DMContasPagar.QContasPagar_CabCod_Conta_Pagar_Cab.Value;
         End;
         If QEmbarqueVal_ICMS.Value <> 0 Then
         Begin
           GeraContasPagar(QEmbarqueVal_Icms.Value,'ICM',StrToInt(Trim(FConhecimento_CP.MeFinalidadeICMS.text)),QEmbarqueCod_Embarque.Value);
           QEmbarqueCod_Conta_Pagar_Cab_Icms.Value := DMContasPagar.QContasPagar_CabCod_Conta_Pagar_Cab.Value;
         End;
         If (QEmbarqueVal_MANIFESTO.Text <> '')  And (QEmbarqueNum_MANIFESTO.Text <> '') Then
         Begin
           GeraContasPagar(QEmbarqueVal_MANIFESTO.Value,'MAN',StrToInt(Trim(FConhecimento_CP.MECodFinalidade.text)),QEmbarqueNum_MANIFESTO.Value);
           QEmbarqueCod_Conta_Pagar_Cab_Compl.Value := DMContasPagar.QContasPagar_CabCod_Conta_Pagar_Cab.Value;
         End;
         QEmbarqueIND_ACERTO_FRETE.Value := 'S';  //--muda situacao do frete para fechado(acertado com o motorista)
         QEmbarque.Post;
         Emite_Conhecimento_Frete(DMEmbarque.QEmbarqueVAL_TOTAL_FRETE.Value,
                                  DMEmbarque.QEmbarqueVAL_ICMS.Value, //tava passando 0
                                  DMEmbarque.QEmbarqueVAL_AJUDA_CUSTO.Value, //tava passando 0
                                  DMEmbarque.QEmbarqueVAL_PEDAGIO.Value, //tava passando 0
                                  DMEmbarque.QEmbarqueVAL_ADTO_FRETE.Value, //tava passando 0
                                  'CONHECIMENTO DE FRETE');
         DMContasPagar.QContasPagar_Mov.Close;
         DMContasPagar.QContasPagar_cab.Close;
       End;
       DMOracle.DBCemapa.Commit;
   End;
   Except
     DMEmbarque.QEmbarque.Cancel;
     DMContasPagar.QContasPagar_Cab.Cancel;
     DMContasPagar.QContasPagar_Mov.Cancel;
     DMOracle.DBCemapa.Rollback;
     Raise;
   End;
end;

procedure TFEmbarqueCad.ExcluiContasaPagar1Click(Sender: TObject);
begin
  inherited;
  DMEmbarque.pApagando:=true;
  if DMEmbarque.QEmbarqueCod_Embarque.Value <> 0 then
   begin
     if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMEmbarque.QEmbarqueDt_Embarque.Value Then
        raise Exception.Create('Não é Permitido excluir este Frete - Fechamento Financeiro');
     DMOracle.DBCemapa.StartTransaction;
     Try
       ExcluiMovimentos(DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab.Value); // volta contas a pagar do frete
       DMEmbarque.QEmbarque.Edit;
       DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab.Text := '';
       If DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Pedagio.Text <> '' Then  // volta contas a pagar do Pedagio
        Begin
          ExcluiMovimentos(DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Pedagio.Value); // volta contas a pagar do Pedagio
          DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Pedagio.Text := '';
        End;
       If DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Icms.Text <> '' Then
        Begin
          ExcluiMovimentos(DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Icms.Value); // volta contas a pagar do ICMS
          DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Icms.Text := '';
        End;
       If DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Compl.Text <> '' Then
        Begin
          ExcluiMovimentos(DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Compl.Value); // volta contas a pagar do Complemento
          DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Compl.Text := '';
        End;
       DMEmbarque.QEmbarqueIND_ACERTO_FRETE.Value := 'N';  //--muda situacao do frete para Aberto(nao acertado com o motorista)
       DMEmbarque.QEmbarque.Post;
       DMOracle.DBCemapa.Commit;
       showmessage('Contas a Pagar foi excluido com sucesso.');
     Except
        showmessage('Não foi possivel excluir o Contas a Pagar');
        DMOracle.DBCemapa.Rollback;
        DMContasPagar.QContasPagar_Cab.Close;
        DMContasPagar.QContasPagar_Mov.Close;
        DMEmbarque.QEmbarque.Close;
        DMEmbarque.QEmbarque.Open;
        Raise;
     End;
  end;
  DMEmbarque.pApagando:=false;
end;

procedure TFEmbarqueCad.DBEdit1Change(Sender: TObject);
begin
  inherited;
  MMCadSimples.Items[2].Items[7].Enabled := DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab.isNull;
  MMCadSimples.Items[2].Items[8].Enabled := DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab.Text <> '';
  MMCadSimples.Items[2].Items[14].Enabled := DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Adto.isNull;
  MMCadSimples.Items[2].Items[15].Enabled := DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Adto.Text <> '';
//  MMCadSimples.Items[2].Items[17].Enabled := DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Compl.isNull;
//  MMCadSimples.Items[2].Items[18].Enabled := DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Compl.Text <> '';
  SbReciboAdto.Enabled := Not(DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Adto.isNull);
end;

procedure TFEmbarqueCad.SbReciboAdtoClick(Sender: TObject);
begin
  inherited;
  if (trim(DMEmbarque.QEmbarqueVAL_ADTO_FRETE.Text) <> '') then
     Emite_Recibo_Frete(DMEmbarque.QEmbarqueVAL_ADTO_FRETE.Value,'Adiantamento ')
  else
    showmessage('Impossível Emitir Recibo! Não exite valor de Adiantamento de Frete');
end;

procedure TFEmbarqueCad.DBEdit25Exit(Sender: TObject);
begin
  inherited;
  with DMEmbarque do
  begin
    if (QEmbarqueVal_Total_Frete.Text <> '') And (QCalculaValorCargaVal_Carga.Value > 0) then
    begin
      LBPercentual.Caption:= FormatFloat('#,##0.00',(((DMEmbarque.QEmbarqueVAL_TOTAL_FRETE.Value +
                                                       DMEmbarque.QEmbarqueVAL_FRETE_COMPLEMENTO.Value +
// RODRIGO PEDIU PARA RETIRAR                                                       DMEmbarque.QEmbarqueVAL_ADTO_FRETE.Value +
                                                       DMEmbarque.QEmbarqueVAL_AJUDA_CUSTO.Value +
                                                       DMEmbarque.QEmbarqueVAL_PEDAGIO.Value)*100)/(QCalculaValorCargaVal_Carga.Value)));
    end;
  end;

end;

procedure TFEmbarqueCad.DBEdit19Exit(Sender: TObject);
begin
  inherited;
  DBEdit25Exit(self);
end;

procedure TFEmbarqueCad.DBEdit20Exit(Sender: TObject);
begin
  inherited;
  DBEdit25Exit(self);
end;

procedure TFEmbarqueCad.DBEdit22Change(Sender: TObject);
begin
  inherited;
  DBEdit25Exit(self);
end;

procedure TFEmbarqueCad.DBEdit6Exit(Sender: TObject);
begin
  inherited;
  with DMEmbarque do
  begin
    QEmbarqueDESC_DESTINO_FRETE.Value := QEmbarqueDesc_Obs.Value;
  end;
end;

procedure TFEmbarqueCad.DBEdit6Change(Sender: TObject);
begin
  inherited;
  DBEdit6Exit(self);
end;

Procedure TFEmbarqueCad.RelFretes1Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[15].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    QRFretes.close;
    If (Trim(FEmbarqueParam.ME16Transportador.Text) = '') then
      QRFretes.SetVariable('TRANSPORTADOR',Null)
    Else
      QRFretes.SetVariable('TRANSPORTADOR',FEmbarqueParam.ME16Transportador.Text);
    If (Trim (FEmbarqueParam.ME16Dt_Embarque_I.Text) = '') or (Trim(FEmbarqueParam.ME16Dt_Embarque_F.Text) = '') then
      raise exception.create('É necessário informar uma data inicial e final')
    Else
     begin
       QRFretes.SetVariable('DATA_I',Trim(FEmbarqueParam.ME16Dt_Embarque_I.Text));
       QRFretes.SetVariable('DATA_F',Trim(FEmbarqueParam.ME16Dt_Embarque_F.Text));
     End;
    case FEmbarqueParam.RG16TipoVeiculo.ItemIndex of
      0:QRFretes.SetVariable('TIPO_VEICULO','34');
      1:QRFretes.SetVariable('TIPO_VEICULO','TOCO');
      2:QRFretes.SetVariable('TIPO_VEICULO','TRUCK');
      3:QRFretes.SetVariable('TIPO_VEICULO','CARRETA');
      4:QRFretes.SetVariable('TIPO_VEICULO',Null);
    end;
    Case FEmbarqueParam.Rg16Acertado.ItemIndex of
      0:QRFretes.SetVariable('IND_ACERTO_FRETE','S');
      1:QRFretes.SetVariable('IND_ACERTO_FRETE','N');
      2:QRFretes.SetVariable('IND_ACERTO_FRETE',Null);
    End;
    QRFretes.Open;
    If FRFretes = Nil then
      FRFretes := TFRFretes.Create(Application);
    FRFretes.QRLPeriodo.Caption := 'Periodo:'+Trim(FEmbarqueParam.ME16Dt_Embarque_I.Text)+' até '+
                                    Trim(FEmbarqueParam.ME16Dt_Embarque_F.Text);
    If FEmbarqueParam.RGPreview.ItemIndex = 0 then
      FRFretes.QRPrimario.Preview
    Else
      FRFretes.QRPrimario.Print;
    QRFretes.Close;
  End;
End;

procedure TFEmbarqueCad.EtiqCodBarraProduoEmbarque1Click(Sender: TObject);
var
wcont, wCont1, wCont2, wCont3, wQtd, wQtd1, wVolume :integer;
wNum_Controle, wProduto, wComando : string;
begin
  inherited;
  if DmParamSistema.QParamSistemaCod_Empresa.Text = 'CGS' then
  Begin
    wcont := 1;
    wQtd1 := 0;
    wCont3 := 0;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[16].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  Begin
    if FEmbarqueParam.RG17Tipo.ItemIndex = 1 then
    //if FEmbarqueParam.RB17Embarque.checked = False then
    Begin
      with DMEmbarque do
        begin
          QEtiqueta.Close;
          QEtiqueta.open;
        if QEtiqueta.RecordCount > 0 then
          begin
            QEtiqueta.First;
          while not QEtiqueta.Eof do
            QEtiqueta.Delete;
          end;
        end;
      with DMEmbarque do
        begin
          QREtiqCodBarraProducao.Close;
          if Trim(FEmbarqueParam.ME17Embarque.Text) <> '' then
            QREtiqCodBarraProducao.SetVariable('EMBARQUE',FEmbarqueParam.ME17Embarque.Text)
          else
           Raise Exception.Create('É preciso informar o embarque!');
          IF Trim(FEmbarqueParam.Me17Classe.Text) = ''  THEN
            QREtiqCodBarraProducao.SetVariable('CLASSE',Null)
          else
            QREtiqCodBarraProducao.SetVariable('CLASSE',FEmbarqueParam.ME17Classe.Text);

          QREtiqCodBarraProducao.Open;
          QREtiqCodBarraProducao.First;
      Try
        DMoracle.DBCemapa.StartTransaction;
      while not QREtiqCodBarraProducao.Eof do
        begin
          If QREtiqCodBarraProducaoNUM_VOLUMES.Value < 1 then
            QREtiqCodBarraProducaoNUM_VOLUMES.Text:= '1';
          wProduto := QREtiqCodBarraProducaoCOD_PRODUTO.Text;
          wQtd := StrToInt(QREtiqCodBarraProducaoQT_PEDIDO.Text);

          if wQtd > 0 then
          Begin

            if ((wQtd <> 1) and (wQtd1 < wQtd)) then
            Begin
              while ((wQtd <> 1) and (wQtd1 < wQtd)) do
              Begin
                if wcont = 1 then
                Begin
                  if (QREtiqCodBarraProducaoNUM_VOLUMES.Text < '1') then
                    QREtiqCodBarraProducaoNUM_VOLUMES.Text:= '1';
                  QEtiqueta.Insert;
                  QEtiquetaETIQUETA1.Value:= Bib.StrZero(IntToStr(DMSequencia.Sequencia(1,'PRODUCAO-CGS')),6) +
                                             Bib.StrZero(QREtiqCodBarraProducaoCOD_PRODUTO.Text,6)  +
                                             QREtiqCodBarraProducaoNUM_VOLUMES.Text;
                end;

                if wcont = 2 then
                Begin
                  if (QREtiqCodBarraProducaoNUM_VOLUMES.Text < '1') then
                    QREtiqCodBarraProducaoNUM_VOLUMES.Text:= '1';
                  QEtiquetaETIQUETA2.Value:= Bib.StrZero(IntToStr(DMSequencia.Sequencia(1,'PRODUCAO-CGS')),6) +
                                             Bib.StrZero(QREtiqCodBarraProducaoCOD_PRODUTO.Text,6)  +
                                             QREtiqCodBarraProducaoNUM_VOLUMES.Text;
                end;

                if wcont = 3 then
                Begin
                  if (QREtiqCodBarraProducaoNUM_VOLUMES.Text < '1') then
                    QREtiqCodBarraProducaoNUM_VOLUMES.Text:= '1';
                  QEtiquetaETIQUETA3.Value:= Bib.StrZero(IntToStr(DMSequencia.Sequencia(1,'PRODUCAO-CGS')),6) +
                                             Bib.StrZero(QREtiqCodBarraProducaoCOD_PRODUTO.Text,6)  +
                                             QREtiqCodBarraProducaoNUM_VOLUMES.Text;
                end;

                if wcont = 4 then
                Begin
                  if (QREtiqCodBarraProducaoNUM_VOLUMES.Text < '1') then
                    QREtiqCodBarraProducaoNUM_VOLUMES.Text:= '1';
                  QEtiquetaETIQUETA4.Value:= Bib.StrZero(IntToStr(DMSequencia.Sequencia(1,'PRODUCAO-CGS')),6) +
                                             Bib.StrZero(QREtiqCodBarraProducaoCOD_PRODUTO.Text,6)  +
                                             QREtiqCodBarraProducaoNUM_VOLUMES.Text;
                end;

                if wcont = 5 then
                Begin
                  if (QREtiqCodBarraProducaoNUM_VOLUMES.Text < '1') then
                    QREtiqCodBarraProducaoNUM_VOLUMES.Text:= '1';
                  QEtiquetaETIQUETA5.Value:= Bib.StrZero(IntToStr(DMSequencia.Sequencia(1,'PRODUCAO-CGS')),6) +
                                             Bib.StrZero(QREtiqCodBarraProducaoCOD_PRODUTO.Text,6)  +
                                             QREtiqCodBarraProducaoNUM_VOLUMES.Text;
                  QEtiqueta.Post;
                end;

                if wcont = 5 then
                  Begin
                  wCont := 1;
                  inc(wQtd1);
                  end
                else
                Begin
                  inc(wcont);
                  inc(wQtd1);
                end;
              end;
                wQtd1 := 0;
              end
              else
              Begin
                if wcont = 1 then
                Begin
                  if (QREtiqCodBarraProducaoNUM_VOLUMES.Text < '1') then
                    QREtiqCodBarraProducaoNUM_VOLUMES.Text:= '1';
                  QEtiqueta.Insert;
                  QEtiquetaETIQUETA1.Value:= Bib.StrZero(IntToStr(DMSequencia.Sequencia(1,'PRODUCAO-CGS')),6) +
                                             Bib.StrZero(QREtiqCodBarraProducaoCOD_PRODUTO.Text,6)  +
                                             QREtiqCodBarraProducaoNUM_VOLUMES.Text;
                end;

                if wcont = 2 then
                Begin
                 if (QREtiqCodBarraProducaoNUM_VOLUMES.Text < '1') then
                    QREtiqCodBarraProducaoNUM_VOLUMES.Text:= '1';
                  QEtiquetaETIQUETA2.Value:= Bib.StrZero(IntToStr(DMSequencia.Sequencia(1,'PRODUCAO-CGS')),6) +
                                             Bib.StrZero(QREtiqCodBarraProducaoCOD_PRODUTO.Text,6)  +
                                             QREtiqCodBarraProducaoNUM_VOLUMES.Text;
                end;

                if wcont = 3 then
                Begin
                  if (QREtiqCodBarraProducaoNUM_VOLUMES.Text < '1') then
                    QREtiqCodBarraProducaoNUM_VOLUMES.Text:= '1';
                  QEtiquetaETIQUETA3.Value:= Bib.StrZero(IntToStr(DMSequencia.Sequencia(1,'PRODUCAO-CGS')),6) +
                                             Bib.StrZero(QREtiqCodBarraProducaoCOD_PRODUTO.Text,6)  +
                                             QREtiqCodBarraProducaoNUM_VOLUMES.Text;
                end;

                if wcont = 4 then
                Begin
                  if (QREtiqCodBarraProducaoNUM_VOLUMES.Text < '1') then
                    QREtiqCodBarraProducaoNUM_VOLUMES.Text:= '1';
                  QEtiquetaETIQUETA4.Value:= Bib.StrZero(IntToStr(DMSequencia.Sequencia(1,'PRODUCAO-CGS')),6) +
                                             Bib.StrZero(QREtiqCodBarraProducaoCOD_PRODUTO.Text,6)  +
                                             QREtiqCodBarraProducaoNUM_VOLUMES.Text;
                end;

                if wcont = 5 then
                Begin
                  if (QREtiqCodBarraProducaoNUM_VOLUMES.Text < '1') then
                    QREtiqCodBarraProducaoNUM_VOLUMES.Text:= '1';
                  QEtiquetaETIQUETA5.Value:= Bib.StrZero(IntToStr(DMSequencia.Sequencia(1,'PRODUCAO-CGS')),6) +
                                             Bib.StrZero(QREtiqCodBarraProducaoCOD_PRODUTO.Text,6)  +
                                             QREtiqCodBarraProducaoNUM_VOLUMES.Text;
                  QEtiqueta.Post;
                end;

                if wcont = 5 then
                  wCont := 1
                else
                  inc(wcont);
                end;
              end;
              QREtiqCodBarraProducao.Next;
            end;
            DMOracle.DBCemapa.Commit;
            except
              ShowMessage('Erro na Gravação do Lançamento da Produção');
              DMOracle.DBCemapa.Rollback;
              raise;
           end;
        if FREtiqCodBarra_Producao = nil then
          FREtiqCodBarra_Producao:=TFREtiqCodBarra_Producao.Create(Application);
          FREtiqCodBarra_Producao.QuickRep1.Preview;
          QREtiqCodBarraProducao.Close;
         end;
       end

       else //aqui faz a impressao de etiquetas para o embarque da cgs

       Begin
         with DMEmbarque do
           begin
             QEtiqueta.Close;
             QEtiqueta.open;
           if QEtiqueta.RecordCount > 0 then
             begin
               QEtiqueta.First;
             while not QEtiqueta.Eof do
               QEtiqueta.Delete;
             end;
           end;

          With DMEmbarque do
          Begin
            QREtiqCodBarraEmbarque.Close;
            QREtiqCodBarraProducao.Close;
            if FEmbarqueParam.ME17Embarque.Text <> '      ' then
              QREtiqCodBarraProducao.SetVariable('EMBARQUE',FEmbarqueParam.ME17Embarque.Text)
            else
              Raise Exception.Create('É preciso informar o embarque!');
            QREtiqCodBarraProducao.SetVariable('CLASSE',Null);

            QREtiqCodBarraProducao.Open;
            QREtiqCodBarraProducao.First;

            while not QREtiqCodBarraProducao.Eof do
            begin
              If StrToFloat(QREtiqCodBarraProducaoNUM_VOLUMES.Text) < 1 then
                QREtiqCodBarraProducaoNUM_VOLUMES.Text:= '1';
              wProduto := QREtiqCodBarraProducaoCOD_PRODUTO.Text;
              wQtd := StrToInt(QREtiqCodBarraProducaoQT_PEDIDO.Text)* StrToInt(QREtiqCodBarraProducaoNUM_VOLUMES.Text);

              if ((wQtd <> 1) and (wQtd1 < wQtd)) then
              Begin
                while ((wQtd <> 1) and (wQtd1 < wQtd)) do
                Begin
                  if QREtiqCodBarraEmbarqueCOD_PRODUTO.Text <> wProduto then
                  Begin
                    QREtiqCodBarraEmbarque.close;
                    QREtiqCodBarraEmbarque.SetVariable('PRODUTO',wProduto);
                    QREtiqCodBarraEmbarque.Open;
                    QREtiqCodBarraEmbarque.First;
                  end;
                  If QREtiqCodBarraEmbarqueNUM_VOLUMES.Value < 1 then
                    QREtiqCodBarraEmbarqueNUM_VOLUMES.Text:= '1';
                  if wcont = 1 then
                  Begin
                    if ((QREtiqCodBarraEmbarqueNUM_VOLUMES.Text <= '1') or (wCont3 = 0)
                     or (wCont3 > QREtiqCodBarraEmbarqueNUM_VOLUMES.Value))then
                      wCont3 := 1;
                    QEtiqueta.Insert;
                    QEtiquetaETIQUETA1.Value:= Bib.StrZero(QREtiqCodBarraEmbarqueNUM_CONTROLE.Text,6) +
                                               Bib.StrZero(QREtiqCodBarraEmbarqueCOD_PRODUTO.Text,6)  +
                                               IntToStr(wCont3) + QREtiqCodBarraEmbarqueNUM_VOLUMES.Text;
                    inc(wCont3);
                  end;

                  if wcont = 2 then
                  Begin
                    if ((QREtiqCodBarraEmbarqueNUM_VOLUMES.Text <= '1') or (wCont3 = 0)
                     or (wCont3 > QREtiqCodBarraEmbarqueNUM_VOLUMES.Value))then
                      wCont3 := 1;
                    QEtiquetaETIQUETA2.Value:= Bib.StrZero(QREtiqCodBarraEmbarqueNUM_CONTROLE.Text,6) +
                                               Bib.StrZero(QREtiqCodBarraEmbarqueCOD_PRODUTO.Text,6)  +
                                               IntToStr(wCont3) + QREtiqCodBarraEmbarqueNUM_VOLUMES.Text;
                    inc(wCont3);
                  end;

                  if wcont = 3 then
                  Begin
                    if ((QREtiqCodBarraEmbarqueNUM_VOLUMES.Text <= '1') or (wCont3 = 0)
                     or (wCont3 > QREtiqCodBarraEmbarqueNUM_VOLUMES.Value))then
                      wCont3 := 1;
                    QEtiquetaETIQUETA3.Value:= Bib.StrZero(QREtiqCodBarraEmbarqueNUM_CONTROLE.Text,6) +
                                               Bib.StrZero(QREtiqCodBarraEmbarqueCOD_PRODUTO.Text,6)  +
                                               IntToStr(wCont3) + QREtiqCodBarraEmbarqueNUM_VOLUMES.Text;
                    QEtiqueta.Post;
                    inc(wCont3);
                  end;
                  QREtiqCodBarraEmbarque.Next;
                  if wcont = 3 then
                  Begin
                    wCont := 1;
                    inc(wQtd1);
                  end
                  else
                  Begin
                    inc(wcont);
                    inc(wQtd1);
                  end;
                end;
                QREtiqCodBarraProducao.Next;
                wQtd1 := 0;
                end
              else
              Begin
                if QREtiqCodBarraEmbarqueCOD_PRODUTO.Text <> wProduto then
                Begin
                  QREtiqCodBarraEmbarque.close;
                  QREtiqCodBarraEmbarque.SetVariable('PRODUTO',wProduto);
                  QREtiqCodBarraEmbarque.Open;
                  QREtiqCodBarraEmbarque.First;
                end;
                if wcont = 1 then
                Begin
                  if ((QREtiqCodBarraEmbarqueNUM_VOLUMES.Text <= '1') or (wCont3 = 0)
                     or (wCont3 > QREtiqCodBarraEmbarqueNUM_VOLUMES.Value))then
                    wCont3 := 1;
                  QEtiqueta.Insert;
                  QEtiquetaETIQUETA1.Value:= Bib.StrZero(QREtiqCodBarraEmbarqueNUM_CONTROLE.Text,6) +
                                             Bib.StrZero(QREtiqCodBarraEmbarqueCOD_PRODUTO.Text,6)  +
                                             IntToStr(wCont3) + QREtiqCodBarraEmbarqueNUM_VOLUMES.Text;
                  inc(wCont3);
                end;

                if wcont = 2 then
                Begin
                  if ((QREtiqCodBarraEmbarqueNUM_VOLUMES.Text <= '1') or (wCont3 = 0)
                     or (wCont3 > QREtiqCodBarraEmbarqueNUM_VOLUMES.Value))then
                    wCont3 := 1;
                  QEtiquetaETIQUETA2.Value:= Bib.StrZero(QREtiqCodBarraEmbarqueNUM_CONTROLE.Text,6) +
                                             Bib.StrZero(QREtiqCodBarraEmbarqueCOD_PRODUTO.Text,6)  +
                                             IntToStr(wCont3) + QREtiqCodBarraEmbarqueNUM_VOLUMES.Text;
                  inc(wCont3);
                end;

                if wcont = 3 then
                Begin
                  if ((QREtiqCodBarraEmbarqueNUM_VOLUMES.Text <= '1') or (wCont3 = 0)
                     or (wCont3 > QREtiqCodBarraEmbarqueNUM_VOLUMES.Value))then
                    wCont3 := 1;
                  QEtiquetaETIQUETA3.Value:= Bib.StrZero(QREtiqCodBarraEmbarqueNUM_CONTROLE.Text,6) +
                                             Bib.StrZero(QREtiqCodBarraEmbarqueCOD_PRODUTO.Text,6)  +
                                             IntToStr(wCont3) + QREtiqCodBarraEmbarqueNUM_VOLUMES.Text;
                  QEtiqueta.Post;
                  inc(wCont3);
                end;
                QREtiqCodBarraEmbarque.Next;
                if wcont = 3 then
                  wCont := 1
                else
                  inc(wcont);
                  QREtiqCodBarraProducao.Next;
                end;
             end;

            Try
              DMOracle.DBCemapa.StartTransaction;
            with DMEmbarque do
            begin
              QREtiqCodBarraEmbarque.Close;
              QREtiqCodBarraProducao.Close;
            if FEmbarqueParam.ME17Embarque.Text <> '      ' then
              QREtiqCodBarraProducao.SetVariable('EMBARQUE',FEmbarqueParam.ME17Embarque.Text)
            else
              Raise Exception.Create('É preciso informar o embarque!');

              QREtiqCodBarraProducao.Open;
              QREtiqCodBarraProducao.First;

              while not QREtiqCodBarraProducao.Eof do
              begin
                if ((wCont2 <> 0) and (wCont2 < wQtd)) then
                  Raise Exception.Create('Produto ' + wProduto +  ' Não disponível para Embarque');
                wCont1 := 0;
                wCont2 := 0;
                wProduto := QREtiqCodBarraProducaoCOD_PRODUTO.Text;
                if (QREtiqCodBarraProducaoNUM_VOLUMES.Text < '1') then
                  wVolume := 1
                else
                wVolume := StrToInt(QREtiqCodBarraProducaoNUM_VOLUMES.Text);
                wQtd := StrToInt(QREtiqCodBarraProducaoQT_PEDIDO.Text)* wVolume;

                QREtiqCodBarraEmbarque.close;
                QREtiqCodBarraEmbarque.SetVariable('PRODUTO',wProduto);
                QREtiqCodBarraEmbarque.Open;
                QREtiqCodBarraEmbarque.First;

                if QREtiqCodBarraEmbarqueNUM_LINHA.Text <> '1' then
                  raise exception.create('Produto ' + wProduto +  ' Não disponível para Embarque');
                while ((not QREtiqCodBarraEmbarque.Eof) and (wQtd > wCont2)) do
                  Begin
                    DMEstoque.QEstoqueProducao.Close;
                    DMEstoque.QEstoqueProducao.SetVariable('PK',QREtiqCodBarraEmbarqueCOD_ESTOQUE_PRODUCAO.Value);
                    DMEstoque.QEstoqueProducao.open;
                    DMEstoque.QEstoqueProducao.Edit;
                    DMEstoque.QEstoqueProducaoNUM_LINHA.Value := 2;
                    DMEstoque.QEstoqueProducaoCOD_EMBARQUE.Value := QREtiqCodBarraProducaoCOD_EMBARQUE.Value;
                    DMEstoque.QEstoqueProducao.Post;
                    inc(wCont2);
                    QREtiqCodBarraEmbarque.next
                  end;
              QREtiqCodBarraProducao.next;
              end;
            end;
            if ((wCont2 <> 0) and (wCont2 < wQtd)) then
              Raise Exception.Create('Produto ' + wProduto +  ' Não disponível para Embarque');
              DmOracle.DBCemapa.Commit;
            Except
              DmOracle.DBCemapa.Rollback;
            Raise;
            End;
          end;
          if FREtiqCodBarra_Embarque = nil then
            FREtiqCodBarra_Embarque:=TFREtiqCodBarra_Embarque.Create(Application);
            FREtiqCodBarra_Embarque.QuickRep1.Preview;
            DMEmbarque.QREtiqCodBarraProducao.Close;
           end;
         end;
     DMOracle.DBCemapa.Commit;
   end;
 end;  
procedure TFEmbarqueCad.FormCreate(Sender: TObject);
begin
  inherited;
  if DSPrimario.DataSet = nil then
    DSPrimario.DataSet := DMEmbarque.QEmbarque;
end;

procedure TFEmbarqueCad.SituaoAcerto1Click(Sender: TObject);
begin
  inherited;
  if FSituacaoAcerto = nil then
    FSituacaoAcerto:= TFSituacaoAcerto.create(application);
  FSituacaoAcerto.showModal;
end;

procedure TFEmbarqueCad.BaixaEstoque1Click(Sender: TObject);
begin
  inherited;
  if DmParamSistema.QParamSistemaCod_Empresa.Text = 'CGS' then
  Begin
    If FBaixaEstoqueLeitor = Nil then
      FBaixaEstoqueLeitor := TFBaixaEstoqueLeitor.Create(Application);
    FBaixaEstoqueLeitor.ShowModal;
  end;     
end;

procedure TFEmbarqueCad.ExcluiMovimentos(wCodigo:Integer);
Begin
  with DMContasPagar do
  begin
    QContasPagar_Cab.Close;  // volta contas a pagar do frete
    QContasPagar_Mov.Close;
    QContasPagar_Cab.SetVariable('Pk',wCodigo);
    QContasPagar_Cab.Open;
    QContasPagar_Mov.Open;
    While not QContasPagar_Cab.Eof do
     Begin
       If (QContasPagar_MovInd_Tipo_Movimento.Value <> 'PRINCIPAL') then
          Raise Exception.Create('Conta a Pagar com baixas!')
       Else
          QContasPagar_Mov.Delete;
       QContasPagar_Cab.Delete;
     End;
  End;
End;

Procedure TFEmbarqueCad.GeraContasPagar(wValor : Real; wTipo : String; wFinalidade,wNumero : Integer);
Begin
   With DMContasPagar do
   Begin
      QContasPagar_Mov.Close;
      QContasPagar_cab.Close;
      QContasPagar_cab.Open;
      QContasPagar_Mov.Open;
      QContasPagar_Cab.Insert;
      QContasPagar_cabCod_Finalidade.Value:=wFinalidade;
      if Trim(FConhecimento_CP.MECodBanco.Text)<>'' then
        QContasPagar_CabCOD_BANCO_AGENCIA.Value:=StrToInt(Trim(FConhecimento_CP.MECodBanco.text));
      if Trim(FConhecimento_CP.MECodDepartamento.Text)<>'' then
        QContasPagar_CabCOD_Departamento.Value:=StrToInt(Trim(FConhecimento_CP.MECodDepartamento.text));
      QContasPagar_CabCod_Cadastro.Value:= DMEmbarque.QEmbarqueCod_Transportador.Value;
      QContasPagar_CabCod_Filial.Value:=1;
      QContasPagar_CabDesc_tipo_Documento.Value:=wTipo;
      QContasPagar_CabDT_EMISSAO.Value:=Date;
      QContasPagar_CabDT_VENCIMENTO.Value:=DMEmbarque.QEmbarqueDT_Vencimento.value;
      QContasPagar_CabVAL_TITULO.Value:=wValor;
      QContasPagar_CabNUM_TITULO.Value:=wNumero;
      QContasPagar_CabIND_ACEITE.Value:='NAO';
      QContasPagar_CabIND_SITUACAO.Value:='ABERTO';
      QContasPagar_Cab.Post;
    End;
End;

procedure TFEmbarqueCad.GeraContasPagarAdiantamento1Click(Sender: TObject);
begin
  inherited;
  With DMEmbarque Do
  begin
    If FConhecimento_CP = Nil then
       FConhecimento_CP := TFConhecimento_CP.Create(Application);
    FConhecimento_CP.BitBtn1.Visible := False;
    FConhecimento_CP.Label1.Caption := 'Adiantamento';
    FConhecimento_CP.Label4.Visible := False;
    FConhecimento_CP.MeCodFinalidadePedagio.Visible := False;
    FConhecimento_CP.SpeedButton4.Visible := False;
    FConhecimento_CP.MeFinalidadePedagio.Visible := False;

    If FConhecimento_CP.ShowModal = MrOk Then
     Begin
       DMOracle.DBCemapa.StartTransaction;
       Try
         If DMEmbarque.QEmbarqueVAL_ADTO_FRETE.Value > 0 Then
            GeraContasPagar(DMEmbarque.QEmbarqueVAL_ADTO_FRETE.Value,'ADT',StrToInt(Trim(FConhecimento_CP.MECodFinalidade.Text)),DMEmbarque.QEmbarqueCOD_EMBARQUE.Value);
         DMOracle.QExecSQL.Close;
         DMOracle.QExecSQL.SQL.Clear;
         DMOracle.QExecSQL.SQL.Add('UPDATE TB_EMBARQUE SET Cod_Conta_Pagar_Cab_Adto = '+DMContasPagar.QContasPagar_CabCod_Conta_Pagar_Cab.Text);
         DMOracle.QExecSQL.SQL.Add(' WHERE COD_EMBARQUE = '+Trim(DMEmbarque.QEmbarqueCOD_EMBARQUE.Text));
         DMOracle.QExecSQL.ExecSQL;
         DMContasPagar.QContasPagar_Mov.Close;
         DMContasPagar.QContasPagar_cab.Close;
         DMOracle.DBCemapa.Commit;
         QEmbarque.Close;
         QEmbarque.Open;
       Except
         DMEmbarque.QEmbarque.Cancel;
         DMContasPagar.QContasPagar_Cab.Cancel;
         DMContasPagar.QContasPagar_Mov.Cancel;
         DMOracle.DBCemapa.Rollback;
         Raise Exception.Create('Não foi possivel gerar contas a pagar!');
       End;
     End;
  End;
end;

procedure TFEmbarqueCad.VoltaAdiantamentoContasPagar1Click(
  Sender: TObject);
begin
  inherited;
  DMEmbarque.pApagando:=true;
  if DMEmbarque.QEmbarqueCod_Embarque.Value <> 0 then
   begin
     if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMEmbarque.QEmbarqueDt_Embarque.Value Then
        raise Exception.Create('Não é Permitido excluir este Frete - Fechamento Financeiro');
     DMOracle.DBCemapa.StartTransaction;
     Try
       If DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Adto.Text <> '' Then  // volta contas a pagar do adiantamento
          ExcluiMovimentos(DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Adto.Value); // volta contas a pagar do frete Adiantamento
       DMEmbarque.QEmbarque.Edit;
       DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Adto.Text := '';
       DMEmbarque.QEmbarque.Post;
       DMOracle.DBCemapa.Commit;
       showmessage('Contas a Pagar foi excluido com sucesso.');
     Except
        showmessage('Não foi possivel excluir o Contas a Pagar');
        DMOracle.DBCemapa.Rollback;
        DMContasPagar.QContasPagar_Cab.Close;
        DMContasPagar.QContasPagar_Mov.Close;
        DMEmbarque.QEmbarque.Close;
        DMEmbarque.QEmbarque.Open;
        Raise;
     End;
  end;
  DMEmbarque.pApagando:=false;
end;

procedure TFEmbarqueCad.DBEdit30Exit(Sender: TObject);
begin
  inherited;
  DBEdit25Exit(self);
end;

procedure TFEmbarqueCad.InsereNf(wFilial,wCadastro,wOperacao,wVendedor,wNr_Dias_Cheque,wNr_Dias_Cheque1,wNr_Dias_Cheque2,wNr_Dias_Cheque3,wNr_Dias_Cheque4,
                       wTransportador,wCodMensagem,wDepartamento,wNum_Pedido,wCod_Prazo : Integer;
                      wPerc_Comissao_Nota,wVal_Desconto : Real;
                      wTipo_Pagamento,wTipo_Frete,wComplemento_Obs,wObservacao : String);
Var wTipoNota : String;
Begin
  With DMNotaSaida Do
  Begin
    QNotaSaida.Insert;
    QNotaSaidaCod_Filial.Value := wFilial;
    QNotaSaidaCod_Cadastro.Value := wCadastro;
    If (wTipo_Pagamento = 'A VISTA') Or (wTipo_Pagamento = '1') Then
      QNotaSaidaInd_Condicao_Pagto.Value := '1'
    Else If (wTipo_Pagamento = 'A PRAZO') Or (wTipo_Pagamento = '2') Then
           QNotaSaidaInd_Condicao_Pagto.Value := '2'
         Else
           QNotaSaidaInd_Condicao_Pagto.Value := '3';
    if FEmbarqueParam.RG4ImpressaoData.ItemIndex = 0 then
      QNotaSaidaInd_Imprime_Cab.Text := 'S'
    else
      QNotaSaidaInd_Imprime_Cab.Text := 'N';
     QNotaSaidaCod_Operacao.Value := wOperacao;
    QNotaSaidaInd_Tipo_Frete.Value := wTipo_Frete;
    wTipoNota := DMOracle.BuscaNome('SELECT IND_EMITE FROM TB_OPERACAO','COD_OPERACAO = '+FloatToStr(wOperacao) );
    If wTipoNota = 'F' Then // Nota Fiscal
      Begin
       If DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'MOINHO' then
          QNotaSaidaCod_Serie.Value := DMUsuario.CodSeriePadrao
       Else
          QNotaSaidaCod_Serie.Value := DMParamSistema.QParamSistemaCod_Serie_Nota.Value
      End
    else
       QNotaSaidaCod_Serie.Value := DMParamSistema.QParamSistemaCod_Serie_Pedido.Value;
    QNotaSaidaPerc_Comissao.Value := wPerc_Comissao_Nota;
    QNotaSaidaCod_Vendedor.Value := wVendedor;
    QNotaSaidaVal_Desconto.Value := wVal_Desconto;
    QNotaSaidaNr_Dias_Cheque.Value := wNr_Dias_Cheque;
    QNotaSaidaNr_Dias_Cheque1.Value := wNr_Dias_Cheque1;
    QNotaSaidaNr_Dias_Cheque2.Value := wNr_Dias_Cheque2;
    QNotaSaidaNr_Dias_Cheque3.Value := wNr_Dias_Cheque3;
    QNotaSaidaNr_Dias_Cheque4.Value := wNr_Dias_Cheque4;
    QNotaSaidaDt_Recebimento.Value :=  StrToDate(Trim(FEmbarqueParam.Me3DtSaida.Text));
    QNotaSaidaObs_Complemento.Text := wComplemento_Obs;
    If DmParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE' Then
       QNotaSaidaObs.Text := wObservacao;
    QNotaSaidaCod_Transportador.Value := wTransportador;
    QNotaSaidaDesc_Placa.Value := Trim(FEmbarqueParam.Ed3Placa.Text);
    If wCodMensagem <> 0 Then
       QNotaSaidaCod_Mensagem.Value := wCodMensagem;
    If wDepartamento <> 0 Then
       QNotaSaidaCod_Departamento.Value := wDepartamento;
    QNotaSaidaNum_Pedido.Value := wNum_Pedido;
    QNotaSaidaCod_Prazo_Vencimento.Value := wCod_Prazo;
  End;
End;

procedure TFEmbarqueCad.InsereItensNf(wProduto,wTributacao,wCod_Lote_Tipo,wCod_Cultura : Integer;
             wQuant,wUnitario,wPerc_Desconto_Item,wPerc_Comissao_Itens,wPerc_Sub : Real;
             wPerc_Desconto1,wPerc_Desconto2,wPerc_Acrescimo : String);
Var wLoteTipo : String;
    wTotal : Real;
Begin
  With DMNotaSaida do
  Begin
    QItemNF.Insert;
    QItemNFCod_Produto.Value := wProduto;
    QItemNFQt_Quantidade.Value := wQuant;
    If wPerc_Desconto_Item > 0 Then
       QItemNFVal_Unitario.Value := wUnitario - (wUnitario * wPerc_Desconto_Item / 100)
    Else
       QItemNFVal_Unitario.Value := wUnitario;
     If wPerc_Desconto1 <> '' Then
       QItemNFVal_Unitario.Value := QItemNFVal_Unitario.Value - (QItemNFVal_Unitario.Value * StrToFloat(wPerc_Desconto1) / 100);
    If wPerc_Desconto2 <> '' Then
       QItemNFVal_Unitario.Value := QItemNFVal_Unitario.Value - (QItemNFVal_Unitario.Value * StrToFloat(wPerc_Desconto2) / 100);
    If wPerc_Acrescimo <> '' Then
       QItemNFVal_Unitario.Value := QItemNFVal_Unitario.Value + (QItemNFVal_Unitario.Value * StrToFloat(wPerc_Acrescimo) / 100);
    QItemNFCod_Tributacao.Value := wTributacao;
    QItemNFCod_Lote_Tipo.Value := wCod_Lote_Tipo;
    QItemNFCod_Cultura.Value := wCod_Cultura;
    If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') And
       (wCod_Lote_Tipo = 1) Then
     Begin
       If DMOracle.BuscaNome('SELECT IND_EMITE FROM TB_OPERACAO','COD_OPERACAO = '+QNotaSaidaCod_Operacao.Text) = 'F' Then
        Begin
          wLoteTipo := DMOracle.BuscaNome('SELECT COD_LOTE_TIPO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value));
          If wLoteTipo <> '' Then
             QItemNFCod_Lote_Tipo.Value := StrToInt(wLoteTipo);
        End;
     End;
    QItemNFPerc_Comissao.Value := wPerc_Comissao_Itens;
    If QItemNFPerc_Comissao.Value = 0 Then
       QItemNFPerc_Comissao.Value := QNotaSaidaPerc_Comissao.Value;
    If QItemNFQt_Quantidade.Value = 0 Then
       QItemNFVal_Total.Value := QItemNFVal_Unitario.Value
    Else
       QItemNFVal_Total.Value := QItemNFQt_Quantidade.Value*QItemNFVal_Unitario.Value;
    If wPerc_Sub > 0 Then
     Begin
       Inc(wind_tb);
       wTbComissao[wind_tb] := QItemNFPerc_Comissao.Value;
       wTotal := QItemNFVal_Total.Value * wPerc_Sub / 100;
       wTbValor[wind_tb] := Trunc(wTotal * 100) / 100;
       wTbProduto[wind_tb] := wProduto;
       QItemNFVal_Total.Value := QItemNFVal_Total.Value - wTbValor[wind_tb];
       If QItemNFQt_Quantidade.Value = 0 Then
          QItemNFVal_Unitario.Value := QItemNFVal_Total.Value
       Else
          QItemNFVal_Unitario.Value := QItemNFVal_Total.Value / QItemNFQt_Quantidade.Value;
     End;
    QItemNF.Post;
  End;
End;
Procedure TFEmbarqueCad.Emite_Recibo_Frete(wValor:Real; wComplemento:String);
begin
  if FRRecibo=Nil then
    FRRecibo:=TFRRecibo.Create(Application);

  DMFilial.QFilial.Close;
  DMFilial.QFilial.SetVariable('PK',1);
  DMFilial.QFilial.Open;
  FRRecibo.QRLRecebido.Caption:=DMFilial.QFilialDesc_Filial.Value;
  FRRecibo.QRLDataEmissao.Caption:=DateToStr(DMEmbarque.QEmbarqueDt_Embarque.Value);
  FRRecibo.QRLValor.Caption:=FormatFloat('#,##0.00',wValor);
  FRRecibo.QRLValor_Juros.Caption:='0,00';
  FRRecibo.QRLValor_Baixa.Caption:=FormatFloat('#,##0.00',wValor);
  FRRecibo.QRLDesconto.Caption:='0.00';
  FRRecibo.QRLValorExtenso.Caption:=Bib.Extenso(wValor,'REAL');
  FRRecibo.QRLDescricao.Caption:= 'Pagamento de ' + wComplemento + ' de Frete - DESTINO:'+
                                       DMEmbarque.QEmbarqueDESC_DESTINO_FRETE.Text;
  FRRecibo.QRLData.Caption:=FormatDateTime(', dd "de" mmmm "de" yyyy',DMEmbarque.QEmbarqueDt_Embarque.Value);
  FRRecibo.QRLResponsavel.Caption:=  DMEmbarque.QEmbarqueCOD_TRANSPORTADOR.text+' - '+DMEmbarque.QEmbarquenome_transportador.text;
  FRRecibo.QRLResponsavel2.Caption:= DMEmbarque.QEmbarquenome_motorista.Text;
  FRRecibo.QRDBTitulo.DataSet:=DMEmbarque.QEmbarque;
  FRRecibo.QRDBTitulo.DataField:='COD_EMBARQUE';
  FRRecibo.QRDBVenc.DataSet:=DMEmbarque.QEmbarque;
  FRRecibo.QRDBVenc.DataField:='DT_VENCIMENTO';
  FRRecibo.QRDBCod_Conta.DataSet:=DMEmbarque.QEmbarque;
  FRRecibo.QRDBCod_Conta.DataField:='COD_EMBARQUE';
  FRRecibo.QuickRep1.Preview;
End;

Procedure TFEmbarqueCad.Emite_Conhecimento_Frete(wVal_Frete,wVal_Icms,wVal_Ajuda,wVal_Pedagio,wAdiantamento:Real;wComplemento:String);
begin
  DMFilial.QFilial.Close;
  DMFilial.QFilial.SetVariable('PK',1);
  DMFilial.QFilial.Open;

  if FRReciboFrete = Nil then
    FRReciboFrete := TFRReciboFrete.Create(Application);

  FRReciboFrete.QRLTitulo.Caption            := wComplemento;
  FRReciboFrete.QRLFilial.Caption            := DMFilial.QFilialDesc_Filial.Value;
  FRReciboFrete.QRLCarga.Caption             := IntToStr(DMEmbarque.QEmbarqueCod_Embarque.Value);
  FRReciboFrete.QRLDtSaida.Caption           := DateToStr(DMEmbarque.QEmbarqueDt_Embarque.Value);
  FRReciboFrete.QRLVencimento.Caption        := DateToStr(DMEmbarque.QEmbarqueDt_Vencimento.Value);
  FRReciboFrete.QRLTransportador.Caption     := DMEmbarque.QEmbarquenome_transportador.Text + ' - ' + DMEmbarque.QEmbarqueCod_Transportador.Text;
  FRReciboFrete.QRLMotorista.Caption         := DMEmbarque.QEmbarqueNome_Motorista.Text;
  FRReciboFrete.QRLDestino.Caption           := DMEmbarque.QEmbarqueDesc_Destino_Frete.Text;
  FRReciboFrete.QRLKMSaida.Caption           := DMEmbarque.QEmbarqueNUM_KILOMETRAGEM.Text;
  FRReciboFrete.QRLKMChegada.Caption         := DMEmbarque.QEmbarqueNUM_KILOMETRAGEM_CHEGADA.Text;
  if (DMEmbarque.QEmbarqueNUM_KILOMETRAGEM_CHEGADA.Text <> '') and (DMEmbarque.QEmbarqueNUM_KILOMETRAGEM.Text <> '') then
    FRReciboFrete.QRLKMTotal.Caption         := FloatToStr(StrToFloat(DMEmbarque.QEmbarqueNUM_KILOMETRAGEM_CHEGADA.Value)-StrToFloat(DMEmbarque.QEmbarqueNUM_KILOMETRAGEM.Value));
  FRReciboFrete.QRLValorFrete.Caption        := FormatFloat('#,##0.00',wVal_Frete);
  FRReciboFrete.QRLValorICMS.Caption         := FormatFloat('#,##0.00',wVal_Icms);
  FRReciboFrete.QRLAjudaCusto.Caption        := FormatFloat('#,##0.00',wVal_Ajuda);
  FRReciboFrete.QRLValorAdiantamento.Caption := FormatFloat('#,##0.00',DMEmbarque.QEmbarqueVAL_ADTO_FRETE.Value);
  FRReciboFrete.QRLValor_Pagamento.Caption   := FormatFloat('#,##0.00',DMEmbarque.QEmbarqueVAL_TOTAL_FRETE.Value - DMEmbarque.QEmbarqueVAL_ADTO_FRETE.Value);
  //FRReciboFrete.QRLValor_Pagamento.Caption   := FormatFloat('#,##0.00',wVal_Frete+wVal_Icms+wVal_Ajuda+wVal_Pedagio);
  FRReciboFrete.QRLVlrPedagio.Caption        := FormatFloat('#,##0.00',wVal_Pedagio);
  FRReciboFrete.QRLVlrTotal.Caption          := FormatFloat('#,##0.00', {wVal_Frete+}wVal_Icms+wVal_Ajuda+wVal_Pedagio+DMEmbarque.QEmbarqueVAL_TOTAL_FRETE.Value-DMEmbarque.QEmbarqueVAL_MANIFESTO.Value);
  FRReciboFrete.QRLNumConhecimento.Caption   := IntToStr(DMEmbarque.QEmbarqueCod_Embarque.Value);
  FRReciboFrete.QRLObs.Caption               := DMEmbarque.QEmbarqueDesc_Obs.Value;
  FRReciboFrete.QRLValorCarga.Caption        := FormatFloat('#,##0.00',DMEmbarque.QCalculaValorCargaVAL_CARGA.Value);
  If DMEmbarque.QCalculaValorCargaVAL_CARGA.Value > 0 Then
     FRReciboFrete.QRLPerc.Caption              := FormatFloat('#,##0.00',(DMEmbarque.QEmbarqueVAL_TOTAL_FRETE.Value +
                                                         {DMEmbarque.QEmbarqueVAL_FRETE_COMPLEMENTO.Value +
                                                         DMEmbarque.QEmbarqueVAL_ADTO_FRETE.Value +}
                                                         DMEmbarque.QEmbarqueVAL_AJUDA_CUSTO.Value +
                                                         DMEmbarque.QEmbarqueVAL_PEDAGIO.Value) / DMEmbarque.QCalculaValorCargaVAL_CARGA.Value * 100)
  Else
     FRReciboFrete.QRLPerc.Caption := '0,00';
  FRReciboFrete.qrlNumManifesto.Caption      := DMEmbarque.QEmbarqueNUM_MANIFESTO.Text;
  FRReciboFrete.qrlValorManifesto.Caption    := FormatFloat('#,##0.00',DMEmbarque.QEmbarqueVAL_MANIFESTO.Value);
  FRReciboFrete.qrlFreteComplemento.Caption  := FormatFloat('#,##0.00',DMEmbarque.QEmbarqueVAL_TOTAL_FRETE.Value - DMEmbarque.QEmbarqueVAL_MANIFESTO.Value - DMEmbarque.QEmbarqueVAL_ADTO_FRETE.Value);
  FRReciboFrete.QRLVlrTotal.Caption          := FormatFloat('#,##0.00',wVal_Icms+wVal_Ajuda+wVal_Pedagio+DMEmbarque.QEmbarqueVAL_TOTAL_FRETE.Value - DMEmbarque.QEmbarqueVAL_ADTO_FRETE.Value);

  DMEmbarque.QRParamSistema.Open;

  FRReciboFrete.QuickRep1.Preview;
  DMEmbarque.QRParamSistema.Close;
End;

procedure TFEmbarqueCad.ControleAcertoCargas1Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[17].TabVisible := True;

  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    QRControleCargas.close;
    QRControleCargas.SetVariable('EMBARQUE',trim(FEmbarqueParam.ME18Embarque.Text));
    QRControleCargas.Open;
    If FRControleAcertoCargas = Nil then
      FRControleAcertoCargas := TFRControleAcertoCargas.Create(Application);
    
    If FEmbarqueParam.RGPreview.ItemIndex = 0 then
      FRControleAcertoCargas.QRPrimario.Preview
    Else
      FRControleAcertoCargas.QRPrimario.Print;

    QRControleCargas.Close;
  End;
end;

procedure TFEmbarqueCad.VoltaEtiquetaEmbarque1Click(Sender: TObject);
var
wCont1, wCont2,wQtd,wVolume :integer;
wProduto : string;
begin
  inherited;
  If FVoltaEtiquetaEmbarque = Nil then
    FVoltaEtiquetaEmbarque := TFVoltaEtiquetaEmbarque.Create(Application);
    FVoltaEtiquetaEmbarque.ShowModal; 

end;

End.

