unit UTCadSimples;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Menus, Buttons, ExtCtrls, ComCtrls, Grids, DBGrids, DBTables,
  StdCtrls, Mask, ImgList,OraTeste;

type
  TFTCadSimples = class(TCustomForm)
    Panel1: TPanel;
    SBIncluir: TSpeedButton;
    SBAlterar: TSpeedButton;
    SBConfirmar: TSpeedButton;
    SBCancelar: TSpeedButton;
    SBExcluir: TSpeedButton;
    MMCadSimples: TMainMenu;
    Manuteno1: TMenuItem;
    Relatrios1: TMenuItem;
    Incluir1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    Confirmar1: TMenuItem;
    Cancelar1: TMenuItem;
    DSPrimario: TDataSource;
    N1: TMenuItem;
    Sair2: TMenuItem;
    StBLongHint: TStatusBar;
    SBHelp: TSpeedButton;
    SBRefresh: TSpeedButton;
    Atualizar1: TMenuItem;
    MELocaliza: TMaskEdit;
    SBConsulta: TSpeedButton;
    Consulta1: TMenuItem;
    ILBotao: TImageList;
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBRefreshClick(Sender: TObject);
    procedure MELocalizaExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
    Procedure MostraHint(Sender: TObject);
    Procedure CadastraFuncao;
    Function ValidaItemMenu(vItemMenu : String):String;
  public
    { Public declarations }
  end;

var
  FTCadSimples: TFTCadSimples;

implementation

uses UOracle_cl, UUsuario_cl, UTela_cl, UFuncao_cl;

{$R *.DFM}

Procedure TFTCadSimples.MostraHint(Sender:TObject);
Begin
  StbLongHint.SimpleText := GetLongHint(Application.Hint);
End;

procedure TFTCadSimples.DSPrimarioStateChange(Sender: TObject);
begin
  If DSPrimario.DataSet.State in [dsEdit,dsInsert] then
  Begin
    SBIncluir.Enabled := False;
    SBAlterar.Enabled := False;
    SBExcluir.Enabled := False;
    SBConfirmar.Enabled := True;
    SBCancelar.Enabled := True;
    SBRefresh.Enabled := False;
    MELocaliza.Enabled := False;
    SBConsulta.Enabled := False;
  End
  Else
  If DSPrimario.DataSet.State = dsBrowse then
  Begin
    SBIncluir.Enabled := True;
    SBAlterar.Enabled := True;
    SBExcluir.Enabled := True;
    SBConfirmar.Enabled := False;
    SBCancelar.Enabled := False;
    SBRefresh.Enabled := True;
    MELocaliza.Enabled := True;
    SBConsulta.Enabled := True;
  End;
  MMCadSimples.Items[0].Items[0].Enabled := SBIncluir.Enabled;
  MMCadSimples.Items[0].Items[1].Enabled := SBAlterar.Enabled;
  MMCadSimples.Items[0].Items[2].Enabled := SBConfirmar.Enabled;
  MMCadSimples.Items[0].Items[3].Enabled := SBExcluir.Enabled;
  MMCadSimples.Items[0].Items[4].Enabled := SBCancelar.Enabled;
  MMCadSimples.Items[0].Items[5].Enabled := SBRefresh.Enabled;
  MMCadSimples.Items[0].Items[6].Enabled := SBConsulta.Enabled;  
  MMCadSimples.Items[0].Items[8].Enabled := SBRefresh.Enabled; // Sair
  MMCadSimples.Items[1].Enabled := SBRefresh.Enabled; // Relatorio
end;

procedure TFTCadSimples.SBIncluirClick(Sender: TObject);
begin
  If SBIncluir.Visible then
     DSPrimario.DataSet.Insert;
  // Setar Focus para o primeiro tabOrder;
end;

procedure TFTCadSimples.SBAlterarClick(Sender: TObject);
begin
  If SBAlterar.Visible then
    DSPrimario.DataSet.Edit;
end;

procedure TFTCadSimples.SBConfirmarClick(Sender: TObject);
begin
  DSPrimario.DataSet.Post;
end;

procedure TFTCadSimples.SBExcluirClick(Sender: TObject);
Var wTrans : Boolean;
begin
  wTrans := DMOracle.DBCemapa.InTransaction;
  Try
    If SBExcluir.Visible then
    If MessageDlg('Apagar este registro?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      DSPrimario.DataSet.Delete;
  Except
    If wTrans = False then
      DMOracle.DBCemapa.Rollback;
    Raise;
  end;
end;

procedure TFTCadSimples.SBCancelarClick(Sender: TObject);
begin
  DSPrimario.DataSet.Cancel;
end;

procedure TFTCadSimples.Sair1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TFTCadSimples.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(DSPrimario.DataSet) then
  begin
    If (DSPrimario.DataSet.State in [dsEdit,dsInsert])
       or (DMOracle.DBCemapa.InTransaction) then
      Raise Exception.Create('Dados não confirmados. Confirme antes de sair desta janela!');
  end;
end;

procedure TFTCadSimples.SBRefreshClick(Sender: TObject);
begin
  DSPrimario.DataSet.Close;
  DSPrimario.DataSet.Open;  
end;

procedure TFTCadSimples.MELocalizaExit(Sender: TObject);
Var QAux : TOracleDataSet1;
begin
  If Trim(MELocaliza.Text) <> '' then
  Begin
    QAux := TOracleDataSet1(DSPrimario.DataSet);
    QAux.Close;
//    QAux.ParamByName('PK').AsFloat := StrToFloat(MELocaliza.Text);
    QAux.SetVariable('PK',Trim(MELocaliza.Text));
    QAux.Open;
    MELocaliza.Text := '';
  End;
end;

procedure TFTCadSimples.FormActivate(Sender: TObject);
Var vHorizontal, vVertical, Cont : Integer;
    vAuxBotao : TSpeedButton;
begin
  Application.OnHint := MostraHint;
  If DMUsuario.Privilegiado = True Then
    CadastraFuncao;
  // Validar os direitos de acesso
  If DMUsuario.Privilegiado = True then
  Begin
    For vHorizontal := 0 To Self.MMCadSimples.Items.Count-1 do
    Begin
      For vVertical := 0 to MMCadSimples.Items[vHorizontal].Count-1 do
      Begin
        MMCadSimples.Items[vHorizontal].Items[vVertical].Visible := True;
      End;
    End;

    For Cont := 0 to Self.ComponentCount-1 do
    Begin
      If Copy(Self.Components[Cont].Name,1,2) = 'SB' Then
      Begin
        Try
          vAuxBotao := TSpeedButton(Self.Components[Cont]);
          vAuxBotao.Visible := True;
        Except
        End;
      End;
    End;
  End
  Else
  Begin  // Usuários não privilegiados;
    With DMTela do
    Begin
      QVerificaTela.Close;
      QVerificaTela.SetVariable('NOME_TELA',Trim(Self.Name));
      QVerificaTela.Open;

      // Controle dos botões dos botões
      QDireitoUsuBotao.Close;
      QDireitoUsuBotao.SetVariable('NOME_TELA',Trim(QVerificaTelaNome_Tela.Value));
      QDireitoUsuBotao.SetVariable('COD_USUARIO',DMUsuario.CodUsuarioCorrente);
      For Cont := 0 to Self.ComponentCount-1 do
      Begin
        If Copy(Self.Components[Cont].Name,1,2) = 'SB' Then
        Begin
          QDireitoUsuBotao.Close;
          QDireitoUsuBotao.SetVariable('NOME_BOTAO',LowerCase(Self.Components[Cont].Name));
          QDireitoUsuBotao.Open;
          Try
            vAuxBotao := TSpeedButton(Self.Components[Cont]);
            If (QDireitoUsuBotao.RecordCount = 0) and
               (Self.Components[Cont].Name <> 'SBCancelar') and
               (Self.Components[Cont].Name <> 'SBConfirmar') and
               (Self.Components[Cont].Name <> 'SBRefresh') and
               (Self.Components[Cont].Name <> 'SBHelp')  Then
              vAuxBotao.Visible := False
            Else
              vAuxBotao.Visible := True;
          Except
          End;
        End;
      End;

      For vHorizontal := 0 To Self.MMCadSimples.Items.Count-1 do
      Begin
        For vVertical := 0 to MMCadSimples.Items[vHorizontal].Count-1 do
        Begin
          QDireitoUsuMenu.Close;
          QDireitoUsuMenu.SetVariable('NOME_TELA',Trim(QVerificaTelaNome_Tela.Value) );
          QDireitoUsuMenu.SetVariable('COD_USUARIO',DMUsuario.CodUsuarioCorrente);
          QDireitoUsuMenu.SetVariable('MENU_1',vHorizontal);
          QDireitoUsuMenu.SetVariable('MENU_2',vVertical);
          QDireitoUsuMenu.Open;
          If (QDireitoUsuMenuNome_Tela.Value = '') and
             (MMCadSimples.Items[vHorizontal].Items[vVertical].Caption <> 'Ca&ncelar') and
             (MMCadSimples.Items[vHorizontal].Items[vVertical].Caption <> '&Confirmar') and
             (MMCadSimples.Items[vHorizontal].Items[vVertical].Caption <> '&Sair') and
             (MMCadSimples.Items[vHorizontal].Items[vVertical].Caption <> '-') and
             (MMCadSimples.Items[vHorizontal].Items[vVertical].Caption <> 'Atualizar') Then
            MMCadSimples.Items[vHorizontal].Items[vVertical].Visible := False
          Else
            MMCadSimples.Items[vHorizontal].Items[vVertical].Visible := True;
        End;
      End;
    End;
  End;
  MELocaliza.Visible := SBConsulta.Visible;
  DSPrimario.AutoEdit := SBAlterar.Visible and SBIncluir.Visible;
end;

procedure TFTCadSimples.Sair2Click(Sender: TObject);
begin
  Close;
end;

Procedure TFTCadSimples.CadastraFuncao;
Var vHorizontal,vVertical : Integer;
    vFuncao, wDescInitFuncao, wBotao : String;
    wQtdeComp : Integer;
Begin
  With DMFuncao do
  Begin
    QModulo.Open;
    If QModulo.Locate('NOME_MODULO',DMFuncao.pModulo,[]) Then
    Begin
      QTela.Open;
      If QTela.Locate('NOME_TELA',Trim(Self.Name),[]) Then
      Begin
        QFuncaoTela.Close;
        QFuncaoTela.SetVariable('NOME_TELA',QTelaNome_Tela.Value);
        QFuncaoTela.Open;
        For vHorizontal := 0 To Self.MMCadSimples.Items.Count-1 do
        Begin
          wDescInitFuncao := ValidaItemMenu(Copy(MMCadSimples.Items[vHorizontal].Caption,0,4))+'.- ';
          For vVertical := 0 to MMCadSimples.Items[vHorizontal].Count-1 do
          Begin
            Try
              // ValidaItemMenu retorna Erro quando é um item inválido
              vFuncao := ValidaItemMenu(MMCadSimples.Items[vHorizontal].Items[vVertical].Caption);
              If Not QFuncaoTela.Locate('NOME_FUNCAO',Copy(wDescInitFuncao+vFuncao,1,30),[]) then
              Begin
                QFuncaoTela.Insert;
                QFuncaoTelaCod_Funcao.Value := DMOracle.Sequencia('FUNCAO');
                QFuncaoTelaNum_Item_Menu1.Value := vHorizontal;
                QFuncaoTelaNum_Item_Menu2.Value := vVertical;
                QFuncaoTelaNome_Funcao.Value := wDescInitFuncao+vFuncao;
                QFuncaoTelaNome_Tela.Value := Trim(Self.Name);
                If vFuncao = 'Incluir' then
                  QFuncaoTelaNome_Botao.Value := 'SBIncluir';
                If vFuncao = 'Alterar' then
                  QFuncaoTelaNome_Botao.Value := 'SBAlterar';
                If vFuncao = 'Excluir' then
                  QFuncaoTelaNome_Botao.Value := 'SBExcluir';
                If vFuncao = 'Consulta' then
                  QFuncaoTelaNome_Botao.Value := 'SBConsulta';
                QFuncaoTela.Post;
              End;
            Except
              If QFuncaoTela.State = dsInsert then
                QFuncaoTela.Cancel;
            End;
          End;
        End;

        For wQtdeComp := 0 to Self.ComponentCount - 1 do
        Begin
          If Copy(Self.Components[wQtdeComp].Name,1,2) = 'SB' then
            If Not QFuncaoTela.Locate('NOME_BOTAO',Self.Components[wQtdeComp].Name,[]) then
            Begin
              wBotao := Self.Components[wQtdeComp].Name;
              If (UpperCase(wBotao) <> 'SBCONFIRMAR')
                 AND (UpperCase(wBotao) <> 'SBCANCELAR')
                 AND (UpperCase(wBotao) <> 'SBHELP')
                 AND (UpperCase(wBotao) <> 'SBREFRESH')
                 AND (UpperCase(wBotao) <> 'SBINCLUIR')
                 AND (UpperCase(wBotao) <> 'SBALTERAR')
                 AND (UpperCase(wBotao) <> 'SBEXCLUIR')
                 AND (UpperCase(wBotao) <> 'SBCONSULTA') then
              Begin
                Try
                  QFuncaoTela.Insert;
                  QFuncaoTelaNome_Botao.Value := Self.Components[wQtdeComp].Name;
                  QFuncaoTelaNome_Funcao.Value := Self.Components[wQtdeComp].Name;
                  QFuncaoTelaCod_Funcao.Value := DMOracle.Sequencia('FUNCAO');
                  QFuncaoTelaNome_Tela.Value := Trim(Self.Name);
                  QFuncaoTela.Post;
                Except
                  If QFuncaoTela.State = dsInsert Then
                    QFuncaoTela.Cancel;
                End;
              End;
            End;
        End;
        QFuncaoTela.Close;
        QFuncaoTela.Open;
      End;
    End;
  End;
End;

Function TFTCadSimples.ValidaItemMenu(vItemMenu : String):String;
Var vItemValido : String;
    Cont : Integer;
Begin
  // Validar o Caption do Menu
  vItemValido := '';
  For Cont := 1 to Length(vItemMenu) do
  Begin
    If (vItemMenu[Cont] <> '&')
       and (vItemMenu[Cont] <> '-') then
      vItemValido := vItemValido + vItemMenu[Cont];
  End;
  If (UpperCase(vItemValido) <> 'SAIR') and
     (UpperCase(vItemValido) <> 'CONFIRMAR') and
     (UpperCase(vItemValido) <> 'CANCELAR') and
     (UpperCase(vItemValido) <> 'ATUALIZAR') and
     (UpperCase(vItemValido) <> '')              then
    Result := vItemValido
  Else
    Abort;
End;

procedure TFTCadSimples.SBConsultaClick(Sender: TObject);
begin
  // Procedimento a ser definido nos form filhos
  If SBConsulta.Visible = False then
    Raise Exception.Create('Acesso negado!');
end;

end.
