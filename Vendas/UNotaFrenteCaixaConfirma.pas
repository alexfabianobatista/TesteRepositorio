unit UNotaFrenteCaixaConfirma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFmOperacao, UFmCadastro, ComCtrls, StdCtrls, ExtCtrls, Mask,
  Buttons, Db, UFmVendedor;
type
  TFNotaFrenteCaixaConfirma = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    Label15: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    FmCadastro1: TFmCadastro;
    FmOperacao1: TFmOperacao;
    MEValorDesconto: TMaskEdit;
    MEPercDesconto: TMaskEdit;
    MeEntrada: TMaskEdit;
    EdVenda: TEdit;
    EdRecebido: TEdit;
    EdTroco: TEdit;
    RGTipoPgto: TRadioGroup;
    BtAvancarFrenteCaixa: TBitBtn;
    BtCancelar: TBitBtn;
    FmVendedor1: TFmVendedor;
    LbCodNotaCab: TLabel;
    BtOk: TBitBtn;
    Memo1: TMemo;
    Label6: TLabel;
    LblAutoriza: TLabel;
    procedure EdRecebidoExit(Sender: TObject);
    procedure MEValorDescontoExit(Sender: TObject);
    procedure MEPercDescontoExit(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtAvancarFrenteCaixaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FmOperacao1BtOperacaoClick(Sender: TObject);
    procedure FmOperacao1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtOkClick(Sender: TObject);
    procedure FmCadastro1BtCadastroClick(Sender: TObject);
    procedure FmCadastro1MeCadastroExit(Sender: TObject);
    procedure MEValorDescontoClick(Sender: TObject);
    procedure MeEntradaClick(Sender: TObject);
    procedure EdRecebidoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FmVendedor1Exit(Sender: TObject);
    procedure RGTipoPgtoExit(Sender: TObject);
    procedure FmOperacao1MeOperacaoExit(Sender: TObject);
    procedure FmCadastro1Exit(Sender: TObject);
  private
    { Private declarations }
    CidadeDoCadastro : string;
    procedure VerificaVendedorInativo;
    procedure CalculaDesconto;

    //PARA GERAR OS BOLETOS VIA API
    procedure GeraBoletoApi;

  public
    { Public declarations }
  end;

var
  FNotaFrenteCaixaConfirma: TFNotaFrenteCaixaConfirma;

implementation

uses UNotaSaida_cl, UBiblioteca, UNotaConsum_Confirma, UOracle_cl, UDevolucaoTroca_cl,
  UUsuario_cl, UParamSistema_cl, UCadastro_cl, UOperacaoCons, UNotaFrenteCaixa,
  UNfe_cl, UEntradaDados, UInformaBancoPix, UOperacao_cl, USenha, UCadastroCons,
    //para API de boletos
  BoletoAPI.BoletoFactory, BoletoApi.Interfaces, UNFCeParam, Math;

{$R *.dfm}

procedure TFNotaFrenteCaixaConfirma.EdRecebidoExit(Sender: TObject);
var Perc_aplicar, wTotalVenda: Real;
  wVlMoeda: string;
  wDescontoPermitido : String;
begin
  Perc_Aplicar := 1;
  case RGTipoPgto.ItemIndex of
    0: Perc_Aplicar := 1 - DMParamSistema.QParamSistemaPerc_Desconto_Vista.Value / 100;
    1: Perc_Aplicar := 1;
    2: Perc_Aplicar := 1 + DMParamSistema.QParamSistemaPerc_Acrescimo_Mes.Value / 100;
  end;

  wTotalVenda := DMNotaSaida.QSomaItemNotaSVal_Total_Nota.Value -
                 DMNotaSaida.QSomaValessval_vale_compras_menos_novo.Value -
                 DMNotaSaida.QSomaValessval_vale_presente_menos_novo.Value;
  if (Trim(MEValorDesconto.Text) <> '') then
  begin
    with DMNotaSaida do
    begin 
      wTotalVenda := QSomaItemNotaSVal_Total_Nota.Value +
                     QNotaSaidaVAL_DESCONTO.Value - StrToFloat(MEValorDesconto.Text)-
                     DMNotaSaida.QSomaValessval_vale_compras_menos_novo.Value -
                     DMNotaSaida.QSomaValessval_vale_presente_menos_novo.Value;
    end;
  end;

  EdVenda.Text := FormatFloat('###,###,##0.00', wTotalVenda);
  if Trim(EdRecebido.Text) <> '0' then
    EdTroco.Text := FormatFloat('###,###,##0.00', StrToFloat(Bib.LimpaString(EdRecebido.Text, '.')) - wTotalVenda);

end;

procedure TFNotaFrenteCaixaConfirma.MEValorDescontoExit(Sender: TObject);
begin
  if (DMParamSistema.CodEmpresa = 'NFCE-DOCES') and ( (MEValorDesconto.Text <> '0,00') and (MEValorDesconto.Text <> '0') )  then
  begin
    if (DMUsuario.pTipoFuncionario <> 'GERENTE') then
    begin
      if FSenha = nil then
        FSenha := TFSenha.Create(Application);
      if FSenha.ShowModal = MrOk then
      begin
        if UpperCase(Trim(FSenha.EdSenha.Text)) <> UpperCase(DmParamSistema.QParamSistemaDesc_Senha_Oficina.Value) then
        begin
          MEValorDesconto.Text := '0,00';
          MEPercDesconto.Text := '0,00';
          raise Exception.Create('Senha Incorreta.');
        end
        else
          FNotaConsum_Confirma.MEValorDesconto.Text := MEValorDesconto.Text;
        end;
        FSenha.Release;
        FSenha := nil;
      end;
  end
  else
    FNotaConsum_Confirma.MEValorDesconto.Text := MEValorDesconto.Text;
  FNotaConsum_Confirma.ValidaDesconto(Self);
  EdRecebidoExit(Self);
end;

procedure TFNotaFrenteCaixaConfirma.MEPercDescontoExit(Sender: TObject);
begin
  if (DMParamSistema.CodEmpresa = 'NFCE-DOCES') and ( (MEPercDesconto.Text <> '0,00') and (MEPercDesconto.Text <> '0') ) then
  begin
      if (DMUsuario.pTipoFuncionario <> 'GERENTE') then
      begin
        if FSenha = nil then
          FSenha := TFSenha.Create(Application);
        if FSenha.ShowModal = MrOk then
        begin
          if UpperCase(Trim(FSenha.EdSenha.Text)) <> UpperCase(DmParamSistema.QParamSistemaDesc_Senha_Oficina.Value) then
          begin
            MEValorDesconto.Text := '0,00';
            MEPercDesconto.Text := '0,00';
            raise Exception.Create('Senha Incorreta.');
          end
          else
            CalculaDesconto;
          FSenha.Release;
          FSenha := nil;
        end;
      end
      else
        CalculaDesconto;
  end
  else
    CalculaDesconto;
  MEPercDesconto.Text := '';
  FNotaConsum_Confirma.MEValorDesconto.Text := MEValorDesconto.Text;
  FNotaConsum_Confirma.ValidaDesconto(Self);

  EdRecebidoExit(Self);
end;

procedure TFNotaFrenteCaixaConfirma.BtCancelarClick(Sender: TObject);
begin
  if DMNotaSaida.QNotaSaida.State <> dsBrowse then
    DMNotaSaida.QNotaSaida.Cancel;
  if DMOracle.DBCemapa.InTransaction then
  begin
    DMOracle.DBCemapa.RollBack;
    DMNotaSaida.QNotaSaida.Close;
    DMNotaSaida.QNotaSaida.Open;
  end;
end;

procedure TFNotaFrenteCaixaConfirma.BtAvancarFrenteCaixaClick(Sender: TObject);
var wMes, wAno, wDia: Word;
    wSerie, wCod_serie_modelo, wComando, wGuiaPagamento, wCodNotaCab, wMensagem : String;
    wModalResult: Integer;
begin
 try
   wSerie := '';
   wCod_serie_modelo := '';
   wComando := 'UPDATE TB_NOTA_CAB SET COD_OPERACAO = ' + Trim(FmOperacao1.MeOperacao.Text);

   if Trim(FmVendedor1.MeVendedor.Text) <> '' then
     wComando := wComando + ', COD_VENDEDOR = ' + FmVendedor1.MeVendedor.Text
   else
   begin
     FmVendedor1.MeVendedor.SetFocus;
     raise Exception.Create('Preencha o Código do Vendedor.');
   end;
   if (DMParamSistema.CodEmpresa = 'QUERENCIA') then   //suporte(821) - Marcos da Agrop. Querencia solicitou o bloqueio de venda a prazo para o cadastro consumidor.
   begin
     if (Trim(FmCadastro1.MeCadastro.Text) = '1582') and (RGTipoPgto.ItemIndex = 1) then //Não achei outra forma de fazer. Junior 04/09/2020.
     begin
       FmCadastro1.SetFocus;
       MessageDlg('Não é permitido venda a prazo para cliente CONSUMIDOR.', mtError, [mbOK], 0);
       raise Exception.Create('Não é permitido venda a prazo para cliente CONSUMIDOR.');
     end;
   end;

//Gustavo da Agroferragens JG solicitou que quando o cliente estiver com titulo em atraso seja bloqueado a venda antes de
//ser informado o codigo do cartão - Alex - 11/04/2022
  if (DMParamSistema.CodEmpresa = 'FERRAGENS') then
  begin
    if (DMOracle.FastSelect('COD_CLASS_CADASTRO','TB_CADASTRO','COD_CADASTRO = ' + Trim(FmCadastro1.MeCadastro.Text)) <> '1') and
       (DMOracle.FastSelect('IND_LIBERA_VENDA','TB_CADASTRO','COD_CADASTRO = ' + Trim(FmCadastro1.MeCadastro.Text)) <> 'SIM') then
    begin
      MessageDlg('Classificação de Cliente sem permissão para Venda!', mtError, [mbOK], 0);
      raise Exception.Create('Classificação de Cliente sem permissão para Venda!');
      FmCadastro1.MeCadastro.SetFocus;
    end;
  end;

   if DMParamSistema.CodEmpresa = 'JASOL' then  // Add. Cod. Mensagem da operação Junior 27/07/2021. Jasol(Lojas Kalce).
   begin
     if (DMNotaSaida.QNotaSaidaCOD_DEPARTAMENTO.Value) <> (DMUsuario.CodDepartamentoUsuario) then //Setar o Dep. do usuario atual. No Ret. Cond. estava ficando o dep. de quem realizou o cond. e caindo o valor no caixa errado. Junior 10/02/24.
       wComando := wComando + ', COD_DEPARTAMENTO = ' + IntToStr(DMUsuario.CodDepartamentoUsuario);
     if DMOracle.FastSelect('COD_MENSAGEM','TB_OPERACAO','COD_OPERACAO = ' + FmOperacao1.MeOperacao.Text) <> '' THEN
       wComando := wComando + ', COD_MENSAGEM = ' + DMOracle.FastSelect('COD_MENSAGEM','TB_OPERACAO','COD_OPERACAO = ' + FmOperacao1.MeOperacao.Text);
   end;
   if StrToInt(Trim(FmCadastro1.MeCadastro.Text)) <> DMUsuario.CodClientePadrao then
   begin
      wComando := wComando + ', COD_CADASTRO = ' + FmCadastro1.MeCadastro.Text;
      //Por Gian 18/05/2020
      //Resolver o problema que não atualizava o estado na TB_NOTA_CAB após trocar o cadastro pela tela do UNotaFrenteCaixa.
      if CidadeDoCadastro <> '' then
        wComando := wComando + ', COD_ESTADO = ' + QuotedStr(DMOracle.FastSelect('COD_ESTADO', 'TB_CIDADE', 'COD_CIDADE = ' + CidadeDoCadastro));
   end;

   if (DMNotaSaida.QNotaSaidaCOD_OPERACAO.Value) <> StrToInt(Trim(FmOperacao1.MeOperacao.Text)) then// <> DMUsuario.CodOperacaoPadrao then
   begin
      wSerie            := DMOracle.FastSelect('COD_SERIE','TB_OPERACAO','COD_OPERACAO = ' + Trim(FmOperacao1.MeOperacao.Text));
      wCod_serie_modelo := DMOracle.FastSelect('COD_SERIE_MODELO','TB_OPERACAO','COD_OPERACAO = ' + Trim(FmOperacao1.MeOperacao.Text));

      if wSerie = '' then
        wSerie := DMUsuario.CodSeriePadrao;
      if wCod_serie_modelo = '' then
        wCod_serie_modelo := DMUsuario.CodSerieModeloPadrao;

      if (DMNotaSaida.QNotaSaidaNUM_NOTA.Value > 0) and
         ((DMNotaSaida.QNotaSaidaCOD_SERIE.Value <> wSerie) or
          (DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value <> wCod_serie_modelo))then
         wComando := wComando + ', NUM_NOTA = 0';

      wComando := wComando + ', COD_SERIE = ' + QuotedStr(wSerie) + ', COD_SERIE_MODELO = ' + QuotedStr(wCod_serie_modelo);
   end;

   if trim(Memo1.Text) <> '' then
   begin
     if ((wCod_serie_modelo <> '') and ((wCod_serie_modelo = '65') or (wCod_serie_modelo = '55'))) or
        (((DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value = '65') or (DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value = '55'))
         and (wCod_serie_modelo = '')) then
     begin
       Memo1.Text := StringReplace(Memo1.Text,' \n ' + chr(13)+chr(10),chr(13)+chr(10),[rfReplaceAll]);
       Memo1.Text := StringReplace(Memo1.Text,chr(13)+chr(10),' \n ' + chr(13)+chr(10),[rfReplaceAll]);
       Memo1.Text := DMNfe.LimpaStrXML(Memo1.Text, chr(13)+chr(10));
     end;
     wComando := wComando + ', OBS = ' + QuotedStr(Memo1.Text);
   end;
   if ((wCod_serie_modelo <> '') and (wCod_serie_modelo = '65')) or
      ((DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value = '65') and (wCod_serie_modelo = '')) then
      RGTipoPgto.ItemIndex := 2;
   case RGTipoPgto.ItemIndex of
        0:  wComando := wComando + ', IND_CONDICAO_PAGTO = ' + QuotedStr('1');
        1:  wComando := wComando + ', IND_CONDICAO_PAGTO = ' + QuotedStr('2');
        2:  wComando := wComando + ', IND_CONDICAO_PAGTO = ' + QuotedStr('3');
        3:  wComando := wComando + ', IND_CONDICAO_PAGTO = ' + QuotedStr('4');
        4:  wComando := wComando + ', IND_CONDICAO_PAGTO = ' + QuotedStr('5');
        5:  wComando := wComando + ', IND_CONDICAO_PAGTO = ' + QuotedStr('6');
   end; // Case
 except
   DMOracle.DBCemapa.Rollback;
   Abort;
 end;
 DMOracle.ExecutaSql(wComando + ' WHERE COD_NOTA_CAB = ' + DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text);
 DMNotaSaida.QNotaSaida.RefreshRecord;
 // Não estava validando permissão de venda para clientes com restrição. Junior 19/10/2018.
 DMNotaSaida.SetaEmissao(DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value);
 DMNotaSaida.ChecaNota;

 wMensagem := '';
 wMensagem := DMOracle.FastSelect('COD_MENSAGEM','TB_OPERACAO','COD_OPERACAO = ' + Trim(FmOperacao1.MeOperacao.Text));
 if (wMensagem <> '') then
   DMNotaSaida.QNotaSaidaCOD_MENSAGEM.Text := Trim(wMensagem)
 else
   DMNotaSaida.QNotaSaidaCOD_MENSAGEM.Clear;

 FNotaConsum_Confirma.OnActivate(Self);
 FNotaConsum_Confirma.MEValorDesconto.Text := MEValorDesconto.Text;
 FNotaConsum_Confirma.MEPercDesconto.Text := MEPercDesconto.Text;
 FNotaConsum_Confirma.MeEntrada.Text := MeEntrada.Text;
 FNotaConsum_Confirma.EdVenda.Text := EdVenda.Text;
 FNotaConsum_Confirma.EdTroco.Text := EdTroco.Text;
 if (DMNotaSaida.QNotaSaidaIND_SITUACAO.Text = '1') then
 begin
    if DMParamSistema.QParamSistemaIND_GUIA_PAGAMENTO.Value = 'SIM' then
    begin
      if (DMUsuario.pTipoFuncionario <> 'VENDEDOR') and (DMUsuario.pTipoFuncionario <> 'COLABORADOR') then
      begin
        DMOracle.ExecutaSql('UPDATE TB_NOTA_CAB SET COD_GUIA_PAGAMENTO = NULL, COD_DEPARTAMENTO = ' + IntToStr(DMUsuario.CodDepartamentoUsuario) +
        ' WHERE COD_NOTA_CAB = ' + DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text);
           FNotaConsum_Confirma.BtAvancarClick(Self)
      end
      else
      begin
        DMOracle.ExecutaSql('UPDATE TB_NOTA_CAB SET VAL_DESCONTO = ' +
          Bib.TrocaVirgulaPorPonto('0' + MEValorDesconto.Text) +
          ' WHERE COD_NOTA_CAB = ' + DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text);
        if DMNotaSaida.QNotaSaidaCOD_GUIA_PAGAMENTO.Value = '' then
        begin
          if FEntradaDados = nil then
            FEntradaDados := TFEntradaDados.Create(Application);
          FEntradaDados.Caption := 'Guia de Pagamento';
          FEntradaDados.MeDados.MaxLength := 4;
          FEntradaDados.MeNome.Clear;
          FEntradaDados.MeDados.Clear;
          while FEntradaDados.ShowModal = mrOk do
          begin
            wGuiaPagamento := Trim(FEntradaDados.MeDados.Text);
            if (wGuiaPagamento <> '') and
              (Length(wGuiaPagamento) = 4) and
              (UpperCase(Copy(wGuiaPagamento,0,1)) = 'P') then
            begin
              wCodNotaCab := DMOracle.BuscaNome('SELECT COD_NOTA_CAB FROM TB_NOTA_CAB','COD_GUIA_PAGAMENTO = ' +
                QuotedStr(UpperCase(wGuiaPagamento)));
              if wCodNotaCab = '' then
              begin
                DMOracle.ExecutaSql('UPDATE TB_NOTA_CAB SET COD_GUIA_PAGAMENTO = ' +
                    QuotedStr(UpperCase(wGuiaPagamento)) +
                    ' WHERE COD_NOTA_CAB = ' + DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text);
                {if Trim(FEntradaDados.MeNome.Text) <> '' then
                begin
                  DMNotaSaida.QNotaNome.Close;
                  DMNotaSaida.QNotaNome.Open;
                  DMNotaSaida.QNotaNome.Insert;
                  DMNotaSaida.QNotaNomeCOD_NOTA_CAB.Value   := DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value;
                  DMNotaSaida.QNotaNomeNOME.Value           := Trim(FEntradaDados.MeNome.Text);
                  DMNotaSaida.QNotaNome.Post;
                  DMOracle.DBCemapa.Commit;
                end;}
                Break;

              end
              else
              begin
                MessageDlg('Tente com outra Guia. Esta já está sendo utilizada pela nota cód.: ' + wCodNotaCab + '.', mtError, [mbOK], 0);
                MessageDlg('Tente com outra Guia. Esta já está sendo utilizada pela nota cód.: ' + wCodNotaCab + '.', mtError, [mbOK], 0);
              end;
            end
            else
            begin
              MessageDlg('Insira uma Guia de Pagamento válida.', mtError, [mbOK], 0);
              MessageDlg('Insira uma Guia de Pagamento válida.', mtError, [mbOK], 0);
            end;
            FEntradaDados.MeNome.Clear;
            FEntradaDados.MeDados.Clear;
          end;
         end;
      end;
    end
    else
      FNotaConsum_Confirma.BtAvancarClick(Self)
 end;
 DMNotaSaida.QNotaSaida.RefreshRecord;
 EdRecebidoExit(Self);
 if (DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value = '2') and (wCod_serie_modelo <> '65') then
 begin
   if DMParamSistema.CodEmpresa = 'DONABENTA' then
     FNotaConsum_Confirma.MEDepartamento.Text := '2';
   if DMParamSistema.CodEmpresa = 'FERRAGMED' then
   begin
     FNotaConsum_Confirma.MEDepartamento.Text := '5';
     FNotaConsum_Confirma.MePrazo.Text := '1';
   end;

   FNotaConsum_Confirma.ShowModal;
 end;
 {if ((DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value = '55') or
    (DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value = '99')) and
    ((DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value = '1') and
    (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DONABENTA')) then
   FNotaConsum_Confirma.ShowModal;}

 GeraBoletoApi;
 ModalResult := mrOk;
end;

procedure TFNotaFrenteCaixaConfirma.FormActivate(Sender: TObject);
var
  wContaCorrente: string;
begin
 LbCodNotaCab.Caption := 'Código: ' + DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text;
 if DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value = '65' then
    RGTipoPgto.Visible := False
 else
    RGTipoPgto.Visible := True;
 if (DMParamSistema.CodEmpresa = 'NFCE-DOCES') or (DMParamSistema.CodEmpresa = 'MAVENIDA') or (DMParamSistema.CodEmpresa = 'LACARNES') then
   FmOperacao1.MeOperacao.SetFocus
 else if DMParamSistema.CodEmpresa = 'DONABENTA' then
   FmVendedor1.MeVendedor.SetFocus
 else if DMParamSistema.CodEmpresa = 'OSARE' then
   Begin
     FmCadastro1.MeCadastro.SetFocus;
     EdVenda.TabStop := False;
     MEValorDesconto.TabStop := True;
     MEPercDesconto.TabStop := True;
   end
// else if DMParamSistema.CodEmpresa = 'QUERENCIA' then
//   FmCadastro1.MeCadastro.SetFocus
 else if DMParamSistema.QParamSistemaIND_GUIA_PAGAMENTO.Value = 'SIM' then
   FmCadastro1.MeCadastro.SetFocus
 else
   EdRecebido.SetFocus;
 {if (DMParamSistema.CodEmpresa = 'DONABENTA') and (DMUsuario.pTipoFuncionario = 'VENDEDOR') then
 begin
//   PageControl1.Visible := False;
   FmCadastro1.Visible := False;
   FmOperacao1.Visible := False;
   RGTipoPgto.Visible  := False;
   Label4.Visible      := False;
   MEValorDesconto.Visible := False;
   Label5.Visible          := False;
   MEPercDesconto.Visible  := False;
   Label15.Visible    := False;
   MeEntrada.Visible  := False;
   Label2.Visible     := False;
   EdRecebido.Visible := False;
   Label3.Visible     := False;
   EdTroco.Visible    := False;
   BtAvancarFrenteCaixa.Visible := False;
   BtCancelar.Visible := False;
   RGTipoPgto.Visible := False;
   BtOK.Visible := True;
   FmVendedor1.MeVendedor.Clear;
   FmVendedor1.EdVendedor.Clear;
   FmVendedor1.MeVendedor.SetFocus;
 end
 else} //if ((DMParamSistema.CodEmpresa = 'FERRAGMED') or (DMParamSistema.CodEmpresa = 'QUERENCIA') or
       //    (DMParamSistema.CodEmpresa = 'DONABENTA')) and (DMUsuario.pTipoFuncionario = 'VENDEDOR') then

 if (DMParamSistema.QParamSistemaIND_GUIA_PAGAMENTO.Value = 'SIM') and ((DMUsuario.pTipoFuncionario = 'VENDEDOR') or (DMUsuario.pTipoFuncionario = 'COLABORADOR')) then
 begin
   BtCancelar.Visible := False;
   RGTipoPgto.Visible := False;
   Label15.Visible := False;
   MeEntrada.Visible := False;
   if (DMParamSistema.CodEmpresa = 'DONABENTA') then
     FmVendedor1.MeVendedor.SetFocus;
 end
 else
 begin
   PageControl1.Visible := True;
   BtAvancarFrenteCaixa.Visible := True;
  // if (DMParamSistema.CodEmpresa = 'FERRAGMED') or (DMParamSistema.CodEmpresa = 'DONABENTA') then
  //   RGTipoPgto.Controls[2].Enabled := False;
 end;

 if (DMParamSistema.CodEmpresa = 'SCALA') then
   RGTipoPgto.ItemIndex := 1;

 with DMNotaSaida do
  begin
    if QSomaItemNotaCod_Nota_Cab.Value <> QNotaSaidaCod_Nota_Cab.Value then
    begin
      QSomaItemNota.Close;
      QSomaItemNota.SetVariable('COD_NOTA_CAB', QNotaSaidaCod_Nota_Cab.Value);
      QSomaItemNota.Open;
    end;
  end;
  if ((DMParamSistema.CodEmpresa = 'FERRAGMED') or (DMParamSistema.CodEmpresa = 'DONABENTA')) then
  Begin
    MEValorDesconto.Enabled := False;
    MEPercDesconto.Enabled := False;
  end;
  if (DMParamSistema.CodEmpresa = 'QUERENCIA') then
  begin
    if (DMUsuario.pTipoFuncionario = 'VENDEDOR') then
    begin
      MEValorDesconto.Enabled := False;
      MEPercDesconto.Enabled := False;
    end;
    if (DMUsuario.pTipoFuncionario = 'SUPERVISOR') then
    begin
      FmVendedor1.MeVendedor.Enabled := False;
      FmVendedor1.BtVendedor.Enabled := False;
    end;
  end;
  if DMParamSistema.CodEmpresa = 'FERRAGENS' then
    Memo1.TabStop := True;
  //MEValorDesconto.Text := '0';
  MEPercDesconto.Text  := '';
  //MeEntrada.Text       := '0';   
  EdRecebidoExit(Self);
  Tag := 0;
  ModalResult := mrNone;
{  if (DMParamSistema.CodEmpresa = 'BAZAR') then
  begin
    Tag := 777; // para não resetar o modalResult do form
    BtAvancarFrenteCaixaClick(Self);
  end;}
end;

procedure TFNotaFrenteCaixaConfirma.FmOperacao1BtOperacaoClick(
  Sender: TObject);
begin
  if FOperacaoCons = nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  FOperacaoCons.RGTipoOperacao.ItemIndex := 1;
  FOperacaoCons.RGTipoOperacao.Enabled := False;
  FmOperacao1.BtOperacaoClick(Sender);
end;

procedure TFNotaFrenteCaixaConfirma.FmOperacao1Exit(Sender: TObject);
var
  wSerie: String;
begin
  if ((DMParamSistema.CodEmpresa <> 'FERRAGMED') and (DMParamSistema.CodEmpresa <> 'QUERENCIA') and (DMParamSistema.CodEmpresa <> 'AGROCAMPO') and
      (DMParamSistema.CodEmpresa <> 'FERRAGENS')) or (DMUsuario.pTipoFuncionario <> 'VENDEDOR') then
  begin
    wSerie := DMOracle.FastSelect('COD_SERIE_MODELO','TB_OPERACAO','COD_OPERACAO = ' + FmOperacao1.MeOperacao.Text);
    if wSerie = '65' then
      RGTipoPgto.Visible := False
    else
    begin
      RGTipoPgto.Visible := True;
{Tati da Junior doces solicitou que o foco da tela seja no tipo de pagamento. Alex 04/11/2024.}
      if (DMParamSistema.CodEmpresa = 'NFCE-DOCES') then
        RGTipoPgto.SetFocus;
    end;
  end;
end;

procedure TFNotaFrenteCaixaConfirma.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 FmOperacao1.MeOperacao.Text := '';
 FmCadastro1.MeCadastro.Text := '';
 Action := CaFree;
 FNotaFrenteCaixaConfirma := nil;
end;

procedure TFNotaFrenteCaixaConfirma.BtOkClick(Sender: TObject);
begin
  Try
    if DMNotaSaida.QNotaSaidaCOD_VENDEDOR.Text <> Trim(FmVendedor1.MeVendedor.Text)then
     DMOracle.ExecutaSql('UPDATE TB_NOTA_CAB SET COD_VENDEDOR = ' + FmVendedor1.MeVendedor.Text + ' WHERE COD_NOTA_CAB = '
                   + DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text);
    {if DMNotaSaida.QNotaSaidaCOD_VENDEDOR.Text <> Trim(FmVendedor1.MeVendedor.Text)then
     DMOracle.ExecutaSql('UPDATE TB_NOTA_CAB SET COD_CADASTRO = ' + FmCadastro1.MeCadastro.Text + ' WHERE COD_NOTA_CAB = '
                   + DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text);
     if DMNotaSaida.QNotaSaidaCOD_VENDEDOR.Text <> Trim(FmVendedor1.MeVendedor.Text)then
     DMOracle.ExecutaSql('UPDATE TB_NOTA_CAB SET COD_VENDEDOR = ' + FmVendedor1.MeVendedor.Text + ' WHERE COD_NOTA_CAB = '
                   + DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text);}

  except
    DMOracle.DBCemapa.Rollback;
  end;
end;

procedure TFNotaFrenteCaixaConfirma.FmCadastro1BtCadastroClick(
  Sender: TObject);
VAR
  wDesconto, wContaCorrente: string;
begin
  if (DMParamSistema.CodEmpresa <> 'SCALA') then
  begin
    FmCadastro1.BtCadastroClick(Sender);
    FmCadastro1MeCadastroExit(self);
  end;
{Adicionado para a Empresa Scala filtrar os cadastros apenas pelo tipo de cadastro 1 sem que seja necessário alterar na tela da consulta.
e todas as vendas finalizadas a prazo Alex 19/03/2026}
  if (DMParamSistema.CodEmpresa = 'SCALA') then
  begin
    if FCadastroCons = Nil then
    begin
      FCadastroCons := TFCadastroCons.Create(Application);
      FCadastroCons.METipoCadastro.Text := '1';
    end;
    if FCadastroCons.ShowModal = mrOk then
    begin
      FCadastroCons.METipoCadastro.Text := '1';
      FmCadastro1.MeCadastro.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
    end;
    RGTipoPgto.ItemIndex := 1;
    FmCadastro1MeCadastroExit(self);
  end;
end;

procedure TFNotaFrenteCaixaConfirma.FmCadastro1MeCadastroExit(
  Sender: TObject);
VAR
  wDesconto, wAutorizado : string;
  i: Integer;
  wValordesconto, wValorTitulo: Double;
begin
  if (DMParamSistema.CodEmpresa = 'SCALA') then
    RGTipoPgto.ItemIndex := 1;
  FmCadastro1.MeCadastroExit(Sender);
  if Trim(FmCadastro1.MeCadastro.Text) <> '' then
  begin
{Criado por solicitação da Agro Campo, para exibir no momento do fechamento da nota no frente de caixa se tem alguma pessoa autorizada a comprar no cadastro
do cliente. Alex 01/12/2023}  
    wAutorizado := DMOracle.BuscaNome('SELECT NOME_AUTORIZADO1 FROM TB_CADASTRO', 'COD_CADASTRO = ' + FmCadastro1.MeCadastro.Text);
    if (wAutorizado <> '') then
    begin
      LblAutoriza.Font.Color := clRed;
      LblAutoriza.Caption :=  'Autorizados: ' + wAutorizado;
      LblAutoriza.Caption := LblAutoriza.Caption + ' - ' + DMOracle.BuscaNome('SELECT NOME_AUTORIZADO2 FROM TB_CADASTRO', 'COD_CADASTRO = ' + FmCadastro1.MeCadastro.Text);
      LblAutoriza.Caption := LblAutoriza.Caption + ' - ' + DMOracle.BuscaNome('SELECT NOME_AUTORIZADO3 FROM TB_CADASTRO', 'COD_CADASTRO = ' + FmCadastro1.MeCadastro.Text);
    end
    else
    begin
      LblAutoriza.Caption := '';
    end;
    //Por Gian 18/05/2020
    //Resolver o problema que não atualizava o estado na TB_NOTA_CAB após trocar o cadastro pela tela do UNotaFrenteCaixa.
    CidadeDoCadastro := DMOracle.FastSelect('COD_CIDADE','TB_CADASTRO','COD_CADASTRO =' + Trim(FmCadastro1.MeCadastro.Text));
    if CidadeDoCadastro = '' then
      MessageDlg('Cidade não encontrada no cadastro do cliente!', mtError, [mbOK], 0);

    wDesconto := '0' +  DMOracle.BuscaNome('SELECT PERC_DESCONTO2 FROM TB_CADASTRO','COD_CADASTRO='+Trim(FmCadastro1.MeCadastro.Text));
    if StrToFloat(wDesconto) > 0 then
    Begin
      DMNotaSaida.QItemNF.First;
      DMNotaSaida.QNotaSaida.Edit;
      while not DMNotaSaida.QItemNF.Eof do
      Begin
        If StrToFloat(DMNotaSaida.QItemNFVAL_UNITARIO.Text) <> StrToFLoat(DMOracle.FastSelect('VAL_VAREJO','TB_PRODUTO','COD_PRODUTO='+DMNotaSaida.QItemNFCOD_PRODUTO.Text)) Then
          wDesconto := '0';
        DMNotaSaida.QItemNF.Edit;
        DMNotaSaida.QItemNFVAL_DESCONTO.Value := 0;
        DMNotaSaida.QItemNFPERC_DESCONTO.Value := 0;
        DMNotaSaida.QItemNFVAL_DESCONTO_RATEIO.Value := 0;
        DMNotaSaida.QItemNF.Post;
        DMNotaSaida.QItemNF.Next;
      end;
      DMNotaSaida.QNotaSaida.Post;
    end;
{Criado este bloco pois estava zerando o valor do desconto quando era feito a nota pela guia de pagamento. Alex 04/04/2026}
    if (DMNotaSaida.QNotaSaidaVAL_DESCONTO.Value = 0) and (StrToFloat(wDesconto) > 0) then
    begin
      MEPercDesconto.Text := wDesconto;
      MEPercDescontoExit(self);
    end;
{Criado este bloco para trazer o valor das notas de devoluções como desconto, quando os titulos da nota original já estão baixados. Alex 08/04/2026}
    if (DMParamSistema.QParamSistemaIND_BAIXA_PARCELA.Value = 'S') and (DMNotaSaida.QNotaSaidaCOD_CADASTRO.Value <> 1) then
    begin
      with DMDevolucaoTroca do
      begin
        QContasPagarCabCons.Close;
        QContasPagarCabCons.SetVariable('COD_CADASTRO',Trim(FmCadastro1.MeCadastro.Text));
        QContasPagarCabCons.Open;
        if QContasPagarCabCons.RecordCount > 0 then
        begin
          QContasPagarCabCons.First;
          wValordesconto := 0;
          while not QContasPagarCabCons.Eof do
          begin
            wValordesconto := wValordesconto + QContasPagarCabConsVAL_TITULO.Value;
            QContasPagarCabCons.Next;
          end;
          MEValorDesconto.Text := FloatToStr(wValordesconto);
        end
        else
          MEValorDesconto.Text := '0';
      end;
    end;
  end;

  if DMParamSistema.CodEmpresa <> 'RETIFOZ' then
  begin
    if DMOracle.FastSelect('DESC_FORMA_COMPRA','TB_CADASTRO','COD_CADASTRO = '+
       Trim(FmCadastro1.MeCadastro.Text)) = 'Conta Corrente' Then
    begin
      RgTipoPgto.ItemIndex := 2;
      for i := 0 to 4 do
        RGTipoPgto.Controls[i].Enabled := False;
    end
    else
    begin
      RgTipoPgto.ItemIndex := 0;
      for i := 0 to 4 do
        if i <> 2 then
          RGTipoPgto.Controls[i].Enabled := True;
    end;
  end;
end;

procedure TFNotaFrenteCaixaConfirma.MEValorDescontoClick(Sender: TObject);
begin
  MEValorDesconto.SelectAll;
end;

procedure TFNotaFrenteCaixaConfirma.MeEntradaClick(Sender: TObject);
begin
  MeEntrada.SelectAll;
end;

procedure TFNotaFrenteCaixaConfirma.EdRecebidoClick(Sender: TObject);
begin
  EdRecebido.SelectAll;
end;

procedure TFNotaFrenteCaixaConfirma.FormCreate(Sender: TObject);
begin
  if (DMParamSistema.CodEmpresa = 'DONABENTA') then
  begin
    RGTipoPgto.Items[2] := 'C/C';
    RGTipoPgto.Controls[2].Enabled := False;
  end;

  if (DMParamSistema.CodEmpresa = 'FERRAGMED') then
    RGTipoPgto.Items[2] := 'C/C';

  if (DMParamSistema.CodEmpresa = 'SCALA') then
    RGTipoPgto.ItemIndex := 1
end;

procedure TFNotaFrenteCaixaConfirma.FmVendedor1Exit(Sender: TObject);
begin
  VerificaVendedorInativo;
end;

procedure TFNotaFrenteCaixaConfirma.VerificaVendedorInativo;
var indSituacao: String;
begin
  if Trim(FNotaFrenteCaixaConfirma.FmVendedor1.MeVendedor.Text) <> '' then
  begin
    indSituacao := DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_VENDEDOR','COD_VENDEDOR = '+ Trim(FNotaFrenteCaixaConfirma.FmVendedor1.MeVendedor.Text));
    if (indSituacao = '') or (indSituacao = 'INATIVO') then
    begin
      FmVendedor1.MeVendedor.Text := '';
      FmVendedor1.EdVendedor.Text := '';
      FmVendedor1.MeVendedor.SetFocus;
 //     MessageDlg('Vendedor Inexistente/Inativo. Informe vendedor ATIVO.', mtError, [mbOK], 0);
      raise Exception.Create('Vendedor Inativo ou Inexistente. Informe vendedor ATIVO.')
    end;
  end;
end;

procedure TFNotaFrenteCaixaConfirma.RGTipoPgtoExit(Sender: TObject);
begin
//Adicionado lançamento PIX para a Refrigeração SMI. Alex 23/09/2022
  if (DMParamSistema.CodEmpresa = 'REFRISM') and (RGTipoPgto.ItemIndex = 5) then
  begin
    if FInformaBancoPix = nil then
      FInformaBancoPix := TFInformaBancoPix.create(Application);
    FInformaBancoPix.ShowModal;
  end;
  {if (DMParamSistema.CodEmpresa = 'GARAGE280') then
  begin
    Memo1.Text := RGTipoPgto.Items.Values;
  end;}
end;

procedure TFNotaFrenteCaixaConfirma.FmOperacao1MeOperacaoExit(
  Sender: TObject);
begin
  FmOperacao1.MeOperacaoExit(Sender);
//Para validar se a operação é de saída. Alex 04/04/2023
  if (Trim(FmOperacao1.MeOperacao.Text) = '') Then
    Exit;
  DMOperacao.QOperacao.Close;
  DMOperacao.QOperacao.SetVariable('PK',Trim(FmOperacao1.MeOperacao.Text));
  DMOperacao.QOperacao.Open;
  if DMOperacao.QOperacaoIND_TIPO_OPERACAO.Value <> 'S' then
  begin
    DMNotaSaida.QNotaSaidaCOD_OPERACAO.Clear;
    FmOperacao1.MeOperacao.SetFocus;
    raise Exception.Create('A operação informada não é de saida.');
  end;
end;

procedure TFNotaFrenteCaixaConfirma.GeraBoletoApi;
var
  wBoletoApi: IBoletoApi;
begin

  with DMNotaSaida do
  begin
    QBoletoAPINota.Close;
    QBoletoAPINota.SetVariable('COD_NOTA_CAB', QNotaSaidaCOD_NOTA_CAB.Value);
    QBoletoAPINota.Open;

    if (QBoletoAPINotaIND_API_BOLETO.Value = 'SIM') then
    begin
      QBoletoAPI.Close;
      QBoletoAPI.SetVariable('COD_NOTA', QNotaSaidaCOD_NOTA_CAB.Value);
                    // A FACTORY VAI MONTAR O OBJETO DE ACORDO COM O TIPO PASSADO TTIPOGERABOLETO
      wBoletoApi := TBoletoFactory.RetornaBoletoBanco(QNotaSaidaCOD_FILIAL.Value,
                                           QNotaSaidaNUM_NOTA.Value,
                                           QNotaSaidaCOD_NOTA_CAB.Value,
                                           QBoletoAPINotaCOD_BANCO.Value,
                                           0,  // SE NOTA, NÃO PRECISA O CONTRATO
                                           TGBNota,   // ESSE O TIPO NOTA
                                           QBoletoAPINotaIND_AMBIENTE_API_BOLETO.Value,
                                           True, True);  // wEnviaBoletoEmail vem do checkbox da tela FNotaSaida_Confirma

      wBoletoApi.EnviarBoletosApi;
      if (MessageDlg('Deseja imprimir o(s) boleto(s)?', mtConfirmation, [mbYes, mbNo], 0) = mrYes)
        and not wBoletoApi.GetIndTemRejeicao then
      begin
        wBoletoApi.GerarPDF;
      end
      else if wBoletoApi.GetIndTemRejeicao then
        ShowMessage('Rejeições ao enviar os boletos. Verifique com o suporte!');
    end;
  end;
end;

procedure TFNotaFrenteCaixaConfirma.CalculaDesconto;
begin
  MEValorDesconto.Text := FormatFloat('#,##0.00',(DMNotaSaida.QSomaItemNotasval_total_nota.Value + DMNotaSaida.QNotaSaidaVAL_DESCONTO.Value)
                                              * StrToFloat(MEPercDesconto.Text) / 100); 
end;

procedure TFNotaFrenteCaixaConfirma.FmCadastro1Exit(Sender: TObject);
begin
  if (DMParamSistema.CodEmpresa = 'SCALA') then
    RGTipoPgto.ItemIndex := 1
end;

end.
