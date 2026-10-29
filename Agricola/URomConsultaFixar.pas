unit URomConsultaFixar;
                                                                                              
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls, QuickRpt, DBDirceu, variants;

type
  TFRomConsultaFixar = class(TForm)
    Label3: TLabel;
    MeFilial: TMaskEdit;
    BitBtn1: TBitBtn;
    EdFilial: TEdit;
    EdCadastro: TEdit;
    BitBtn2: TBitBtn;
    MeCadastro: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    MeProduto: TMaskEdit;
    BitBtn3: TBitBtn;
    EdProduto: TEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    RGTipoFixacao: TRadioGroup;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    GBGeraNota: TGroupBox;
    MEQtde: TMaskEdit;
    Label14: TLabel;
    Label15: TLabel;
    MEValUnitario: TMaskEdit;
    MECodOperacao: TMaskEdit;
    SpeedButton1: TSpeedButton;
    MEOperacao: TMaskEdit;
    DBText1: TDBText;
    DBText2: TDBText;
    Label16: TLabel;
    Button1: TButton;
    EDescricao: TEdit;
    Label18: TLabel;
    EValor: TEdit;
    Label19: TLabel;
    MEObservacao: TMaskEdit;
    Label20: TLabel;
    MEDataPagto: TMaskEdit;
    Label21: TLabel;
    QRCompositeReport1: TQRCompositeReport;
    Label22: TLabel;
    BtConsLote: TBitBtn;
    MeLoteTipo: TMaskEdit;
    EdLoteTipo: TEdit;
    Label23: TLabel;
    DBEdit7: TDBEdit;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label17: TLabel;
    DBEdit12: TDBEdit;
    Label24: TLabel;
    DBEdit13: TDBEdit;
    Label25: TLabel;
    DBEdit14: TDBEdit;
    Label26: TLabel;
    MeDisponivel: TMaskEdit;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    Label6: TLabel;
    DBEdit15: TDBEdit;
    BtConsContaCorrente: TBitBtn;
    Label27: TLabel;
    BitBtn10: TBitBtn;
    Label28: TLabel;
    MeValorTotal: TMaskEdit;
    Label29: TLabel;
    MePercDPI: TMaskEdit;
    Label30: TLabel;
    MeCreditoSemente: TMaskEdit;
    Label31: TLabel;
    MeCobrado: TMaskEdit;
    Label32: TLabel;
    BitBtn11: TBitBtn;
    MeNrFitas: TMaskEdit;
    Label33: TLabel;
    MeVlFitas: TMaskEdit;
    Label7: TLabel;
    BtConsParceria: TSpeedButton;
    MeCodParceiro: TMaskEdit;
    Label34: TLabel;
    MeContaCorrente: TMaskEdit;
    RgBaixaContrato: TRadioGroup;
    Label35: TLabel;
    MeNfProdutor: TMaskEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure MeFilialExit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MeCadastroExit(Sender: TObject);
    procedure MeProdutoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MECodOperacaoExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MeLoteTipoExit(Sender: TObject);
    procedure BtConsLoteClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BtConsParceriaClick(Sender: TObject);
    procedure BtConsContaCorrenteClick(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure MeFilialChange(Sender: TObject);
    procedure MeCreditoSementeChange(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure MeCodParceiroChange(Sender: TObject);
    procedure MEQtdeExit(Sender: TObject);
    procedure MEValUnitarioExit(Sender: TObject);
    procedure MeCreditoSementeExit(Sender: TObject);
  private
    procedure CalculaTotal;
    procedure Proc_Gera_Nota(pOperacao : Integer; pPreco : Real; pCodNota : String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRomConsultaFixar: TFRomConsultaFixar;

implementation

uses UFilialCons, UFilial_cl, UCadastroCons, UCadastro_cl, UProdutoCons,
  UProduto_cl, URomaneioAgricola_cl, UParamSistema_cl, UOperacaoCons,
  UOperacao_cl, UOracle_cl, UNotaEntrada_cl, UUsuario_cl, UReciboFixar,
  USequencia_cl, URReciboNFA, UBiblioteca, UTipoLoteCons, UTipoLote_cl,
  UContasReceberCons, UContasPagarCons, UContratoCons, UrReciboAB,
  UBloqueio_Produto_cl, UrReciboMilhoConsumo, UContrato_GPCons,
  UPrecoAgricola_cl, UNotaSaida_cl, UPenhorCedularCons, UPenhorCedular_cl,
  UFitasBaixa, UProdutoAgricola_cl, UContasReceberBaixa;

{$R *.DFM}

procedure TFRomConsultaFixar.BitBtn1Click(Sender: TObject);
begin
  If FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOK then
  begin
     MeFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
     MEFilialExit(Self);
  end;

end;

procedure TFRomConsultaFixar.BitBtn2Click(Sender: TObject);
begin
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
  begin
     MeCadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
     MeCadastroExit(Self);
  end;

end;

procedure TFRomConsultaFixar.BitBtn3Click(Sender: TObject);
begin
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
  begin
     MeProduto.Text := DMProduto.QProdutoConsCod_Produto.Text;
     MeProdutoExit(Self);
  end;

end;

procedure TFRomConsultaFixar.MeFilialExit(Sender: TObject);
begin
  If Trim(MEFilial.Text) <> '' Then
    EdFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MEFilial.text,True)
  Else
    EdFilial.Text := 'Todos';
end;

procedure TFRomConsultaFixar.BitBtn4Click(Sender: TObject);
Var wNrFitas : Integer;
begin
    DmUsuario.Checar_Filial_Usuario( Trim(MeFilial.Text),'AGRICOLA');
    MeValorTotal.Clear;
    MeVlFitas.Clear;
    with DmRomaneioAgricola do
    begin
      QRomConsFixar.Close;
      QContaPagarTotal.Close;
      QContaReceberTotal.Close;
      QContratoTotal.Close;
      QContratoGPTotal.Close;
      If Trim(MeCadastro.Text) = '' then
         Raise Exception.Create('Informar Código Cadastro')
      Else
        begin
          QRomConsFixar.SetVariable('CADASTRO',MeCadastro.Text);
          QContaPagarTotal.SetVariable('COD_CADASTRO',MeCadastro.Text);
          QContaReceberTotal.SetVariable('COD_CADASTRO',MeCadastro.Text);
          QContratoTotal.SetVariable('COD_CADASTRO',MeCadastro.Text);
          QContratoGPTotal.SetVariable('COD_CADASTRO',MeCadastro.Text);
        end;
      QContaReceberTotal.SetVariable('COD_FILIAL',Null);
      QContaPagarTotal.SetVariable('COD_FILIAL',Null);
      QRomConsFixar.SetVariable('FILIAL',Null);
      QContratoTotal.SetVariable('COD_FILIAL',Null);
      QContratoGPTotal.SetVariable('COD_FILIAL',Null);
      If Trim(MeFilial.Text) <> '' then
        begin
         QRomConsFixar.SetVariable('FILIAL',MeFilial.Text);
         If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO' Then
          Begin
            QContratoTotal.SetVariable('COD_FILIAL',MeFilial.Text);
            QContratoGPTotal.SetVariable('COD_FILIAL',MeFilial.Text);
          End;
        end;
      If Trim(MeProduto.Text) = '' then
         Raise Exception.Create('Informar Codigo Produto')
      Else
        begin
         QRomConsFixar.SetVariable('PRODUTO',MeProduto.Text);
         QContratoTotal.SetVariable('COD_PRODUTO',MeProduto.Text);
         QContratoGPTotal.SetVariable('COD_PRODUTO',MeProduto.Text);
        end;

      If Trim(MeLoteTipo.Text) = '' then
         //QRomConsFixar.SetVariable('LOTE_TIPO',Null)
         Raise Exception.Create('Informar lote do produto')
      Else
         QRomConsFixar.SetVariable('LOTE_TIPO',MeLoteTipo.Text);
      If Trim(MeCodParceiro.Text) = '' then  // QUANDO DEIXA NULO PORQUE QUER TUDO
         QRomConsFixar.SetVariable('COD_PARCEIRO',Null)
      Else
         QRomConsFixar.SetVariable('COD_PARCEIRO',MeCodParceiro.Text);
//      QRomConsFixar.SetVariable('DATAI',StrToDate('01/01/1900'));
//      QRomConsFixar.SetVariable('DATAF',Date);
      If RGTipoFixacao.ItemIndex = 0 Then
         QRomConsFixar.SetVariable('TIPO_FIXAR','EMPRESA')
      Else
         QRomConsFixar.SetVariable('TIPO_FIXAR','OUTRAS_EMPRESAS');

      MeCodOperacao.Text := DMOracle.BuscaNome('SELECT COD_OPERACAO_FIXACAO FROM TB_PRODUTO_AGRICOLA','COD_PRODUTO='+Trim(MeProduto.Text),True);
      MeCodOperacaoExit(Self);
      MePercDpi.Text := DMOracle.BuscaNome('SELECT PERC_DPI_TRANSGENICOS FROM TB_PRODUTO_AGRICOLA','COD_PRODUTO='+Trim(MeProduto.Text),True);
      QRomConsFixar.Open;
      QContaPagarTotal.Open;
      QContaReceberTotal.Open;
      QContratoTotal.Open;
      QContratoGPTotal.Open;
      GBGeraNota.Visible := True;
//      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'GRASEL' Then // MARCOS E CESAR 30/07/2019 PARA DEIXAR PARA TODOS OS CLIENTES
         MEDataPagto.Text := DateToStr(Date + 3);
      MeDisponivel.Text := FormatFloat('###,###,###,##0',QRomConsFixarSaldo_Fixar.Value - QContratoTotalSaldo.Value - QContratoGPTotalSALDO_GP.Value);
      DMRomaneioAgricola.QFitas_Cobranca.Close;
      DMRomaneioAgricola.QFitas_Cobranca.SetVariable('Cod_Cadastro',Trim(MeCadastro.Text));
      DMRomaneioAgricola.QFitas_Cobranca.Open;
      wNrFitas := 0;
      While not (DMRomaneioAgricola.QFitas_Cobranca.Eof) Do
      Begin
        Inc(wNrFitas);
        DMRomaneioAgricola.QFitas_Cobranca.Next;
      End;
      MeNrFitas.Text := IntToStr(wNrFitas);
      MeCreditoSemente.Clear;
      MeCobrado.Clear;
      MEQtde.SetFocus;
    end;
end;

procedure TFRomConsultaFixar.FormCreate(Sender: TObject);
begin
  MeFilial.Text := IntToStr(DMUsuario.CodFilialUsuario);
  MeFilialExit(Self);
end;

procedure TFRomConsultaFixar.MeCadastroExit(Sender: TObject);
begin
  If Trim(MECadastro.Text) <> '' Then
    EdCadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECadastro.text,True)
  Else
    EdCadastro.Text := 'Obridado Informar Código Produtor';
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB') And
     (Trim(MECadastro.Text) <> '') Then
     DMNotaSaida.MostraMsg(StrToInt(Trim(MECadastro.Text)));
  GBGeraNota.Visible := False;   
end;

procedure TFRomConsultaFixar.MeProdutoExit(Sender: TObject);
begin
  If Trim(MEProduto.Text) <> '' Then
   Begin
     EdProduto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+MEProduto.text,True);
     if Trim(MeLoteTipo.Text) <> '' then
       MeValUnitario.Text := DMOracle.BuscaNome('SELECT VAL_PRECO FROM TB_PRECO_AGRICOLA',
                            'COD_PRODUTO = '+Trim(meProduto.Text)+' AND COD_FILIAL='+Trim(MeFilial.text) +
                            ' AND DT_PRECO_AGRICOLA='+Chr(39)+DateToStr(Date)+Chr(39) + ' AND COD_LOTE_TIPO='+Trim(MeLoteTipo.Text));
   End
  Else
    EdProduto.Text := 'Todos';
  GBGeraNota.Visible := False;
end;

procedure TFRomConsultaFixar.SpeedButton1Click(Sender: TObject);
begin
  if FOperacaoCOns = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  if FOperacaoCons.ShowModal =  mrOk then
    begin
      MECodOperacao.Text:=DMOperacao.QOperacaoConsCod_Operacao.text;
      MECodOperacaoExit(Self);
    end;
end;

procedure TFRomConsultaFixar.MECodOperacaoExit(Sender: TObject);
begin
  if MECodOperacao.text<>'' then
    MEOperacao.text:=DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO','COD_OPERACAO = '+MECodOperacao.text,True)
  else
    MEOperacao.Clear;
end;

procedure TFRomConsultaFixar.Button1Click(Sender: TObject);
var
  Qtde,wMenor,wMaior,wVl_Outros,wUnitario, wDiferenca:Real;
  i,Tam,wNumAcerto,wNumRecibo:integer;
  X,wTexto, wVal, wTipoProduto : String;
begin
//  Qtde := 0;
  Tam := 0;
  wVl_Outros := 0;
  GBGeraNota.Visible := False;
  DMNotaEntrada.pContabiliza_Extra := 'N';
  if Trim(MEQtde.Text) <> '' then
     Qtde:=StrToFloat(MEQtde.Text)
  Else
     Raise Exception.Create('Quantidade Deve Ser Informada');
  if Trim(MEValUnitario.Text)='' then
     Raise Exception.Create('Valor Unitário Deve Ser Informado');
  if Trim(MECodOperacao.Text)='' then
     Raise Exception.Create('Operação Deve Ser Informado');
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
     If Trim(MeCodParceiro.Text) = '' Then
        Raise Exception.Create('Cod Parceiro Deve Ser Informado');
  If DMOracle.BuscaNome('SELECT Ind_Bloqueio_Fixacao FROM TB_PARAM_SISTEMA','COD_FILIAL >= 0 ') = 'B' then
     Raise Exception.Create('Neste Momento o Sistema Encontra-se Fechado Para Realizar Fixações');
  If (Trim(MePercDpi.Text) <> '') And (Trim(MePercDpi.Text) <> '0') And (Trim(MeCreditoSemente.Text) = '')  Then
     Raise Exception.Create('Informar Quantidade Credito Semente');
  If (Trim(MePercDpi.Text) = '') And (Trim(MeCreditoSemente.Text) <> '') Then
     Raise Exception.Create('Informar %DPI');
  DMOperacao.QOperacao.Close;
  DMOperacao.QOperacao.SetVariable('PK',MECodOperacao.Text);
  DMOperacao.QOperacao.Open;
  if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'NUTRI') or (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'GRASEL')) then
    If ((DMOperacao.QOperacaoInd_Fixar_Empresa.Value = 'F') Or
        (DMOperacao.QOperacaoInd_Compras.Value       = 'C')) Then  // para moinho informa operacao de compra
      If (Trim(MeNFProdutor.Text) = '') and (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'GRASEL') Then
          Raise Exception.Create('Informar Nota Fiscal Produtor');

  wTipoProduto := DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Trim(MeProduto.text),True);
  // vai consistir se não está utilizando uma OPERAÇÃO invalida (que não é de fixação)
  If (DMOperacao.QOperacaoInd_Fixar_Empresa.Value <> 'F') and   //Fixação
     (DMOperacao.QOperacaoInd_Fixar_Empresa.Value <> 'D') and   //Devolução saldo a fixar
     (DMOperacao.QOperacaoInd_Compras.Value       <> 'C') and   //Para moinho informa operacao de compra
     (DMOperacao.QOperacaoInd_Fixar_Consumo.Value <> 'D') then
      raise exception.Create('Operação deve ser Fixação ou Devolução de Consumo');
  If ((DMOperacao.QOperacaoInd_Fixar_Empresa.Value = 'F') Or
      (DMOperacao.QOperacaoInd_Compras.Value       = 'C'))And  // para moinho informa operacao de compra
      (DMRomaneioAgricola.QRomConsFixarsaldo_fixar.Value < Qtde) Then
      raise exception.Create('Quantidade Maior que  Saldo a Fixar do Cliente');
  If (DMOperacao.QOperacaoInd_Fixar_Consumo.Value = 'D') And
     (DMRomaneioAgricola.QRomConsFixarsaldo_consumo.Value < Qtde) Then
     raise exception.Create('Quantidade Maior que Saldo de Consumo do Cliente');
  If (Trim(MeCodOperacao.Text)<>'') and (Trim(MeValUnitario.Text)<>'') and (Qtde>0) then
     begin
       if Trim(MeCadastro.text)<>'' then
         begin
           if Trim(MeProduto.text) <> '' Then
            Begin
              If (DMOperacao.QOperacaoInd_Fixar_Empresa.Value = 'F') Or
                 (DMOperacao.QOperacaoInd_Compras.Value       = 'C') Then  // para moinho informa operacao de compra
               begin
                 DMPrecoAgricola.QPrecoAgricola_Cons.Close;
                 DMPrecoAgricola.QPrecoAgricola_Cons.SetVariable('Cod_Produto',Trim(MeProduto.text));
                 DMPrecoAgricola.QPrecoAgricola_Cons.SetVariable('Cod_Filial',Trim(MeFilial.text));
                 DMPrecoAgricola.QPrecoAgricola_Cons.SetVariable('Dt_Preco_Agricola', DMOracle.DataServ);
                 DMPrecoAgricola.QPrecoAgricola_Cons.SetVariable('Cod_Lote_Tipo',Trim(MeLoteTipo.Text));
                 DMPrecoAgricola.QPrecoAgricola_Cons.Open;
                 If DMPrecoAgricola.QPrecoAgricola_Cons.Eof Then
                    Raise Exception.Create ('Não Foi Cadastrado Preço Produto Agricola para esta Data');
                 If DMPrecoAgricola.QPrecoAgricola_ConsVal_Preco.Value <> StrToFloat(Trim(MeValUnitario.Text)) Then
                  Begin
                    wMenor := DMPrecoAgricola.QPrecoAgricola_ConsVal_Preco.Value -
                              (DMPrecoAgricola.QPrecoAgricola_ConsVal_Preco.Value * DMPrecoAgricola.QPrecoAgricola_ConsPerc_Abaixo.Value / 100);
                    wMaior := DMPrecoAgricola.QPrecoAgricola_ConsVal_Preco.Value +
                              (DMPrecoAgricola.QPrecoAgricola_ConsVal_Preco.Value * DMPrecoAgricola.QPrecoAgricola_ConsPerc_Acima.Value / 100);
                    // Alterado por Djeison A. S. - 16/07/2013, problema com dízimas periódicas.
                    wDiferenca := wMenor - StrToFloat(Trim(MeValUnitario.Text));
                    if (wDiferenca > 0.000009) then
                        Raise exception.Create('Preço Informado Está fora dos limites estabelicidos pela empresa');
                    wDiferenca := wMaior - StrToFloat(Trim(MeValUnitario.Text));
                    if (wDiferenca < -0.000009) then
                        Raise exception.Create('Preço Informado Está fora dos limites estabelicidos pela empresa');
//                    If (StrToFloat(Trim(MeValUnitario.Text)) < wMenor) OR
//                       (StrToFloat(Trim(MeValUnitario.Text)) > wMaior) Then
//                        Raise exception.Create('Preço Informado Está fora dos limites estabelicidos pela empresa');
                  End;
               End;
              DMFilial.QFilial.Close;
              DMFilial.QFilial.SetVariable('PK',MEFilial.text);
              DMFilial.QFilial.Open;
              DMCadastro.QCadastro.Close;
              DMCadastro.QCadastro.SetVariable('PK',MECadastro.text);
              DMCadastro.QCadastro.Open;
              DMProdutoAgricola.QProdutoAgricola.Close;
              DMProdutoAgricola.QProdutoAgricola.SetVariable('Pk',StrToInt(Trim(MeProduto.text)));
              DMProdutoAgricola.QProdutoAgricola.Open;
              wUnitario := StrToFloat('0'+DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO','COD_PRODUTO = '+Trim(MeProduto.text),True));

              DMOracle.DBCemapa.StartTransaction;

              with DMNotaEntrada do
                begin
                  Try
                    QNotaEntrada.Open;
                    QItemNF.Open;
                    If (DMParamSistema.QParamSistemaIND_TIPO_FIXACAO.Value = 'D') Then  // significa que emite uma nota fiscal de devolucao e outra de compra do produto
                     Begin
                       DMOperacao.QOperacao.Close;  //para gerar a nota fiscal de devolucao
                       DMOperacao.QOperacao.SetVariable('PK',DMProdutoAgricola.QProdutoAgricolaCod_Operacao_Devolucao.Value);
                       DMOperacao.QOperacao.Open;
                       Proc_Gera_Nota(DMProdutoAgricola.QProdutoAgricolaCod_Operacao_Devolucao.Value,wUnitario,'');  // gera nota fiscal de devolucao de deposito
                       DMOperacao.QOperacao.Close;  //para gerar a nota fiscal de fixação
                       DMOperacao.QOperacao.SetVariable('PK',StrToInt(MeCodOperacao.Text));
                       DMOperacao.QOperacao.Open;
                       Proc_Gera_Nota(StrToInt(MeCodOperacao.Text),StrToFloat(MeValUnitario.Text),QNotaEntradaCod_Nota_Cab.Text);  // gera nota fiscal de compra
                     End
                    Else
                       Proc_Gera_Nota(StrToInt(MeCodOperacao.Text),StrToFloat(MeValUnitario.Text),'');  // gera nota fiscal de compra

//                    if EValor.Text <> '' then   // CESAR RETIROU ESTE TESTE PARA GERAR PARA TODOS FECHAMENTOS PARA PERMITIR EMITIR UMA COPIA DO RECIBO
//                    begin
                      If Trim(EValor.Text) = '' Then
                         EValor.Text := '0';
                      wNumAcerto := DMSequencia.Sequencia(StrToInt(Trim(MEFilial.text)),'ACERTO');
                      wNumRecibo := DMSequencia.Sequencia(StrToInt(Trim(MEFilial.text)),'RECIBO');
                      wVal := DMOracle.BuscaNome('SELECT SQPAGAMENTO_FIXACAO.NEXTVAL FROM DUAL','1=1');
                      DMOracle.QExecSQL.Close;
                      DMOracle.QExecSQL.SQL.Clear;
                      DMOracle.QExecSQL.SQL.Add('INSERT INTO TB_PAGAMENTO_FIXACAO (');
                      DMOracle.QExecSQL.SQL.Add('  COD_PAGAMENTO_FIXACAO, ');
                      DMOracle.QExecSQL.SQL.Add('  VAL_PAGAMENTO_FIXACAO, ');
                      DMOracle.QExecSQL.SQL.Add('  DESC_PAGAMENTO_FIXACAO, ');
                      DMOracle.QExecSQL.SQL.Add('  DESC_OBSERVACAO, ');
                      DMOracle.QExecSQL.SQL.Add('  DT_PAGAMENTO_FIXACAO, ');
                      DMOracle.QExecSQL.SQL.Add('  COD_NOTA_CAB, NUM_RECIBO,NUM_ACERTO, COD_USUARIO, ');
                      DMOracle.QExecSQL.SQL.Add('  DESC_CONTA_CORRENTE) ');
                      DMOracle.QExecSQL.SQL.Add('VALUES (');
                      DMOracle.QExecSQL.SQL.Add(   wVal + ', ');
                      DMOracle.QExecSQL.SQL.Add('  TO_NUMBER(''' + EValor.Text + '''),  ');
                      DMOracle.QExecSQL.SQL.Add('  ''' + EDescricao.Text + ''', ' );
                      DMOracle.QExecSQL.SQL.Add('  ''' + MeObservacao.Text + ''', ' );
                      DMOracle.QExecSQL.SQL.Add('  ''' + MEDataPagto.Text + ''', ' );
                      DMOracle.QExecSQL.SQL.Add(   QNotaEntradaCOD_NOTA_CAB.Text + ',' + IntToStr(wNumRecibo) + ',' + IntToStr(wNumAcerto) + ',' + IntToStr(DMUsuario.CodUsuarioCorrente) + ',');
                      DMOracle.QExecSQL.SQL.Add('  ''' +  MeContaCorrente.Text + ''' ' + ')');
//                      showmessage (dmoracle.qexecsql.sql.text);
                      DMOracle.QExecSQL.ExecSQL;
//                    end;
                     if FFitasBaixa = nil then
                      FFitasBaixa := TFFitasBaixa.create(application);
                     For I := 0 to FFitasBaixa.LbBaixas.Items.Count - 1 do
                    Begin
                      X := Copy(FFitasBaixa.LbBaixas.Items[I],1,6);
                      DMOracle.QExecSQL.Close;
                      DMOracle.QExecSQL.SQL.Clear;
                      DMOracle.QExecSQL.SQL.Add('UPDATE TB_ROMANEIO_FITAS SET COD_NOTA_CAB = ' + QNotaEntradaCOD_NOTA_CAB.Text + ' WHERE COD_ROMANEIO_FITAS = ' + Trim(X));
                      DMOracle.QExecSQL.ExecSQL;
                    End;
                    DMOracle.DBCemapa.Commit;
                    Close;
                    if Trim(EValor.Text) <> '' then
                       wVl_Outros := StrToFloat(Trim(EValor.Text));
                    If DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'GRASEL'  Then
                    Begin
                      If (DMOperacao.QOperacaoInd_Fixar_Empresa.Value = 'F') Or
                         (DMOperacao.QOperacaoInd_Compras.Value = 'C') Then
                      Begin
                        If FReciboFixar = nil then
                          FReciboFixar := TFReciboFixar.Create(Application);
                        FReciboFixar.pCodCadastro:=StrToInt(Trim(MECadastro.text));
                        FReciboFixar.pCodFilial:=StrToInt(Trim(MEFilial.text));
                        FReciboFixar.QRLProduto.Caption := EdProduto.Text;
                        If Trim(MeLoteTipo.Text) <> '1' Then
                           FReciboFixar.QRLProduto.Caption := FReciboFixar.QRLProduto.Caption + ' Lote/Ph:'+Trim(MeLoteTipo.Text);
                        if Trim(EValor.Text) <> '' then
                          FReciboFixar.QRLValOutros.Caption:=FormatFloat('#,##0.00',StrToFloat(EValor.Text))
                        else
                          FReciboFixar.QRLValOutros.Caption:='0,00';
                        FReciboFixar.QRLOutros.Caption:=' ';
                        if Trim(EDescricao.text) <> '' then
                          begin
                            x:=' ';
                            if Length(EDescricao.text)< 67 then
                              Tam:=67-Length(EDescricao.text);
                            For i:=1 to tam do
                              x:=x+'.';
                            FReciboFixar.QRLOutros.Caption:=EDescricao.Text+x;
                          end;
                        FReciboFixar.QRLNumero.Caption:= IntToStr(wNumAcerto);
                        FReciboFixar.QRLDtPagto.Caption:=MEDataPagto.Text;
                        FReciboFixar.QRLObservacao.Caption:=MEObservacao.Text;
                        FReciboFixar.QRLContaCorrente.Caption:=MeContaCorrente.Text;
                        FReciboFixar.QRLDataExtenso.Caption:=DMFilial.QFilialDESC_CIDADE.text+FormatDateTime('"," dd "de" mmmm "de" yyyy"."',StrToDate(MEDataPagto.Text));

//                        FRReciboNFA.pCodCadastro:=StrToFloat(MECadastro.text);
                        FReciboFixar.QRLDt_Recibo.Caption:=MEDataPagto.Text;
//                        FRReciboNFA.pCodFilial:=StrToFloat(MEFilial.text);
                        FReciboFixar.QRLValorExtenso.Caption:=bib.extenso(DmNotaEntrada.QItemNFVAL_TOTAL.value - DmNotaEntrada.QNotaEntradaVAL_FUNRURAL.value - DMNotaEntrada.QNotaEntradaVAL_DESCONTO_FITAS.Value - DmNotaEntrada.QItemNFVAL_DPI_TRANSGENICOS.value - QItemNFVal_Facs.Value - QItemNfVal_Fethab.Value,'REAL');
                        FReciboFixar.QRLValor.Caption:=FormatFloat('#,##0.00',(DmNotaEntrada.QItemNFVAL_TOTAL.value - DmNotaEntrada.QNotaEntradaVAL_FUNRURAL.value - DMNotaEntrada.QNotaEntradaVAL_DESCONTO_FITAS.Value - DmNotaEntrada.QItemNFVAL_DPI_TRANSGENICOS.value - QItemNFVal_Facs.Value - QItemNfVal_Fethab.Value));
                        FReciboFixar.QRLData.Caption:=DMFilial.QFilialDESC_CIDADE.text+FormatDateTime('"," dd "de" mmmm "de" yyyy"."',StrToDate(MEDataPagto.Text));
                        FReciboFixar.QRLNRRECIBO.Caption:=IntToStr(wNumRecibo);
                        FReciboFixar.QRLComplemento.Caption:='Referente a Venda de '+Trim(MEQtde.text)+' Kgs de ' +Trim(EdProduto.Text);
                        FReciboFixar.QRLUsuario.Caption := 'Usuário:'+DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO','COD_USUARIO = '+IntToStr(DMUsuario.CodUsuarioCorrente),True);
                        FReciboFixar.QRLEmpresa.Caption := 'EMPRESA: '+DMFilial.QFilialDESC_FILIAL.Value;
                        FReciboFixar.QRLEndereco.Caption := 'ENDEREÇO: '+DMFilial.QFilialDESC_ENDERECO.Value;
                        FReciboFixar.QRLCep_Cidade_UF.Caption := 'CEP: '+DMFilial.QFilialDESC_CEP.Value+ ' '+DMFilial.QFilialDESC_CIDADE.Value+' '+DMFilial.QFilialCOD_ESTADO.Value;
                        FReciboFixar.QRLTelefone.Caption := 'TELEFONE: '+DMFilial.QFilialDESC_TELEFONE.Value;

                        FReciboFixar.QuickRep1.Preview;

{                        if FRReciboNFA = Nil then
                           FRReciboNFA:=TFRReciboNFA.Create(Application);
                        FRReciboNFA.pCodCadastro:=StrToFloat(MECadastro.text);
                        FRReciboNFA.QRLDt_Recibo.Caption:=MEDataPagto.Text;
                        FRReciboNFA.pCodFilial:=StrToFloat(MEFilial.text);
                        FRReciboNFA.QRLValorExtenso.Caption:=bib.extenso(DmNotaEntrada.QItemNFVAL_TOTAL.value - DmNotaEntrada.QNotaEntradaVAL_FUNRURAL.value - DMNotaEntrada.QNotaEntradaVAL_DESCONTO_FITAS.Value - DmNotaEntrada.QItemNFVAL_DPI_TRANSGENICOS.value - QItemNFVal_Facs.Value - QItemNfVal_Fethab.Value,'REAL');
                        FRReciboNFA.QRLValor.Caption:=FormatFloat('#,##0.00',(DmNotaEntrada.QItemNFVAL_TOTAL.value - DmNotaEntrada.QNotaEntradaVAL_FUNRURAL.value - DMNotaEntrada.QNotaEntradaVAL_DESCONTO_FITAS.Value - DmNotaEntrada.QItemNFVAL_DPI_TRANSGENICOS.value - QItemNFVal_Facs.Value - QItemNfVal_Fethab.Value));
                        FRReciboNFA.QRLData.Caption:=DMFilial.QFilialDESC_CIDADE.text+FormatDateTime('"," dd "de" mmmm "de" yyyy"."',StrToDate(MEDataPagto.Text));
                        FRReciboNFA.QRLNRRECIBO.Caption:=IntToStr(wNumRecibo);
                        FRReciboNFA.QRLComplemento.Caption:='Referente a Venda de '+Trim(MEQtde.text)+' Kgs de ' +Trim(EdProduto.Text);
                        FRReciboNFA.QRLUsuario.Caption := 'Usuário:'+DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO','COD_USUARIO = '+IntToStr(DMUsuario.CodUsuarioCorrente),True);
                        QRCompositeReport1.Preview;
}                      End
                     Else
                      Begin
                        If FrReciboMilhoConsumo = nil then
                          FrReciboMilhoConsumo := TFrReciboMilhoConsumo.Create(Application);
                        FrReciboMilhoConsumo.pCodCadastro:=StrToFloat(MECadastro.text);
                        FrReciboMilhoConsumo.pCodFilial:=StrToFloat(MEFilial.text);
                        FrReciboMilhoConsumo.QRLProduto.Caption := EdProduto.Text;
                        FrReciboMilhoConsumo.QRLNumero.Caption:=FloatToStr(DMSequencia.Sequencia(StrToInt(Trim(MEFilial.text)),'CONSUMO'));
                        FrReciboMilhoConsumo.QRPrimario.Preview;
                      End;
                    End;
                   If (Trim(EValor.Text) <> '') And (Trim(EValor.Text) <> '0') Then
                    Begin
                      If FContasReceberBaixa = Nil Then
                         FContasReceberBaixa := TFContasReceberBaixa.Create(Application);
                      FContasReceberBaixa.MeCodCliente.Text := Trim(MECadastro.text);
                      FContasReceberBaixa.ShowModal;
                    End;
                  except
                    QNotaEntrada.Cancel;
                    QItemNF.Cancel;
                    if DMOracle.DBCemapa.intransaction then
                      DMOracle.DBCemapa.Rollback;
                    Raise;
                    { exception.Create('Erro! Não foi possível gerar a nota.'+#13+
                                           'Verifique se existem notas que '+#13+
                                           'ainda não foram confirmadas.');      }
                  end;
                end;
            end
          else
            ShowMessage('Erro ! Campo do Produto em branco!');
        end
      else
        ShowMessage('Erro! Campo do Cadastro em branco!');
    end
 else
   ShowMessage('Erro! Valor da Quantidade superior ao saldo a fixar.'+#13+
               'Ou valores dos campos não preenchidos corretamente.');
End;

procedure TFRomConsultaFixar.QRCompositeReport1AddReports(Sender: TObject);
Begin
  QRCompositeReport1.Reports.Add(FReciboFixar.QuickRep1);
  QRCompositeReport1.Reports.Add(FRReciboNFA.QuickRep1);
  DMCadastro.QCadastro.Close;
  DMCadastro.QCadastro.SetVariable('PK',FReciboFixar.pCodCadastro);
  DMCadastro.QCadastro.Open;
  FReciboFixar.QRLEmpresa.Caption := 'EMPRESA: '+DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                                       'COD_FILIAL = '+FloatToStr(FReciboFixar.pCodFilial));
  FReciboFixar.QRLEndereco.Caption := 'ENDEREÇO: '+DMOracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_FILIAL',
                                                       'COD_FILIAL = '+FloatToStr(FReciboFixar.pCodFilial));
  FReciboFixar.QRLCep_Cidade_UF.Caption := 'CEP: '+DMOracle.BuscaNome('SELECT TB_FILIAL.DESC_CEP||'+#39+' '+#39+'||TB_FILIAL.DESC_CIDADE||'+#39+' '+#39+'||TB_FILIAL.COD_ESTADO FROM TB_FILIAL',
                                                       'COD_FILIAL = '+FloatToStr(FReciboFixar.pCodFilial));
  FReciboFixar.QRLTelefone.Caption := 'TELEFONE: '+DMOracle.BuscaNome('SELECT TB_FILIAL.DESC_TELEFONE FROM TB_FILIAL',
                                                       'COD_FILIAL = '+FloatToStr(FReciboFixar.pCodFilial));

End;

procedure TFRomConsultaFixar.FormActivate(Sender: TObject);
begin
  MEQtde.Text := '';
  MEValUnitario.Text := '';
  MECodOperacao.Text := '';
  EDescricao.Text := '';
  EValor.Text := '';
  MEDataPagto.Text := '';
  MEObservacao.Text := '';
  if DmParamSistema.QparamSistemaCod_Empresa.Value <> 'GONZATTI' then
    MeLoteTipo.Text := '1';
  DbEdit4.Visible := DmParamSistema.QparamSistemaCod_Empresa.Value <> 'MOINHO';
  Label1.Visible := DmParamSistema.QparamSistemaCod_Empresa.Value <> 'MOINHO';
  DbEdit5.Visible := DmParamSistema.QparamSistemaCod_Empresa.Value <> 'MOINHO';
  Label2.Visible := DmParamSistema.QparamSistemaCod_Empresa.Value <> 'MOINHO';
  DbEdit8.Visible := DmParamSistema.QparamSistemaCod_Empresa.Value <> 'MOINHO';
  DbEdit9.Visible := DmParamSistema.QparamSistemaCod_Empresa.Value <> 'MOINHO';
  MeCodParceiro.Text := DMusuario.PCodParceria;
  MeCodParceiro.Enabled := DMusuario.PCodParceria = '';
  BtConsParceria.Enabled := DMusuario.PCodParceria = '';
end;

procedure TFRomConsultaFixar.MeLoteTipoExit(Sender: TObject);
begin
  If Trim(MeLoteTipo.Text) <> '' Then
   Begin
     EdLoteTipo.Text := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO = '+MELoteTipo.text);
     if Trim(MeProduto.Text) <> '' then
       MeValUnitario.Text := DMOracle.BuscaNome('SELECT VAL_PRECO FROM TB_PRECO_AGRICOLA',
                            'COD_PRODUTO = '+Trim(meProduto.Text)+' AND COD_FILIAL='+Trim(MeFilial.text) +
                            ' AND DT_PRECO_AGRICOLA='+Chr(39)+DateToStr(Date)+Chr(39) + ' AND COD_LOTE_TIPO='+Trim(MeLoteTipo.Text));
   End
  Else
    EdLoteTipo.Text := 'Todos';
  GBGeraNota.Visible := False;   
end;

procedure TFRomConsultaFixar.BtConsLoteClick(Sender: TObject);
begin
  If FTipoLoteCons = nil then
     FTipoLoteCons := TFTipoLoteCons.Create(Application);
  If FTipoLoteCons.ShowModal = mrOK then
  begin
     MeLoteTipo.Text := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Text;
     MeLoteTipoExit(Self);
  end;
end;

procedure TFRomConsultaFixar.BitBtn6Click(Sender: TObject);
begin
  If FContasReceberCons = Nil then
    FContasReceberCons := TFContasReceberCons.Create(Application);
  FContasReceberCons.MeCodCliente.Text := FRomConsultaFixar.MeCadastro.Text;
  FContasReceberCons.MECodClienteChange(Self);
  FContasReceberCons.BtProcurarClick(Self);
  FContasReceberCons.ShowModal;
  FContasReceberCons.Free;
  FContasReceberCons := Nil;
end;

procedure TFRomConsultaFixar.BitBtn7Click(Sender: TObject);
begin
  If FContasPagarCons = Nil then
    FContasPagarCons := TFContasPagarCons.Create(Application);
  FContasPagarCons.MeCodCliente.Text := FRomConsultaFixar.MeCadastro.Text;
  FContasPagarCons.MECodClienteChange(Self);
  FContasPagarCons.BtProcurarClick(Self);
  FContasPagarCons.ShowModal;
  FContasPagarCons.Free;
  FContasPagarCons := Nil;
end;

procedure TFRomConsultaFixar.BitBtn8Click(Sender: TObject);
begin
  if FContratoCons = Nil then
    FContratoCons := TFContratoCons.Create(Application);
  FContratoCons.MeCodCliente.Text := FRomConsultaFixar.MeCadastro.Text;
  FContratoCons.RgSituacao.ItemIndex := 0;
  FContratoCons.MECodClienteExit(Self);
  FContratoCons.BtProcurarClick(Self);
  FContratoCons.ShowModal;
  FContratoCons.Free;
  FContratoCons := Nil;
end;

procedure TFRomConsultaFixar.BitBtn9Click(Sender: TObject);
begin
  if FContrato_GPCons = Nil then
    FContrato_GPCons := TFContrato_GPCons.Create(Application);
  FContrato_GPCons.MeCodCliente.Text := FRomConsultaFixar.MeCadastro.Text;
  FContrato_GPCons.RgSituacao.ItemIndex := 0;
  FContrato_GPCons.BtProcurarClick(Self);
  FContrato_GPCons.ShowModal;
  FContrato_GPCons.Free;
  FContrato_GPCons := Nil;
end;

procedure TFRomConsultaFixar.BtConsParceriaClick(Sender: TObject);
begin
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal =  mrOk then
      MECodParceiro.Text:=DMCadastro.QCadastroConsCod_Cadastro.text;
end;

procedure TFRomConsultaFixar.BtConsContaCorrenteClick(Sender: TObject);
Var wBanco : String;
begin
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
   Begin
     If DMCadastro.QCadastroConsCod_Banco_Agencia.Text <> '' Then
        wBanco := DMOracle.BuscaNome('SELECT COD_BANCO FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+DMCadastro.QCadastroConsCod_Banco_Agencia.Text);
     MeContaCorrente.Text := 'Titular:'+DMCadastro.QCadastroConsNome_Titular.Value +' Cpf:'+DMCadastro.QCadastroConsDesc_Complemento.Value +
                          ' Banco.:' + wBanco + ' Agencia:'+DMCadastro.QCadastroConsDesc_Agencia.Text +
                          ' Conta.:' + DMCadastro.QCadastroConsDesc_Conta_Corrente.Text;
   End;
end;

procedure TFRomConsultaFixar.BitBtn10Click(Sender: TObject);
begin
  if FPenhorCedularCons = Nil then
    FPenhorCedularCons := TFPenhorCedularCons.Create(Application);
  FPenhorCedularCons.MECliente.Text := MeCadastro.Text;
  FPenhorCedularCons.MEProduto.Text := MeProduto.Text;
  DMPenhorCedular.QPenhorCedularCons.SetVariable('COD_CADASTRO',MeCadastro.Text);
  DMPenhorCedular.QPenhorCedularCons.SetVariable('COD_PRODUTO',MeProduto.Text);
  FPenhorCedularCons.MEClienteExit(Self);
  FPenhorCedularCons.MEProdutoExit(Self);
  FPenhorCedularCons.BtProcurarClick(Self);
  FPenhorCedularCons.ShowModal;
  FPenhorCedularCons.Free;
  FPenhorCedularCons := Nil;
end;

procedure TFRomConsultaFixar.MeFilialChange(Sender: TObject);
begin
  GBGeraNota.Visible := False;
end;

procedure TFRomConsultaFixar.CalculaTotal;
Var wTotal,wEmbalagem,wValDpi : Real;
begin
  If (Trim(MEQtde.Text) <> '') And (Trim(MEValUnitario.Text) <> '') And (Trim(MECodOperacao.Text) <> '') Then
  Begin
    wTotal := StrToFloat(Trim(MEValUnitario.Text));
    If StrToFloat(Trim(MEValUnitario.Text)) > 0 Then
      wTotal := StrToFloat(Trim(MEValUnitario.Text))*StrToFloat(Trim(MEQtde.Text));
    wTotal := wTotal / StrToFloat(DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO = '+Trim(MeProduto.Text)));
    wValDpi := 0;
    // calcular o valor do dpi transgenicos
    If (DMOperacao.QOperacao.Eof) Or
       (DMOperacao.QOperacaoCod_Operacao.Text <> MeCodOperacao.Text) Then
     Begin
       DMOperacao.QOperacao.Close;
       DMOperacao.QOperacao.SetVariable('Pk',MeCodOperacao.Text);
       DMOperacao.QOperacao.Open;
     End;
    If (DMOperacao.QOperacaoInd_Fixar_Empresa.Value = 'F') Or // somente desconta transgenicos para fixacao nao tem na devolucao
       (DMOperacao.QOperacaoIND_COMPRAS.Value = 'C') Then  // para moinho testa o compras porque faz nota devolucao e um nota de compra
     Begin
       wEmbalagem :=StrToFloat(DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO = '+Trim(MeProduto.Text),True));
       If (Trim(MePercDpi.Text) <> '') And (Trim(MePercDpi.Text) <> '0') And (Trim(MeCobrado.Text) <> '') Then
          wValDpi := StrToFloat(Trim(MEValUnitario.Text)) * (StrToFloat(MeCobrado.Text) / wEmbalagem * StrToFloat(Trim(MePercDpi.Text)) / 100);
     End;

    MeValorTotal.Text := FormatFloat('#,##0.00',wTotal - wValDpi - DMNotaEntrada.CalculaFunrural(StrToInt(Trim(MeProduto.Text)),
                    StrToInt(Trim(MeCodOperacao.Text)),
                    StrToInt(Trim(MeCadastro.Text)),
                    wTotal));

  End;
end;

procedure TFRomConsultaFixar.MeCreditoSementeChange(Sender: TObject);
begin
  If Trim(MeCreditoSemente.Text) <> '' Then
    If StrToFloat(Trim(MeCreditoSemente.Text)) > StrToFloat(Trim(MeQtde.Text)) Then
       MeCobrado.Text := '0'
    Else
       MeCobrado.Text := FloatToStr(StrToFloat(MeQtde.Text) - StrToFloat(Trim(MeCreditoSemente.Text)));
end;

procedure TFRomConsultaFixar.BitBtn11Click(Sender: TObject);
begin
  DMRomaneioAgricola.QFitas_Cobranca.Close;
  DMRomaneioAgricola.QFitas_Cobranca.SetVariable('Cod_Cadastro',Trim(MeCadastro.Text));
  DMRomaneioAgricola.QFitas_Cobranca.Open;
  If FFitasBaixa = Nil Then
     FFitasBaixa := TFFitasBaixa.Create(Application);
  If FFitasBaixa.ShowModal = MrOk Then
     MeVlFitas.Text := FFitasBaixa.MeTotal.Text;
end;

procedure TFRomConsultaFixar.MeCodParceiroChange(Sender: TObject);
begin
  GBGeraNota.Visible := False;
end;

procedure TFRomConsultaFixar.MEQtdeExit(Sender: TObject);
begin
  CalculaTotal;
end;

procedure TFRomConsultaFixar.MEValUnitarioExit(Sender: TObject);
begin
  CalculaTotal;
end;

procedure TFRomConsultaFixar.Proc_Gera_Nota(pOperacao : Integer; pPreco : Real; pCodNota : String);
Var wQt_DPI,wEmbalagem : Real;
    wBloqueio : String;
    wSped: Boolean;
begin
  Try
    With DMNotaEntrada do
    Begin
      QNotaEntrada.Insert;
      QNotaEntradaCOD_FILIAL.Value   := StrToInt(Trim(MeFilial.text));
      QNotaEntradaCOD_OPERACAO.Value := pOperacao;
      QNotaEntradaCod_Cadastro.Value := StrToInt(Trim(MeCadastro.text));
      If (DmParamSistema.QparamSistemaCod_Empresa.Value = 'CEREAIS') then
        QNotaEntradaCOD_SERIE.Value  := DMOperacao.QOperacaoCOD_SERIE.Value
      Else
        QNotaEntradaCOD_SERIE.Value  := DMOracle.BuscaNome('SELECT COD_SERIE FROM TB_FILIAL','COD_FILIAL = '+Trim(MeFilial.text));
      QNotaEntradaCOD_SERIE_MODELO.Value :=
        DMOracle.BuscaNome('SELECT COD_SERIE_MODELO FROM TB_FILIAL','COD_FILIAL = '+Trim(MeFilial.text));
      If (DmParamSistema.QparamSistemaCod_Empresa.Value <> 'MOINHO') and
         (DmParamSistema.QparamSistemaCod_Empresa.Value <> 'GONZATTI')  Then
         QNotaEntradaDESC_OBS_CORPO_NOTA.Value := MEObservacao.Text;
      If DMOperacao.QOperacaoCod_Mensagem.Value > 0 Then
         QNotaEntradaCOD_MENSAGEM.Value:=DMOperacao.QOperacaoCod_Mensagem.Value;
      If (Trim(MeCodParceiro.Text) <> '') And
         (Trim(MeCodParceiro.Text) <> '0') Then
         QNotaEntradaCod_Cadastro_Parceiro.Value:=StrToInt(Trim(MeCodParceiro.text));
      If Trim(MeVlFitas.Text) <> '' Then
         QNotaEntradaVal_Desconto_Fitas.Value := StrToFloat(Trim(MeVlFitas.Text));
      If RgBaixaContrato.ItemIndex = 0 Then
         QNotaEntradaIND_BAIXA_CONTRATO_CF.Value := 'S'
      Else
         QNotaEntradaIND_BAIXA_CONTRATO_CF.Value := 'N';
      If pCodNota <> '' Then
       Begin
         QNotaEntradaCOD_NOTA_CAB_DEV_FIXAR.Value := StrToInt(pCodNota);  // grava o codigo da nota fiscal de devolucao que foi gerado
         QNotaEntradaNUM_NOTA.Value := 999999;
       End
      Else
       If (DmParamSistema.QparamSistemaCod_Empresa.Value = 'MOINHO') Then
         QNotaEntradaIND_CONDICAO_PAGTO.Value := '3';

      //Para checar se filial entrega sped contribuições
      wSped := (DMOracle.FastSelect('NVL(COD_INC_TRIB,0)','TB_FILIAL',
        'COD_FILIAL = ' + QNotaEntradaCOD_FILIAL.Text) <> '0');

      QItemNF.Insert;
      QItemNFCOD_PRODUTO.Value   := StrToInt(Trim(MeProduto.text));
      if wSped then
      begin
        with DMOracle do
        begin
          QItemNFCOD_CST_PIS.Value := FastSelect('COD_CST_PIS','TB_PRODUTO',
            'COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text);
          QItemNFCOD_CST_COFINS.Value := FastSelect('COD_CST_COFINS','TB_PRODUTO',
            'COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text);
        end;
      end;
      if(MeLoteTipo.Text = '')then
        Raise Exception.Create('Informar Lote do produto')
      else
      QItemNFCOD_LOTE_TIPO.Value := StrToInt(Trim(MeLoteTipo.text));
      QItemNFQT_QUANTIDADE.Value := StrToFloat(Trim(MeQtde.text));
      QItemNFVAL_UNITARIO.Value  := pPreco;
      if MeNfProdutor.Text <> '' then
        QItemNFNUM_NOTA_PRODUTOR.Value := StrToInt(MeNfProdutor.Text);
      QItemNFVAL_DPI_TRANSGENICOS.Value := 0;
      If Trim(MeCreditoSemente.Text) <> '' Then
         QItemNFQT_CREDITO_TRANSGENICOS.Value := StrToFloat(Trim(MeCreditoSemente.Text))
      Else
         QItemNFQT_CREDITO_TRANSGENICOS.Value := 0;
      wQt_DPI := QItemNFQT_QUANTIDADE.Value - QItemNFQT_CREDITO_TRANSGENICOS.Value;
      If (DMOperacao.QOperacaoInd_Fixar_Empresa.Value = 'F') Or // somente desconta transgenicos para fixacao nao tem na devolucao
         (DMOperacao.QOperacaoIND_COMPRAS.Value = 'C') Then  // para moinho testa o compras porque faz nota devolucao e um nota de compra
       Begin
         wEmbalagem :=StrToFloat(DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO',
                'COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value),True));
        If (Trim(MePercDpi.Text) <> '') And (Trim(MePercDpi.Text) <> '0') And (wQt_DPI > 0) Then
         Begin
           QItemNFVAL_DPI_TRANSGENICOS.Value := QItemNFVal_Unitario.Value * wQt_DPI / wEmbalagem * StrToFloat(Trim(MePercDpi.Text)) / 100;
         End;
         // calculo imposto para mato grosso facs e fethab
         If DMCadastro.QCadastroCod_Estado.Value = 'MT' Then
          Begin
            DMProdutoAgricola.QProdutoAgricola.Close;
            DMProdutoAgricola.QProdutoAgricola.SetVariable('Pk',StrToInt(Trim(MeProduto.text)));
            DMProdutoAgricola.QProdutoAgricola.Open;
            If not(DMProdutoAgricola.QProdutoAgricola.eof) Then
             Begin
               If (DMProdutoAgricola.QProdutoAgricolaVal_Facs.Value > 0) And (StrToFloat(Trim(MEQtde.text)) > 0) Then
                  QItemNFVal_Facs.Value := StrToFloat(Trim(MEQtde.text)) * DMProdutoAgricola.QProdutoAgricolaVal_Facs.Value / 1000;
               If (DMProdutoAgricola.QProdutoAgricolaVal_Fethab.Value > 0) And (StrToFloat(Trim(MEQtde.text)) > 0) Then
                  QItemNFVal_Fethab.Value := StrToFloat(Trim(MEQtde.text)) * DMProdutoAgricola.QProdutoAgricolaVal_Fethab.Value / 1000;
             End;
          End;
       End;
      QItemNF.Post;
      If (DMOperacao.QOperacaoInd_Fixar_Consumo.Value = 'D') And
         (DMRomaneioAgricola.QRomConsFixarsaldo_consumo.Value = StrToFloat(Trim(MeQtde.Text))) And
         (DMRomaneioAgricola.QRomConsFixarSQuantidade_Bloqueado_Consumo.Value <> 0) Then
       Begin
         QItemNF.Insert;
         QItemNFCOD_PRODUTO.Value      := StrToInt(Trim(MeProduto.text));
         QItemNFCOD_LOTE_TIPO.Value    := StrToInt(Trim(MeLoteTipo.text));
         QItemNFQT_QUANTIDADE.Value    := DMRomaneioAgricola.QRomConsFixarSQuantidade_Bloqueado_Consumo.Value;
         QItemNFVAL_UNITARIO.Value     := pPreco;
         QItemNFInd_Tipo_Consumo.Value := 'QUEBRA';
         QItemNF.Post;
         DMBloqueio_produto.QBloqueioProduto_Cad.Close;
         DMBloqueio_produto.QBloqueioProduto_Cad.CommitOnPost := Not(DMBloqueio_produto.QBloqueioProduto_Cad.CommitOnPost);
         wBloqueio := DMOracle.BuscaNome('SELECT COD_PRODUTO_BLOQUEADO FROM TB_PRODUTO_BLOQUEADO',
                      ' COD_CADASTRO = '         + Trim(MECadastro.text) +
                      ' AND COD_PRODUTO = '      + Trim(MeProduto.text) +
                      ' AND IND_TIPO_PRODUTO = ' + Chr(39) + 'CONSUMO' + Chr(39) +
                      ' AND COD_FILIAL = '       + Trim(MEFilial.text));
         If wBloqueio <> '' Then
          Begin
            DMBloqueio_produto.QBloqueioProduto_Cad.SetVariable('PK',wBloqueio);
            DMBloqueio_produto.QBloqueioProduto_Cad.Open;
            DMBloqueio_produto.QBloqueioProduto_Cad.Delete;
          End;
       End;
      QNotaEntrada.Post;
    End;
  Except
    Raise;
  End;
End;


procedure TFRomConsultaFixar.MeCreditoSementeExit(Sender: TObject);
begin
  CalculaTotal;
end;

end.
