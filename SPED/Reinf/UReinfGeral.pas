unit UReinfGeral;

interface

uses
  Windows, ShlObj, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, Grids, DBGrids, StdCtrls, Buttons, ComCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  ActnList, XMLDoc, ImgList, DB, Menus, Mask, ExtCtrls, UBibSped, UTReinf_R2055,
  URConsolidacaoR2055, OracleData, OraTeste;

type
  TFReinfGeral = class(TFTCadSimples)
    Panel2: TPanel;
    Label5: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label18: TLabel;
    Label1: TLabel;
    MCalendarInicio: TMonthCalendar;
    MCalendarFim: TMonthCalendar;
    GroupBox4: TGroupBox;
    Label14: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label17: TLabel;
    btnR2098: TBitBtn;
    btnR2099: TBitBtn;
    btnR9000: TBitBtn;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    btnR2055: TBitBtn;
    btnR2050: TBitBtn;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    btnR2010: TBitBtn;
    btnR2020: TBitBtn;
    BitBtn3: TBitBtn;
    DBGReinfPeriodo: TDBGrid;
    btnSuspensao: TBitBtn;
    btnR1070: TBitBtn;
    btnR100: TBitBtn;
    btnFiltrar: TButton;
    PopupMouseClick: TPopupMenu;
    SalvarXML1: TMenuItem;
    SaveXMLDlg: TSaveDialog;
    Gerao1: TMenuItem;
    AquisioporPerodo1: TMenuItem;
    ConciliaoR20551: TMenuItem;
    DownAction1: TMenuItem;
    EncerrarPerodo1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnR100Click(Sender: TObject);
    procedure btnR1070Click(Sender: TObject);
    procedure btnSuspensaoClick(Sender: TObject);
    procedure btnR2010Click(Sender: TObject);
    procedure btnR2050Click(Sender: TObject);
    procedure btnR2055Click(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure DBGReinfPeriodoCellClick(Column: TColumn);
    procedure DBGReinfPeriodoMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SalvarXML1Click(Sender: TObject);
    procedure AquisioporPerodo1Click(Sender: TObject);
    procedure ConciliaoR20551Click(Sender: TObject);
    procedure Reenviar1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnR2099Click(Sender: TObject);
    procedure btnR2098Click(Sender: TObject);
    procedure DBGReinfPeriodoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure EncerrarPerodo1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReinf: TFReinfGeral;
  BibSped: TBibSped;
  clGerado: TColor;
  clEnviado: TColor;

implementation

uses UReinfR1000, UReinfR1070, USuspensaoProcessos, UReinfR2010,
  UReinfR2050, UReinfR2055, UReinfR2099, UReinf_cl, UFilial_cl, UUsuario_cl, UOracle_cl,
  UReinfR2098;

{$R *.dfm}

procedure TFReinfGeral.FormActivate(Sender: TObject);
begin

  SBIncluir.Enabled := false;
  SBAlterar.Enabled := false;
  SBConfirmar.Enabled := false;
  SBCancelar.Enabled := false;
  SBExcluir.Enabled := (DSPrimario.DataSet.RecNo > -1);
  DMReinf.QReinfPeriodo.Open;
  DBGReinfPeriodo.Refresh;
end;

procedure TFReinfGeral.btnFiltrarClick(Sender: TObject);
begin

  with DMReinf do
  begin
    DBGReinfPeriodo.DataSource.DataSet.DisableControls;
    QReinfPeriodo.Close;
    QReinfPeriodo.SetVariable('dt_inicio_evento', MCalendarInicio.Date);
    QReinfPeriodo.SetVariable('dt_fim_evento', MCalendarFim.Date);
    QReinfPeriodo.Open;
    DBGReinfPeriodo.DataSource.DataSet.EnableControls;
    DBGReinfPeriodo.Refresh;
  end;

end;

procedure TFReinfGeral.btnR100Click(Sender: TObject);
begin

  if FReinfR1000 = nil then
    FReinfR1000 := TFReinfR1000.Create(Application);

  FReinfR1000.ShowModal;
  FreeAndNil(FReinfR1000);

end;

procedure TFReinfGeral.btnR1070Click(Sender: TObject);
begin
  if FReinfR1070 = nil then
    FReinfR1070 := TFReinfR1070.Create(Application);

  FReinfR1070.ShowModal;
  FreeAndNil(FReinfR1070);

end;

procedure TFReinfGeral.btnSuspensaoClick(Sender: TObject);
begin

  if FSuspensaoProcessos = nil then
    FSuspensaoProcessos := TFSuspensaoProcessos.Create(Application);

  FSuspensaoProcessos.ShowModal;
  FreeAndNil(FSuspensaoProcessos);

end;

procedure TFReinfGeral.btnR2010Click(Sender: TObject);
begin
  if FReinfR2010 = nil then
    FReinfR2010 := TFReinfR2010.Create(Application);

  FReinfR2010.ShowModal;
  FreeAndNil(FReinfR2010);
end;

procedure TFReinfGeral.btnR2050Click(Sender: TObject);
begin
  if FReinfR2050 = nil then
    FReinfR2050 := TFReinfR2050.Create(Application);

  FReinfR2050.ShowModal;
  FreeAndNil(FReinfR2050);
end;


procedure TFReinfGeral.btnR2099Click(Sender: TObject);
begin
  inherited;
  with DMFilial, DMUsuario do
  begin
    if FReinfR2099 = nil then
      FReinfR2099 := TFReinfR2099.Create(Application);

    FReinfR2099.ShowModal;
    FreeAndNil(FReinfR2099);

  end;
end;


procedure TFReinfGeral.btnR2055Click(Sender: TObject);
begin
  with DMFilial, DMUsuario do
  begin
    QFilial.Close;
    QFilial.SetVariable('pk', QUsuarioCOD_FILIAL.Value);
    QFilial.Open;

    if QFilialCOD_CLASSIFICACAO_TRIBUTARIA.Value <> 22 then
    begin
      if FReinfR2055 = nil then
        FReinfR2055 := TFReinfR2055.Create(Application);

      FReinfR2055.ShowModal;
      FreeAndNil(FReinfR2055);
    end
    else
      Raise Exception.Create('Para eventos R-2055 a empresa não deve ter a classificação tributária 22 - Segurado Especial.' + #10#13 + 'Verifique o cadastro da Filial.');
  end;
end;

procedure TFReinfGeral.SBExcluirClick(Sender: TObject);
begin
  with DMReinf do
  begin

    if (QReinfPeriodoIND_SITUACAO.Value <> 'ENVIADO') then
      inherited
    else
      Raise Exception.Create('Não é possível excluir um evento enviado. Faça a exclusão através da função adequada!');

  end;
end;

procedure TFReinfGeral.DBGReinfPeriodoCellClick(Column: TColumn);
begin
  inherited;
  with DMReinf do
  begin
    if QReinfPeriodo.State in [dsBrowse] then
      SBExcluir.Enabled := (QReinfPeriodoIND_SITUACAO.Value <> 'ENVIADO');
  end;

end;

procedure TFReinfGeral.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DMReinf do
  begin
    QRegistrosReinf.Close;
    Action := caFree;
    FReinf := nil;    
  end;

end;

procedure TFReinfGeral.DBGReinfPeriodoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
  begin
    inherited;
    with DBGReinfPeriodo.ClientToScreen(Point(0, 0)) do
      PopupMouseClick.Popup(X, Y);
  end
  else
    inherited;
end;

procedure TFReinfGeral.SalvarXML1Click(Sender: TObject);
var
  XML: TStringlist;
begin
  if BibSped = nil then
    BibSped := TBibSped.Create;
    
  inherited;
  with DMReinf do
  begin

    try
      SaveXMLDlg.DefaultExt := 'XML';
      SaveXMLDlg.Filter:= 'XML |*.XML';
      SaveXMLDlg.FileName := QReinfPeriodoDESC_EVENTO_REINF.Text + QReinfPeriodoDESC_XML_ID.Text + '.XML';
      SaveXMLDlg.InitialDir := BibSped.GeraCaminhoPastaSistema(CSIDL_DESKTOP); //põe a área de trabalho como diretório padrão
      if SaveXMLDlg.Execute then
      begin
        if XML = nil then
          XML := TStringList.Create;
        XML.Add(QReinfPeriodo.FieldByName('DESC_XML_EVENTO').AsString);
        //ShowMessage(XML.Text);
        XML.SaveToFile(SaveXMLDlg.FileName);
      end;
    except
      Raise Exception.Create('Erro ao gravar o arquivo.');
    end;
  end;
end;

procedure TFReinfGeral.AquisioporPerodo1Click(Sender: TObject);
var
  DataInicio, DataFim: String;
  Filial: integer;
begin
  inherited;
  with DMReinf do
  begin
    if FGeraR2055 = nil then
      FGeraR2055 := TFGeraR2055.Create(Application);
    FGeraR2055.PGRelatorio.Pages[0].TabVisible := True;
    if FGeraR2055.ShowModal = mrOk then
    begin
      FGeraR2055.Gerar;
      ShowMessage('Arquivos gerados. Atualize a janela para visualizar.');
    end;
    FreeAndNil(FGeraR2055);
  end;

  DBGReinfPeriodo.DataSource.DataSet.Close;
  DBGReinfPeriodo.DataSource.DataSet.Open;

end;

procedure TFReinfGeral.ConciliaoR20551Click(Sender: TObject);
var
  DataInicio, DataFim, wOperacoes: String;
  Filial: integer;
begin
  inherited;
  with DMReinf do
  begin
    if FGeraR2055 = nil then
      FGeraR2055 := TFGeraR2055.Create(Application);
    FGeraR2055.PGRelatorio.Pages[1].TabVisible := True;
    if FGeraR2055.ShowModal = mrOk then
    begin
        QRelatorioAquisicao.Close;

        if Trim(FGeraR2055.MEDataIni1.Text) <> '' then
          QRelatorioAquisicao.SetVariable('DATA_INI', Trim(FGeraR2055.MEDataIni1.Text))
        else
          Raise Exception.Create('A Data Inicial é obrigatória');

        if Trim(FGeraR2055.MEDataFim1.Text) <> '' then
          QRelatorioAquisicao.SetVariable('DATA_FIM', Trim(FGeraR2055.MEDataFim1.Text))
        else
          Raise Exception.Create('A Data Final é obrigatória');

        if Trim(FGeraR2055.FMFilial1.MeFilial.Text) <> '' then
          QRelatorioAquisicao.SetVariable('FILIAL', StrToInt(Trim(FGeraR2055.FMFilial1.MeFilial.Text)))
        else
          Raise Exception.Create('A FILIAL é obrigatória');

        // Abre todas as operações cadastradas para que liste todos os cadastros com
        // operações para reinf no período
        QConfigAquisicaoOperacao.Close;
        QConfigAquisicaoOperacao.Open;


        QConfigAquisicaoOperacao.First;
        // separa as operações para listar os cadastros
        while not QConfigAquisicaoOperacao.Eof do
        begin
          wOperacoes := wOperacoes + QConfigAquisicaoOperacaoCOD_OPERACAO.Text;

          if (QConfigAquisicaoOperacao.RecNo) < QConfigAquisicaoOperacao.RecordCount then
            wOperacoes := wOperacoes + ', ';

          QConfigAquisicaoOperacao.Next;
        end;

        // Define as operações e abre o dataset para consulta
        QRelatorioAquisicao.SetVariable('OPERACAO', wOperacoes);
        QRelatorioAquisicao.Open;

        if FRConsolidacaoR2055 = nil then
          FRConsolidacaoR2055 := TFRConsolidacaoR2055.Create(Application);

        if FGeraR2055.RGPreview.ItemIndex = 0 then
          FRConsolidacaoR2055.QRPrimario.Preview
        else
          FRConsolidacaoR2055.QRPrimario.Print;

        QConfigAquisicaoOperacao.Close;
    end;
  end;
end;

procedure TFReinfGeral.Reenviar1Click(Sender: TObject);
var
  xSql: String;
begin
  inherited;
  xSql := '';

  with DMOracle do
  begin

    xSql := 'UPDATE TB_REINF_PERIODO SET DESC_XML_RETORNO = ' + QuotedStr('') +
                                                   ', DESC_MSG_RETORNO = ' + QuotedStr('') +
                                                   ', IND_SITUACAO = ' + QuotedStr('GERADO') +
                                                   ', DESC_XML_ID_RETORNO = ' + QuotedStr('');
    xSql := xSql + ' WHERE (DESC_XML_PROTOCOLO IS NULL OR DESC_XML_PROTOCOLO = ' + QuotedStr('') + ')';
    xSql := xSql + ' AND (IND_SITUACAO = ' + QuotedStr('ENVIADO') + ' or IND_SITUACAO = ' + QuotedStr('ERRO') + ') ';
    xSql := xSql + ' AND DT_INI_EVENTO BETWEEN ';

    if MessageDlg('Você tem certeza que deseja reenviar os registros com problemas?',mtConfirmation,[mbyes,mbno],0)=mryes then
    begin
      with DMReinf do
      begin
        if FGeraR2055 = nil then
          FGeraR2055 := TFGeraR2055.Create(Application);
        FGeraR2055.PGRelatorio.Pages[0].TabVisible := True;
        if FGeraR2055.ShowModal = mrOk then
        begin
          xSql := xSql + QuotedStr(FGeraR2055.MeDataIniReinf.Text) + ' AND ' + QuotedStr(FGeraR2055.MeDataFinReinf.Text);
          try
            DBCemapa.StartTransaction;
            QExecSQL.Close;
            QExecSQL.SQL.Clear;
            QExecSQL.SQL.Add(xSql);
            QExecSQL.ExecSQL;
            DBCemapa.Commit;
          except
            DBCemapa.Rollback;
            raise Exception.Create('Não atualizou os dados de envio. Entre em contato com o suporte!');
            FreeAndNil(FGeraR2055);
          end;

        end;
        FreeAndNil(FGeraR2055);
      end;

      DBGReinfPeriodo.DataSource.DataSet.Close;
      DBGReinfPeriodo.DataSource.DataSet.Open;

    end;
  end;
end;

procedure TFReinfGeral.FormCreate(Sender: TObject);
var
  wHoje, wInicioMes, wFimMes: TDate;
begin
  inherited;

  if BibSped = nil then
    BibSped := tBibSped.Create;

  wHoje := BibSped.GetDateInDateTime(Now);
  wInicioMes := BibSped.GetStartOfPreviousMonthLess(wHoje);
  wFimMes := BibSped.GetEndOfPreviousMonth(wHoje);

  MCalendarInicio.Date := wInicioMes;
  MCalendarFim.Date := wFimMes;

  clGerado := $00FF55;
  clEnviado := $80AA00;

  Panel4.Color := clGerado;
  Panel5.Color := clRed;
  Panel6.Color := clEnviado;
  
end;

procedure TFReinfGeral.btnR2098Click(Sender: TObject);
begin
  inherited;
  with DMFilial, DMUsuario do
  begin
    if FReinfR2098 = nil then
      FReinfR2098 := TFReinfR2098.Create(Application);

    FReinfR2098.ShowModal;
    FreeAndNil(FReinfR2098);

  end;
end;

procedure TFReinfGeral.DBGReinfPeriodoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;

  with DMReinf do
  begin

    if (gdSelected in State) or (gdFocused in State) then
      DBGReinfPeriodo.Canvas.Brush.Color:=clGradientInactiveCaption;

    if QReinfPeriodoIND_SITUACAO.Value = 'ENVIADO' then
    begin
      DBGReinfPeriodo.Canvas.Brush.Color := clEnviado; // coloque aqui a cor desejada
      DBGReinfPeriodo.DefaultDrawDataCell(Rect, DBGReinfPeriodo.columns[datacol].field, State);
    end;

    if QReinfPeriodoIND_SITUACAO.Value = 'ERRO' then
    begin
      DBGReinfPeriodo.Canvas.Brush.Color:= clRed; // coloque aqui a cor desejada
      DBGReinfPeriodo.DefaultDrawDataCell(Rect, DBGReinfPeriodo.columns[datacol].field, State);
    end;

    if QReinfPeriodoIND_SITUACAO.Value = 'GERADO' then
    begin
      DBGReinfPeriodo.Canvas.Brush.Color:= clGerado; // coloque aqui a cor desejada
      //DBGReinfPeriodo.Canvas.Font.Color:= clBlack;       
      DBGReinfPeriodo.DefaultDrawDataCell(Rect, DBGReinfPeriodo.columns[datacol].field, State);
    end;

    if QReinfPeriodoIND_SITUACAO.Value = '' then
    begin
      DBGReinfPeriodo.Canvas.Brush.Color:= clWhite; // coloque aqui a cor desejada
      DBGReinfPeriodo.DefaultDrawDataCell(Rect, DBGReinfPeriodo.columns[datacol].field, State);
    end;



  end
end;

procedure TFReinfGeral.EncerrarPerodo1Click(Sender: TObject);
var
  DataInicio, DataFim: String;
  Filial: integer;
begin
  inherited;
  with DMReinf do
  begin
    if FGeraR2055 = nil then
      FGeraR2055 := TFGeraR2055.Create(Application);
    FGeraR2055.PGRelatorio.Pages[0].TabVisible := True;
    if FGeraR2055.ShowModal = mrOk then
    begin
      FGeraR2055.EncerrarMes;
      ShowMessage('Encerramento gerado! Aguardar envio.');
    end;
    FreeAndNil(FGeraR2055);
  end;

  DBGReinfPeriodo.DataSource.DataSet.Close;
  DBGReinfPeriodo.DataSource.DataSet.Open;

end;

end.
