unit UVinculaPecasPedido;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Menus, Buttons, ExtCtrls, ComCtrls, Grids, DBGrids, DBTables,
  StdCtrls, Mask, ImgList, OraTeste, DBCtrls, ActnList, OracleData, DBPanel,
  UBiblioteca, Variants, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP;

type
  TFVinculaPecasPedido = class(TForm)
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
    BtCopia: TSpeedButton;
    ALCadastro: TActionList;
    UpAction: TAction;
    DownAction: TAction;
    sbEnviarSMS: TSpeedButton;
    IdHTTP1: TIdHTTP;
    EdRazaoSocial: TEdit;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    MEPedido: TMaskEdit;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    EdFantasia: TEdit;
    Label4: TLabel;
    EdProduto: TEdit;
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
    procedure BtCopiaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ExitActionExecute(Sender: TObject);
    procedure UpActionExecute(Sender: TObject);
    procedure DownActionExecute(Sender: TObject);
    procedure sbEnviarSMSClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MEPedidoExit(Sender: TObject);
  private
    { Private declarations }
    // Procedure MostraHint(Sender: TObject);
    procedure CadastraFuncao;
    function ValidaItemMenu(vItemMenu: string): string;
  protected
    FAtalhos: TVariantMap;
    procedure RefreshCharCase;
    function ModoAlteracao(DataSource: TDataSource = nil): Boolean;
    function ValidaCampos(Where: TComponent; ds: TDataSource = nil): Boolean;
  public
    { Public declarations }
  end;

var
  FVinculaPecasPedido: TFVinculaPecasPedido;

implementation

uses UOracle_cl, UUsuario_cl, UTela_cl, UFuncao_cl, UParamSistema_cl, Math, UMensagemSMS,
  UPedidoCons, UPedido_cl, UVidracaria_cl;

{$R *.DFM}

{ Procedure TFTCadSimples.MostraHint(Sender:TObject);
Begin
  StbLongHint.SimpleText := GetLongHint(Application.Hint);
End;
}

procedure TFVinculaPecasPedido.DSPrimarioStateChange(Sender: TObject);
begin
  if DSPrimario.DataSet.State in [dsEdit, dsInsert] then
  begin
    SBIncluir.Enabled := False;
    SBAlterar.Enabled := False;
    SBExcluir.Enabled := False;
    SBConfirmar.Enabled := True;
    SBCancelar.Enabled := True;
    SBRefresh.Enabled := False;
    MELocaliza.Enabled := False;
    SBConsulta.Enabled := False;
    BtCopia.Enabled := False;
  end
  else
    if DSPrimario.DataSet.State = dsBrowse then
    begin
      SBIncluir.Enabled := True;
      SBAlterar.Enabled := True;
      SBExcluir.Enabled := True;
      SBConfirmar.Enabled := False;
      SBCancelar.Enabled := False;
      SBRefresh.Enabled := True;
      MELocaliza.Enabled := True;
      SBConsulta.Enabled := True;
      BtCopia.Enabled := True;
    end;
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

procedure TFVinculaPecasPedido.SBIncluirClick(Sender: TObject);
begin
  if SBIncluir.Visible then
    DSPrimario.DataSet.Insert;
  // Setar Focus para o primeiro tabOrder;
end;

procedure TFVinculaPecasPedido.SBAlterarClick(Sender: TObject);
begin
  if SBAlterar.Visible then
  begin
    TOracleDataSet(DSPrimario.DataSet).RefreshRecord;
    DSPrimario.DataSet.Edit;
  end;
end;

procedure TFVinculaPecasPedido.SBConfirmarClick(Sender: TObject);
begin
//  If DSPrimario.DataSet.State = dsInsert then
//    DMOracle.Audit( TOracleDataset1 (DSPrimario.Dataset ), 'Inclusão' );

  if DSPrimario.DataSet.State = DsEdit then
    DMOracle.Audit(TOracleDataset1(DSPrimario.Dataset), 'Alteração');
  try
    DSPrimario.DataSet.UpdateRecord;
    if ValidaCampos(Self, DSPrimario) then
      DSPrimario.DataSet.Post;
  except
    on e: EDatabaseError do
      if (DSPrimario.State = DsEdit) and (e.Message = 'Record has been changed by another user') then
      begin
        if (MessageDlg('O registro que você está tentando gravar foi alterado por outro usuário.' + #13 + #10 +
          'Você precisa atualizar os dados. Deseja atualizar agora? (Isso fará com que você perca as' + #13 + #10 +
          'alterações que fez)',
          mtError, [mbYes, mbNo, mbCancel], 0) = mrYes) then
        begin
          TOracleDataset(DSPrimario.DataSet).RefreshRecord;
          SBAlterar.Click;
        end;
      end
      else
        raise;
    on e: Exception do
      raise;
  end;
end;

procedure TFVinculaPecasPedido.SBExcluirClick(Sender: TObject);
var wTrans: Boolean;
begin
  wTrans := DMOracle.DBCemapa.InTransaction;
  try
    if SBExcluir.Visible then
      if MessageDlg('Apagar este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        DMOracle.Audit(TOracleDataset1(DSPrimario.Dataset), 'Exclusão');
        DSPrimario.DataSet.Delete;
      end;
  except
    if wTrans = False then
      DMOracle.DBCemapa.Rollback;
    raise;
  end;
end;

procedure TFVinculaPecasPedido.SBCancelarClick(Sender: TObject);
begin
  DSPrimario.DataSet.Cancel;
end;

procedure TFVinculaPecasPedido.Sair1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TFVinculaPecasPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(DSPrimario.DataSet) then
  begin
    if (DSPrimario.DataSet.State in [dsEdit, dsInsert])
      or (DMOracle.DBCemapa.InTransaction) then
      raise Exception.Create('Dados não confirmados. Confirme antes de sair desta janela!');
  end;
end;

procedure TFVinculaPecasPedido.SBRefreshClick(Sender: TObject);
begin
  DSPrimario.DataSet.Close;
  DSPrimario.DataSet.Open;
  RefreshCharCase;
end;

procedure TFVinculaPecasPedido.MELocalizaExit(Sender: TObject);
var QAux: TOracleDataSet1;
begin
  if Trim(MELocaliza.Text) <> '' then
  begin
    QAux := TOracleDataSet1(DSPrimario.DataSet);
    QAux.Close;
    QAux.SetVariable('PK', StrToInt(Trim(MELocaliza.Text)));
    QAux.Open;
    MELocaliza.Text := '';
  end;
end;

procedure TFVinculaPecasPedido.FormActivate(Sender: TObject);
var
  vHorizontal, vVertical, Cont: Integer;
  vAuxBotao: TSpeedButton;
  vAtalho: Variant;
begin
//  Application.OnHint := MostraHint;
  if DMUsuario.Privilegiado = True then
    CadastraFuncao;
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

    for Cont := 0 to Self.ComponentCount - 1 do
    begin
      if Copy(Self.Components[Cont].Name, 1, 2) = 'SB' then
      begin
        try
          vAuxBotao := TSpeedButton(Self.Components[Cont]);
          vAuxBotao.Visible := True;
        except
        end;
      end;
    end;
  end
  else
  begin // Usuários não privilegiados;
    with DMTela do
    begin
      QVerificaTela.Close;
      QVerificaTela.SetVariable('NOME_TELA', Trim(Self.Name));
      QVerificaTela.Open;

      // Controle dos botões dos botões
      QDireitoUsuBotao.Close;
      QDireitoUsuBotao.SetVariable('NOME_TELA', Trim(QVerificaTelaNome_Tela.Value));
      QDireitoUsuBotao.SetVariable('COD_USUARIO', DMUsuario.CodUsuarioCorrente);
      for Cont := 0 to Self.ComponentCount - 1 do
      begin
        if Copy(Self.Components[Cont].Name, 1, 2) = 'SB' then
        begin
          QDireitoUsuBotao.Close;
          QDireitoUsuBotao.SetVariable('NOME_BOTAO', LowerCase(Self.Components[Cont].Name));
          QDireitoUsuBotao.Open;
          try
            vAuxBotao := TSpeedButton(Self.Components[Cont]);
            if (QDireitoUsuBotao.RecordCount = 0) and
              (Self.Components[Cont].Name <> 'SBCancelar') and
              (Self.Components[Cont].Name <> 'SBConfirmar') and
              (Self.Components[Cont].Name <> 'SBRefresh') and
              (Self.Components[Cont].Name <> 'SBHelp') and
              (Self.Components[Cont].Name <> 'SBVendedorCons') and
              (Self.Components[Cont].Name <> 'SBValUnitario') then
              vAuxBotao.Visible := False
            else
              vAuxBotao.Visible := True;
          except
          end;
        end;
      end;

      for vHorizontal := 0 to Self.MMCadSimples.Items.Count - 1 do
      begin
        for vVertical := 0 to MMCadSimples.Items[vHorizontal].Count - 1 do
        begin
          QDireitoUsuMenu.Close;
          QDireitoUsuMenu.SetVariable('NOME_TELA', Trim(QVerificaTelaNOME_TELA.Value));
          QDireitoUsuMenu.SetVariable('COD_USUARIO', DMUsuario.CodUsuarioCorrente);
          QDireitoUsuMenu.SetVariable('MENU_1', vHorizontal);
          QDireitoUsuMenu.SetVariable('MENU_2', vVertical);
          QDireitoUsuMenu.Open;
          if (QDireitoUsuMenuNOME_TELA.Value = '') and
            (MMCadSimples.Items[vHorizontal].Items[vVertical].Caption <> 'Ca&ncelar') and
            (MMCadSimples.Items[vHorizontal].Items[vVertical].Caption <> '&Confirmar') and
            (MMCadSimples.Items[vHorizontal].Items[vVertical].Caption <> '&Sair') and
            (MMCadSimples.Items[vHorizontal].Items[vVertical].Caption <> '-') and
            (MMCadSimples.Items[vHorizontal].Items[vVertical].Caption <> 'Atualizar') then
          begin
            MMCadSimples.Items[vHorizontal].Items[vVertical].Visible := False;
            MMCadSimples.Items[vHorizontal].Items[vVertical].ShortCut := 0; //Remover atalho quando desabilitar
          end
          else
          begin
            MMCadSimples.Items[vHorizontal].Items[vVertical].Visible := True;
            if (FAtalhos <> nil) then
            begin
              vAtalho := FAtalhos.getValue(IntToStr(vHorizontal) + IntToStr(vVertical));
              if (vAtalho <> null) then
                MMCadSimples.Items[vHorizontal].Items[vVertical].ShortCut := vAtalho;
            end;
          end;
        end;
      end;
    end;
  end;
  MELocaliza.Visible := SBConsulta.Visible;
  BtCopia.Visible := (DMOracle.FastSelect('COD_EMPRESA', 'TB_PARAM_SISTEMA',
    '', True) <> 'ARISTIDES') and (SBIncluir.Visible); // Não aparecer botão de Cópia se for Aristides ou se usuário não
                                                       // possuir permissão de inclusão. Diego A. S. 16/06/2010

//  MMCadSimples.Items[0].Items[1].ShortCut := IfThen(SBAlterar.Visible, VK_F3, 0);
//  MMCadSimples.Items[0].Items[8].ShortCut := 0;
  RefreshCharCase;
end;

procedure TFVinculaPecasPedido.Sair2Click(Sender: TObject);
begin
  Close;
end;

procedure TFVinculaPecasPedido.CadastraFuncao;
var vHorizontal, vVertical: Integer;
  vFuncao, wDescInitFuncao, wBotao: string;
  wQtdeComp: Integer;
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
        QFuncaoTela.SetVariable('NOME_TELA', QTelaNome_Tela.Value);
        QFuncaoTela.Open;
        for vHorizontal := 0 to Self.MMCadSimples.Items.Count - 1 do
        begin
          wDescInitFuncao := ValidaItemMenu(Copy(MMCadSimples.Items[vHorizontal].Caption, 0, 4)) + '.- ';
          for vVertical := 0 to MMCadSimples.Items[vHorizontal].Count - 1 do
          begin
            try
              // ValidaItemMenu retorna Erro quando é um item inválido
              vFuncao := ValidaItemMenu(MMCadSimples.Items[vHorizontal].Items[vVertical].Caption);
              if not QFuncaoTela.Locate('NOME_FUNCAO', Copy(wDescInitFuncao + vFuncao, 1, 30), []) then
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

        for wQtdeComp := 0 to Self.ComponentCount - 1 do
        begin
          if Copy(Self.Components[wQtdeComp].Name, 1, 2) = 'SB' then
            if not QFuncaoTela.Locate('NOME_BOTAO', Self.Components[wQtdeComp].Name, []) then
            begin
              wBotao := Self.Components[wQtdeComp].Name;
              if (UpperCase(wBotao) <> 'SBCONFIRMAR')
                and (UpperCase(wBotao) <> 'SBCANCELAR')
                and (UpperCase(wBotao) <> 'SBHELP')
                and (UpperCase(wBotao) <> 'SBREFRESH')
                and (UpperCase(wBotao) <> 'SBINCLUIR')
                and (UpperCase(wBotao) <> 'SBALTERAR')
                and (UpperCase(wBotao) <> 'SBEXCLUIR')
                and (UpperCase(wBotao) <> 'SBCONSULTA') then
              begin
                try
                  QFuncaoTela.Insert;
                  QFuncaoTelaNome_Botao.Value := Self.Components[wQtdeComp].Name;
                  QFuncaoTelaNome_Funcao.Value := Self.Components[wQtdeComp].Name;
                  QFuncaoTelaCod_Funcao.Value := DMOracle.Sequencia('FUNCAO');
                  QFuncaoTelaNome_Tela.Value := Trim(Self.Name);
                  QFuncaoTela.Post;
                except
                  if QFuncaoTela.State = dsInsert then
                    QFuncaoTela.Cancel;
                end;
              end;
            end;
        end;
        QFuncaoTela.Close;
        QFuncaoTela.Open;
      end;
    end;
  end;
end;

function TFVinculaPecasPedido.ValidaItemMenu(vItemMenu: string): string;
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

procedure TFVinculaPecasPedido.SBConsultaClick(Sender: TObject);
begin
  // Procedimento a ser definido nos form filhos
  if SBConsulta.Visible = False then
    raise Exception.Create('Acesso negado!');
end;


procedure TFVinculaPecasPedido.BtCopiaClick(Sender: TObject);
var
//  wVlCampo: array[0..150] of string;
//  wCont, I: Integer;
//  wCampo: string;

  i: Integer;
  wValores: array of Variant;
begin
  DmOracle.pDuplicando := True;   // esta propriedade serve para poder verificar se esta duplicando um registro - nos modulos somente testar se esta verdadeiro
  SetLength(wValores, DSPrimario.DataSet.FieldCount);
  for i := 0 to DSPrimario.DataSet.FieldCount - 1 do
    wValores[i] := DSPrimario.DataSet.Fields[i].Value;

  DSPrimario.DataSet.Append;

  for i := 0 to DSPrimario.DataSet.FieldCount - 1 do
  begin
//    if
//      (DSPrimario.DataSet.Fields[i].FieldName = TOracleDataSet1(DSPrimario.DataSet).SequenceField.Field) or // Se encontrar a propriedade SequenceField da query corretamente preenchida, ignora este campo (Diego Stiehl - 18/08/2011)
//      ((((DSPrimario.DataSet.Fields[i] is TIntegerField) or (DSPrimario.DataSet.Fields[i] is TFloatField)) and ((DSPrimario.DataSet.Fields[i].Value <> 0) or (not DSPrimario.DataSet.Fields[i].IsNull))) or (((not (DSPrimario.DataSet.Fields[i] is TIntegerField)) and (not (DSPrimario.DataSet.Fields[i] is TFloatField))) and (not DSPrimario.DataSet.Fields[i].IsNull))) or // Para ignorar campos que contenham dados após o Append (principal caso: chave primária). Realmente faltou um pouco de inspiração pra fazer um código limpo. Se quiser, arrume. (Diego Stiehl - 18/08/2011)
//      (DSPrimario.DataSet.Fields[i].FieldName = 'DESC_CHAVE_ACESSO') // Só deixei porque tinha na rotina original (Diego Stiehl - 29/07/2011)
//      then
//      Continue;

    if DSPrimario.DataSet.Fields[i].FieldName = TOracleDataSet1(DSPrimario.DataSet).SequenceField.Field then
      Continue; // Se encontrar a propriedade SequenceField da query corretamente preenchida, ignora este campo (Diego Stiehl - 18/08/2011)
    if DSPrimario.DataSet.Fields[i].FieldName = 'DESC_CHAVE_ACESSO' then
      Continue; // Só deixei porque tinha na rotina original (Diego Stiehl - 29/07/2011)

    if ((DSPrimario.DataSet.Fields[i] is TIntegerField) or (DSPrimario.DataSet.Fields[i] is TFloatField)) then // Para ignorar campos que contenham dados após o Append (principal caso: chave primária). Realmente faltou um pouco de inspiração pra fazer um código limpo. Se quiser, arrume. (Diego Stiehl - 18/08/2011)
    begin
      if ((not DSPrimario.DataSet.Fields[i].IsNull) and (DSPrimario.DataSet.Fields[i].Value <> 0)) then
        Continue;
    end
    else
      if (not DSPrimario.DataSet.Fields[i].IsNull) then
        Continue;

    DSPrimario.DataSet.Fields[i].Value := wValores[i];
  end;

//  For wCont := 0 to DSPrimario.DataSet.FieldCount -1 do
//  Begin
//    wCampo := DSPrimario.Dataset.Fields[wCont].Text;
//    wVlCampo[wCont] := '';
//    for i := 1 to length(wCampo) do
//      If wCampo[i] <> '.' Then
//         wVlCampo[wCont] := wVlCampo[wCont] + wCampo[i];
//  End;
//  DSPrimario.DataSet.Insert;
//  For wCont := 0 to DSPrimario.DataSet.FieldCount -1 do
//    If (DSPrimario.DataSet.Fields[wCont].Text = '') and (DSPrimario.DataSet.Fields[wCont].FieldName <> 'DESC_CHAVE_ACESSO') Then
//      DSPrimario.DataSet.Fields[wCont].Text := wVlCampo[wCont];

    DmOracle.pDuplicando := False;
end;

procedure TFVinculaPecasPedido.FormCreate(Sender: TObject);
var
  i, j: Integer;
//  a: TAction;
begin
  Self.Constraints.MinHeight := Self.Height;
  Self.Constraints.MinWidth := Self.Width;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS' then
  begin
    StBLongHint.SimpleText := 'F2 - INC; F3 - ALT; F4 - CONF; F5 - DEL; F6 - CANC; F7 - ATUAL; F8 - CONS';
    {a := TAction.Create(Application);
    a.ShortCut := 123;
    a.OnExecute := ExitActionExecute;
    ALCadastro.Actions}
    Sair2.ShortCut := 27;
    UpAction.ShortCut := VK_UP;
    DownAction.ShortCut := VK_DOWN;
  end;
  if Self.FAtalhos = nil then
  begin
    FAtalhos := TVariantMap.Create;
    for i := 0 to MMCadSimples.Items.Count - 1 do
      for j := 0 to MMCadSimples.Items[i].Count - 1 do
        FAtalhos.addValue(IntToStr(i) + IntToStr(j), MMCadSimples.Items[i].Items[j].ShortCut);
  end;
end;

procedure TFVinculaPecasPedido.RefreshCharCase;
begin
  if DMParamSistema.QParamSistemaIND_MAIUSCULO_CADASTRO.Value = 'S' then
    Bib.charCaseComps(Bib.componentsAsArray(self), ecUpperCase, Self.Name)
  else
    Bib.charCaseComps(Bib.componentsAsArray(self), ecNormal, Self.Name);
end;

procedure TFVinculaPecasPedido.ExitActionExecute(Sender: TObject);
begin
  Close;
end;

procedure TFVinculaPecasPedido.UpActionExecute(Sender: TObject);
begin
  Perform(WM_NEXTDLGCTL, 1, 0);
end;

procedure TFVinculaPecasPedido.DownActionExecute(Sender: TObject);
begin
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

function TFVinculaPecasPedido.ValidaCampos(Where: TComponent; ds: TDataSource = nil): Boolean;
  procedure ValidaComp(Comp: TComponent; var isValid: Boolean; var Msg: string);
  var
    str: string;
    i: Integer;
    c, First: TComponent;
  begin
    First := nil;
    for i := 0 to Comp.ComponentCount - 1 do
    begin
      c := Components[i];
      if (c is TDBPanel) and ((c as TDBPanel).DataSource = ds) and (not (c as TDBPanel).ReadOnly) then
      begin
        TDBPanel(c).Validate(isValid, str);
        if str <> '' then
          Msg := Trim(Msg + #13 + #10 + str);
        if (not Assigned(First)) and (not isValid) then
          First := c;
      end
      else
        if (c.ComponentCount > 0) then
          ValidaComp(c, isValid, Msg);
    end;
    if (Assigned(First)) and (First is TDBPanel) then
      with TDBPanel(First) do
        if Enabled and Visible and CanFocus then
          SetFocus;
  end;
var
  MsgValidacao: string;
begin
  Result := True;
  MsgValidacao := '';
  ValidaComp(Where, Result, MsgValidacao);
  if MsgValidacao <> '' then
  begin
    if Result then
      MessageDlg(MsgValidacao, mtWarning, [mbOK], 0)
    else
      MessageDlg(MsgValidacao, mtError, [mbOK], 0)
  end;
end;

function TFVinculaPecasPedido.ModoAlteracao(DataSource: TDataSource = nil): Boolean;
begin
  if Assigned(DataSource) then
    Result := (DataSource.State in [DsEdit, DsInsert])
  else
    Result := (DSPrimario.State in [DsEdit, DsInsert]);
end;

procedure TFVinculaPecasPedido.sbEnviarSMSClick(Sender: TObject);
  var mensagem, url, retorno: String;
    cod_cadastro: Integer;
begin
  if FMensagemSMS = nil then
    FMensagemSMS := TFMensagemSMS.create(Application);
  if FMensagemSMS.ShowModal = mrOK then
  begin
    if trim(FMensagemSMS.FmCadastroSMS.MeCadastro.Text) = '' then
      raise Exception.Create('Um cadastro precisa ser informado!');
    if trim(FMensagemSMS.mMensagem.Text) = '' then
      raise Exception.Create('A mensagem não pode estar em branco!');
      
    cod_cadastro := StrToInt(trim(FMensagemSMS.FmCadastroSMS.MeCadastro.Text));
    mensagem := FMensagemSMS.mMensagem.Text;
    url := bib.EnviaSMS(cod_cadastro, mensagem);
    retorno := IdHTTP1.Get(url);
    MessageDlg(bib.analisaEnvioSMS(trim(retorno)), mtInformation, [mbOK], 0);
  end;
end;

procedure TFVinculaPecasPedido.SpeedButton1Click(Sender: TObject);
begin
    if FPedidoCons = nil then
    FPedidoCons := TFPedidoCons.Create(Application);
  if FPedidoCons.ShowModal = mrOk then
    with DMPedido do
    begin
      MePedido.Text := DMPedido.QPedidoConsCOD_PEDIDO_CAB.Text;
      MePedidoExit(Self);
    end;
end;

procedure TFVinculaPecasPedido.MEPedidoExit(Sender: TObject);
var
wAux,wAux1,wAux2 : String;
begin
    wAux := DmOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_PEDIDO_CAB',
      'COD_PEDIDO_CAB=' + Trim(MePedido.Text));
    wAux1 := DMOracle.BuscaNome('SELECT COD_PEDIDO_ITEM FROM TB_PEDIDO_ITEM',
      'COD_PEDIDO_CAB=' + Trim(MePedido.Text));
    wAux2 := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PEDIDO_ITEM',
      'COD_PEDIDO_ITEM=' + wAux1);
    EdRazaoSocial.Text := wAux +' '+DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO='+wAux);
    EdFantasia.Text := DmOracle.BuscaNome('SELECT DESC_FANTASIA FROM TB_CADASTRO', 'COD_CADASTRO='+ wAux);
    EdProduto.Text := wAux2+ ' ' +DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO='+ wAux2);
    DMVidracaria.QVinculaPecasPedido.Close;
    DmVidracaria.QVinculaPecasPedido.SetVariable('COD_PEDIDO_CAB',MEPedido.Text);
    DmVidracaria.QVinculaPecasPedido.Open;
end;

end.

