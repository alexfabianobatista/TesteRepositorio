unit UTransferenciaSaldoFixar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Mask, ComCtrls, ToolWin, ExtCtrls, variants;

type
  TFTransferenciaSaldoFixar = class(TForm)
    MECodFilial: TMaskEdit;
    MECodProduto: TMaskEdit;
    MECodOperacaoEntrada: TMaskEdit;
    MEFilial: TMaskEdit;
    MEProduto: TMaskEdit;
    MEOperacaoEntrada: TMaskEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    MECodCadastroEntrada: TMaskEdit;
    SpeedButton4: TSpeedButton;
    MECadastroEntrada: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MEPreco: TMaskEdit;
    MEQuantidade: TMaskEdit;
    MECodCadastroSaida: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    SpeedButton5: TSpeedButton;
    MECadastroSaida: TMaskEdit;
    MECodOperacaoSaida: TMaskEdit;
    SpeedButton6: TSpeedButton;
    MEOperacaoSaida: TMaskEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    BitBtn1: TBitBtn;
    MECodSerieSaida: TMaskEdit;
    Label11: TLabel;
    MECodSerieEntrada: TMaskEdit;
    Label12: TLabel;
    Label22: TLabel;
    MeLoteTipo: TMaskEdit;
    BtConsLote: TBitBtn;
    EdLoteTipo: TEdit;
    Label13: TLabel;
    MEObservacao: TMaskEdit;
    MeComplemento: TMaskEdit;
    Label14: TLabel;
    MeObservacaoEnt: TMaskEdit;
    Label15: TLabel;
    MeCadastroParceiro: TMaskEdit;
    SpeedButton7: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure MECodFilialExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MECodProdutoExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure MECodOperacaoEntradaExit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure MECodCadastroEntradaExit(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure MECodCadastroSaidaExit(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MeLoteTipoExit(Sender: TObject);
    procedure BtConsLoteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MECodOperacaoSaidaExit(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTransferenciaSaldoFixar: TFTransferenciaSaldoFixar;

implementation

uses UFilialCons, UFilial_cl, UOracle_cl, UProdutoCons, UProduto_cl,
  UOperacaoCons, UOperacao_cl, UCadastroCons, UCadastro_cl,
  URomaneioAgricola_cl, UNotaSaida_cl, UNotaSaida_Confirma, UNotaEntrada_cl,
  UNotaEntrada_Confirma, URSolicitacaoTransf, UTipoLoteCons, UTipoLote_cl,
  UUsuario_cl;

{$R *.DFM}

procedure TFTransferenciaSaldoFixar.SpeedButton1Click(Sender: TObject);
begin
  if FFilialCons = Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      MECodFilial.text:=DMFilial.QFilialConsCod_Filial.text;
      MECodFilialExit(Self);
    end;
end;

procedure TFTransferenciaSaldoFixar.MECodFilialExit(Sender: TObject);
begin
  if Trim(MECodFilial.text) <> '' then
    MEFilial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL ='+MECodFilial.text)
  else
    MEFilial.Clear;
end;

procedure TFTransferenciaSaldoFixar.SpeedButton2Click(Sender: TObject);
begin
  if FProdutoCons = nil then
    FProdutoCons:=TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    begin
      MECodProduto.text:=DMProduto.QprodutoConsCod_Produto.text;
      MECodprodutoExit(Self);
    end;
end;

procedure TFTransferenciaSaldoFixar.MECodProdutoExit(Sender: TObject);
begin
  if trim(MECodProduto.text)<>'' then
    begin
      MEProduto.text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+MECodProduto.text);
      MEPreco.Text:=DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO','COD_PRODUTO = '+MECodProduto.text);
      MECodOperacaoSaida.Text := DMOracle.BuscaNome('SELECT COD_OPERACAO_TRANSFERENCIA FROM TB_PRODUTO_AGRICOLA','COD_PRODUTO='+Trim(MeCodProduto.Text));
      MECodOperacaoEntrada.Text := DMOracle.BuscaNome('SELECT COD_OPER_TRANSF_ENTRADA FROM TB_PRODUTO_AGRICOLA','COD_PRODUTO='+Trim(MeCodProduto.Text));
    end
  else
    begin
      MEProduto.Clear;
      MEPreco.Clear;
      MECodOperacaoSaida.Clear;
      MECodOperacaoEntrada.Clear;
    end;
end;

procedure TFTransferenciaSaldoFixar.SpeedButton3Click(Sender: TObject);
begin
  if FOperacaoCons = nil then
    FOperacaoCons:=TFOperacaoCons.Create(Application);
  FOperacaoCons.RGTipoOperacao.ItemIndex:=0;
  if FOperacaoCons.ShowModal = mrok then
    MECodOperacaoEntrada.Text:=DMOperacao.QOperacaoConsCod_Operacao.text;
  MECodOperacaoEntradaExit(Self);
end;

procedure TFTransferenciaSaldoFixar.MECodOperacaoEntradaExit(
  Sender: TObject);
begin
  if Trim(MECodOperacaoEntrada.text)<>'' then
    MEOperacaoEntrada.text:=DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO','COD_OPERACAO = '+MECodOperacaoEntrada.Text)
  else
    MEOperacaoEntrada.Clear;
end;

procedure TFTransferenciaSaldoFixar.SpeedButton4Click(Sender: TObject);
begin
  if FCadastroCons = nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      MECodCadastroEntrada.Text:=DMCadastro.QCadastroConsCod_Cadastro.text;
      MECodCadastroEntradaExit(Self);
    end;
end;

procedure TFTransferenciaSaldoFixar.MECodCadastroEntradaExit(
  Sender: TObject);
begin
  if trim(MECodCadastroEntrada.text)<>'' then
    MECadastroEntrada.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECodCadastroEntrada.text)
  else
    MECadastroEntrada.Clear;
end;

procedure TFTransferenciaSaldoFixar.SpeedButton5Click(Sender: TObject);
begin
  if FCadastroCons = Nil then
   FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.Showmodal = mrok then
    begin
      MECodCadastroSaida.Text:=DMCadastro.QCadastroConsCod_Cadastro.text;
      MECodCadastroSaidaExit(Self);
    end;
end;

procedure TFTransferenciaSaldoFixar.MECodCadastroSaidaExit(
  Sender: TObject);
begin
  if trim(MECodCadastroSaida.text)<>'' then
    MECadastroSaida.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECodCadastroSaida.text)
  else
    MECadastroSaida.Clear;
end;

procedure TFTransferenciaSaldoFixar.SpeedButton6Click(Sender: TObject);
begin
  if FOperacaoCons=Nil then
    FOperacaoCons:=TFOperacaoCons.Create(Application);
  if FOperacaoCons.Showmodal = mrok then
    MECodOperacaoSaida.Text:=DMOperacao.QOperacaoConsCOD_OPERACAO.text;
  MECodOperacaoSaidaExit(Self);
end;

procedure TFTransferenciaSaldoFixar.BitBtn1Click(Sender: TObject);
var wMensagem,wCpfRecebe,wCpfEmite,wTexto : String;
begin
  DmUsuario.Checar_Filial_Usuario( Trim(MECodFilial.Text),'AGRICOLA');
  with DMRomaneioAgricola do
    begin
      QRomConsFixar.Close;
      if Trim(MECodCadastroSaida.text)<>'' then
        QRomConsFixar.SetVariable('CADASTRO',MECodCadastroSaida.text)
      else
        Raise Exception.Create('Erro! É obrigatório informar o cliente do qual será feito a transferência.');

      if Trim(MECodProduto.text)<>'' then
        QRomConsFixar.SetVariable('PRODUTO',MECodProduto.text)
      else
        Raise Exception.Create('Erro! É obrigatório informar o produto.');

      if Trim(MELoteTipo.text)<>'' then
        QRomConsFixar.SetVariable('LOTE_TIPO',MELoteTipo.text)
      else
        Raise Exception.Create('Erro! É obrigatório informar o produto.');

      if Trim(MECodFilial.text)<>'' then
        QRomConsFixar.SetVariable('FILIAL',MECodFilial.Text)
      else
        Raise Exception.Create('Erro! É obrigatório informar a filial.');

      if Trim(MeCadastroParceiro.text) <> '' then
        QRomConsFixar.SetVariable('COD_PARCEIRO',Trim(MeCadastroParceiro.text))
      else
        QRomConsFixar.SetVariable('COD_PARCEIRO',Null);

//      QRomConsFixar.SetVariable('DATAI',StrToDate('01/12/1999'));
//      QRomConsFixar.SetVariable('DATAF',DMOracle.DataServ);
      QRomConsFixar.SetVariable('TIPO_FIXAR','EMPRESA');
      DMNotaEntrada.pContabiliza_Extra := 'N';
      QRomConsFixar.Open;
      if trim(MEQuantidade.text)<>'' then
        if StrToFloat(MEQuantidade.text)<=QRomConsFixarsaldo_fixar.Value then
          begin
            if (Trim(MECodFilial.text)<>'') and (Trim(MECodProduto.text)<>'') and (Trim(MECodCadastroSaida.text)<>'')
              and (Trim(MECodOperacaoSaida.text)<>'') and (Trim(MEPreco.text)<>'') and (Trim(MECodSerieSaida.text)<>'')
              and (Trim(MECodOperacaoEntrada.text)<>'') and (Trim(MECodCadastroSaida.text)<>'') and (Trim(MECodSerieEntrada.text)<>'') then
              begin
                DMOracle.DBCemapa.StartTransaction;
                Try
                  with DMNotaSaida do
                    begin
                      QNotaSaida.Open;
                      QItemNF.Open;
                      QNotaSaida.Insert;
                      pTR:=True;
                      QNotaSaidaCOD_FILIAL.Value:=StrToInt(Trim(MECodFilial.text));
                      QNotaSaidaCOD_CADASTRO.Value:=StrToInt(Trim(MECodCadastroSaida.text));
                      QNotaSaidaCOD_OPERACAO.Value:=StrToInt(Trim(MECodOperacaoSaida.text));
                      QNotaSaidaCOD_SERIE.Value:=MECodSerieSaida.Text;
                      QNotaSaidaOBS.Value:=MEObservacao.Text;
                      QNotaSaidaOBS_COMPLEMENTO.Value:=MEComplemento.Text;
                      If (Trim(MeCadastroParceiro.Text) <> '') And (Trim(MeCadastroParceiro.Text) <> '0') Then
                         QNotaSaidaCOD_CADASTRO_PARCEIRO.Value := StrToInt(Trim(MeCadastroParceiro.Text));
                      wMensagem := DMOracle.BuscaNome('SELECT COD_MENSAGEM FROM TB_OPERACAO','COD_OPERACAO = '+Trim(MECodOperacaoSaida.text));
                      If wMensagem <> '' Then
                         QNotaSaidaCod_Mensagem.Value :=  StrToInt(wMensagem);
                      QItemNF.insert;
                      QItemNFCOD_PRODUTO.Value:=StrToInt(Trim(MECodProduto.text));
                      QItemNFCOD_LOTE_TIPO.Value:=StrToInt(Trim(MELoteTipo.text));
                      QItemNFQT_QUANTIDADE.Value:=StrToFloat(Trim(MEQuantidade.text));
                      QItemNFVAL_UNITARIO.Value:=StrTofloat(Trim(MEPreco.text));
                      QItemNF.post;
                      If DMNotaSaida.QNotaSaidaInd_Situacao.Value = '2' Then
                        Raise Exception.Create('Nota Fiscal já confirmada!');
                      If DMNotaSaida.QNotaSaidaInd_Situacao.Value = '3' Then
                        Raise Exception.Create('Não é possível confirmar uma Nota Fiscal Cancelada!');
                      If FNotaSaida_Confirma = Nil then
                        FNotaSaida_Confirma := TFNotaSaida_Confirma.Create(Application);
//                      ChecaNota; RETIRADO PELO CESAR PORQUE NA TRANSFERENCIA DE SALDO A FIXAR NAO PRECISA
                      FNotaSaida_Confirma.pAtivado := False;
                      pConfirmando := True;
                      DMNotaEntrada.CalculaDesconto(QNotaSaidaCOD_CADASTRO.Value,QNotaSaidaCOD_FILIAL.Value,QNotaSaidaCOD_OPERACAO.Value,QItemNFCOD_NOTA_ITEM.Value,QItemNFCOD_PRODUTO.Value,QItemNFQT_QUANTIDADE.Value,'S',QNotaSaidaCOD_CADASTRO_PARCEIRO.Text);
                      FNotaSaida_Confirma.ShowModal;
                      QSomaItemNota.AutoCalcfields := False;
                      pConfirmando := False;
                      FNotaSaida_Confirma.pAtivado := False;
                    end;
                  if not(DMNotaSaida.pCF) then
                    begin
                      With DMNotaEntrada do
                        begin
                          QNotaEntrada.Open;
                          QItemNF.Open;
                          QNotaEntrada.Insert;
                          QNotaEntradaCOD_FILIAL.Value:=StrToInt(Trim(MECodFilial.text));
                          QNotaEntradaCOD_OPERACAO.Value:=StrtoInt(Trim(MECodOperacaoEntrada.text));
                          QNotaEntradaCOD_SERIE.Value:=Trim(MECodSerieEntrada.text);
                          QNotaEntradaCOD_CADASTRO.Value:=StrToInt(Trim(MECodCadastroEntrada.text));
                          QNotaEntradaCOD_NOTA_CONTA_CORRENTE.Value:=DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value;
                          QNotaEntradaOBS.Value:=MeObservacaoEnt.Text;
                          If (Trim(MeCadastroParceiro.Text) <> '') And (Trim(MeCadastroParceiro.Text) <> '0') Then
                             QNotaEntradaCOD_CADASTRO_PARCEIRO.Value := StrToInt(Trim(MeCadastroParceiro.Text));
                          wMensagem := DMOracle.BuscaNome('SELECT COD_MENSAGEM FROM TB_OPERACAO','COD_OPERACAO = '+Trim(MECodOperacaoEntrada.text));
                          If wMensagem <> '' Then
                             QNotaEntradaCod_Mensagem.Value :=  StrToInt(wMensagem);
                          QItemNF.Insert;
                          QItemNFCOD_PRODUTO.Value:=StrToInt(Trim(MECodProduto.text));
                          QItemNFCOD_LOTE_TIPO.Value:=StrToInt(Trim(MELoteTipo.text));
                          QItemNFQT_QUANTIDADE.Value:=StrToFloat(Trim(MEQuantidade.text));
                          QItemNFVAL_UNITARIO.Value:=StrTofloat(Trim(MEPreco.text));
                          QItemNFVAL_TOTAL.Value:=QItemNFQT_QUANTIDADE.Value*QItemNFVAL_UNITARIO.Value;
                          QItemNF.post;
                          QNotaEntrada.post;
                          If QNotaEntradaInd_Situacao.Value = '2' Then
                            Raise Exception.Create('Nota Fiscal já confirmada!');
                          If QNotaEntradaInd_Situacao.Value = '3' Then
                            Raise Exception.Create('Não é possível confirmar uma Nota Fiscal Cancelada!');
                          pOperacaoInterna := 3;
                          pTR:=True;
                          If FNotaEntrada_Confirma = Nil then
                            FNotaEntrada_Confirma := TFNotaEntrada_Confirma.Create(Application);
                          FNotaEntrada_Confirma.BtCancelar.Enabled := False;  
                          FNotaEntrada_Confirma.ShowModal;
                          pOperacaoInterna := 0;
                        end;
                    end;
                  if (DMNotaSaida.pCF) or (DMNotaEntrada.pCF)then
                    begin
                      DMOracle.DBCemapa.RollBack;
                      DMNotaSaida.pCF:=False;
                      DMNotaEntrada.pCF:=False;
                    end
                  else
                    begin
                      DMOracle.DBCemapa.Commit;
                      DMNotaSaida.pCF:=False;
                      DMNotaEntrada.pCF:=False;
                      if FRSolicitacaoTransf = Nil then
                         FRSolicitacaoTransf := TFRSolicitacaoTransf.Create(Application);
                      wCpfRecebe := DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO','COD_CADASTRO = '+MECodCadastroEntrada.text);
                      wCpfEmite := DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO','COD_CADASTRO = '+MECodCadastroSaida.text);
                      FRSolicitacaoTransf.QRLFilial.Caption:=MEFilial.text;
                      wTexto:='Eu, '+MECadastroSaida.Text+','+' Maior, portador do CPF nr. '+wCpfEmite + ' Solicito e autorizo a empresa ';
                      wTexto:=wTexto +MEFilial.text+', a transferir a quantia de '+MEQuantidade.Text+' Kg. de '+MEproduto.Text+' depositado em meu nome, em favor ao(a) Sr.(a), ';
                      wTexto:=wTexto +MECadastroEntrada.text + ' portador(a) do CPF nr. '+wCpfRecebe + ', me responsabilizando inteiramente pela transfêrencia.';
                      wTexto:=wTexto +chr(13)+'    Declaro também para todos os fins, que o produto transferido não provem de';
                      wTexto:=wTexto +' vínculos de crédito de terceiros, financiamentos, custeio agrícola, cédula de produto';
                      wTexto:=wTexto +' agrícola, e outros, dando ao autorizado(a) total liberdade para faturamento do produto';
                      wTexto:=wTexto +' isentando a empresa '+MEFilial.text+'. de quaisquer problemas oriundos desta autorização, seja fiscal ou financeira.';
                      FRSolicitacaoTransf.QRlabel7.Caption:= wTexto;
                      FRSolicitacaoTransf.QRLData.Caption:=DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_FILIAL','COD_FILIAL = '+MECODFILIAL.TEXT)+', '+FormatDateTime('dd "de" mmmm "de" yyyy.',DMOracle.DataServ);
                      FRSolicitacaoTransf.QRLCadastro.Caption:=MECadastroSaida.Text;
                      FRSolicitacaoTransf.QuickRep1.Preview;
//                      ShowMessage('Notas de Trânsferência geradas com sucesso.');
                      Close;
                      MEObservacao.Text := '';
                      MEComplemento.Text := '';
                    end;
                except
                  on e : Exception do
                   Begin
                  DMOracle.DBCemapa.Rollback;
                  DMNotaSaida.QNotaSaida.EnableControls;
                  DMNotaSaida.QItemNF.EnableControls;
                  DMNotaSaida.QItemNF.Cancel;
                  DMNotaSaida.QNotaSaida.Cancel;
                  DMNotaSaida.pTR:=False;
                  DMNotaSaida.pCF:=False;
                  DMNotaEntrada.QItemNF.Cancel;
                  DMNotaEntrada.QNotaEntrada.Cancel;
                     Raise Exception.Create(e.Message + Chr(13) + 'Erro! Não foi possível gerar as notas.');
                  end;   
                end;
              end
            else
              showmessage('Atenção! Todos os campos devem ser preenchidos'+#13+
                          'para emissão das notas de transferência.'+#13+
                          'Favor preencher os campos que estão em branco.');
          end
        else
          Showmessage('Atenção! Não existe saldo disponível.');
    end;
end;

procedure TFTransferenciaSaldoFixar.MeLoteTipoExit(Sender: TObject);
begin
  If Trim(MELoteTipo.Text) <> '' Then
    EdLoteTipo.Text := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO = '+MELoteTipo.text)
  Else
    EdLoteTipo.Text := 'Todos';

end;

procedure TFTransferenciaSaldoFixar.BtConsLoteClick(Sender: TObject);
begin
  If FTipoLoteCons = nil then
     FTipoLoteCons := TFTipoLoteCons.Create(Application);
  If FTipoLoteCons.ShowModal = mrOK then
  begin
     MeLoteTipo.Text := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Text;
     MeLoteTipoExit(Self);
  end;

end;

procedure TFTransferenciaSaldoFixar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMNotaSaida.pTR := False;
  DMNotaEntrada.pTR := False;
end;

procedure TFTransferenciaSaldoFixar.MECodOperacaoSaidaExit(
  Sender: TObject);
begin
  if Trim(MECodOperacaoSaida.text)<>'' then
    MEOperacaoSaida.text:=DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO','COD_OPERACAO = '+MECodOperacaoSaida.Text)
  else
    MEOperacaoSaida.Clear;

end;

procedure TFTransferenciaSaldoFixar.SpeedButton7Click(Sender: TObject);
begin
  if FCadastroCons = Nil then
   FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.Showmodal = mrok then
      MeCadastroParceiro.Text:=DMCadastro.QCadastroConsCod_Cadastro.text;
end;

end.
