unit UTMenuPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Buttons, ExtCtrls, Db, StdCtrls, ImgList, ComCtrls;

type
  TFTMenuPrincipal = class(TForm)
    MMCadSimples: TMainMenu;
    Opes1: TMenuItem;
    Sair1: TMenuItem;
    TrocaLogin1: TMenuItem;
    Panel1: TPanel;
    MonitorSistema1: TMenuItem;
    BtBaseTeste: TSpeedButton;
    BtBaseProducao: TSpeedButton;
    ImageList1: TImageList;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    AdicionarAtalho1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TrocaLogin1Click(Sender: TObject);
    procedure MonitorSistema1Click(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure AdicionarAtalho1Click(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Panel1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  private
    { Private declarations }
    FPegouSenha: Boolean;
    FModulo: string;
    xClick, yClick: Integer;
    imagens: TList;
    procedure CadastraFuncao;
    function ValidaItemMenu(vItemMenu: string): string;
    procedure SetaDireitoUsuario;
    function PegaDataExecutavel(path: string): TDate;
    procedure ProcessaMensagens;
    procedure AbreTelaLogin;
    procedure atualizaStatusBar;
    procedure adicionarAtalho;
//    procedure clica(Sender: TObject);
    function buscaMenuItem(nome: string): TMenuItem;
  public
    { Public declarations }
    property pPegouSenha: Boolean read FPegouSenha write FPegouSenha;
    property pModulo: string read FModulo write FModulo;

  end;

var
  FTMenuPrincipal: TFTMenuPrincipal;

implementation

uses UOracle_cl, ULogin, UUsuario_cl, UTela_cl, UParamCadFuncao, UFuncao_cl,
  UParamSistema_cl, UEscolheTela, UImagemAtalho; //, UMensagemUsuario_cl; //UMonitorSistema;

{$R *.DFM}

function TFTMenuPrincipal.PegaDataExecutavel(path: string): TDate;
var
  SearchFile: TSearchRec;
  lpSystemTime: TSystemTime;
begin
  { arquivo }
  FindFirst(path, faAnyFile, SearchFile);
  try
  { Modificado }
    FileTimeToSystemTime
      (SearchFile.FindData.ftLastWriteTime, lpSystemTime);
    Result := (SystemTimeToDateTime(lpSystemTime));
  { Criação }//pega data de criação do executavel
  {FileTimeToSystemTime
  (SearchFile.FindData.ftCreationTime,lpSystemTime);
  Edit1.text:=DateTimeToStr(SystemTimeToDateTime(lpSystemTime)); }
  { Acessado }//pega data de ultimo acesso do executavel
  {FileTimeToSystemTime
  (SearchFile.FindData.ftLastAccessTime,lpSystemTime);
  Edit3.text:=DateTimeToStr(SystemTimeToDateTime(lpSystemTime)); }
  finally
    FindClose(SearchFile);
  end;
end;

procedure TFTMenuPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TFTMenuPrincipal.AbreTelaLogin;
begin
  if FLogin = nil then
    FLogin := TFLogin.Create(Application);
  if FLogin.ShowModal = mrOk then
  begin
    pPegouSenha := True;
    Self.SetFocus; // Adicionado em 25/05/2010 para focar no Menu depois do Login
                    // porque a tela de login estava pegando os atalhos no lugar do menu.
  end
  else
    Close;
end;

procedure TFTMenuPrincipal.FormActivate(Sender: TObject);
var
  wDtVersao, wDtUltimaVersao: TDate;
begin
  WindowState := wsMaximized;

  if Date <> DMOracle.DataServ then
  begin
    ShowMessage('A Data desta Máquina está diferente do Servidor!');
    Close;
  end;
  Application.OnException := DMOracle.TrataErro;
  if pPegouSenha = False then
  begin
    if FLogin = nil then
      FLogin := TFLogin.Create(Application);
    if ((ParamStr(1) <> '') and (ParamStr(2) <> '') and (ParamStr(3) <> '') and (ParamStr(4) <> '')) then
    begin
      if ParamStr(1) = '/login' then
      begin
        FLogin.SBBase.Down := ParamStr(4) = 'ORA';
        if ParamStr(4) = 'ORA' then
          FLogin.SBBase.Caption := 'Produção'
        else
          FLogin.SBBase.Caption := 'Teste';
        DMOracle.DBCemapa.Connected := False;
        DMOracle.DBCemapa.LogonDataBase := ParamStr(4);
        DMOracle.DBCemapa.Connected := True;
        try
          DMUsuario.ValidaSenha(StrToInt(ParamStr(2)), UpperCase(ParamStr(3)));
        except
          AbreTelaLogin;
        end;
      end
      else
        AbreTelaLogin;
    end
    else
      AbreTelaLogin;
  end;
  //O bloco a seguir bloqueia o acesso ao sistema, caso o campo IND_BLOQUEADO da TB_PARAM_SISTEMA seja igual a 'S'.
  // try adicionado para não dar erro caso o campo IND_BLOQUEADO não exista.      Alessandro. 23/08/12
  try
    if DMOracle.FastSelect('IND_BLOQUEADO', 'TB_PARAM_SISTEMA') = 'S' then
    begin
      MessageDlg('Sistema bloqueado. Entre em contato com a Cemapa - (45)3264-3773.', mtError, [mbOK], 0);
      Close;
    end;
  except
    ;
  end;
  // pModulo := 'CUSTOS';
  if Trim(pModulo) = '' then
    raise Exception.Create('Modulo não informado!');

  // faz o controle de versao .. o programa continua executando se a data
  // de modificação do executável for maior ou igual a DT_VERSAO da tb_modulo
  // se for menor, o programa para
  if (DmParamSistema.QParamsistemaCod_Empresa.Value = 'NIR') and
    (DmParamSistema.QParamsistemaIND_CONTROLE_VERSAO.Value = 'SIM') then
  begin

    wDtUltimaVersao := strToDate(DMOracle.BuscaNome('SELECT DT_VERSAO FROM TB_MODULO', 'NOME_MODULO = ' + chr(39) + pModulo + chr(39)));
    wDtVersao := Int(PegaDataExecutavel(ParamStr(0)));

    if wDtVersao < wDtUltimaVersao then
    begin
      MessageDlg('Versão Desatualizada. Pegue a versão atualizada no servidor', mtError, [mbAbort], 0);
      close;
    end;

    if wDtVersao > wDtUltimaVersao then
    begin
      with DMOracle do
      begin
        try
          DMOracle.DBCemapa.StartTransaction;
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          QExecSQL.SQL.Add('UPDATE TB_MODULO SET DT_VERSAO = ' + chr(39) + DateToStr(wDtVersao) + chr(39));
          QExecSQL.SQL.Add('WHERE NOME_MODULO = ' + chr(39) + pModulo + chr(39));
          QExecSQL.ExecSQL;
          DMOracle.DBCemapa.Commit;
        except
          DMOracle.DBCemapa.Rollback;
          raise Exception.Create('A data da versão não foi atualizada no banco');
        end;
      end;
    end;
  end;
  //raise Exception.Create('Sistema bloqueado. Entre em contato com a Cemapa - (45)3264-3773.');
  SetaDireitoUsuario;
  DMParamSistema.QParamSistema.Open;
//  BtBaseProducao.Visible := FLogin.SBBase.Down;
//  BtBaseTeste.Visible := Not FLogin.SBBase.Down;
  DMFuncao.pModulo := Self.pModulo;
  DMTela.VerificaTela(pModulo, Self.Caption, Self.Name);
  CadastraFuncao;
//  if DmParamSistema.QParamsistemaCod_Empresa.Value = 'GRASEL' then
//    WindowState := wsMaximized;

  ProcessaMensagens;

  atualizaStatusBar;
end;

procedure TFTMenuPrincipal.ProcessaMensagens;
begin
//  DmMensagemUsuario.QMostraMensagem.Close;
//  DmMensagemUsuario.QMostraMensagem.SetVariable('COD_USUARIO_DESTINO', DMUsuario.CodUsuarioCorrente);
//  DmMensagemUsuario.QMostraMensagem.Open;
//
//  DmMensagemUsuario.QMostraMensagem.First;
//
//  while not DmMensagemUsuario.QMostraMensagem.Eof do
//  begin
//    if MessageDlg('Mensagem recebida de ' + DmMensagemUsuario.QMostraMensagemNOME_USUARIO_ORIGEM.Value + ': ' + #13 + #10 +
//    DmMensagemUsuario.QMostraMensagemDESC_MENSAGEM.Text + #13 + #10 + #13 + #10 +
//    'Marcar como lida?', mtInformation, [mbYes, mbNo], 0) = mrYes
//    then
//      DMOracle.ExecutaSql('INSERT INTO TB_MENSAGEM_USUARIO_LIDA(COD_MENSAGEM_USUARIO_LIDA, COD_MENSAGEM_USUARIO, COD_USUARIO) VALUES(SQMENSAGEM_USUARIO_LIDA.NEXTVAL, ' + DmMensagemUsuario.QMostraMensagemCOD_MENSAGEM_USUARIO.Text + ', ' + IntToStr(DMUsuario.CodUsuarioCorrente) + ')');
//
//    DmMensagemUsuario.QMostraMensagem.Next;
//  end;
end;

procedure TFTMenuPrincipal.TrocaLogin1Click(Sender: TObject);
begin
  if FLogin.ShowModal <> mrOk then
    Close;
  //DMOracle.DBCemapa.Connected := False;  // Fecha todas as Querys
  //DMOracle.DBCemapa.Connected := True;
//  BtBaseProducao.Visible := FLogin.SBBase.Down;
//  BtBaseTeste.Visible := Not FLogin.SBBase.Down;
  atualizaStatusBar;
  SetaDireitoUsuario;
end;

procedure TFTMenuPrincipal.FormCreate(Sender: TObject);
begin
  pPegouSenha := False;
  Self.Top := 1;
  Self.Left := 1;
//  Application.HintColor := clAqua;
  Application.HintHidePause := 9000;
  Application.HintPause := 100;

  imagens := TList.Create;
end;

procedure TFTMenuPrincipal.SetaDireitoUsuario;
var vHorizontal, vVertical: Integer;
begin
  // Validar os direitos de acesso
  if DMUsuario.Privilegiado = True then
  begin
    for vHorizontal := 0 to Self.MMCadSimples.Items.Count - 1 do
    begin
      for vVertical := 0 to MMCadSimples.Items[vHorizontal].Count - 1 do
      begin
        MMCadSimples.Items[vHorizontal].Items[vVertical].Visible := True;
      end;
    end;
  end
  else
  begin // Usuários não privilegiados;
    with DMTela do
    begin
      QVerificaTela.Close;
      QVerificaTela.SetVariable('NOME_TELA', Self.Name);
      QVerificaTela.Open;
      for vHorizontal := 0 to Self.MMCadSimples.Items.Count - 1 do
      begin
        for vVertical := 0 to MMCadSimples.Items[vHorizontal].Count - 1 do
        begin
          QDireitoUsuMenu.Close;
          QDireitoUsuMenu.SetVariable('NOME_TELA', QVerificaTelaNome_Tela.Value);
          QDireitoUsuMenu.SetVariable('COD_USUARIO', DMUsuario.CodUsuarioCorrente);
          QDireitoUsuMenu.SetVariable('MENU_1', vHorizontal);
          QDireitoUsuMenu.SetVariable('MENU_2', vVertical);
          QDireitoUsuMenu.Open;
          if (QDireitoUsuMenuNome_Tela.Value = '') and
            (MMCadSimples.Items[vHorizontal].Items[vVertical].Caption <> 'Ca&ncelar') and
            (MMCadSimples.Items[vHorizontal].Items[vVertical].Caption <> '&Confirmar') and
            (MMCadSimples.Items[vHorizontal].Items[vVertical].Caption <> 'Atualizar') then
            MMCadSimples.Items[vHorizontal].Items[vVertical].Visible := False
          else
            MMCadSimples.Items[vHorizontal].Items[vVertical].Visible := True;
        end;
      end;
    end;
  end;
end;

procedure TFTMenuPrincipal.CadastraFuncao;
var vHorizontal, vVertical: Integer;
  vFuncao, wDescInitFuncao: string;
begin
  with DMFuncao do
  begin
    QModulo.Open;
    if QModulo.Locate('NOME_MODULO', DMFuncao.pModulo, []) then
    begin
      QTela.Open;
      if QTela.Locate('NOME_TELA', Trim(Self.Name), []) then
      begin
        QFuncaoTela.Close;
        QFuncaoTela.SetVariable('NOME_TELA', Trim(QTelaNome_Tela.Value));
        QFuncaoTela.Open;
        for vHorizontal := 0 to Self.MMCadSimples.Items.Count - 1 do
        begin
          wDescInitFuncao := ValidaItemMenu(Copy(MMCadSimples.Items[vHorizontal].Caption, 0, 4)) + '.- ';
          for vVertical := 0 to MMCadSimples.Items[vHorizontal].Count - 1 do
          begin
            try
              // ValidaItemMenu retorna Erro quando é um item inválido
              vFuncao := ValidaItemMenu(MMCadSimples.Items[vHorizontal].Items[vVertical].Caption);
              if not QFuncaoTela.Locate('NOME_FUNCAO', Trim(Copy(wDescInitFuncao + vFuncao, 1, 100)), []) then
              begin
                QFuncaoTela.Insert;
                QFuncaoTelaCod_Funcao.Value := DMOracle.Sequencia('FUNCAO');
                QFuncaoTelaNum_Item_Menu1.Value := vHorizontal;
                QFuncaoTelaNum_Item_Menu2.Value := vVertical;
                QFuncaoTelaNome_Funcao.Value := wDescInitFuncao + vFuncao;
                QFuncaoTelaNome_Tela.Value := Trim(Self.Name);
                if vFuncao = 'Incluir' then
                  QFuncaoTelaNome_Botao.Value := 'SBIncluir';
                if vFuncao = 'Alterar' then
                  QFuncaoTelaNome_Botao.Value := 'SBAlterar';
                if vFuncao = 'Excluir' then
                  QFuncaoTelaNome_Botao.Value := 'SBExcluir';
                if vFuncao = 'Consulta' then
                  QFuncaoTelaNome_Botao.Value := 'SBConsulta';
                QFuncaoTela.Post;
              end;
            except
              if QFuncaoTela.State = dsInsert then
                QFuncaoTela.Cancel;
            end;
          end;
        end;
        QFuncaoTela.Close;
        QFuncaoTela.Open;
      end;
    end;
  end;
end;

function TFTMenuPrincipal.ValidaItemMenu(vItemMenu: string): string;
var vItemValido: string;
  Cont: Integer;
begin
  // Validar o Caption do Menu
  vItemValido := '';
  for Cont := 1 to Length(vItemMenu) do
  begin
    if (vItemMenu[Cont] <> '&')
      and (vItemMenu[Cont] <> '-') then
      vItemValido := vItemValido + vItemMenu[Cont];
  end;
  if (UpperCase(vItemValido) <> 'SAIR') and
    (UpperCase(vItemValido) <> 'CONFIRMAR') and
    (UpperCase(vItemValido) <> 'CANCELAR') and
    (UpperCase(vItemValido) <> 'ATUALIZAR') and
    (UpperCase(vItemValido) <> '') then
    Result := vItemValido
  else
    Abort;
end;

procedure TFTMenuPrincipal.MonitorSistema1Click(Sender: TObject);
begin
  //If FMonitorSistema = Nil then
  //  FMonitorSistema := TFMonitorSistema.Create(Application);
  //FMonitorSistema.ShowModal;
end;

procedure TFTMenuPrincipal.atualizaStatusBar;
begin
  Buscador.Limpa;
  Buscador.Adiciona('NOME', 'TB_USUARIO', 'COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente));
  Buscador.Adiciona('DESC_FILIAL', 'TB_FILIAL', 'COD_FILIAL = ' + IntToStr(DMUsuario.CodFilialUsuario));
  Buscador.Buscar;

//  StatusBar1.Panels[1].Text := 'Usuário: ' + DMOracle.FastSelect('NOME', 'TB_USUARIO', 'COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente), True) + ' (' + IntToStr(DMUsuario.CodUsuarioCorrente) + ')';
//  StatusBar1.Panels[2].Text := 'Filial: ' + DMOracle.FastSelect('DESC_FILIAL', 'TB_FILIAL', 'COD_FILIAL = ' + IntToStr(DMUsuario.CodFilialUsuario), True) + ' (' + IntToStr(DMUsuario.CodFilialUsuario) + ')';
  StatusBar1.Panels[1].Text := 'Usuário: ' + Buscador.Proximo + ' (' + IntToStr(DMUsuario.CodUsuarioCorrente) + ')';
  StatusBar1.Panels[2].Text := 'Filial: ' + Buscador.Proximo + ' (' + IntToStr(DMUsuario.CodFilialUsuario) + ')';
  StatusBar1.Repaint;
end;

procedure TFTMenuPrincipal.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  if FLogin = nil then
    Exit;

  if Panel.Index = 0 then
  begin
    StatusBar.Canvas.FillRect(Rect);
//    if FLogin.SBBase.Down then
    if DMOracle.DBCemapa.LogonDatabase = 'ORA' then
      ImageList1.Draw(StatusBar1.Canvas, Rect.Left + 5, Rect.Top + 1, 0)
    else
      ImageList1.Draw(StatusBar1.Canvas, Rect.Left + 5, Rect.Top + 1, 1);

    StatusBar.Canvas.Refresh;
  end;
end;

procedure TFTMenuPrincipal.AdicionarAtalho1Click(Sender: TObject);
begin
  if FEscolheTela = nil then
    FEscolheTela := TFEscolheTela.Create(Application);
  FEscolheTela.wMenuBase := MMCadSimples;
  FEscolheTela.ShowModal;

  if FEscolheTela.ModalResult = mrOK then
    adicionarAtalho;
end;

procedure TFTMenuPrincipal.Panel1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
  begin
    xClick := X;
    yClick := Y;
  end;
end;

procedure TFTMenuPrincipal.adicionarAtalho;
var image: TImagemAtalho;
begin
  image := TImagemAtalho.Create(Panel1);
  image.Picture.LoadFromFile('C:\twitter.ico');
  image.Parent := Panel1;
  image.Left := xClick;
  image.Top := yClick;
  image.MenuItem := buscaMenuItem(FEscolheTela.wItemEscolhido.Name);

  imagens.Add(image);
end;

//procedure TFTMenuPrincipal.clica(Sender: TObject);
//begin
//  MessageDlg('Teste: ' + TMenuItem(Sender).Caption, mtWarning, [mbOK], 0);
//end;

function TFTMenuPrincipal.buscaMenuItem(nome: string): TMenuItem;
var i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i].Name = nome then
      Result := TMenuItem(Components[i]);
end;

procedure TFTMenuPrincipal.Panel1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  if Source is TImagemAtalho then
  begin
    TImagemAtalho(Source).Left := X;
    TImagemAtalho(Source).Top := Y;
  end;
end;

procedure TFTMenuPrincipal.Panel1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Source is TImagemAtalho);
end;

end.
