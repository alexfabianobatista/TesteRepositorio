unit UGeraNFTransEntrada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask;

type
  TFGeraNFTransEntrada = class(TForm)
    MECodFilial: TMaskEdit;
    SpeedButton1: TSpeedButton;
    MEFilial: TMaskEdit;
    SpeedButton2: TSpeedButton;
    MECadastro: TMaskEdit;
    MECodOperacao: TMaskEdit;
    SpeedButton3: TSpeedButton;
    MEOperacao: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MECodCadastro: TMaskEdit;
    BitBtn1: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure MECodFilialExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MECodCadastroExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure MECodOperacaoExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    Function ValidaCampos : Boolean;
    Function InsereItens :Boolean;
    Function InsereNotaEntrada :Boolean;
    Procedure ConfirmaNota;
    Procedure VoltaStatusNota;
    Procedure FinalizanfEntrada;
  public
    { Public declarations }
  end;

var
  FGeraNFTransEntrada: TFGeraNFTransEntrada;

implementation

uses UFilialCons, UFilial_cl, UOracle_cl, UCadastroCons, UCadastro_cl,
  UOperacaoCons, UOperacao_cl, UNotaEntrada_cl, UNotaSaida_cl,
  USequencia_cl, UNotaSaida_Confirma, UParamSistema_cl;

{$R *.DFM}

procedure TFGeraNFTransEntrada.SpeedButton1Click(Sender: TObject);
begin
  if FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      MECodFilial.text:=DMFilial.QFilialConsCod_Filial.Text;
      MECodFilialExit(Self);
    end;
end;

procedure TFGeraNFTransEntrada.MECodFilialExit(Sender: TObject);
begin
  if Trim(MECodFilial.text)<>'' then
    MEFilial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MECodFilial.text)
  else
    MEFilial.Clear;
end;

procedure TFGeraNFTransEntrada.SpeedButton2Click(Sender: TObject);
begin
  if FCadastroCons = Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      MECodCadastro.text:=DMCadastro.QCadastroConsCod_Cadastro.text;
      MECodCadastroExit(Self);
    end;
end;

procedure TFGeraNFTransEntrada.MECodCadastroExit(Sender: TObject);
begin
  if Trim(MECodCadastro.text)<>'' then
    MECadastro.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECodCadastro.text)
  else
    MECadastro.Clear;
end;

procedure TFGeraNFTransEntrada.SpeedButton3Click(Sender: TObject);
begin
  if FOperacaoCons = Nil then
    FOperacaoCons:=TFOperacaoCons.Create(Application);
  if FOperacaoCons.ShowModal = mrOk then
    begin
      If DMOperacao.QOperacaoConsInd_Tipo_Operacao.Value <> 'E' Then
         Raise Exception.Create('Operação Não é de Entrada!');

      MECodOperacao.text:=DMOperacao.QOperacaoConsCod_Operacao.text;
      MECodOperacaoExit(Self);
    end;
end;

procedure TFGeraNFTransEntrada.MECodOperacaoExit(Sender: TObject);
begin
  if Trim(MECodOperacao.text)<>'' then
    MEOperacao.text:=DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO','COD_OPERACAO ='+MECodOperacao.text)
  else
    MEOperacao.Clear;
end;

procedure TFGeraNFTransEntrada.BitBtn1Click(Sender: TObject);
Var
  InsNot, InsItem :Boolean;
begin
  InsNot:=False;
  InsItem:=InsNot;
  DMNotaEntrada.pContabiliza_Extra := 'N';
  if ValidaCampos then
    begin
      Try
        DMOracle.DBCemapa.StartTransaction;
        InsNot:=InsereNotaEntrada;
        InsItem:=InsereItens;
        ConfirmaNota;
        if not(DMNotaSaida.pCF) and (InsNot) and (InsItem) then
          begin
            FinalizanfEntrada;
            if DMOracle.DBCemapa.inTransaction then
              DMOracle.DBCemapa.Commit;
            VoltaStatusNota;
            Close;
            ShowMessage('Nota de transferência de saida confirmada com sucesso.'+#13+
                        ' Nota de transferência de entrada gerada com sucesso. ');
          end
        else
          begin
            DMNotaEntrada.QNotaEntrada.Cancel;
            DMNotaEntrada.QItemNF.Cancel;
            if DMOracle.DBCemapa.inTransaction then
              DMOracle.DBCemapa.RollBack;
            VoltaStatusNota;
          end;
      except
        DMNotaEntrada.QNotaEntrada.Cancel;
        DMNotaEntrada.QItemNF.Cancel;
        DMNotaSaida.QNotaSaida.Cancel;
        DMNotaSaida.QItemNF.Cancel;
        if DMOracle.DBCemapa.inTransaction then
          DMOracle.DBCemapa.Rollback;
        VoltaStatusNota;
        DMNotaSaida.pTRF:=False;
        Raise;
      end;
    end;
end;

function TFGeraNFTransEntrada.ValidaCampos: Boolean;
begin
  if Trim(MECodFilial.text)<>'' then
    if Trim(MECodCadastro.text)<>'' then
      if Trim(MECodOperacao.text)<>'' then
        Result:=True
      else
        begin
          Result:=False;
          Showmessage('Erro! Operação não informada');
        end
    else
      begin
       Result:=False;
       Showmessage('Erro! Cadastro não informado');
      end
   else
     begin
       Result:=False;
       Showmessage('Erro! Filial não informada');
     end;
   if Result then
     if DmNotaSaida.QNotaSaidaCod_Filial.value=StrToFloat(MECodFilial.text) then
       begin
         Result:=False;
         ShowMessage('Erro ! A Filial da Nota de Saida e Nota de Entrada tem de ser diferentes.');
       end;
end;

Function TFGeraNFTransEntrada.InsereItens :Boolean;
begin
  Try
    DMNotaSaida.QItemNF.First;
    While not(DMNotaSaida.QItemNF.EOF) do
      begin
        DMNotaEntrada.QItemNF.Insert;
        DMNotaEntrada.QItemNFCod_Produto.Value:=DMNotaSaida.QItemNFCod_Produto.Value;
        If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') And
           (DMNotaEntrada.QNotaEntradaCod_Filial.Value = 10) Then
          DMNotaEntrada.QItemNFCod_Tributacao.Value := 86
        Else
          DMNotaEntrada.QItemNFCod_Tributacao.Value := DMNotaSaida.QItemNFCod_tributacao.value;
        DMNotaEntrada.QItemNFCod_Lote_Tipo.Value:=DMNotaSaida.QItemNFCod_Lote_Tipo.Value;
        DmNotaEntrada.QItemNFQt_Quantidade.Value:=DMNotaSaida.QitemNFQT_Quantidade.Value;
        DmNotaEntrada.QItemNFVal_Unitario.Value:=DMNotaSaida.QItemNFVal_Unitario.Value;
        DmNotaEntrada.QItemNFVAL_TOTAL.Value:=DmNotaSaida.QItemNFVAL_TOTAL.Value;
        DmNotaEntrada.QItemNFPERC_BENEFICIADO.Value := DmNotaSaida.QItemNFPERC_BENEFICIADO.Value;
        DmNotaEntrada.QItemNF.Post;
        DMNotaSaida.QItemNF.Next;
      end;
  except
    Result:=False;
    Raise;
  end;

  Result:=True

end;

Function TFGeraNFTransEntrada.InsereNotaEntrada :Boolean;
begin
  Try
    with DMNotaEntrada do
      begin
        QNotaEntrada.Open;
        QItemNF.Open;
        QNotaEntrada.Insert;
        QNotaEntradaCod_Cadastro.Value:=StrToInt(MECodCadastro.text);
        QNotaEntradaNum_Nota.Value:=DmSequencia.Sequencia(StrToInt(MECodFilial.text),'NOTA_TRANSFERENCIA');
        QNotaEntradaCod_Filial.Value:=StrToInt(MECodFilial.text);
        QNotaEntradaCod_Operacao.Value:=StrToInt(MECodOperacao.text);
        QNotaEntradaCod_Serie.Value:=DMNotaSaida.QNotaSaidaCod_Serie.Value;
        QNotaEntradaDt_Emissao.Value:=DMOracle.DataServ;
        QNotaEntradaDt_Recebimento.Value := DMOracle.DataServ;
        QNotaEntradaVal_Funrural.Value:=0;
        QNotaEntradaperc_Comissao.Value:=0;
        QNotaEntradaObs.Value := DMNotaSaida.QNotaSaidaObs.Value;
        QNotaEntradaObs_Complemento.Value := DMNotaSaida.QNotaSaidaObs_Complemento.Value;
        QNotaEntradaDesc_Transportadora.Value := DMNotaSaida.QNotaSaidaDesc_Transportadora.Value;
        QNotaEntradaCod_Cadastro_Parceiro.Value := DMNotaSaida.QNotaSaidaCod_Cadastro_Parceiro.Value;
        Result:=True;
      end;
  except
    Raise;
    Result:=False;
  end;
end;

procedure TFGeraNFTransEntrada.FormActivate(Sender: TObject);
begin
  DMNotaEntrada.pTipoNota:='NORMAL';
end;

procedure TFGeraNFTransEntrada.ConfirmaNota;
begin
  with DMNotaSaida do
    begin
      QSomaItemNota.AutoCalcFields := False;
      QItemNF.AutoCalcFields := False;
      QNotaSaida.DisableControls;
      QItemNF.DisableControls;
      pCF:=False;
      pTRF:=True;
      if FNotaSaida_Confirma = Nil then
        FNotaSaida_Confirma := TFNotaSaida_Confirma.Create(Application);
      ChecaNota;
      FNotaSaida_Confirma.pAtivado:=False;
      pConfirmando:=True;
      FNotaSaida_Confirma.ShowModal;
      pTRF:=False;
    end;
end;

procedure TFGeraNFTransEntrada.VoltaStatusNota;
begin
  With DMNotaSaida do
   begin
     QSomaItemNota.AutoCalcfields := False;
     QItemNF.AutoCalcfields := False;
     pConfirmando := False;
     QNotaSaida.EnableControls;
     QItemNF.EnableControls;
   end;
  If FNotaSaida_Confirma <> Nil then
    FNotaSaida_Confirma.pAtivado := False;
end;

procedure TFGeraNFTransEntrada.FinalizanfEntrada;
begin
  with DMNotaEntrada do
   begin
     QNotaEntrada.Edit;
     QNotaEntradaNUM_NOTA.Value:=DMNotaSaida.QNotaSaidaNUM_NOTA.Value;
     QNotaEntrada.Post;
   end;
end;
end.
