unit UReinfR1070;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, ExtCtrls, Buttons, Grids, DBGrids, UReinf_cl, DBCtrls, UFmCidade,
  UFmCadastro, UFmFilial, UBibliotecaDB, UOracle_cl, UGeraXMLReinf;

type
  TFReinfR1070 = class(TFTCadSimples)
    dbgReinfR1070: TDBGrid;
    FmFilialR1070: TFmFilial;
    FmCadastroR1070: TFmCadastro;
    FmCidadeR1070: TFmCidade;
    Label1: TLabel;
    Label2: TLabel;
    dbeNumProcesso: TDBEdit;
    cbTipoProcesso: TComboBox;
    dtpkDataInicio: TDateTimePicker;
    dtpkDataFim: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cbTipoR1070: TComboBox;
    cbFimValidade: TCheckBox;
    dbgIndSuspR1070: TDBGrid;
    Label6: TLabel;
    btnAddSusp: TButton;
    btnRemSusp: TButton;
    bdeNumVara: TDBEdit;
    Label7: TLabel;
    btnGerarEvento: TButton;
    dbckAutoria: TDBCheckBox;
    procedure LimparCampos;
    procedure AtivarDesativarCampos(Botao: TButton);
    procedure cbFimValidadeClick(Sender: TObject);
    procedure FmFilialR1070BtFilialClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FmCadastroR1070BtCadastroClick(Sender: TObject);
    procedure FmFilialR1070MeFilialExit(Sender: TObject);
    procedure FmCadastroR1070MeCadastroExit(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure dbgReinfR1070CellClick(Column: TColumn);
    procedure FmCidadeR1070MeCidadeExit(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure FmCidadeR1070BtCidadeClick(Sender: TObject);
    procedure btnAddSuspClick(Sender: TObject);
    procedure btnRemSuspClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SBRefreshClick(Sender: TObject);
    procedure cbTipoProcessoChange(Sender: TObject);
    procedure AbreGridSuspensao;
    procedure btnGerarEventoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReinfR1070: TFReinfR1070;
  BibDB: TBibliotecaDB;
implementation

uses
  UFilialCons,
  UCadastroCons,
  UCidadeCons,
  UFilial_cl,
  UUsuario_cl,
  UCadastro_cl,
  UCidade_cl,
  USuspensaoProcessoCons, DateUtils;

{$R *.dfm}

procedure TFReinfR1070.AtivarDesativarCampos(Botao: TButton);
var
  isAtivo: boolean;
begin
  isAtivo := (DSPrimario.State in [dsEdit, dsInsert]);
  //desativa a edição dos campos do formulário caso este não esteja em edição ou inserção
  FmFilialR1070.Enabled := isAtivo;
  FmCadastroR1070.Enabled := isAtivo;
  FmCidadeR1070.Enabled := isAtivo;
  cbTipoProcesso.Enabled := isAtivo;
  dtpkDataInicio.Enabled := isAtivo;
  cbTipoR1070.Enabled := isAtivo;
  cbFimValidade.Enabled := isAtivo;
  bdeNumVara.Enabled := isAtivo;
  dbgReinfR1070.Enabled := isAtivo;
  dbeNumProcesso.Enabled := isAtivo;
  dbgIndSuspR1070.Enabled := isAtivo;
  dbckAutoria.Enabled := isAtivo;
  btnAddSusp.Enabled := isAtivo;
  btnRemSusp.Enabled := isAtivo;

  dbgReinfR1070.Enabled := (DSPrimario.DataSet.RecordCount > 0);

  if Botao.Name = 'SBConfirmar' then
     cbFimValidade.Enabled := false
  else if (DSPrimario.State in [dsEdit]) then
    cbFimValidade.Checked := DMReinf.QReinfR1070DT_FIM_VALIDADE.Text <> '';

  cbFimValidadeClick(Self);
end;

procedure TFReinfR1070.LimparCampos;
begin

  FmFilialR1070.MeFilial.Clear;
  FmFilialR1070.EdFilial.Clear;
  FmCadastroR1070.MeCadastro.Clear;
  FmCadastroR1070.EdCadastro.Clear;
  FmCidadeR1070.MeCidade.Clear;
  FmCidadeR1070.EdCidade.Clear;
  cbTipoR1070.ItemIndex := -1;
  cbTipoProcesso.ItemIndex := 0;
  dbeNumProcesso.Clear;
  dbckAutoria.Checked := false;

end;

procedure TFReinfR1070.cbFimValidadeClick(Sender: TObject);
begin
  inherited;
  dtpkDataFim.Enabled := (cbFimValidade.Checked) and (DSPrimario.State in [dsEdit, dsInsert]);
end;

procedure TFReinfR1070.FmFilialR1070BtFilialClick(Sender: TObject);
begin
  inherited;
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);

  if FFilialCons.ShowModal = mrOk then
  begin
    with DMFilial, DMReinf do
    begin
      QFilial.Close;
      QFilial.SetVariable('PK', QFilialConsCod_Filial.Value);
      QFilial.Open;
      QReinfR1070COD_FILIAL.Value := QFilialCOD_FILIAL.Value;
      FmFilialR1070.MeFilial.Text := QFilialCOD_FILIAL.Text;
      FmFilialR1070.EdFilial.Text := QFilialDESC_FILIAL.Text;

      if QFilialCOD_CADASTRO_REINF.Text <> '' then
        FmCadastroR1070.MeCadastro.Text := QFilialCOD_CADASTRO_REINF.Text;

      QReinfR1000IND_PRODUCAO_HOMOLOGACAO.Value := QFilialIND_AMBIENTE_REINF.Value;

      if (QFilialCOD_CADASTRO_REINF.Text <> '') and (QFilialCOD_CADASTRO_REINF.Value > 0) then
      begin
        with DMCadastro do
        begin
          QCadastro.Close;
          QCadastro.SetVariable('PK', QFilialCOD_CADASTRO_REINF.Value);
          QCadastro.Open;

          QReinfR1070COD_CADASTRO.Value := QFilialCOD_CADASTRO_REINF.Value;
          FmCadastroR1070.MeCadastro.Text := QFilialCOD_CADASTRO_REINF.Text;
          FMCadastroR1070.EdCadastro.Text := QCadastroNOME.Text;
        end;
      end;
    end;
  end;

end;

procedure TFReinfR1070.FormCreate(Sender: TObject);
begin
  inherited;
  with DMReinf do
  begin
    QReinfR1070.Open;
    QReinfR1070Cons.Open;
    QReinfSuspProcR1070.Open;
  end;
  dtpkDataInicio.DateTime := Today;
  dtpkDataFim.DateTime := Today;
  dtpkDataFim.Enabled := cbFimValidade.Checked;
  LimparCampos;
  AtivarDesativarCampos(TButton(SBConfirmar));
  AbreGridSuspensao;
end;

procedure TFReinfR1070.FmCadastroR1070BtCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);

  if FCadastroCons.ShowModal = mrOk then
  begin
    with DMCadastro, DMReinf do
    begin
      QCadastro.Close;
      QCadastro.SetVariable('PK', QCadastroConsCOD_CADASTRO.Value);
      QCadastro.Open;
      QReinfR1070COD_CADASTRO.Value := QCadastroCOD_CADASTRO.Value;
      FmCadastroR1070.MeCadastro.Text := QCadastroCOD_CADASTRO.Text;
      FmCadastroR1070.EdCadastro.Text := QCadastroNOME.Text;
    end;
  end;

end;

procedure TFReinfR1070.FmFilialR1070MeFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(FmFilialR1070.MeFilial.Text) <> '' then
  begin
    with DMFilial, DMReinf do
    begin
      QFilial.Close;
      QFilial.SetVariable('PK', StrToInt(Trim(FmFilialR1070.MeFilial.Text)));
      QFilial.Open;
      QReinfR1070COD_FILIAL.Value := QFilialCOD_FILIAL.Value;
      FmFilialR1070.MeFilial.Text := QFilialCOD_FILIAL.Text;
      FmFilialR1070.EdFilial.Text := QFilialDESC_FILIAL.Text;

      if QFilialCOD_CADASTRO_REINF.Text <> '' then
        FmCadastroR1070.MeCadastro.Text := QFilialCOD_CADASTRO_REINF.Text;

      QReinfR1070IND_PRODUCAO_HOMOLOGACAO.Value := QFilialIND_AMBIENTE_REINF.Value;

      if (QFilialCOD_CADASTRO_REINF.Text <> '') and (QFilialCOD_CADASTRO_REINF.Value > 0) then
      begin
        with DMCadastro do
        begin
          QCadastro.Close;
          QCadastro.SetVariable('PK', QFilialCOD_CADASTRO_REINF.Value);
          QCadastro.Open;

          QReinfR1070COD_CADASTRO.Value := QFilialCOD_CADASTRO_REINF.Value;
          FmCadastroR1070.MeCadastro.Text := QFilialCOD_CADASTRO_REINF.Text;
          FMCadastroR1070.EdCadastro.Text := QCadastroNOME.Text;
        end;
      end;
    end;
  end;                   
end;

procedure TFReinfR1070.FmCadastroR1070MeCadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(FmCadastroR1070.MeCadastro.Text) <> '' then
  begin
    with DMCadastro, DMReinf do
    begin
      QCadastro.Close;
      QCadastro.SetVariable('PK', StrToInt(Trim(FmCadastroR1070.MeCadastro.Text)));
      QCadastro.Open;
      QReinfR1070COD_CADASTRO.Value := QCadastroCOD_CADASTRO.Value;
      FmCadastroR1070.MeCadastro.Text := QCadastroCOD_CADASTRO.Text;
      FmCadastroR1070.EdCadastro.Text := QCadastroNOME.Text;
    end;
  end;

end;

procedure TFReinfR1070.SBConfirmarClick(Sender: TObject);
begin

  with DMReinf, DMUsuario, DMFilial do
  begin
    QReinfR1070COD_USUARIO.Value := QUsuarioCOD_USUARIO.Value;

    QReinfR1070IND_PRODUCAO_HOMOLOGACAO.Value := DMFilial.QFilialIND_AMBIENTE_REINF.Value;
    QReinfR1070IND_TIPO_APLICATIVO.Value := 1;

    QReinfR1070DT_INI_VALIDADE.Value := dtpkDataInicio.Date;
    if cbFimValidade.Checked then
      QReinfR1070DT_FIM_VALIDADE.Value := dtpkDataFim.Date
    else
      QReinfR1070DT_FIM_VALIDADE.Clear;

    if cbTipoProcesso.ItemIndex < 1 then
      Raise Exception.Create('É obrigatório informar o TIPO DE PROCESSO');
    QReinfR1070IND_TIPO_PROCESSO.Value := cbTipoProcesso.ItemIndex;
    QReinfR1070IND_INC_ALT_EXC.Value := cbTipoR1070.ItemIndex; //0 - inclusao; 1 alteracao; 2 - exclusao
    QReinfR1070COD_ID_VARA.Text := 'S';
    QReinfR1070COD_USUARIO.Value := QUsuarioConsCOD_USUARIO.Value;

  end;
  inherited;

  LimparCampos;
  AtivarDesativarCampos(TButton(Sender));
  dbgReinfR1070.DataSource.DataSet.Refresh;
end;

procedure TFReinfR1070.dbgReinfR1070CellClick(Column: TColumn);
begin
  with DMReinf do
  begin                      
    if QReinfR1070.State in [dsBrowse] then
    begin
      QReinfR1070.Close;
      QReinfR1070.SetVariable('PK', dbgReinfR1070.DataSource.DataSet.FieldByName('COD_REINF_R1070').Value);
      QReinfR1070.Open;

      FmFilialR1070.MeFilial.Text := QReinfR1070COD_FILIAL.Text;
      FmFilialR1070.MeFilialExit(Self);
      FmCadastroR1070.MeCadastro.Text := QReinfR1070COD_CADASTRO.Text;
      FmCadastroR1070.MeCadastroExit(Self);
      FmCidadeR1070.MeCidade.Text := QReinfR1070COD_CIDADE.Text;
      FmCidadeR1070.MeCidadeExit(Self);
      dtpkDataInicio.DateTime := QReinfR1070DT_INI_VALIDADE.Value;
      if QReinfR1070DT_FIM_VALIDADE.Text <> '' then
        dtpkDataFim.DateTime := QReinfR1070DT_FIM_VALIDADE.Value;

      cbTipoR1070.ItemIndex := QReinfR1070IND_INC_ALT_EXC.Value;//0 - inclusao; 1 alteracao; 2 - exclusao
      cbTipoProcesso.ItemIndex := QReinfR1070IND_TIPO_PROCESSO.Value;
      QReinfSuspProcR1070Cons.Close;
      QReinfSuspProcR1070Cons.SetVariable('COD_REINF_R1070', QReinfR1070COD_REINF_R1070.Value);
      QReinfSuspProcR1070Cons.Open;
    end
    else
      Raise Exception.Create('Os dados não puderam ser abertos! Cancele a operação anterior.');
  end;
  AtivarDesativarCampos(TButton(SBConfirmar));
  inherited;
end;

procedure TFReinfR1070.FmCidadeR1070MeCidadeExit(Sender: TObject);
begin
  inherited;
  if Trim(FmCidadeR1070.MeCidade.Text) <> '' then
  begin
    with DMCidade, DMReinf do
    begin
      QCidade.Close;
      QCidade.SetVariable('PK', StrToInt(Trim(FmCadastroR1070.MeCadastro.Text)));
      QCidade.Open;
      QReinfR1070COD_CIDADE.Value := QCidadeCOD_CIDADE.Value;
      FmCidadeR1070.MeCidade.Text := QCidadeCOD_CIDADE.Text;
      FmCidadeR1070.EdCidade.Text := QCidadeDESC_CIDADE.Text;
      QReinfR1070COD_ESTADO.Value := QCidadeCOD_ESTADO.Value;
    end;
  end;         
end;

procedure TFReinfR1070.SBIncluirClick(Sender: TObject);
begin
  inherited;
  LimparCampos;
  AtivarDesativarCampos(TButton(Sender));
  AbreGridSuspensao;

end;

procedure TFReinfR1070.SBAlterarClick(Sender: TObject);
begin
  with DMReinf do
  begin
    QReinfR1070.Close;
    QReinfR1070.SetVariable('PK', dbgReinfR1070.DataSource.DataSet.FieldByName('COD_REINF_R1070').Value);
    QReinfR1070.Open;

    FmFilialR1070.MeFilial.Text := QReinfR1070COD_FILIAL.Text;
    FmFilialR1070.MeFilialExit(Self);
    FmCadastroR1070.MeCadastro.Text := QReinfR1070COD_CADASTRO.Text;
    FmCadastroR1070.MeCadastroExit(Self);
    FmCidadeR1070.MeCidade.Text := QReinfR1070COD_CIDADE.Text;
    FmCidadeR1070.MeCidadeExit(Self);
  end;
  inherited;
  AtivarDesativarCampos(TButton(Sender));
  AbreGridSuspensao;
end;

procedure TFReinfR1070.SBCancelarClick(Sender: TObject);
begin
  inherited;
  AtivarDesativarCampos(TButton(Sender));
end;

procedure TFReinfR1070.FmCidadeR1070BtCidadeClick(Sender: TObject);
begin
  inherited;
  if FCidadeCons = nil then
    FCidadeCons := TFCidadeCons.Create(Application);

  if FCidadeCons.ShowModal = mrOk then
  begin
    with DMCidade, DMReinf do
    begin
      QCidade.Close;
      QCidade.SetVariable('PK', QCidadeConsCOD_CIDADE.Value);
      QCidade.Open;
      QReinfR1070COD_CIDADE.Value := QCidadeCOD_CIDADE.Value;
      FmCidadeR1070.MeCidade.Text := QCidadeCOD_CIDADE.Text;
      FmCidadeR1070.EdCidade.Text := QCidadeDESC_CIDADE.Text;
      QReinfR1070COD_ESTADO.Value := QCidadeCOD_ESTADO.Value;
    end;
  end;

end;

procedure TFReinfR1070.btnAddSuspClick(Sender: TObject);
begin
  inherited;
  with DMReinf do
  begin
    if QReinfR1070.State in [dsEdit, dsInsert] then
    begin
      // definido pelo layout o máximo de 50 suspensões por processo
      QReinfR1070COD_ID_VARA.Value := 'S';
      QReinfR1070.Post;
      QReinfR1070.Edit;
      
      if QReinfSuspProcR1070Cons.RecordCount < 50 then
      begin
        if FSuspensaoProcCons = nil then
          FSuspensaoProcCons := TFSuspensaoProcCons.Create(Application);

        FSuspensaoProcCons.ShowModal;
        if FSuspensaoProcCons.ModalResult = mrOK then
        begin
          if QReinfSuspProcessoCons.RecordCount > 0 then
          begin
            QReinfSuspProcR1070.Close;
            QReinfSuspProcR1070.Open;
            QReinfSuspProcR1070.Insert;

            QReinfSuspProcR1070COD_REINF_R1070.Value := QReinfR1070COD_REINF_R1070.Value;
            QReinfSuspProcR1070COD_SUSPENSAO_R1070.Value := QReinfSuspProcessoConsCOD_SUSPENSAO_R1070.Value;
            //QReinfSuspProcessoConsCOD_SUSPENSAO_R1070.Value;
            QReinfSuspProcR1070.Post;
          end;
        end;
      end
      else
        ShowMessage('Não é possível ultrapassar 50 suspensões.') //definido pelo layout
    end
    else
      Raise Exception.Create('O registro não encontra-se em edição.');
    dbgIndSuspR1070.DataSource.DataSet.Refresh;
  end;
end;

procedure TFReinfR1070.btnRemSuspClick(Sender: TObject);
begin
  inherited;
  with DMReinf do
  begin
    if QReinfR1070.State in [dsEdit, dsInsert] then
    begin
      if QReinfSuspProcR1070Cons.RecordCount > 0 then
      begin
        if QReinfSuspProcR1070Cons.RecNo <> -1 then
        begin
          QReinfSuspProcR1070.Locate('COD_R1070_X_SUSPENSAO', QReinfSuspProcR1070ConsCOD_R1070_X_SUSPENSAO.Value, []);
          QReinfSuspProcR1070.Delete;
        end;
      end
      else
        Raise Exception.Create('Não existem dados para serem excluídos!');
      dbgIndSuspR1070.DataSource.DataSet.Refresh;
    end
    else
      Raise Exception.Create('O registro não encontra-se em edição.');
  end;
end;

procedure TFReinfR1070.SBExcluirClick(Sender: TObject);
begin

  with DMOracle, DMReinf do
  begin

    if (BuscaNome('SELECT COUNT(COD_REINF_PERIODO) FROM TB_REINF_PERIODO', 'DESC_EVENTO_REINF = ' +
                    QuotedStr('R-1070') +  ' AND COD_REINF_PERIODO = ' + QReinfR1070COD_REINF_R1070.Text) = '0') then
    begin
      if Dialogs.MessageDlg('Isso excluirá todas as informações. Deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        QReinfSuspProcR1070.First;
        while not QReinfSuspProcR1070.Eof do
        begin
          QReinfSuspProcR1070.Delete;
          QReinfSuspProcR1070.First;
        end;

        inherited;
        dbgIndSuspR1070.DataSource.DataSet.Refresh;
        dbgReinfR1070.DataSource.DataSet.Refresh;

      end
      else
        ShowMessage('Cancelado pelo usuário');
    end
    else
      Raise Exception.Create('Já existe evento gerado para envio. Exclua os eventos não enviados para poder alterá-los.');

  end;

end;

procedure TFReinfR1070.SBRefreshClick(Sender: TObject);
begin
  dbgReinfR1070.DataSource.DataSet.Refresh;
  dbgIndSuspR1070.DataSource.DataSet.Refresh;
  inherited;

end;

procedure TFReinfR1070.cbTipoProcessoChange(Sender: TObject);
begin
  inherited;
  with DMReinf do
  begin
    QReinfR1070IND_TIPO_PROCESSO.Value := cbTipoProcesso.ItemIndex;
  end;
end;

procedure TFReinfR1070.AbreGridSuspensao;
begin
  with DMReinf do
  begin
    if dbgReinfR1070.Enabled then
    begin
      if QReinfR1070Cons.RecordCount > 0 then
      begin
        QReinfSuspProcR1070Cons.Close;
        QReinfSuspProcR1070Cons.SetVariable('COD_REINF_R1070', QReinfR1070ConsCOD_REINF_R1070.Value);
        QReinfSuspProcR1070Cons.Open;
      end;
    end;
  end;
end;

procedure TFReinfR1070.btnGerarEventoClick(Sender: TObject);
var
  GeraXML: TGeraXMLReinf;
begin
  inherited;
  if GeraXML = nil then
    GeraXML := TGeraXMLReinf.Create;

  with DMReinf, DMOracle do
  begin

  // verifica se a query do evento está aberta
    if not (QReinfR1070.State in [dsBrowse]) then
      raise Exception.Create('Não foi possível realizar a geração. O registro deve estar salvo!')
    else
    begin

      if (BuscaNome('SELECT COUNT(COD_REINF_PERIODO) FROM TB_REINF_PERIODO', 'DESC_EVENTO_REINF = ' +
                    QuotedStr('R-1070') +  ' AND COD_EVENTO_REINF = ' + QReinfR1070COD_REINF_R1070.Text) = '0') then
      begin
        // verifica se o evento está selecionado
        if Trim(QReinfR1070COD_REINF_R1070.Text) = '' then
          raise Exception.Create('Deve haver um registro selecionado para geração.')
        else
          GeraXML.GerarR1070(QReinfR1070COD_REINF_R1070.Value, 'R-1070', '1.05.01');
      end
      else
        raise Exception.Create('Este evento já foi gerado!');
    end;
    QReinfPeriodo.Refresh;
  end;
end;

procedure TFReinfR1070.FormActivate(Sender: TObject);
begin
  inherited;
  dbgReinfR1070.OnCellClick(dbgReinfR1070.Columns.Items[1]);
end;

end.
