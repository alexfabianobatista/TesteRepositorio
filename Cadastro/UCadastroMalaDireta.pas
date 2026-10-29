unit UCadastroMalaDireta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, Mask, DB;

type
  TFCadastraMalaDireta = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BtnVoltar: TBitBtn;
    BtnAvancar: TBitBtn;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EdDescricao: TEdit;
    Label12: TLabel;
    BtnMensagem: TBitBtn;
    EdMensagem: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    LbDescricaoFinal: TLabel;
    LbDestinosFinais: TLabel;
    LbServidoresFinais: TLabel;
    LbMensagemFinal: TLabel;
    DBGDestinos: TDBGrid;
    Label20: TLabel;
    BtnAdicionarDestinos: TBitBtn;
    BtnExcluirDestino: TBitBtn;
    BtnExcluirTodosDestinos: TBitBtn;
    Label21: TLabel;
    DBGServidores: TDBGrid;
    Label22: TLabel;
    BtnAdicionarSMTP: TBitBtn;
    BtnExcluirSMTP: TBitBtn;
    BtnExcluirTodosSMTP: TBitBtn;
    BtnNovaMensagem: TBitBtn;
    MeMensagem: TMaskEdit;
    DSDestinos: TDataSource;
    DSSMTP: TDataSource;
    Label13: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label23: TLabel;
    LbConclusaoAproximada: TLabel;
    procedure BtnAvancarClick(Sender: TObject);
    procedure Navegacao(Pagina : Integer);
    procedure BtnVoltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnNovaMensagemClick(Sender: TObject);
    procedure BtnMensagemClick(Sender: TObject);
    procedure MeMensagemExit(Sender: TObject);
    procedure BtnAdicionarDestinosClick(Sender: TObject);
    procedure BtnExcluirDestinoClick(Sender: TObject);
    procedure BtnExcluirTodosDestinosClick(Sender: TObject);
    procedure BtnAdicionarSMTPClick(Sender: TObject);
    procedure BtnExcluirSMTPClick(Sender: TObject);
    procedure BtnExcluirTodosSMTPClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure CarregaConfirmacao;
  private
    { Private declarations }
  public
    { Public declarations }
    DescricaoMala : String;
    MensagemEletronica: String; 
    CodigoMensagemEletronica : Integer;
    NumeroDestinos: Integer;
    NumeroServidores: Integer;
  end;

var
  FCadastraMalaDireta: TFCadastraMalaDireta;

implementation

uses UMensagemEletronicaCad, UMalaDireta_cl, UTela_cl, UMensagemEletronicaCons, UOracle_cl, UCadastro_Rel_cl, UBiblioteca,
  UCadastroParam, USMTPCons, Math;

{$R *.dfm}

procedure TFCadastraMalaDireta.BtnAvancarClick(Sender: TObject);
begin
  Navegacao(PageControl1.ActivePageIndex+1);
end;

procedure TFCadastraMalaDireta.Navegacao(Pagina : Integer);
begin
  if Pagina = 0 then
    BtnVoltar.Enabled := False
  else
    BtnVoltar.Enabled := True;

  if Pagina < PageControl1.PageCount then
  begin
    PageControl1.ActivePageIndex := Pagina;
    PageControl1Change(nil);
  end;

  if Pagina = PageControl1.PageCount then
  begin
    if DescricaoMala = '' then
    begin
      MessageDlg('Ainda falta preencher a descrição!', mtError, [mbOK], 0);
      PageControl1.ActivePage := TabSheet2;
    end
    else if CodigoMensagemEletronica = 0 then
    begin
      MessageDlg('Ainda falta preencher a mensagem a ser enviada!', mtError, [mbOK], 0);
      PageControl1.ActivePage := TabSheet2;
    end
    else if NumeroDestinos = 0 then
    begin
      MessageDlg('É necessário ter selecionado ao menos um destino!', mtError, [mbOK], 0);
      PageControl1.ActivePage := TabSheet3;
    end
    else if NumeroServidores = 0 then
    begin
      MessageDlg('É necessário ter selecionado ao menos um servidor SMTP!', mtError, [mbOK], 0);
      PageControl1.ActivePage := TabSheet4;
    end
    else
    begin
      with DMMalaDireta do
      begin
        QMalaDiretaDESC_DESCRICAO.Value := DescricaoMala;
        QMalaDiretaCOD_MENSAGEM_ELETRONICA.Value := CodigoMensagemEletronica;

        QMalaDireta.Post;

        CDSDestinos.First;
        while not CDSDestinos.Eof do
        begin
          QMalaDiretaDestino.Insert;
          QMalaDiretaDestinoCOD_MALA_DIRETA_CAB.Value := QMalaDiretaCOD_MALA_DIRETA_CAB.Value;
          QMalaDiretaDestinoDESC_EMAIL_DESTINO.Value := CDSDestinosEMAIL_DESTINO.Value;
          QMalaDiretaDestinoDESC_NOME_DESTINO.Value := CDSDestinosNOME_DESTINO.Value;
          QMalaDiretaDestinoIND_ENVIO.Value := 'N'; 
          QMalaDiretaDestino.Post;
          CDSDestinos.Next;
        end;

        CDSSMTP.First;
        while not CDSSMTP.Eof do
        begin
          QMalaDiretaSMTP.Insert;
          QMalaDiretaSMTPCOD_MALA_DIRETA_CAB.Value := QMalaDiretaCOD_MALA_DIRETA_CAB.Value;
          QMalaDiretaSMTPCOD_SMTP.Value := CDSSMTPCODIGO.Value;
          QMalaDiretaSMTP.Post;
          CDSSMTP.Next;
        end;
                        
        Self.ModalResult := MrOk;
      end;
    end;
  end;
end;

procedure TFCadastraMalaDireta.BtnVoltarClick(Sender: TObject);
begin
  Navegacao(PageControl1.ActivePageIndex-1);
end;

procedure TFCadastraMalaDireta.FormCreate(Sender: TObject);    
var
  page : Integer;
begin
  for page := 0 to PageControl1.PageCount-1 do
  begin
    PageControl1.ActivePageIndex := page;    
    PageControl1.ActivePage.TabVisible:= False;
  end;

  DMMalaDireta.CDSDestinos.EmptyDataSet;
  DMMalaDireta.CDSSMTP.EmptyDataSet;
  Navegacao(0);
end;

procedure TFCadastraMalaDireta.BtnNovaMensagemClick(Sender: TObject);
begin
  if FMensagemEletronicaCad = nil then
    FMensagemEletronicaCad := TFMensagemEletronicaCad.Create(Application);
  DMMalaDireta.QMensagemEletronica.Close;
  DMMalaDireta.QMensagemEletronica.Open;
  DMMalaDireta.QMensagemEletronica.Insert;
  FMensagemEletronicaCad.ShowModal;

  if DMMalaDireta.QMensagemEletronica.RecordCount > 0 then
  begin
    MeMensagem.Text := DMMalaDireta.QMensagemEletronicaCOD_MENSAGEM_ELETRONICA.Text;
    MeMensagemExit(Sender);
  end;
end;

procedure TFCadastraMalaDireta.BtnMensagemClick(Sender: TObject);
begin
  if FMensagemEletronicaCons = nil then
    FMensagemEletronicaCons := TFMensagemEletronicaCons.Create(Application);
  FMensagemEletronicaCons.BtProcurarClick(Sender);
  FMensagemEletronicaCons.ShowModal;

  if FMensagemEletronicaCons.ModalResult = MrOk then
  begin
    MeMensagem.Text := DMMalaDireta.QMensagemEletronicaConsCOD_MENSAGEM_ELETRONICA.Text;
    MeMensagemExit(Sender);
  end;
end;

procedure TFCadastraMalaDireta.MeMensagemExit(Sender: TObject);
begin
  EdMensagem.Text := DMOracle.FastSelect('DESC_DESCRICAO','TB_MENSAGEM_ELETRONICA','COD_MENSAGEM_ELETRONICA =' + QuotedStr(Trim(MeMensagem.Text)));
end;

procedure TFCadastraMalaDireta.BtnAdicionarDestinosClick(Sender: TObject);
begin
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[26].TabVisible := True;

  if FCadastroParam.ShowModal = mrOk then
  begin
    with DMCadastro_Rel do
    begin
      QRDestinosMalaDireta.Close;
      Bib.setVariableOuNull(QRDestinosMalaDireta, 'COD_CADASTRO', Trim(FCadastroParam.Fm26Cadastro.MeCadastro.Text));
      Bib.setVariableOuNull(QRDestinosMalaDireta, 'COD_ESTADO', Trim(FCadastroParam.Fm26Estado.MeEstado.Text));
      Bib.setVariableOuNull(QRDestinosMalaDireta, 'COD_CLASS_CADASTRO', Trim(FCadastroParam.Fm26Classificacao.MeClassificacao.Text));
      Bib.setVariableOuNull(QRDestinosMalaDireta, 'COD_REGIAO', Trim(FCadastroParam.Fm26Regiao.MeRegiao.Text));
      Bib.setVariableOuNull(QRDestinosMalaDireta, 'COD_RAMO', Trim(FCadastroParam.Fm26Ramo.MeRamo.Text));
      Bib.setVariableOuNull(QRDestinosMalaDireta, 'COD_TIPO_CADASTRO', Trim(FCadastroParam.Fm26TipoCadastro.MeTipoCadastro.Text));
      Bib.setVariableOuNull(QRDestinosMalaDireta, 'COD_VENDEDOR', Trim(FCadastroParam.Fm26Vendedor.MeVendedor.Text));
      if FCadastroParam.CB26ConsideraData.Checked then
      begin
        QRDestinosMalaDireta.SetVariable('DT_NASC_INICIO', DateToStr(FCadastroParam.DTP26NascInicio.DateTime));
        QRDestinosMalaDireta.SetVariable('DT_NASC_FIM', DateToStr(FCadastroParam.DTP26NascFinal.DateTime));
      end
      else
      begin
        QRDestinosMalaDireta.SetVariable('DT_NASC_INICIO', Null);
        QRDestinosMalaDireta.SetVariable('DT_NASC_FIM', Null);
      end;
      QRDestinosMalaDireta.Open;
      QRDestinosMalaDireta.First;

      while not QRDestinosMalaDireta.Eof do
      begin
        with DMMalaDireta do
        begin
          try
            if Trim(QRDestinosMalaDiretaDESC_E_MAIL.Text) <> '' then
            begin
              CDSDestinos.Insert;
              CDSDestinosEMAIL_DESTINO.Value := QRDestinosMalaDiretaDESC_E_MAIL.Text;
              CDSDestinosNOME_DESTINO.Value := Bib.TitleCase(LowerCase(QRDestinosMalaDiretaNOME.Text));
              CDSDestinos.Post;
            end;
          Except on e:exception do
            if Pos('Key Violation', UpperCase(e.Message)) = 0 then
              if DSDestinos.State in [DsInsert] then
                CDSDestinos.Cancel
            else
              ShowMessage(e.Message);
          end;

          QRDestinosMalaDireta.Next;
        end;
      end;

    end;
  end;
end;

procedure TFCadastraMalaDireta.BtnExcluirDestinoClick(Sender: TObject);
begin
  if not DMMalaDireta.CDSDestinos.Eof then
    DMMalaDireta.CDSDestinos.Delete;
end;

procedure TFCadastraMalaDireta.BtnExcluirTodosDestinosClick(
  Sender: TObject);
begin
  DMMalaDireta.CDSDestinos.First;
  while not DMMalaDireta.CDSDestinos.Eof do
    DMMalaDireta.CDSDestinos.Delete;
end;

procedure TFCadastraMalaDireta.BtnAdicionarSMTPClick(Sender: TObject);
begin
  if FSMTPCons = nil then
    FSMTPCons := TFSMTPCons.Create(Application);
    
  FSMTPCons.BtProcurarClick(Sender);
  if FSMTPCons.ShowModal = mrOk then
  begin
    with DMMalaDireta do
    begin
      try  

        if QSMTPConsQT_HORAS.Value < 1 then
          raise Exception.Create('O servidor SMTP deve ter ao menos 1 hora de intervalo de envio.');

        if QSMTPConsQT_EMAIL.Value < 1 then
          raise Exception.Create('O servidor SMTP deve ter ao menos 1 e-mail de intervalo de envio.');

        CDSSMTP.Insert;
        CDSSMTPCODIGO.Value := QSMTPConsCOD_SMTP.Value;
        CDSSMTPEMAIL.Value := QSMTPConsDESC_EMAIL.Text;
        CDSSMTPSERVIDOR.Value := QSMTPConsDESC_SMTP.Text;
        CDSSMTPINTERVALO.Value := QSMTPConsQT_EMAIL.Text + '/' + QSMTPConsQT_HORAS.Text + '/' + QSMTPConsQT_ENVIOS_VEZ.Text;
        CDSSMTPEMAILS_HORA.Value := Ceil(QSMTPConsQT_EMAIL.Value/QSMTPConsQT_HORAS.Value);
        CDSSMTP.Post;
      Except on e:exception do
        if Pos('Key Violation', UpperCase(e.Message)) = 0 then
          if CDSSMTP.State in [DsInsert] then
            CDSSMTP.Cancel
        else
          ShowMessage(e.Message);
      end;
    end;
  end;
end;

procedure TFCadastraMalaDireta.BtnExcluirSMTPClick(Sender: TObject);
begin
  if not DMMalaDireta.CDSSMTP.Eof then
    DMMalaDireta.CDSSMTP.Delete;
end;

procedure TFCadastraMalaDireta.BtnExcluirTodosSMTPClick(Sender: TObject);
begin
  DMMalaDireta.CDSSMTP.First;
  while not DMMalaDireta.CDSSMTP.Eof do
    DMMalaDireta.CDSSMTP.Delete;
end;

procedure TFCadastraMalaDireta.CarregaConfirmacao;
begin
  DescricaoMala := Trim(EdDescricao.Text);
  NumeroDestinos := DMMalaDireta.CDSDestinos.RecordCount;
  NumeroServidores := DMMalaDireta.CDSSMTP.RecordCount;
  MensagemEletronica := DMOracle.FastSelect('DESC_DESCRICAO','TB_MENSAGEM_ELETRONICA','COD_MENSAGEM_ELETRONICA = ' + Trim(MeMensagem.Text)); 

  if MensagemEletronica <> '' then
  begin
    if not TryStrToInt(Trim(MeMensagem.Text), CodigoMensagemEletronica) then
      CodigoMensagemEletronica := 0;
  end
  else
    CodigoMensagemEletronica := 0;
end;

procedure TFCadastraMalaDireta.PageControl1Change(Sender: TObject);
var
  wHoras, wTotalHoras : Integer;
begin
  if PageControl1.ActivePage = TabSheet5 then
  begin
    CarregaConfirmacao;
    if DescricaoMala = '' then
      LbDescricaoFinal.Caption := 'Nenhuma'
    else
      LbDescricaoFinal.Caption := DescricaoMala;

    if MensagemEletronica = '' then
      LbMensagemFinal.Caption := 'Nenhuma'
    else
      LbMensagemFinal.Caption := MensagemEletronica;

    LbDestinosFinais.Caption := IntToStr(NumeroDestinos);
    LbServidoresFinais.Caption := IntToStr(NumeroServidores);

    with DMMalaDireta do
    begin                    
      wTotalHoras := 0;
      CDSSMTP.First;

      while not CDSSMTP.Eof do
      begin
        wTotalHoras := wTotalHoras + CDSSMTPEMAILS_HORA.Value;
        CDSSMTP.Next;
      end;

      if wTotalHoras < 1 then
        raise Exception.Create('O numero de horas de intervalo de envio deve ser no mínimo 1.');

      wHoras := Ceil(CDSDestinos.RecordCount/wTotalHoras);
    end;

    if wHoras > 1 then
      LbConclusaoAproximada.Caption := IntToStr(wHoras) + ' horas.'
    else
      LbConclusaoAproximada.Caption := 'Menos de uma hora.';
  end;
end;

end.
