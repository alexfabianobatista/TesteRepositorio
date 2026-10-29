unit UReporterWiz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Grids, DBGrids, DBCtrls, Db, DBTables,
  ExtCtrls, Mask;

type
  TFReporterWiz = class(TForm)
    PCPrincipal: TPageControl;
    TSSelecao: TTabSheet;
    BtAnterior: TSpeedButton;
    BtProximo: TSpeedButton;
    BtCancelar: TBitBtn;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBGrid2: TDBGrid;
    Label2: TLabel;
    SBInsTabela: TSpeedButton;
    SBDelTabela: TSpeedButton;
    DBGrid3: TDBGrid;
    Label3: TLabel;
    SBInsCampo: TSpeedButton;
    SBDelCampo: TSpeedButton;
    Label4: TLabel;
    TSFiltro: TTabSheet;
    DBGrid5: TDBGrid;
    DBGrid6: TDBGrid;
    SBIncFiltro: TSpeedButton;
    DBGrid7: TDBGrid;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    SBDelFiltro: TSpeedButton;
    TSOrdem: TTabSheet;
    SBSubirOrdem: TSpeedButton;
    SBAtuOrdem: TSpeedButton;
    DBGrid8: TDBGrid;
    SBDescerOrdem: TSpeedButton;
    TSFim: TTabSheet;
    Memo1: TMemo;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    TabSheet1: TTabSheet;
    PDetalhe: TPanel;
    Label11: TLabel;
    DBCBSoma: TDBCheckBox;
    DBEControle: TDBEdit;
    DBGrid10: TDBGrid;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    PSumary: TPanel;
    SBSumary: TSpeedButton;
    SBFonte: TSpeedButton;
    PGrupo: TPanel;
    SBGrupo: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure SBInsTabelaClick(Sender: TObject);
    procedure SBDelTabelaClick(Sender: TObject);
    procedure SBInsCampoClick(Sender: TObject);
    procedure SBDelCampoClick(Sender: TObject);
    procedure SBIncFiltroClick(Sender: TObject);
    procedure PDetalheDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure BtProximoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBDelFiltroClick(Sender: TObject);
    procedure SBSubirOrdemClick(Sender: TObject);
    procedure SBAtuOrdemClick(Sender: TObject);
    procedure SBDescerOrdemClick(Sender: TObject);
    procedure BtAnteriorClick(Sender: TObject);
    procedure DBEControleChange(Sender: TObject);
    procedure PSumaryDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure SBSumaryClick(Sender: TObject);
    procedure SBFonteClick(Sender: TObject);
    procedure SBGrupoClick(Sender: TObject);
    procedure DBLCBGrupoCloseUp(Sender: TObject);
  private
    { Private declarations }
    Procedure AtuPainelDetail;
    Procedure AtuPainelSumary;
    Procedure AtuPainelGrupo;
    Procedure GravaPosCampos;
    procedure DestroyPainelDetail;
    procedure DestroyPainelSumary;
    procedure DestroyPainelGrupo;

  public
    { Public declarations }
    Procedure DestroyPainel;
    Procedure AtuPainel;
  end;

var
  FReporterWiz: TFReporterWiz;

implementation

uses URelatorio_cl, URelatorioFiltro, URelatorio_Rel, URelatorio_Sumary,
  URelatorio_Fonte, URelatorio_Grupo;

{$R *.DFM}

procedure TFReporterWiz.FormActivate(Sender: TObject);
Var wQtPagina : Integer;
begin
  For wQtPagina := 1 to PCPrincipal.PageCount-1 do
  Begin
    PCPrincipal.Pages[wQtPagina].TabVisible := False;
  End;

  With DMRelatorio do
  Begin
    QFrom.Open;
    QCamposDisp.open;
    QSelect.Open;
    QWhere.Open;
    QRelacao.open;

    If (PDetalhe.ComponentCount <= 0) and (QSelectCod_Relatorio.Value > 0) Then
    // Ainda não criou os componentes de visualização
    Begin
      QSelect.First;
      While not QSelect.Eof do
      Begin
        // AtuPainel;
        QSelect.Next;
      End;
    End;
  End;
  PCPrincipal.ActivePage := TSSelecao;
end;

procedure TFReporterWiz.SBInsTabelaClick(Sender: TObject);
begin
  With DMRelatorio do
  Begin
    If QFromCod_Relatorio.Value > 0 then
    Begin
      // Relacionar Tabelas
      QColRelacao.Close;
      QColRelacao.SetVariable('TABELA1',QFromNome_Tabela.Value);
      QColRelacao.SetVariable('TABELA2',QTabDispTable_Name.Value);
      QColRelacao.Open;
      If QColRelacao.RecordCount > 1 then
      Begin
        If FRelatorio_rel = Nil then
          FRelatorio_Rel := TFRelatorio_Rel.Create(Self);
        FRelatorio_Rel.ShowModal;
      End;
      QRelacao.Insert;
      QRelacaoCod_Relatorio.Value := QRelatorioCod_Relatorio.Value;
      QRelacaoNome_Tabela1.Value := QColRelacaoTable_Name.Value;
      QRelacaoNome_Campo1.Value := QColRelacaoColumn_Name.Value;
      QRelacaoNome_Tabela2.Value := QColRelacaoTable_Name_1.Value;
      QRelacaoNome_Campo2.Value := QColRelacaoColumn_Name_1.Value;
      QRelacao.Post;
    End;
    QFrom.Insert;
    QFrom.Post;
  End;
end;

procedure TFReporterWiz.SBDelTabelaClick(Sender: TObject);
begin
  DMRelatorio.QFrom.Delete;
end;

procedure TFReporterWiz.SBInsCampoClick(Sender: TObject);
begin
  With DMRelatorio do
  Try
    QSelect.Insert;
    QSelect.Post;
//    CriaCampo;
  Except
    If QSelect.State = dsInsert then
      QSelect.cancel;
  End;
end;

procedure TFReporterWiz.SBDelCampoClick(Sender: TObject);
Begin
  DMRelatorio.QSelect.Delete;
end;

procedure TFReporterWiz.SBIncFiltroClick(Sender: TObject);
begin
  If FRelatorioFiltro = nil then
    FRelatorioFiltro := TFRelatorioFiltro.Create(Self);
  If FRelatorioFiltro.ShowModal = mrOk then
  Begin
    
  End;
end;

procedure TFReporterWiz.PDetalheDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := True;
  If (X < TDBEdit(Source).Left) Then
    TDBEdit(Source).Left := X
  else
    If X > TDBEdit(Source).Left + TDBEdit(Source).Width then
      TDBEdit(Source).Left := X - TDBEdit(Source).Width;

  If Y < TDBEdit(Source).Top Then
    TDBEdit(Source).Top := Y
  Else
    If Y > TDBEdit(Source).Top + TDBEdit(Source).Height then
      TDBEdit(Source).Top := Y - TDBEdit(Source).Height;
//  MEPosX.Text := IntToStr( TDBEdit(Source).Left );
//  MEPosY.Text := IntToStr( TDBEdit(Source).Top );
end;

procedure TFReporterWiz.BtProximoClick(Sender: TObject);
Var wCont : Integer;
begin
  With DMRelatorio do
  Begin
    wCont := PCPrincipal.ActivePage.PageIndex;
    Case wCont of
        0 : Begin  // Seleção de campos - Preparar para filtros
              If QSelect.State = dsEdit then
                 QSelect.Post;
            End;
        1 : Begin // Filtros - Preparar para Ordem
              QSelect.Close;
              QSelect.Open;
            End;
        2 : AtuPainel; // Ordem - Preparar para Layout
        3 : GravaPosCampos; // Layout - Preparar para finalizar
    End; // Case
  End;

  If wCont <= 3 Then
  Begin
    PCPrincipal.ActivePage.TabVisible := False;
    PCPrincipal.Pages[ wCont + 1 ].TabVisible := True;
  End
  Else
  Begin
    ModalResult := MrOk;
  End;
end;

procedure TFReporterWiz.AtuPainelDetail;
Var wX, wY : Integer;
begin
  wX := 3;
  wY := 3;
  DMRelatorio.QSelect.First;
  While not DMRelatorio.QSelect.Eof do
  Begin
    If DMRelatorio.QSelectInd_Grupo.Value = 0 Then
    With TEdit.Create(PDetalhe) do
    Begin
      Name := 'Ed'+DMRelatorio.QSelectNome_Campo.Text;
      Text := DMRelatorio.QSelectNome_Campo.Text;
      Parent := PDetalhe;
      DragMode := dmAutomatic;
      // DragKind := dkDock;
      CharCase := ecUpperCase;
      Ctl3D := False;
      Cursor := crHandPoint;
      DragCursor := crDrag;
      Width := DMRelatorio.QSelectNum_Tamanho.Value;
      If DMRelatorio.QSelectNum_Pos_X.Value  = 0 Then
      Begin
        DMRelatorio.QSelect.Edit;
        DMRelatorio.QSelectNum_Pos_X.Value := wX;
        DMRelatorio.QSelectNum_Pos_Y.Value := wY;
        DMRelatorio.QSelect.Post;
      End;
      Left := DMRelatorio.QSelectNum_Pos_X.Value;
      Top  := DMRelatorio.QSelectNum_Pos_Y.Value;
      If ( wX + width > PDetalhe.Width ) Then
      Begin
        wX := 0;
        wY := wY + Height + 2;
      End
      Else
      Begin
        wX := Left + Width + 2;
      End;
      If DMRelatorio.QSelectDesc_Calculo.Value = 'SUM' Then
      Begin
        Hint := 'Soma - ';
        Color := clRed;
      End
      Else
        Color := clWindow;
      Hint := Hint + DMRelatorio.QSelectNome_Campo.Text;
      ShowHint := True;
    End;
    DMRelatorio.QSelect.Next;
  End;
//  AtuPainelSumary;
end;

procedure TFReporterWiz.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  With DMRelatorio do
  Begin
    QFrom.Close;
    QCamposDisp.Close;
    QSelect.Close;
    QWhere.Close;
    QRelacao.Close;
    QSumary.Close;
    QNotSumary.Close;
  End;

  Action := caFree;
  FReporterWiz := Nil;
end;

procedure TFReporterWiz.SBDelFiltroClick(Sender: TObject);
begin
  DMRelatorio.QWhere.Delete;
end;

procedure TFReporterWiz.SBSubirOrdemClick(Sender: TObject);
Var wOrdem : Real;
begin
  With DMRelatorio do
  Begin
    If QSelectNum_Ordem.Value > 0 then
    Begin
      wOrdem := QSelectNum_Ordem.Value - 1;
      QSelect.Edit;
      QSelectNum_Ordem.Value := wOrdem;
      QSelect.Post;
      QSelect.Prior;
      QSelect.Edit;
      QSelectNum_Ordem.Value := wOrdem + 1;
      QSelect.Post;
      QSelect.Close;
      QSelect.Open;
      QSelect.Locate('NUM_ORDEM', (wOrdem), []);
    End;
  End;
end;

procedure TFReporterWiz.SBAtuOrdemClick(Sender: TObject);
begin
  DMRelatorio.QSelect.Close;
  DMRelatorio.QSelect.Open;
end;

procedure TFReporterWiz.SBDescerOrdemClick(Sender: TObject);
Var wOrdem : Real;
begin
  With DMRelatorio do
  Begin
    wOrdem := QSelectNum_Ordem.Value + 1;
    QSelect.Edit;
    QSelectNum_Ordem.Value := wOrdem;
    QSelect.Post;
    QSelect.Next;
    QSelect.Edit;
    QSelectNum_Ordem.Value := wOrdem -1;
    QSelect.Post;
    QSelect.Close;
    QSelect.Open;
    QSelect.Locate('NUM_ORDEM', (wOrdem), []);
  End;
end;

procedure TFReporterWiz.GravaPosCampos;
Var wCont : Integer;
    wNome : String;
begin
  With DMRelatorio do
  Begin
    For wCont := 0 to PDetalhe.ComponentCount - 1 do
    Begin
      wNome := PDetalhe.Components[wCont].Name;
      wNome := Copy(wNome,3,Length(wNome)-2);
      If QSelect.Locate('NOME_CAMPO',(wNome), [loCaseInsensitive]	) then
      Begin
        QSelect.Edit;
        QSelectNum_Pos_X.Value := TEdit(PDetalhe.Components[wCont]).Left;
        QSelectNum_Pos_Y.Value := TEdit(PDetalhe.Components[wCont]).Top;
        QSelect.Post;
      End;
    End;
    For wCont := 0 to PGrupo.ComponentCount - 1 do
    Begin
      wNome := PGrupo.Components[wCont].Name;
      wNome := Copy(wNome,3,Length(wNome)-2);
      If QSelect.Locate('NOME_CAMPO',(wNome), [loCaseInsensitive]	) then
      Begin
        QSelect.Edit;
        QSelectNum_Pos_X.Value := TEdit(PGrupo.Components[wCont]).Left;
        QSelectNum_Pos_Y.Value := TEdit(PGrupo.Components[wCont]).Top;
        QSelect.Post;
      End;
    End;

  End;
end;

procedure TFReporterWiz.BtAnteriorClick(Sender: TObject);
Var wCont : Integer;
begin
  wCont := PCPrincipal.ActivePage.PageIndex;
  Case wCont of
     3 : DestroyPainel;
  End;
  If wCont > 0 Then
  Begin
    PCPrincipal.ActivePage.TabVisible := False;
    PCPrincipal.Pages[ wCont -1 ].TabVisible := True;
  End;
end;

procedure TFReporterWiz.DBEControleChange(Sender: TObject);
begin
  If (DMRelatorio.QSelectDesc_tipo_Dado.Value = 'NUMBER')
    and (Copy (DMRelatorio.QSelectNome_Campo.Value,1,3) <> 'COD') Then
    DBCBSoma.Enabled := True
  Else
    DBCBSoma.Enabled := False;
end;

procedure TFReporterWiz.DestroyPainelDetail;
begin
  While PDetalhe.ComponentCount > 0 do
  Begin
    PDetalhe.Components[ PDetalhe.ComponentCount -1 ].Destroy;
  End;
end;

procedure TFReporterWiz.DestroyPainelSumary;
begin
  While PSumary.ComponentCount > 0 do
  Begin
    PSumary.Components[ PSumary.ComponentCount -1 ].Destroy;
  End;
end;


procedure TFReporterWiz.PSumaryDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := True;
  If (X < TDBEdit(Source).Left) Then
    TDBEdit(Source).Left := X
  else
    If X > TDBEdit(Source).Left + TDBEdit(Source).Width then
      TDBEdit(Source).Left := X - TDBEdit(Source).Width;
  If Y < TDBEdit(Source).Top Then
    TDBEdit(Source).Top := Y
  Else
    If Y > TDBEdit(Source).Top + TDBEdit(Source).Height then
      TDBEdit(Source).Top := Y - TDBEdit(Source).Height;
end;

procedure TFReporterWiz.SBSumaryClick(Sender: TObject);
begin
  If FRelatorio_Sumary = Nil then
    FRelatorio_Sumary := TFRelatorio_Sumary.Create(Self);
  FRelatorio_Sumary.ShowModal;
  DestroyPainelSumary;
  AtuPainelSumary;
end;

procedure TFReporterWiz.AtuPainelSumary;
Var wX, wY : Integer;
begin
  wX := 3;
  wY := 3;
  DMRelatorio.QSumary.Close;
  DMRelatorio.QSumary.open;
  DMRelatorio.QSumary.First;
  PSumary.Visible := DMRelatorio.QSumaryCod_Relatorio.Value = DMRelatorio.QRelatorioCod_Relatorio.Value;
  While not DMRelatorio.QSumary.Eof do
  Begin
    With TEdit.Create(PSumary) do
    Begin
      Name := 'Ed'+DMRelatorio.QSumaryNome_Campo.Text;
      Text := DMRelatorio.QSumaryNome_Campo.Text;
      Parent := PSumary;
      DragMode := dmAutomatic;
      CharCase := ecUpperCase;
      Ctl3D := False;
      Cursor := crHandPoint;
      DragCursor := crDrag;
      Width := DMRelatorio.QSumaryNum_Tamanho.Value;
      If DMRelatorio.QSumaryNum_Pos_X.Value  = 0 Then
      Begin
        DMRelatorio.QSumary.Edit;
        DMRelatorio.QSumaryNum_Pos_X.Value := wX;
        DMRelatorio.QSumaryNum_Pos_Y.Value := wY;
        DMRelatorio.QSumary.Post;
      End;
      Left := DMRelatorio.QSumaryNum_Pos_X.Value;
      Top  := DMRelatorio.QSumaryNum_Pos_Y.Value;
      If ( wX + width > PSumary.Width ) Then
      Begin
        wX := 0;
        wY := wY + Height + 2;
      End
      Else
      Begin
        wX := Left + Width + 2;
      End;
      Color := clWindow;
      Hint := Hint + DMRelatorio.QSumaryNome_Campo.Text;
      ShowHint := True;
    End;
    DMRelatorio.QSumary.Next;
  End;
  // Atualizar Campos;
  DMRelatorio.QSelect.Close;
  DMRelatorio.QSelect.Open;
end;

procedure TFReporterWiz.AtuPainel;
begin
  AtuPainelGrupo;
  AtuPainelDetail;
  AtuPainelSumary;
end;

procedure TFReporterWiz.DestroyPainel;
begin
  DestroyPainelDetail;
  DestroyPainelSumary;
  DestroyPainelGrupo;
end;

procedure TFReporterWiz.SBFonteClick(Sender: TObject);
begin
  If FRelatorio_fonte = Nil then
    FRelatorio_Fonte := TFRelatorio_fonte.Create(Self);
  FRelatorio_fonte.ShowModal;

  DestroyPainel;
  AtuPainel;

end;

procedure TFReporterWiz.SBGrupoClick(Sender: TObject);
begin
  If FRelatorio_Grupo = Nil then
    FRelatorio_Grupo := TFRelatorio_Grupo.Create(Self);
  FRelatorio_Grupo.ShowModal;
  DestroyPainelGrupo;
  AtuPainelGrupo;
  DestroyPainelDetail;
  AtuPainelDetail;
end;

procedure TFReporterWiz.AtuPainelGrupo;
Var wX, wY, wAux : Integer;
begin
  wX := 3;
  wY := 3;
  With DMRelatorio do
  Begin
    wAux := Round(QGrupoInd_Grupo.Value);
    QGrupo.Close;
    QGrupo.Open;
    QGrupo.Locate('IND_GRUPO',(wAux),[]);
//    QGrupo.Last;
    PGrupo.Visible := QGrupo.RecordCount > 0;
    If PGrupo.Visible then
    Begin
      QSelect.First;
      While not QSelect.Eof do
      Begin
        If QSelectInd_Grupo.Value = QGrupoInd_Grupo.Value then
        Begin
          With TEdit.Create(PGrupo) do
          Begin
            Name := 'Ed'+DMRelatorio.QSelectNome_Campo.Text;
            Text := DMRelatorio.QSelectNome_Campo.Text;
            Parent := PGrupo;
            DragMode := dmAutomatic;
            CharCase := ecUpperCase;
            Ctl3D := False;
            Cursor := crHandPoint;
            DragCursor := crDrag;
            Width := DMRelatorio.QSelectNum_Tamanho.Value;
            If DMRelatorio.QSelectNum_Pos_X.Value  = 0 Then
            Begin
              DMRelatorio.QSelect.Edit;
              DMRelatorio.QSelectNum_Pos_X.Value := wX;
              DMRelatorio.QSelectNum_Pos_Y.Value := wY;
              DMRelatorio.QSelect.Post;
            End;
            Left := DMRelatorio.QSelectNum_Pos_X.Value;
            Top  := DMRelatorio.QSelectNum_Pos_Y.Value;
            If ( wX + width > PGrupo.Width ) Then
            Begin
              wX := 0;
              wY := wY + Height + 2;
            End
            Else
            Begin
              wX := Left + Width + 2;
            End;
            Color := clWindow;
            Hint := Hint + DMRelatorio.QSelectNome_Campo.Text;
            ShowHint := True;
          End;
        End;
        QSelect.Next;
      End;
    End;
  End;
end;

procedure TFReporterWiz.DestroyPainelGrupo;
begin
  While PGrupo.ComponentCount > 0 do
  Begin
    PGrupo.Components[ PGrupo.ComponentCount -1 ].Destroy;
  End;
end;

procedure TFReporterWiz.DBLCBGrupoCloseUp(Sender: TObject);
begin
  GravaPosCampos;
  DestroyPainelGrupo;
  AtuPainelGrupo;
end;

end.
