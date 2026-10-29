unit UReceitaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, Grids, DBGrids, Db, DBCtrls, ExtCtrls, DBPanel,
  UFmCidade, Variants;

type
  TFReceitaCad = class(TForm)
    Label9: TLabel;
    MeFilial: TMaskEdit;
    EdFilial: TEdit;
    Label1: TLabel;
    MeAgronomo: TMaskEdit;
    BitBtn1: TBitBtn;
    EdAgronomo: TEdit;
    Label5: TLabel;
    EdLocalAplicacao: TEdit;
    Label3: TLabel;
    MeCodNotaCab: TMaskEdit;
    BtConsNota: TBitBtn;
    Label6: TLabel;
    MeCadastro: TMaskEdit;
    EdCadastro: TEdit;
    BtIncluiReceita: TBitBtn;
    BtExcluiReceita: TBitBtn;
    BtnConfirma: TBitBtn;
    BitBtn9: TBitBtn;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    BtConsulta: TBitBtn;
    GroupBox3: TGroupBox;
    DBGReceitaCab: TDBGrid;
    DSReceitaCab: TDataSource;
    BtIncluiReceitaCab: TBitBtn;
    BtExcluiReceitaCab: TBitBtn;
    BtIncluiReceitaCabExist: TBitBtn;
    BtSalva: TBitBtn;
    MObs: TMemo;
    Label7: TLabel;
    MPrecaucao: TMemo;
    Label8: TLabel;
    MEPI: TMemo;
    Label10: TLabel;
    EdOrientacao: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    MENumeroAplicacao: TMaskEdit;
    FmCidadeAplicacao: TFmCidade;
    Label13: TLabel;
    MENumeroReceita: TMaskEdit;
    BtConsMensagem: TBitBtn;
    Label14: TLabel;
    MeCodMensagem: TMaskEdit;
    BtCancel: TBitBtn;
    BtConhecimentoRisco: TBitBtn;
    BtCienciaResponsabilidade: TBitBtn;
    procedure MeFilialExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MeAgronomoExit(Sender: TObject);
    procedure BtConsNotaClick(Sender: TObject);
    procedure MeCadastroExit(Sender: TObject);
    procedure BtIncluiReceitaClick(Sender: TObject);
    procedure BtExcluiReceitaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnConfirmaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtConsultaClick(Sender: TObject);
    procedure BtIncluiReceitaCabClick(Sender: TObject);
    procedure BtExcluiReceitaCabClick(Sender: TObject);
    procedure DSReceitaCabDataChange(Sender: TObject; Field: TField);
    procedure BtIncluiReceitaCabExistClick(Sender: TObject);
    procedure BtSalvaClick(Sender: TObject);
    procedure DSReceitaCabStateChange(Sender: TObject);
    procedure MObsChange(Sender: TObject);
    procedure MPrecaucaoChange(Sender: TObject);
    procedure MEPIChange(Sender: TObject);
    procedure EdOrientacaoChange(Sender: TObject);
    procedure BtConsMensagemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtCancelClick(Sender: TObject);
    procedure BtConhecimentoRiscoClick(Sender: TObject);
    procedure BtCienciaResponsabilidadeClick(Sender: TObject);
    procedure ExcluiReceitaMov;
  private
    procedure PersisteMensagens;
  public
    { Public declarations }
  end;

var
  FReceitaCad: TFReceitaCad;

implementation

uses UNotaSaida_cl, UReceita_cl, UFilial_cl, UFilialCons, UUsuario_cl,
  UAgronomo_cl, UPragaCons, UPraga_cl, UCultura_cl, UCulturaCons,
  UCadastroCons, UCadastro_cl, UNotaSaidaCons, UOracle_cl,
  UPragaCulturaCons, UAgronomoCons, USequencia_cl, UReceitaConsulta,
  UParamSistema_cl, URReceituario, OraTeste, OracleData,  uMensReceita_cl, UMensReceitaCons,
  Math, UBibAgricola, UReceitaParam, URReceitaRel,
  URTermoReconhecimentoRisco, URTermoCienciaResponsabilidade;

{$R *.DFM}

procedure TFReceitaCad.MeFilialExit(Sender: TObject);
begin
  if Trim(MEFilial.Text) <> '' then
    with DMFilial do
    begin
      QFilial.Close;
      QFilial.SetVariable('PK', MEFilial.Text);
      QFilial.Open;
      EdFilial.Text := QFilialDesc_Filial.Text
    end
  else
    EdFilial.Text := 'Informar Filial';
  DMOracle.ValidaFilial(MeFilial.Text);
end;

procedure TFReceitaCad.FormCreate(Sender: TObject);
begin
  MeFilial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  MeFilialExit(Self);

end;

procedure TFReceitaCad.MeAgronomoExit(Sender: TObject);
begin
  if Trim(MEAgronomo.Text) <> '' then
    with DMAgronomo do
    begin
      QAgronomo.Close;
      QAgronomo.SetVariable('PK', MEAgronomo.Text);
      QAgronomo.Open;
      EdAgronomo.Text := QAgronomoNome.Text;
      If QAgronomoCod_Filial.Text <> '' Then
         If QAgronomoCod_Filial.Text <> Trim(MeFilial.Text) Then
          Begin
            MeAgronomo.Clear;
            Raise exception.Create('Agronomo não trabalha para esta filial');
          End;
    end
  else
    EdAgronomo.Text := 'Informar Agronomo';
end;

procedure TFReceitaCad.BtConsNotaClick(Sender: TObject);
begin
  if DMReceita.pNome_Tela <> 'NOTA' then
  begin
    if FNotaSaidaCons = nil then
      FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
    if FNotaSaidaCons.ShowModal = mrOk then
    begin
      DMNotaSaida.QNotaSaida.Close;
      DMNotaSaida.QItemNf.Close;
      DMNotaSaida.QNotaSaida.SetVariable('PK', DMNotaSaida.QNotaSaidaConsCod_Nota_Cab.Value);
      MeCodNotaCab.Text := FloatToStr(DMNotaSaida.QNotaSaidaConsCod_Nota_Cab.Value);
      DMNotaSaida.QNotaSaida.Open;
      DMNotaSaida.QItemNf.Open;
      MeCodNotaCab.Text := FloatToStr(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
      MeCadastro.Text := FloatToStr(DMNotaSaida.QNotaSaidaCod_Cadastro.Value);
      MeFilial.Text := FloatToStr(DMNotaSaida.QNotaSaidaCod_Filial.Value);
      MeFilialExit(Self);
      MeCadastroExit(Self);
      with DMReceita do
      begin
        QReceitaCab.Close;
        QReceitaCab.SetVariable('COD_NOTA_CAB', DMNotaSaida.QItemNFCOD_NOTA_CAB.Value);
        QReceitaCab.Open;

//        QReceitaCons.Close;
//        QReceitaCons.ClearVariables;
//        QReceitaCons.SetVariable('PK', DMNotaSaida.QItemNFCOD_NOTA_CAB.Value);
//        if not QReceitaCabCOD_RECEITA_CAB.IsNull then
//          QReceitaCons.SetVariable('COD_RECEITA_CAB', QReceitaCabCOD_RECEITA_CAB.Value);
//        QReceitaCons.Open;
      end;
    end
  end
  else
  begin
    DMNotaSaida.QItemNF.EnableControls;
    DMNotaSaida.QNotaSaida.EnableControls;
    DMNotaSaida.QNotaSaida.Close;
    DMNotaSaida.QItemNf.Close;
    DMNotaSaida.QNotaSaida.Open;
    DMNotaSaida.QItemNf.Open;
    MeCodNotaCab.Text := FloatToStr(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
    MeCadastro.Text := FloatToStr(DMNotaSaida.QNotaSaidaCod_Cadastro.Value);
    MeFilial.Text := FloatToStr(DMNotaSaida.QNotaSaidaCod_Filial.Value);
    MeFilialExit(Self);
    MeCadastroExit(Self);
    DbGrid1.Enabled := True;
    with DMReceita do
    begin
      QReceitaCab.Close;
      QReceitaCab.SetVariable('COD_NOTA_CAB', DMNotaSaida.QItemNFCOD_NOTA_CAB.Value);
      QReceitaCab.Open;

//      QReceitaCons.Close;
//      QReceitaCons.ClearVariables;
//      QReceitaCons.SetVariable('PK', DMNotaSaida.QItemNFCOD_NOTA_CAB.Value);
//      if not QReceitaCabCOD_RECEITA_CAB.IsNull then
//        QReceitaCons.SetVariable('COD_RECEITA_CAB', QReceitaCabCOD_RECEITA_CAB.Value);
//      QReceitaCons.Open;
    end;
  end;
  DMReceita.pNome_Tela := '';
end;

procedure TFReceitaCad.MeCadastroExit(Sender: TObject);
var
  bibAgricola: TBibAgricola;
begin

  if Trim(MECadastro.Text) <> '' then
    with DMCadastro do
    begin
      bibAgricola := TBibAgricola.Create;
      QCadastro.Close;
      QCadastro.SetVariable('PK', MECadastro.Text);
      QCadastro.Open;
      EdCadastro.Text := QCadastroNome.Text;
      FmCidadeAplicacao.MeCidade.Text := QCadastroCOD_CIDADE.AsString;
      EdLocalAplicacao.Text := bibAgricola.localAplicacaoReceita(QCadastro);


    end
  else
    EdCadastro.Text := 'Informar Cadastro';

end;

procedure TFReceitaCad.BtIncluiReceitaClick(Sender: TObject);
var
  wAux: string;
  wPraga: string;
  wCultura: string;
begin
  if Trim(MeAgronomo.Text) = '' then
    raise Exception.Create('Codigo do agronomo inválido!');
  with DmReceita do
  begin
    try
      if FPragaCulturaCons = nil then
        FPragaCulturaCons := TFPragaCulturaCons.Create(Application);
      FPragaCulturaCons.EdProduto.Text := DmNotaSaida.QItemNFnome_produto.Text;

      //LUCIANO(Grasel) solicitou para puxar a praga e a cultura já cadastrada na PRAGA/DEFENSIVOS. Junior - 28/05/2015
      if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GRASEL') then
      begin
        wPraga := DMOracle.BuscaNome('SELECT COD_PRAGA FROM TB_PRAGA_PRODUTO','COD_PRODUTO = ' +
                  FloatToStr(DMNotaSaida.QItemNfCod_Produto.Value) + ' AND ROWNUM = 1');
        FPragaCulturaCons.MePraga.Text := wPraga;
        FPragaCulturaCons.MePragaExit(sender);
        if Trim(wPraga) <> '' then
          wCultura := DMOracle.BuscaNome('SELECT COD_CULTURA FROM TB_PRAGA_PRODUTO','COD_PRODUTO = ' +
                    FloatToStr(DMNotaSaida.QItemNfCod_Produto.Value)
                    + ' AND COD_PRAGA = ' + wPraga
                    + ' AND ROWNUM = 1')
        else
          wCultura := DMOracle.BuscaNome('SELECT COD_CULTURA FROM TB_PRAGA_PRODUTO','COD_PRODUTO = ' +
                    FloatToStr(DMNotaSaida.QItemNfCod_Produto.Value)
                    + ' AND ROWNUM = 1') ;
        FPragaCulturaCons.MeCultura.Text := wCultura;
        FPragaCulturaCons.MeCulturaExit(sender);
      end;

      if FPragaCulturaCons.ShowModal = mrOK then
      begin
        QReceita.Close;
        QReceita.SetVariable('PK', DMNotaSaida.QItemNfCod_Nota_Item.Value);
        QReceita.Open;
        if (QReceita.Eof) then
          QReceita.Insert
        else
          QReceita.Edit;

        //Exixtem mais de um produto para cultura diferente mas para a mesma praga.
        //BUSCANOME filtrava apenas pelo COD_PRAGA fazendo retornar o primeiro produto cadastrado para a praga.
        //Adicionado o filtro COD_CULTURA. Solic. Renan - Plantiagro. Junior - 10/08/2015.
        wAux := DMOracle.BuscaNome('SELECT COD_PRAGA_PRODUTO FROM TB_PRAGA_PRODUTO',
          'COD_PRODUTO = ' + FloatToStr(DMNotaSaida.QItemNfCod_Produto.Value)
          + ' AND COD_PRAGA = ' + Trim(FPragaCulturaCons.MePraga.Text) +  //FloatToStr(DmPraga.QPragaCod_Praga.Value) +
          'AND COD_CULTURA = ' + Trim(FPragaCulturaCons.MeCultura.Text) );


        if Trim(wAux) <> '' then
          QReceitaCod_Praga_Produto.Value := StrToInt(wAux)
        else
          raise Exception.Create('Cadastro de Praga x Produto não encontrado!');
          // QReceitaCod_Praga.Value := DmPraga.QPragaCod_Praga.Value;
        QReceitaCod_Cultura.Value := DMCultura.QCulturaCod_Cultura.Value;
        QReceitaCod_Nota_Item.Value := DMNotaSaida.QItemNfCod_Nota_Item.Value;
        QReceitaCod_Agronomo.Value := StrToInt(Trim(MeAgronomo.Text));
        QReceitaDesc_Local_Aplicacao.Value := EdLocalAplicacao.Text;
        QReceitaCOD_CIDADE_APLICACAO.Value := strtoint(trim(FmCidadeAplicacao.MeCidade.Text));
          // QReceitaCod_Produto.Value := DmNotaSaida.QItemNfCod_Produto.Value;
        QReceitaQt_Produto.Value := DmNotaSaida.QItemNfQt_Quantidade.Value;
        if (DMParamSistema.CodEmpresa = 'GONZATTI') OR (DMParamSistema.CodEmpresa = 'GRASEL')  then
          QReceitaDT_EMISSAO.Value := DMNotaSaida.QNotaSaidaDT_EMISSAO.Value
        else
          QReceitaDT_EMISSAO.Value := DmOracle.Dataserv;
        if not QReceitaCabNUM_RECEITA.IsNull then
          QReceitaNUM_RECEITA.Value := QReceitaCabNUM_RECEITA.Value;
        if not QReceitaCabCOD_RECEITA_CAB.IsNull then
          QReceitaCOD_RECEITA_CAB.Value := QReceitaCabCOD_RECEITA_CAB.Value;
        QReceita.Post;
        QReceita.Close;
      end;
    except
      if QReceita.State in [dsEdit, dsInsert] then
        QReceita.Cancel;
      raise;
    end;
    QReceitaCons.Close;
    QReceitaCons.SetVariable('Pk', DmNotaSaida.QItemNfCod_Nota_Cab.Value);
    QReceitaCons.Open;
  end;
end;

procedure TFReceitaCad.BtExcluiReceitaClick(Sender: TObject);
begin
  with DmReceita do
  begin
    if QReceitaCabIND_EMITIDA.Value = 'S' then   //ALTERADO POR CLEBER EM 24-09-2019 PARA EVITAR QUE
    begin                                        //DADOS DO SIAGRO SEJAM AFETADOS
      if MessageDlg('Excluir a receita vai afetar o arquivo Siagro, deseja continuar?',
                    mtWarning,
                    [mbYes, mbNo], 0) = mrYes then
        ExcluiReceitaMov;
    end
    else
      ExcluiReceitaMov;
  end;

end;

procedure TFReceitaCad.BitBtn1Click(Sender: TObject);
begin
  if FAgronomoCons = nil then
    FAgronomoCons := TFAgronomoCons.Create(Application);
  if FAgronomoCons.ShowModal = mrOK then
  begin
    MeAgronomo.Text := DMAgronomo.QAgronomoConsCod_Agronomo.Text;
    MeAgronomoExit(Self)
  end;
end;

procedure TFReceitaCad.BtnConfirmaClick(Sender: TObject);
var
  wNumero: Integer;
  wEmitirRelatorio: Boolean;
  bibAgricola: TBibAgricola;
begin
  wEmitirRelatorio := False;
  DmUsuario.Checar_Filial_Usuario(Trim(MeFilial.Text), 'AGRICOLA');
  if DMReceita.QReceitaConsCOD_RECEITA_CAB.Value
    <> DMReceita.QReceitaCabCOD_RECEITA_CAB.Value then
  begin
    DMReceita.QReceitaCons.Close;
    DMReceita.QReceitaCons.SetVariable('PK',
      DMReceita.QReceitaCabCOD_NOTA_CAB.Value);
    DMReceita.QReceitaCons.SetVariable('COD_RECEITA_CAB', null);
    DMReceita.QReceitaCons.Open;
  end;
  wNumero := DMReceita.QReceitaConsNUM_RECEITA.Value;
  DMReceita.QReceitaCab.Edit;
  PersisteMensagens;
  DMReceita.QReceitaCab.Post;
  DMOracle.DBCemapa.Commit;
  if (DMParamSistema.CodEmpresa = 'GONZATTI') or (DMParamSistema.CodEmpresa = 'GOLDEN') or
     (DMParamSistema.CodEmpresa = 'GRASEL')   or (DMParamSistema.CodEmpresa = 'PLANTIAGRO')   then
    wEmitirRelatorio := MessageDlg('Emitir Receituario em Relatório?', mtConfirmation, [mbYes, mbNo], 0) = mrYes;
  if wEmitirRelatorio = True then
  begin
    with DMReceita.QRReceituario do
    begin
      Close;
      SetVariable('NUM_RECEITA', wNumero);
      Open;
    end;

    if FRReceituario = nil then
      FRReceituario := TFRReceituario.Create(Application);
    bibAgricola := TBibAgricola.Create;
    FRReceituario := TFRREceituario(bibAgricola.personalizaRelatorio(FRReceituario));
    FRReceituario.QRLvia.Caption := '1ª VIA - CLIENTE';

    if DMReceita.QRReceituarioIND_TECNICO.Value = 'SIM' then
      FRReceituario.QRLabel18.Caption := 'CFTA - REGISTRO Nº:'

    else
    begin
      FRReceituario.QRLabel41.Enabled:= false;
      FRReceituario.QRDBText35.Enabled:= false;
      FRReceituario.QRLabel18.Caption := 'CREA/PR - CARTEIRA Nº:';
    end;


    //FRReceituario.QRMemo1.Lines.Text := Trim(StringReplace(MEPI.Lines.Text,chr(13) + chr(10),'',[rfReplaceAll]));
    //Gian 22/10/2018 solicitado por Marlon
    //Esconder cabeçalho caso o agronomo seja o 5
    if (Trim(MeAgronomo.Text) = '5') and (DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'GRASEL') then
    begin
      FRReceituario.QRLTitulo.Enabled := False;
      FRReceituario.QRDBText30.Enabled := False;
      FRReceituario.QRDBText1.Enabled := False;
      FRReceituario.QRLabel35.Enabled := False;
      FRReceituario.QRDBText4.Enabled := False;
      FRReceituario.QRLEmpresa.Enabled := False;
      FRReceituario.QRLabel36.Enabled := False;
      FRReceituario.QRDBText5.Enabled := False;
    end
    else
    begin
      FRReceituario.QRLTitulo.Enabled := True;
      FRReceituario.QRDBText30.Enabled := True;
      FRReceituario.QRDBText1.Enabled := True;
      FRReceituario.QRLabel35.Enabled := True;
      FRReceituario.QRDBText4.Enabled := True;
      FRReceituario.QRLEmpresa.Enabled := True;
      FRReceituario.QRLabel36.Enabled := True;
      FRReceituario.QRDBText5.Enabled := True;
    end;

    FRReceituario.QRPrimario.Preview;
    FRReceituario := nil;
    if FRReceituario = nil then
      FRReceituario := TFRReceituario.Create(Application);
    FRReceituario := TFRREceituario(bibAgricola.personalizaRelatorio(FRReceituario));
    FRReceituario.QRLvia.Caption := '2ª VIA - EMPRESA';

    if DMReceita.QRReceituarioIND_TECNICO.Value = 'SIM' then
      FRReceituario.QRLabel18.Caption := 'CFTA - REGISTRO Nº:'
    else
    begin
      FRReceituario.QRLabel41.Enabled:= false;
      FRReceituario.QRDBText35.Enabled:= false;
      FRReceituario.QRLabel18.Caption := 'CREA/PR - CARTEIRA Nº:';
    //FRReceituario.QRMemo1.Lines.Text := Trim(StringReplace(MEPI.Lines.Text,chr(13) + chr(10),'',[rfReplaceAll]));
    //Gian 22/10/2018 solicitado por Marlon
    //Esconder cabeçalho caso o agronomo seja o 5
    end;
    if (Trim(MeAgronomo.Text) = '5') and (DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'GRASEL') then
    begin
      FRReceituario.QRLTitulo.Enabled := False;
      FRReceituario.QRDBText30.Enabled := False;
      FRReceituario.QRDBText1.Enabled := False;
      FRReceituario.QRLabel35.Enabled := False;
      FRReceituario.QRDBText4.Enabled := False;
      FRReceituario.QRLEmpresa.Enabled := False;
      FRReceituario.QRLabel36.Enabled := False;
      FRReceituario.QRDBText5.Enabled := False;
    end
    else
    begin
      FRReceituario.QRLTitulo.Enabled := True;
      FRReceituario.QRDBText30.Enabled := True;
      FRReceituario.QRDBText1.Enabled := True;
      FRReceituario.QRLabel35.Enabled := True;
      FRReceituario.QRDBText4.Enabled := True;
      FRReceituario.QRLEmpresa.Enabled := True;
      FRReceituario.QRLabel36.Enabled := True;
      FRReceituario.QRDBText5.Enabled := True;
    end;
    FRReceituario.QRPrimario.Preview;
    DMReceita.EmiteGuiaAplicacaoBrasperon(wNumero, StrToInt(Trim(MeFilial.Text)));    
  end
  else
    DMReceita.EmiteReceita(wNumero, StrToInt(Trim(MeFilial.Text)));
  // FRReceita.Preview;
  if DMReceita.pNome_Tela = 'NOTA' then
  begin
    ModalResult := mrOk;
    Close;
  end;
end;

procedure TFReceitaCad.FormActivate(Sender: TObject);
var bibAgricola: TBibAgricola;
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GRASEL' then
  begin
    if trim(MeCodNotaCab.Text) = '' then
      BtConsNotaClick(Self); // Estava no OnShow porém na Grasel não estava funcionando
  end;
  
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'PLANTIAGRO' then
    MeCodMensagem.Text := '1';

  // Empresas precisam de mensagens personalizadas
  bibAgricola := TBibAgricola.Create;
  MPrecaucao.Lines.Text := bibAgricola.mensagemPrecaucaoUso;
  MObs.Lines.Text := bibAgricola.mensagemObservacoes;
end;

procedure TFReceitaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  // Na grasel está dando problema
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'GRASEL' then
  begin
    Action := CaFree;
    FReceitaCad := nil;
  end;
end;

procedure TFReceitaCad.BtConsultaClick(Sender: TObject);
begin
  if FReceitaConsulta = nil then
    FReceitaConsulta := TFReceitaConsulta.Create(Application);
  FReceitaConsulta.ShowModal;
end;

procedure TFReceitaCad.BtIncluiReceitaCabClick(Sender: TObject);
var wART : integer;
begin
  if Trim(MENumeroAplicacao.Text) = '' then
  begin
    MessageDlg('Por favor informe o Número de Aplicações', mtError,[mbOk],0);
    Abort;
  end;
  if Trim(MEAgronomo.Text) = '' then
  begin
    MessageDlg('Por favor informe o agrônomo', mtError, [mbOk], 0);
    Abort;
  end;

  if Trim(MeCodNotaCab.Text) <> '' then
    with DMReceita do
    begin
      QReceitaCab.Append;
      if Trim(MENumeroReceita.Text) <> '' then
        QReceitaCabNUM_RECEITA.Value := StrToInt(Trim(MENumeroReceita.Text))
      else
        QReceitaCabNUM_RECEITA.Value := DMSequencia.Sequencia(StrToInt(Trim(MeFilial.Text)), 'RECEITA');

      QReceitaCabCOD_NOTA_CAB.Value := StrToInt(Trim(MeCodNotaCab.Text));
      QReceitaCabNUM_APLICACAO.Value := StrToInt(Trim(MENumeroAplicacao.Text));
      QReceitaCabNUM_ART_RELACIONADA.Value :=  //Adicionado por Djeison - 30/08/2012
        DMOracle.BuscaNome('SELECT NUM_ART_RELACIONADA FROM TB_AGRONOMO','COD_AGRONOMO = '
        + trim(MeAgronomo.Text),False);
      if Trim(MeCodMensagem.Text) <> '' then
        QReceitaCabCOD_MENS_RECEITA.Value := StrToInt(Trim(MeCodMensagem.Text));
      QReceitaCab.Post;

      if Trim(QReceitaCabNUM_ART_RELACIONADA.Value) <> '' then
      begin
        wART := StrToInt(DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_RECEITA_CAB', 'NUM_ART_RELACIONADA = '+ QReceitaCabNUM_ART_RELACIONADA.Value));//Adicionado por Djeison - 30/08/2012
        if(wART >= 130)then //Adicionado por Djeison - 30/08/2012
          MessageDlg('Esta é a Receita '+IntToStr(wART)+' desta ART.', mtInformation, [mbOK],0);
      end;

    end;
end;

procedure TFReceitaCad.BtExcluiReceitaCabClick(Sender: TObject);
begin
  with DMReceita.QReceitaCab do
    if not Eof then
      Delete;
  DMReceita.QReceitaCab.Refresh;
end;

procedure TFReceitaCad.DSReceitaCabDataChange(Sender: TObject;
  Field: TField);
begin
  with DMReceita do
  begin
    QReceitaCons.Close;
    QReceitaCons.ClearVariables;
    QReceitaCons.SetVariable('PK', DMNotaSaida.QItemNFCOD_NOTA_CAB.Value);
    if not QReceitaCabCOD_RECEITA_CAB.IsNull then
      QReceitaCons.SetVariable('COD_RECEITA_CAB', QReceitaCabCOD_RECEITA_CAB.Value);
    QReceitaCons.Open;
  end;
end;

procedure TFReceitaCad.BtIncluiReceitaCabExistClick(Sender: TObject);
var
  wReceita: string;
  wNumero: Integer;
begin
  wReceita := '0';
  if (Trim(MeCodNotaCab.Text) <> '') and (InputQuery('Receituário', 'Digite o número para o receituário', wReceita)) then
    with DMReceita do
    begin
      try
        wNumero := StrToInt(wReceita);
      except
        MessageDlg('Número inválido.', mtError, [mbOK], 0);
        BtIncluiReceitaCabExistClick(Sender);
        Exit;
      end;
      QReceitaCab.Append;
      QReceitaCabNUM_RECEITA.Value := wNumero;
      QReceitaCabCOD_NOTA_CAB.Value := StrToInt(Trim(MeCodNotaCab.Text));
      QReceitaCab.Post;
    end;
end;

procedure TFReceitaCad.BtSalvaClick(Sender: TObject);
begin
  DMOracle.ValidaFilial(MeFilial.Text);
  with DMReceita do
  begin
    QReceitaCab.First;
    while not QReceitaCab.Eof do
    begin
      QReceitaCab.Edit;
      QReceitaCab.Post;
      QReceitaCab.Next;
    end;
  end;
  DMOracle.DBCemapa.Commit;
end;

procedure TFReceitaCad.DSReceitaCabStateChange(Sender: TObject);
begin
  PersisteMensagens;
end;

procedure TFReceitaCad.MObsChange(Sender: TObject);
begin
  PersisteMensagens;
end;

procedure TFReceitaCad.MPrecaucaoChange(Sender: TObject);
begin
  PersisteMensagens;
end;

procedure TFReceitaCad.MEPIChange(Sender: TObject);
begin
  PersisteMensagens;
end;

procedure TFReceitaCad.EdOrientacaoChange(Sender: TObject);
begin
  PersisteMensagens;
end;

procedure TFReceitaCad.PersisteMensagens;
  function LimpaMsg(Msg: string): string;
  begin
    Result := StringReplace(Msg, #$D + #$A, '', [rfReplaceAll]);
  end;
begin
  if DSReceitaCab.State in [DsEdit, DsInsert] then
    with DMReceita do
    begin
      QReceitaCabDESC_OBS.Value := LimpaMsg(MObs.Lines.Text);
      QReceitaCabDESC_PRECAUCAO.Value := LimpaMsg(MPrecaucao.Lines.Text);
      QReceitaCabDESC_EPI.Value := LimpaMsg(MEPI.Lines.Text);
      QReceitaCabDESC_ORIENTACAO.Value := LimpaMsg(EdOrientacao.Text);
      QReceitaCabIND_EMITIDA.Value := 'S'; //Incluído por Cleber em 24-09-2019 para possibilitar mensagem na alteração.
    end;
end;

procedure TFReceitaCad.BtConsMensagemClick(Sender: TObject);
begin
  if FMensReceitaCons = nil then
    FMensReceitaCons := TFMensReceitaCons.Create(Application);
  if FMensReceitaCons.ShowModal = mrOk then
    MeCodMensagem.Text := DMMensReceita.QMensReceitaConsCOD_MENS_RECEITA.Text;
  MeCodMensagem.Text;
end;

procedure TFReceitaCad.FormShow(Sender: TObject);
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'GRASEL' then
    BtConsNotaClick(Self);
end;

procedure TFReceitaCad.BtCancelClick(Sender: TObject);
begin
  if FReceitaParam = nil then
    FReceitaParam := TFReceitaParam.Create(Application);
  FReceitaParam.PGRelatorio.Pages[0].TabVisible := true;
  if FReceitaParam.ShowModal = mrOk then
  begin

    if (Trim(FReceitaParam.FmDatas1.MeDtInicial.Text) = '')
      or (Trim(FReceitaParam.FmDatas1.MeDtFinal.Text) = '') then
    begin
      MessageDlg('Período não informado', mtError, [mbOk], 0);
      Abort;
    end;

    with DMReceita do
    begin

      QRReceitaRel.Close;
      if Trim(FReceitaParam.FmAgronomo1.MeAgronomo.Text) = '' then
        QRReceitaRel.SetVariable('COD_AGRONOMO', null)
      else
        QRReceitaRel.SetVariable('COD_AGRONOMO'
          , Trim(FReceitaParam.FmAgronomo1.MeAgronomo.Text));

      QRReceitaRel.SetVariable('DT_INI'
        , Trim(FReceitaParam.FmDatas1.MeDtInicial.Text));
      QRReceitaRel.SetVariable('DT_FIN'
        , Trim(FReceitaParam.FmDatas1.MeDtFinal.Text));
      QRReceitaRel.Open;
      
      if QRReceitaRel.Eof then
      begin
        MessageDlg('Nenhuma receita encontrada', mtError, [mbOk], 0);
        Abort;
      end;

      if FRReceitaRel = nil then
        FRReceitaRel := TFRReceitaRel.Create(Application);
      FRReceitaRel.QRLEmpresa.Caption
        := DMOracle.FastSelect('DESC_EMPRESA', 'TB_PARAM_SISTEMA'
          ,'1 = 1');

      if FReceitaParam.RGPreview.ItemIndex = 0 then
        FRReceitaRel.QRPrimario.Preview
      else
        FRReceitaRel.QRPrimario.Print;

    end;
  end;
end;

procedure TFReceitaCad.BtConhecimentoRiscoClick(Sender: TObject);
begin
  if Trim(MeCodNotaCab.Text) = '' then
  begin
    MessageDlg('Nota fiscal não informada', mtError, [mbOk], 0);
    abort;
  end;
  if Trim(MeAgronomo.Text) = '' then
  begin
    MessageDlg('Agrônomo não informado', mtError, [mbOk], 0);
    abort;
  end;
  if FRTermoReconhecimentoRisco = Nil then
    FRTermoReconhecimentoRisco := TFRTermoReconhecimentoRisco.Create(Application);
  with DMCadastro,DMAgronomo, FRTermoReconhecimentoRisco do
  begin
    QCadastro.Close;
    QCadastro.SetVariable('PK', Trim(MeCadastro.Text));
    QCadastro.Open;
    if qCadastro.Eof then
    begin
      MessageDlg('Cadastro não encontrado', mtError, [mbOk], 0);
      abort;
    end;
    QAgronomo.Close;
    QAgronomo.SetVariable('PK', Trim(MeAgronomo.Text));
    QAgronomo.Open;
    if QAgronomo.Eof then
    begin
      MessageDlg('Agrônomo não informado', mtError, [mbOk],  0);
      abort;
    end;
    if DMReceita.QReceitaCab.Eof then
    begin
      MessageDlg('Nenhuma receita selecionada', mtError, [mbOk], 0);
      abort;
    end;
    NomeCadastro := QCadastroNOME.Value;
    EnderecoCadastro := QCadastroDESC_ENDERECO.Value;
    RgCadastro := QCadastroNUM_INSCRICAO.Value;
    OrgaoEmissorCadastro := QCadastroDESC_ORGAO_EMISSOR.Value;
    CpfCadastro := QCadastroNUM_CGC_CPF.Value;
    InscMunicipalCadastro := QCadastroDESC_INSCRICAO_MUNICIPAL.Value;
    LocalCadastro := QCadastroDESC_CIDADE.Value + '-' + QCadastroCOD_ESTADO.Value;
    NomeAgronomo := QAgronomoNOME.Value;
    CreaAgronomo := QAgronomoDESC_CREA.Value;
    Receituario := DMReceita.QReceitaCabNUM_RECEITA.Text;
    ArtAgronomo := QAgronomoNUM_ART_RELACIONADA.Value;
    LocalAgronomo := QAgronomoDESC_CIDADE.Value + '-' + QAgronomoCOD_ESTADO.Value;
  end;
  FRTermoReconhecimentoRisco.QRPrimario.Preview;
  FRTermoReconhecimentoRisco.Free;
  FRTermoReconhecimentoRisco := nil;

end;

procedure TFReceitaCad.BtCienciaResponsabilidadeClick(Sender: TObject);
begin
  if Trim(MeCodNotaCab.Text) = '' then
  begin
    MessageDlg('Nota fiscal não informada', mtError, [mbOk], 0);
    abort;
  end;
  if Trim(MeAgronomo.Text) = '' then
  begin
    MessageDlg('Agrônomo não informado', mtError, [mbOk], 0);
    abort;
  end;
  if FRTermoCienciaResponsabilidade = Nil then
    FRTermoCienciaResponsabilidade := TFRTermoCienciaResponsabilidade.Create(Application);


  with DMCadastro,DMAgronomo, FRTermoCienciaResponsabilidade do
  begin
    QCadastro.Close;
    QCadastro.SetVariable('PK', Trim(MeCadastro.Text));
    QCadastro.Open;
    if qCadastro.Eof then
    begin
      MessageDlg('Cadastro não encontrado', mtError, [mbOk], 0);
      abort;
    end;
    QAgronomo.Close;
    QAgronomo.SetVariable('PK', Trim(MeAgronomo.Text));
    QAgronomo.Open;
    if QAgronomo.Eof then
    begin
      MessageDlg('Agrônomo não informado', mtError, [mbOk],  0);
      abort;
    end;
    if DMReceita.QReceitaCab.Eof then
    begin
      MessageDlg('Nenhuma receita selecionada', mtError, [mbOk], 0);
      abort;
    end;
    NomeCadastro := QCadastroNOME.Value;
    EnderecoCadastro := QCadastroDESC_ENDERECO.Value;
    RgCadastro := QCadastroNUM_INSCRICAO.Value;
    OrgaoEmissorCadastro := QCadastroDESC_ORGAO_EMISSOR.Value;
    CpfCadastro := QCadastroNUM_CGC_CPF.Value;
    InscMunicipalCadastro := QCadastroDESC_INSCRICAO_MUNICIPAL.Value;
    LocalCadastro := QCadastroDESC_CIDADE.Value + '-' + QCadastroCOD_ESTADO.Value;
    NomeAgronomo := QAgronomoNOME.Value;
    CreaAgronomo := QAgronomoDESC_CREA.Value;
    Receituario := DMReceita.QReceitaCabNUM_RECEITA.Text;
    ArtAgronomo := QAgronomoNUM_ART_RELACIONADA.Value;
    LocalAgronomo := QAgronomoDESC_CIDADE.Value + '-' + QAgronomoCOD_ESTADO.Value;
  end;
  FRTermoCienciaResponsabilidade.QRPrimario.Preview;
  FRTermoCienciaResponsabilidade.Free;
  FRTermoCienciaResponsabilidade := Nil;
end;

procedure TFReceitaCad.ExcluiReceitaMov;
begin

  with DmReceita do
  begin
    QReceita.Close;
    QReceita.SetVariable('PK', QReceitaConsCod_Nota_Item.Value);
    QReceita.Open;
    DMOracle.Audit(TOracleDataSet1(DMReceita.QReceita), 'Excluir Receiturario');
    QReceita.Delete;
    QReceitaCab.Edit;
    QReceitaCabIND_EMITIDA.Value := 'N';
    QReceitaCab.Post;
    QReceitaCons.Close;
    QReceitaCons.Open;
  end;

end;


end.

